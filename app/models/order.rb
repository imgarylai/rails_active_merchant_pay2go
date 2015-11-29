# == Schema Information
#
# Table name: orders
#
#  id           :uuid             not null, primary key
#  full_name    :string
#  email        :string
#  phone        :string
#  address      :string
#  params       :hstore
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  trade_number :string
#

class Order < ActiveRecord::Base
  has_many :line_items
  validates_presence_of :full_name, :email, :phone, :address

  after_initialize :generate_trade_number
  validates :trade_number, uniqueness: true

  def price
    line_items.to_a.sum(&:price)
  end
  private

  def generate_trade_number
    return if trade_number
    ActiveRecord::Base.transaction(requires_new: true) do
      self.trade_number = SecureRandom.hex(4)
    end
  rescue ActiveRecord::RecordNotUnique => e
    @token_attempts = @token_attempts.to_i + 1
    retry if @token_attempts < 3
    raise e, 'Retries exhausted'
  end

end

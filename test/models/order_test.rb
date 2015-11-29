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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

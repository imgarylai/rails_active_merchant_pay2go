class LineItemsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    current_cart.line_items.create!(product: @product, unit_price: @product.price, quantity: 1)
    redirect_to cart_path, notice: '已加入購物車'
  rescue ActiveRecord::RecordNotFound
    redirect_to request.referer, alert: '找不到該產品'
  end

  def destroy
    @line_item = current_cart.line_items.find(params[:id])
    @line_item.destroy
    redirect_to cart_path
  rescue ActiveRecord::RecordNotFound
    redirect_to request.referer, alert: '購物車內找不到該產品'
  end
end

10.times do
  product = Product.new
  product.title = Jiazi.get_title
  product.price = [100, 200, 300, 400, 500].sample
  product.save
end

json.id order.id
json.product do
  json.partial! order.product, partial: 'api/products/product', as: :product
end
json.quantity order.quantity
json.user_email order.user.email
json.price order.product.price
json.subtotal order.subtotal
json.tax order.tax
json.total order.total

json.formatted do
  json.price number_to_currency(order.product.price)
  json.subtotal number_to_currency(order.subtotal)
  json.tax number_to_currency(order.tax)
  json.total number_to_currency(order.total)

end

# ruby
module OrderOperations
  extend self
  
  def add_item(order, item)
    order.merge(items: order[:items] + [item])
  end
  
  def apply_discount(order, discount)
    order.merge(total: order[:total] * (1 - discount))
  end
end

order = { items: [], total: 100 }

# Цепочка трансформаций (Pipeline)
new_order = order
  .then { |o| OrderOperations.add_item(o, "Кофе") }
  .then { |o| OrderOperations.apply_discount(o, 0.2) }

p new_order # {:items=>["Кофе"], :total=>80.0}
p order     # {:items=>[], :total=>100} (оригинал цел)

gets # Пауза

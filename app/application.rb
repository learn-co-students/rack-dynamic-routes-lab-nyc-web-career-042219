
class Application

  @@items = [Item.new("Apples", 5.23), Item.new("Oranges", 2.43)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

  if req.path.match(/items/)
    item_request = req.path.split("/items/").last
    if item = @@items.find do |item|
      item.name == item_request end
      resp.write item.price
  else
      resp.status = 400
      resp.write "Item not found"
    end
  else
    resp.write "Route not found"
    resp.status = 404
  end
  resp.finish
  end
end

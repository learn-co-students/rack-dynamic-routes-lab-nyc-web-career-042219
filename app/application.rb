class Application

  def call(env)

  resp = Rack::Response.new
  req = Rack::Request.new(env)

if req.path.match(/items/)
  sqitem = req.path.split("/items/").last
  if ooitem = @@items.find{|item| item.name == sqitem}
    resp.write ooitem.price
  else
    resp.status = 400
    resp.write "Item not found"
  end
else
  resp.status = 404
    resp.write "Route not found"
    end
    resp.finish
  end
end

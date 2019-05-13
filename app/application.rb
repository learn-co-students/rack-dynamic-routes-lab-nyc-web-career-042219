class Application


@@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)

      particular_item = req.path.split("/items/").last
      item_object = @@items.find{|i| i.name == particular_item }

      if item_object == nil
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write item_object.price
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end

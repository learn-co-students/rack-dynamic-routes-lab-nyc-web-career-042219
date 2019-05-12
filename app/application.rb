require 'pry'

class Application

  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new

    if req.path.match(/\/items\//)
      item = req.path.split(/\/items\//)[1]
      found_item = @@items.find { |i| i.name == item }
      if found_item
        resp.write "#{found_item.price}"
      else
        resp.status = 400
        resp.write "#{resp.status} - Item not found"
      end
    else
      resp.status = 404
      resp.write "#{resp.status} - Route not found"
    end
    resp.finish
  end

end

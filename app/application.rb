class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      #binding.pry says this is "figs"

      item = @@items.find{|i| i.name == item_name}

      if item.nil?
        resp.write "Item not found"
        resp.status = 400
        #if s user requests an item you don't have, it should return the price of that item. 
      else
        resp.write item.price
      end
    else
      resp.write "Route not found"
      resp.status = 404
      #everything else should 404 
    end

    resp.finish
  end
end
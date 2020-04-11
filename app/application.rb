class Application
 @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/items/)
 
      item_name = req.path.split("/items/").last
      name = @@items.find{|s| s.name == item_name}
        if name !=nil 
         resp.write name.price
        else
           resp.write "Item not found"
           resp.status = 400
         end
      else
        
        resp.status = 404
        resp.write "Route not found"
       end
    resp.finish
  end
end
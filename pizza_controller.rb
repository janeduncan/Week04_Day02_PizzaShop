require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('./models/pizza_order')
also_reload('./models/*')

# this is our INDEX route
get '/pizza-orders' do
  @orders = PizzaOrder.all()
  erb (:index)
end

# this is our NEW route
get '/pizza-orders/new' do
  erb (:new)
end

get '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb (:edit)
end

# this is our SHOW route
get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb (:show)
end

#this is our CREATE route
post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end



post '/pizza-orders/:id/update' do
  @order = PizzaOrder.new(params)
  @order.update
  redirect '/pizza-orders'
end

# this is our DELETE route
post '/pizza-orders/:id/delete' do
  @order = PizzaOrder.find(params[:id])
  @order.delete()
  redirect '/pizza-orders'
end

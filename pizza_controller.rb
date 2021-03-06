require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('models/pizza_order')
also_reload('./models/*')


get '/pizza_orders' do
    @orders = PizzaOrder.all()
    erb(:index)
  end

get '/pizza_orders/new' do
    erb(:new)
end

get '/pizza_orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end

post '/pizza_orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

post '/pizza_orders/:id/delete' do
  @order = PizzaOrder.find(params[:id])
  @order.delete
  erb(:destroy)
end

get '/pizza_orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

post '/pizza_orders/:id/update' do
  @order =  PizzaOrder.new(params)
  @order.update
    erb(:create)
end

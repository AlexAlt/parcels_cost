require('sinatra')
require('sinatra/reloader')
require('./lib/parcels') 
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/parcels') do
binding.pry 
  @length = params.fetch('length').to_i
  @width = params.fetch('width').to_i
  @height = params.fetch('height').to_i
  @weight = params.fetch('weight').to_i
  @next_day_checked = params.fetch('next_day_delivery') 
  @standard_shipping = Parcels.new(@length, @width, @height, @weight).cost_to_ship
  @next_day_shipping = Parcels.new(@length, @width, @height, @weight).next_day_delivery
  erb(:product_results)
end

require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/shoos')

get '/shoes/new' do
  erb(:new)
end

post '/shoes' do
  @shoos = Shoos.new(params)
  @shoos.save()
  erb(:create)
end

get '/shoes' do
  @shoos = Shoos.all
  erb(:index)
end



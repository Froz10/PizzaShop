#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db" 

class Product < ActiveRecord::Base
end	

before do 
	@products = Product.all
end

get '/' do
	erb :index
end

get '/about' do
	erb :about
end

post '/cart' do
	orders_input = params[:orders]
	@items = parse_orders_input orders_input

	@items.each do |item|

		item[0] = @products.find(item[0])

	end

	erb :cart
end


def parse_orders_input orders_input 

	s = orders_input.split(/,/)

	arr = []

	s.each do |x|
   		s1 = x.split(/\=/)

		s2 = s1[0].split(/_/)


		id = s2[1]
		cnt = s1[1]

		arr2 = [id, cnt]

		arr.push arr2

	end

	return arr

end


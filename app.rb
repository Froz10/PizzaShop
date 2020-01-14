#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db" 

class Product < ActiveRecord::Base
end	

class Order < ActiveRecord::Base
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

post '/place_order' do
	@orders = Order.create params[:order]
	erb :order_placed
end

post '/cart' do
	
	# получаем список параметров и разбираем (parse) их

	@orders_input = params[:orders_input]
	@items = parse_orders_input @orders_input

	if @items.length == 0
		return erb :cart_is_empty
	end

	#выводим список продуктов в корзине

	@items.each do |item|

		item[0] = @products.find(item[0]).id
		item[0] = @products.find(item[0]).title
		item[2] = @products.find(item[2]).price

	end

	# возвращаем представление по-умолчанию

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
		price = id

		arr2 = [id, cnt, price]

		arr.push arr2

	end

	return arr

end


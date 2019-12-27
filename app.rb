#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db" 

class Product < ActiveRecord::Base
end	

get '/' do
	@products = Product.all
	erb :index
end

get '/about' do
	erb :about
end

post '/cart' do
	orders_input = params[:orders]
	@orders = parse_orders_input orders_input

	erb "Hello #{@orders.inspect}"
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


#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "pizzashop.db"}

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
end

get '/' do
	@products = Product.all
	erb :index
end

get '/about' do
	erb :about
end

get '/cart' do
	erb :cart
end

post '/place_order' do
	@order = Order.create params[:order]
	erb :place_order
end

post '/cart' do
	#получаем список параметров и получаем их(парсим)
	@orders_input = params[:orders_input]
	
	@items = parse_orders_input @orders_input

	#вывод сообщения, что карзина пуста
	if @items.length == 0
		return erb :cart_is_empty
	end

	#ds##выводим список в корзине
	@items.each do |item|
		# id, cnt
		item[0] = Product.find(item[0])
	end
	#возврад представления по-умолчанию 
	erb :cart
end


def parse_orders_input orders_input
	s1 = orders_input.split(/,/)

	arr = []

	s1.each do |x|
		s2 = x.split(/\=/)

		s3 = s2[0].split(/_/)

		id = s3[1]
		cnt = s2[1]

		arr2 = [id, cnt]

		arr << arr2
	end

	return arr
	end


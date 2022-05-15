class StocksController < ApplicationController
  before_action :authorized

	def index
		@stocks = current_user.stocks.all
	end

	def new
		@stock = current_user.stocks.new
	end

	def create
		@stock = current_user.stocks.build(stock_params)
		if @stock.save
			redirect_to @stock, notice: 'stock created successfully'
		else
			render :new
		end
	end

	def show
		@stock = Stock.find(params[:id])
	end

	def edit
		@stock =Stock.find(params[:id])
	end

	def update
		@stock =Stock.find(params[:id])
		if @stock.update(stock_params)
			redirect_to @stock ,notice: "updated sucessfully"
		else
			render :edit
		end
	end

	private
	def stock_params
		params.require(:stock).permit([:companyname,:stockprice])
	end
end
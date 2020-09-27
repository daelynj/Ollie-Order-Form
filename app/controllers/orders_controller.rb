class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :submit]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @customers = Customer.all
    @products = Product.all
  end

  # GET /orders/1/edit
  def edit
    @customers = Customer.all
    @products = Product.all
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(:customer_id => order_params[:customer_id])

    order_params[:line_items].each do |item|
      if !item.empty?
        @order.line_items.new(:product_id => item, :order_id => @order.id)
      end
    end

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def submit
    @order.update(status: true)
    redirect_to orders_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit!
    end
end

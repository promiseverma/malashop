class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :calculate_total]
  before_action :authenticate_user!
  # GET /products
  # GET /products.json
  def index
    @products = Product.includes(:items, :materials, :prices).search(params[:search]).paginate(:page => params[:page], :per_page => 10).order(created_at: :desc)
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @product.items.build
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    params["product"]["material_ids"] = params["product"]["material_ids"].reject{|i| i==""}
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      params["product"]["total_price"] = params["product"]["total_price"].to_f
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_image
    # byebug
    @product = Product.find(params[:product_id])
    @image = Image.new
     # @product = Product.find(params[:product_id])
     #@product.images.build
     # @product.update
  end

  def upload_image
  end

  def calculate_total
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:product_number, :name, :description, :total_price, :majdoori, :piece, items_attributes: [:item_name], :material_ids => [], prices_attributes:[:quantity, :calculated_price, :unit, :id])
    end
end

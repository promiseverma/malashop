class ImagesController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.includes(:items).all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @image = Image.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    params[:image][:product_id] = params[:image][:product]
    @product = Product.find(params[:image][:product_id])
    @image = Image.new(image_params)
    respond_to do |format|
      if @image.save
        format.html { redirect_to products_path, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { redirect_to product_add_image_path(@product), error: @image.errors }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
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
    @image.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_image
    # byebug
    @product = Product.find(params[:product_id])
    @product.images.build 
     # @product = Product.find(params[:product_id])
     #@product.images.build
     # @product.update
  end

  def upload_image
    byebug
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      byebug
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:avatar, :product_id)
    end
end

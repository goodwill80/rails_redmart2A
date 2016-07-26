class CategoriesProductsController < ApplicationController
  before_action :set_categories_product, only: [:show, :edit, :update, :destroy]

  # GET /categories_products
  # GET /categories_products.json
  def index
    @categories_products = CategoriesProduct.all
  end

  # GET /categories_products/1
  # GET /categories_products/1.json
  def show
  end

  # GET /categories_products/new
  def new
    @categories_product = CategoriesProduct.new
  end

  # GET /categories_products/1/edit
  def edit
  end

  # POST /categories_products
  # POST /categories_products.json
  def create
    @categories_product = CategoriesProduct.new(categories_product_params)

    respond_to do |format|
      if @categories_product.save
        format.html { redirect_to @categories_product, notice: 'Categories product was successfully created.' }
        format.json { render :show, status: :created, location: @categories_product }
      else
        format.html { render :new }
        format.json { render json: @categories_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories_products/1
  # PATCH/PUT /categories_products/1.json
  def update
    respond_to do |format|
      if @categories_product.update(categories_product_params)
        format.html { redirect_to @categories_product, notice: 'Categories product was successfully updated.' }
        format.json { render :show, status: :ok, location: @categories_product }
      else
        format.html { render :edit }
        format.json { render json: @categories_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories_products/1
  # DELETE /categories_products/1.json
  def destroy
    @categories_product.destroy
    respond_to do |format|
      format.html { redirect_to categories_products_url, notice: 'Categories product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categories_product
      @categories_product = CategoriesProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categories_product_params
      params.require(:categories_product).permit(:product_id, :category_id)
    end
end

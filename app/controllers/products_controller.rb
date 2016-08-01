class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def index
    @products = Product.all
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find(params[:id])
  end

  def image
    @image = Product.find(params[:id])
    send_data @image.picture, :filename => "photo.jpg",
    :type => @image.content_type, :disposition => "inline"
  end


private

def product_params
    params.require(:product).permit(:name, :price, :picture)
  end

end

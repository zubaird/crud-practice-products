class ProductsController < ApplicationController


  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    if @product = Product.create(product_params)
      flash[:notice] = "Product was created successfully"
      redirect_to product_path(@product)
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.save
      flash[:notice] = "Product was updated successfully"
      redirect_to products_path
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:notice] = "Product was deleted"
      redirect_to products_path
    end
  end




  private

  def product_params
    params.require(:product).permit(
    :name,
    :description,
    :price,
    )
  end

end

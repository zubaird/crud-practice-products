class ProductsController < ApplicationController


def index
  @products = Product.all
end

def new
  @product = Product.new
end

def create
  if @product = Product.create(product_params)
    flash[:notice] = "Product successfully created"
    redirect_to product_path(@product)
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

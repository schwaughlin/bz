class ProductsController < ApplicationController
  def index
    respond_to do |format|

      format.html do

      end

      format.pdf do
        @big_categories = Category::CATEGORIES
        render pdf: "schwoducts_products",
              :template => 'products/index.html.erb',
                margin: {
                         top: 10,
                         left: 12,
                         right: 12,
                         bottom: 10
                       },
                :footer => {
                  :html => {
                    :template => 'layouts/_footer.html.erb'
                  }
                 },
                 :header => {
                  :html => {
                    :template => 'layouts/_header.html.erb'
                  }
                },
                :layout => 'pdf',
                :toc => {
                  :header_text => "Product Index by Category",
                  text_size_shrink:  1
                }
      end
    end
  end

  def create
    @product = Product.new(product_params)
    @product.category_id = params[:product][:category]
    @product.category_name = Category.find(params[:product][:category]).name
    @product.save
    redirect_to @product
  end

  def edit
    @product = Product.find(params[:id])

  end

  def update
    @product = Product.find(params[:id])

    @product.update(product_params)
    redirect_to @product

  end

  def new
    @product = Product.new
    @categories = Category.all

  end

  def other_index
    unless current_user.try(:email) == "nicholas.schwaderer@gmail.com" || current_user.try(:email) == "elkhunter1964@gmail.com" || current_user.try(:email) == "daniel.zolnikov@gmail.com" || current_user.try(:email) == "lazyt4jewels@gmail.com"
      redirect_to unauthorized_path
    end
    @big_categories = Category::CATEGORIES
    @categories = Category.all
    @products = Product.all

  end

  def unauthorized


  end

  def show

    @product = Product.find(params[:id])
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to root_path
  end

  def product_params
    params.require(:product).permit(:product_id, :description, :price, :wholesale_price, :name, :manufacturer)
  end
end

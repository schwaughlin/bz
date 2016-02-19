class GeneratePdfControllerController < ApplicationController

  def product_catalogue
    @products = Product.all
    render template: "catalogue_template/product_catalogue_template", layout: false
  end
end


require "#{Rails.root}/app/helpers/application_helper"
include ApplicationHelper

desc "This task is called by the Heroku scheduler add-on"


task :send_reminders => :environment do
  puts "Generating pdf"
  sc = WickedPdf.new.pdf_from_string(GeneratePdfControllerController.new.product_catalogue,
                                         margin: {
                                           left: 10,
                                           right: 10,
                                           top: 10
                                         },
                                         footer: {
                                           left: 'nope',
                                           center: 'what',
                                           right: 'Page [page] of [topage]   ',
                                           font_size: '8'
                                         })

      path = "#{Rails.root}/tmp/schwad.pdf"
      File.open(path, "wb") do |file|
        file.write sc
      end
end

task :import_products => :environment do
  puts "Clearing products"
  Product.destroy_all
  # Category.destroy_all
  my_csv = CSV.open('products(3).csv')
  current_csv = my_csv.readlines
  counter = 1
  current_csv.each do |element|
    if counter == 1
      counter += 1
    else
      Product.create(
        :product_id => element[0],
        :name => element[1],
        :description => element[35],
        :price => element[2],
        :wholesale_price => element[19],
        :category_code => element[5],
        :manufacturer => element[6]
        )
      counter += 1
      puts "Building product number #{counter}, for #{element[1]}"

    end
  end
  puts "we are done. then you can try categories lol"
  puts "category time."

  # my_csv = CSV.open('categories.csv')
  # current_csv = my_csv.readlines
  # counter = 1
  # current_csv.each do |element|
  #   if counter == 1
  #     counter += 1
  #   else
  #     Category.create(
  #       :category_key => element[1],
  #       :name => element[2],
  #       :description => element[10],
  #       :priority => element[5],
  #       :parent_key => element[3]
  #       )
  #     counter += 1
  #     puts "Building Category number #{counter}, for #{element[2]}"
  #   end
  # end



  @products = Product.all

  @products.each do |product|
    if product.name == nil
      next
    end
    my_categories = Category.where("category_key = ? ", product.category_code)
    if my_categories.length == 0
      binding.pry
    end
    product.category_name = my_categories.first.try(:name)
    product.category = my_categories.try(:first)
    my_categories.first.products << product
    my_categories.first.save!
    product.save!
    puts "Now establishing category name for #{product.name}"
  end


end

task :inspect_shit => :environment do


end

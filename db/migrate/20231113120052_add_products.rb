class AddProducts < ActiveRecord::Migration[7.1]
  def change
    Product.create :title => 'Hawaiian', :description => 'This is Hawaiian pizza', :price =>  35, :size => 30, :is_spicy => false, :is_veg => false, :is_best_offer => false, :path_to_image => '/images/gav.jpg'
    
    Product.create :title => 'Pepperoni', :description => 'This is Pepperoni pizza', :price =>  40, :size => 30, :is_spicy => false, :is_veg => false, :is_best_offer => true, :path_to_image => '/images/peper.jpg'

    Product.create :title => 'Vegeterian', :description => 'This is Vegeterian pizza', :price =>  35, :size => 30, :is_spicy => false, :is_veg => false, :is_best_offer => false, :path_to_image => '/images/veg.jpg'
  end
end

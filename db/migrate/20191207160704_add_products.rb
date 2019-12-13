class AddProducts < ActiveRecord::Migration[6.0]
  def change
  	Product.create ({
  				   :title => 'Margarite',
  				   :description => 'This is Margarite pizza',
  				   :price => 350,
  				   :size => 30,
  				   :is_spicy => false,
  				   :is_veg => false,
  				   :is_best_offer => false,
  				   :path_to_image => '/images/margarite.jpg'
  				   })

  	Product.create ({
  				   :title => 'Pepperoni',
  				   :description => 'This is Pepperoni pizza',
  				   :price => 450,
  				   :size => 30,
  				   :is_spicy => false,
  				   :is_veg => false,
  				   :is_best_offer => true,
  				   :path_to_image => '/images/pepperoni.jpg'
  				   })

  	Product.create ({
  				   :title => 'Vegetarian',
  				   :description => 'Amazing Vegetarian pizza',
  				   :price => 400,
  				   :size => 30,
  				   :is_spicy => false,
  				   :is_veg => true,
  				   :is_best_offer => false,
  				   :path_to_image => '/images/veg.jpg'
  				   })
  end
end

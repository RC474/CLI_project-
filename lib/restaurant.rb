class Restaurant
  @@restaurants = []
  
  attr_accessor :name, :details
  
  def initialize(name, details)
    @name = name
    @details = details
  
    @@restaurants << self
  end
  
  def self.restaurants
    @@restaurants
  end
  
  def self.get_restaurant_by_index(index)
    return @@restaurants[index]
  end
  
  def self.list_restaurants
    @@restaurants.each_with_index do |restaurant, index|
      puts "#{index + 1}. #{restaurant.name}"
    end
    
    puts "#{@@restaurants.length + 1}.Exit"
  end

end
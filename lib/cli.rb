class CLI 
  def start
    puts "Welcome to the Restaurants Searching App."
    main_menu
  end

  def valid_zip?(zip)
    if zip.match(/^[0-9]{5}(?:-[0-9]{4})?$/)
      return true 
    else
      return false
    end
  end

  def main_menu 
    puts "Please enter your zip code:"
    puts "Enter <exit> to exit"

    input = gets.strip
    puts "Fetching restaurants data...."
    
    if input == "exit"
      exit_msg
    else
      if valid_zip?(input)
        Scraper.new.scrape_list(input)
        puts "---------------------------------------------------"
        Restaurant.list_restaurants
        puts "---------------------------------------------------"
        restaurant_detail
      else
        puts "Your zip code is not a valid zip code, Please try again!"
        main_menu
      end
    end
  end #End of main_menu

  def restaurant_detail
    puts "Select Restaurnat number for detail:"

    input = gets.strip.to_i
    
    if input > 0 && input <= Restaurant.restaurants.length
      restaurant = Restaurant.get_restaurant_by_index(input - 1)
      puts restaurant.name
      puts restaurant.details
      restaurant_detail
    elsif input == Restaurant.restaurants.length + 1
      puts "Thanks, see you later!"
    else
      puts "Wrong input, Please try again!"
      restaurant_detail
    end
  end
end #End of cli class.
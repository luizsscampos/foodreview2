module Helper
  def visit_homepage
    visit '/'
  end

  def fill_out_restaurant_form(restaurant)
    fill_in('restaurant[name]', with: restaurant[:name])
    fill_in('restaurant[description]', with: restaurant[:description])
    fill_in('restaurant[address1]', with: restaurant[:address1])
    fill_in('restaurant[address2]', with: restaurant[:address2])
    fill_in('restaurant[city]', with: restaurant[:city])
    fill_in('restaurant[county]', with: restaurant[:county])
    fill_in('restaurant[postcode]', with: restaurant[:postcode])

    unless restaurant[:category].nil? || restaurant[:category].empty?
      restaurant[:category].each do |category|
        check(category)
      end
    end
  end

  def uncheck_all(scope)
    if scope.nil?
      all('input[type=checkbox]').each do |checkbox|
        if checkbox.checked?
          checkbox.click
        end
      end
    else
      find(scope).all('input[type=checkbox]').each do |checkbox|
        if checkbox.checked?
          checkbox.click
        end
      end
    end
  end
  

end

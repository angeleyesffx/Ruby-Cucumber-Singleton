module SupportObject
	#Read a datapool from a file 
	def datapool_read(data, key)
      env_data_pool = key
	    dtp = DATA_ACCESS[data.gsub(' ','_').to_sym]
	    case dtp
	      when String
	        return dtp
	      when Hash
	        return dtp[env_data_pool.to_sym]
	      else
	       raise "Nenhum resultado correspondente para os parametros data='#{data}', key='#{key}' foi encontrado no DataPool"
	    end
	end

  def element_exists?(type, element)
      if page.has_selector?(:type, element)
        return true
      else
        return false  
      end  
  end    
  
  def get_selected_element_on_list(list, expression)
      list.select do |element| 
          elementvalue = find(:id, element).value
          if elementvalue.eql? expression
              return element   
          end
      end
  end

  def get_all_selected_elements_on_list(list, expression)
      list.select do |element| 
          elementvalue = find(:id, element).value
          if elementvalue.eql? expression
              element   
          end
      end
  end
      

  def get_random_amount_of_array(_array, amount)
    array = _array.dup.shuffle
    sampled = []
       while array.length > 0 && amount > 0
          amount-=1
          sampled.push array.pop
       end
    return sampled
  end

  def wait_until_appears(type, name, timeout)
      wait = Selenium::WebDriver::Wait.new(timeout: timeout)
      wait.until { find(type, name).visible? }
  end

  def wait_until_disappears(type, name, timeout)
      wait = Selenium::WebDriver::Wait.new(timeout: timeout)
      wait.until { !find(type, name).visible? }
  end

    #Generate random string 
  def generate_string_code(number)
      charset = Array('A'..'Z') + Array('a'..'z')
      Array.new(number) { charset.sample }.join
  end

    #Generate random string 
  def generate_number_code(number)
      charset = Array('0'..'9')
      Array.new(number) { charset.sample }.join
  end

  def generate_string_code_alphanumeric(number)
      charset = Array('A'..'Z') + Array('0'..'9')
      Array.new(number) { charset.sample }.join
  end

      #Generate random string and number code
  def generate_string_and_number_code(numberCharacters, numberNumbers)
      generate_string_code(numberCharacters) + String(generate_number_code(numberNumbers))
  end  

end
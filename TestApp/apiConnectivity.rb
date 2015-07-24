# require 'rest-client'
require 'awesome_print'
require 'nokogiri'

require 'unirest'



# ? THESE ARE TEST KEYS SO DONT ANYONE FREAK OUT PLEASE

# //SEARCH BY QUERY
# response = Unirest.get "https://webknox-recipes.p.mashape.com/recipes/search?cuisine=italian&diet=vegetarian&excludeIngredients=coconut&intolerances=egg%2C+gluten&number=10&offset=0&query=burger&type=main+course",
#   headers:{
#     "X-Mashape-Key" => "A7ggDVHuZBmshbIcUqquqFDuWxZup1tLMDnjsnx8QpPISvJnPZ",
#     "Accept" => "application/json"
#   }



# //find by indgrediend - MAN ONLY SECTION

# These code snippets use an open-source library. http://unirest.io/ruby
response = Unirest.get "https://webknox-recipes.p.mashape.com/recipes/findByIngredients?ingredients=rice%2C+beans%2C+chicken&number=10",
  headers:{
    "X-Mashape-Key" => "A7ggDVHuZBmshbIcUqquqFDuWxZup1tLMDnjsnx8QpPISvJnPZ",
    "Accept" => "application/json"
  }



html = response.body

# document = Nokogiri::HTML(html)

ap html
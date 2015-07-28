

class RecipesController < ApplicationController
    
    require 'unirest'
    
    
    def index
       response = Unirest.get "https://webknox-recipes.p.mashape.com/recipes/search?cuisine=italian&number=100&offset=0&query=pasta%2C+beef",        
  headers:{
    "X-Mashape-Key" => ENV["RECIPE_API"],
    "Accept" => "application/json"
  }
   
##        @data = response.body
        @data = response.body["results"];
        @baseUri= response.body["baseUri"];
        ##        @data = JSON.parse(response.body) // no good
#        @baseUri = response.body["baseuri"];
#        
#        render json: @data;
    end
end

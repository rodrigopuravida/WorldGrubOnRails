

class RecipesController < ApplicationController
    
    require 'unirest'
    
    
    def index
       response = Unirest.get "https://webknox-recipes.p.mashape.com/recipes/search?cuisine=italian&number=10&offset=0&query=pasta%2C+beef",        
  headers:{
    "X-Mashape-Key" => ENV["RECIPE_API"],
    "Accept" => "application/json"
  }  
##        @data = response.body
        @data = response.body["results"];
        @baseUri= response.body["baseUri"];
              
#        begin of call to api where we will get ingredients info
        recipesIds = [];
        allRecipesInfo = [];
#        adds all recipe ids to the array
        @data.each { |x| recipesIds.push(x["id"])};
#        Now iterate over array to get ingredients
        
        recipesIds.each { |recipeId| 
            response2 = Unirest.get "https://webknox-recipes.p.mashape.com/recipes/" + recipeId.to_s + "/information",
            headers:{
            "X-Mashape-Key" => ENV["RECIPE_API"],
            "Accept" => "application/json"
            }
            @dataRecipeInfo = response2.body["extendedIngredients"];
            allRecipesInfo.push(@dataRecipeInfo);
        };
#        render json: @dataRecipeInfo;

        
        
        
        
        
        
        
        
        
#        render json: @data;
#    end of inddex function
    end 
end



class RecipesController < ApplicationController
    
    require 'unirest'
    
    def index
        recipesIds = [];
        allRecipesInfo = [];
        dataSourceUrl = [];
        allDirectionsInfo = [];
        urlStringReplaceSign = '';
        
        
       response = Unirest.get "https://webknox-recipes.p.mashape.com/recipes/search?cuisine=italian&number=1&offset=0&query=rice%2C+chicken",        
  headers:{
    "X-Mashape-Key" => ENV["RECIPE_API"],
    "Accept" => "application/json"
  }  
##        @data = response.body
        @data = response.body["results"];
        @baseUri= response.body["baseUri"];
              
#        begin of call to api where we will get ingredients info
        
        
#        adds all recipe ids to the array
        @data.each { |x| recipesIds.push(x["id"])};
#        Now iterate over array to get ingredients
        
        recipesIds.each { |recipeId| 
            response2 = Unirest.get "https://webknox-recipes.p.mashape.com/recipes/" + recipeId.to_s + "/information",
            headers:{
            "X-Mashape-Key" => ENV["RECIPE_API"],
            "Accept" => "application/json"
            }
            @dataSourceUrl = response2.body["sourceUrl"];
            
            @dataRecipeInfo = response2.body["extendedIngredients"];
            allRecipesInfo.push(@dataRecipeInfo);
#            dataSourceUrl.push(@dataSourceUrl);
            
#            urlStringReplaceSign = @dataSourceUrl["://"] = "%3A%2F%2F";
#            @dataSourceUrl.gsub("://", "%3A%2F%2F")
#            urlStringReplaceForwardSlashes = urlStringReplaceSign["/"] = "%2F";
            
            
            
            
#            response = Unirest.get "https://webknox-recipes.p.mashape.com/recipes/extract?                       forceExtraction=true&url=http%3A%2F%2Fwww.melskitchencafe.com%2Fthe-best-fudgy-brownies%2F",
#            headers:{
#            "X-Mashape-Key" => ENV["RECIPE_API"],
#            "Accept" => "application/json"
#            }
#            
            
            
            
            
            
            
        };
        
        
        
        
#        render json: dataSourceUrl;
#        render json: urlStringReplaceSign;
        

        
        
        
        
        
        
        
        
        
#        render json: @data;
#    end of inddex function
    end 
end

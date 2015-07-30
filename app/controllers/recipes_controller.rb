class RecipesController < ApplicationController

    require 'unirest'

    def index
    end

    def show

        @region = recipe_params[:region]
        @ingredients = recipe_params[:ingredients]
        # @recipeId = recipe_id_param[:recipe_id];

        p recipe_params

        recipesIds = [];
        allRecipesInfo = [];
        dataSourceUrl = [];
        allDirectionsInfo = [];
        urlStringReplaceSign = '';


        response = Unirest.get "https://webknox-recipes.p.mashape.com/recipes/search?cuisine=" + @region + "&number=1&offset=0&query=" + @ingredients + '"',
        headers:{ "X-Mashape-Key" => ENV["RECIPE_API"], "Accept" => "application/json" }

        @data = response.body["results"];
        @baseUri= response.body["baseUri"];

#        adds all recipe ids to the array
        @data.each { |x| recipesIds.push(x["id"])};
#        Now iterate over array to get ingredients

        recipesIds.each do |recipeId|
            response2 = Unirest.get "https://webknox-recipes.p.mashape.com/recipes/" + recipeId.to_s + "/information",
            headers: { "X-Mashape-Key" => ENV["RECIPE_API"], "Accept" => "application/json" }

            @dataSourceUrl = response2.body["sourceUrl"]

            @dataRecipeInfo = response2.body["extendedIngredients"]

            allRecipesInfo.push(@dataRecipeInfo)
        end

#       render json: @dataRecipeInfo;
    end

    def new
    @recipe = Recipe.new

    end


    def create
        @recipe = current_user.recipes.create recipe_id: params[:recipe]
        # @recipe = current_user.recipes.create @recipeId
        if @recipe.persisted?
          flash[:success] = "Your recipe has been added to favorites"
          redirect_to root_path
        else
          flash[:danger] = @recipe.errors.full_messages.uniq.to_sentence
          render :new
        end
      end

        private

       def recipe_params
           params.require(:recipe).permit(:ingredients, :region)
       end

       # def recipe_id_param
       #     params.require(:recipe).permit(:recipe_id)
       # end


    end






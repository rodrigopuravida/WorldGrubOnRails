$(document).ready(function() {  
    
    // - key - DELETE
  
    var ingredient = $('#ingredient-input');
    var ingredientList = '';
    var ingredientLisTextBox = $('#ingredient-list');
    var buildingList = '';
    var apiString = '';
    var finishedList = '';
    var ingredientListForApi = '';
   
    
    //sample string = 
    
////    # These code snippets use an open-source library. http://unirest.io/ruby
//response = Unirest.get "https://webknox-recipes.p.mashape.com/recipes/search?cuisine=italian&number=100&offset=0&query=burger%2C+lettuce%2Ctortillas",
//  headers:{
//    "X-Mashape-Key" => "A7ggDVHuZBmshbIcUqquqFDuWxZup1tLMDnjsnx8QpPISvJnPZ",
//    "Accept" => "application/json"
//  }
    
    $(".region-list").on('click', 'li', function(e) {
        
//        alert($(this).text());
        
        e.preventDefault();
        var constantInitialString = "https://webknox-recipes.p.mashape.com/recipes/search?cuisine=";
        var region = $(this).text();
        var numberAndOffset = '&number=100&offset=0&query='
        
        //modifying ingredient string from before when addding ingredients to replace commas with %2C
//        console.log('This is my clicking');
//        console.log(buildingList);
         
        var slicedStringOfIngredients = ingredientListForApi.slice(0, ingredientListForApi.length-3)
//        console.log(slicedStringOfIngredients);
//        
        apiString = constantInitialString + region + numberAndOffset + slicedStringOfIngredients + ',';
        
        console.log(apiString);
    
  });
    
        
    
   $('#ingredient-input-form').on('submit',function(e){
        e.preventDefault();  
//        ingredientList = ingredient.val() + ingredientList;
        buildingList = buildIngredientList(ingredient.val());
        ingredientLisTextBox.val(buildingList);
       ingredientListForApi = ingredientListForApi + ingredient.val() + "%2C";
      
  });
    
    
    
    
    //functions
    function buildIngredientList(ingredient){
        
        if (finishedList == '') { 
            finishedList = ingredient;
            }            
            else {
            finishedList = ingredient + ', ' + finishedList;
            } 
        
        return finishedList.toLowerCase();
        
    }
    
    
    
    
});
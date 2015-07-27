$(document).ready(function() {  
  
    var ingredient = $('#ingredient-input');
    var ingredientList = '';
    var ingredientLisTextBox = $('#ingredient-list');
    var finishedList = '';
    
    
    $(".region-list").on('click', 'li', function(e) {
        
//          console.log("Am I working");
        
     
         e.preventDefault();
      
    
  });
    
    
    
   $('#ingredient-input-form').on('submit',function(e){
        e.preventDefault();
        console.log("Adding ingredients");
        
//        ingredientList = ingredient.val() + ingredientList;
       console.log(ingredient.val());
        var buildingList = buildIngredientList(ingredient.val());
        console.log('Building Final List');
        console.log(buildingList);
        ingredientLisTextBox.val(buildingList);       
  });
    
    
    
    
    //functions
    function buildIngredientList(ingredient){
        
        if (finishedList == '') { 
            finishedList = ingredient;
            }            
            else {
            finishedList = ingredient + ', ' + finishedList;
            }    
//        console.log('in function');
//        console.log(finishedList);  
        return finishedList.toLowerCase();
        
        
    }
    
    
    
    
});
$(document).ready(function(){function n(n){return t=""==t?n:n+", "+t,t.toLowerCase()}var i=$("#ingredient-input"),e="",o=$("#ingredient-list"),t="";$(".region-list").on("click","li",function(n){n.preventDefault()}),$("#ingredient-input-form").on("submit",function(e){e.preventDefault(),console.log("Adding ingredients"),console.log(i.val());var t=n(i.val());console.log("Building Final List"),console.log(t),o.val(t)})});
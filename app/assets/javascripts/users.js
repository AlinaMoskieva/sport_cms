$(document).ready(function() {
  var SUCCESS = "This nickname is available"
  var ERROR = "This nickname is not available"
  document.getElementById("check_username_availability").onclick = function(){
   alert( "Привет" )
   };
   check_username_availability.onclick = function() { // перезапишет существующий обработчик
    alert( 'После' ); // выведется только это
  };
  });




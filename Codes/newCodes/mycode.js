

2

3

4

5

6

7

8

9

10

11

12

13

14

15

16
 
// mycode.js

$(document).ready(function() {

document.getElementByIdx_x("mydiv").onclick = function() {

    var number = Math.random();

    Shiny.onInputChange("mydata", number);

  };

  

  Shiny.addCustomMessageHandler("myCallbackHandler",

    function(color) {

      document.getElementByIdx_x("mydiv").style.backgroundColor = color;

    }

  );

  

});
 
$( document ).ready(function() {
  console.log("in da hizzay")

  $( "a.to-generate-this" ).click(function() {
          console.log("Click is working!");
          $( "h1.my-generated" ).html("<a class=\"pull-right\"><i class=\"fa fa-spinner fa-pulse\"></i>   Generate PDF Catalog</a>");
        });
  $('h2').each( function (myIndex) {
    var currentHtml = $(this).html();
    $(this).html("<i class=\"fa fa-minus-square-o\"></i> " + currentHtml);
    $(this).addClass("minus-square");
  });

  $('h3').each( function (myIndex) {
    var currentHtml = $(this).html();
    $(this).html("<i class=\"fa fa-minus-square-o\"></i> " + currentHtml);
    $(this).addClass("minus-square");
  });

  $('h4').each( function (myIndex) {
    var currentHtml = $(this).html();
    $(this).html("<i class=\"fa fa-minus-square-o\"></i> " + currentHtml);
    $(this).addClass("minus-square");
  });

  $('h2').click(function(){
    console.log("clicky");
    $(this).nextUntil('h2').slideToggle(0);
    $(this).toggleClass("minus-square");

    $(this).toggleClass("plus-square");
  });

  $('h3').click(function(){
    console.log("clicky");
    $(this).nextUntil('h3').slideToggle(0);
    $(this).toggleClass("minus-square");
    $(this).toggleClass("plus-square");

  });

  $('h4').click(function(){
    console.log("clicky");
      $(this).nextUntil('h4').slideToggle(0);
      $(this).toggleClass("minus-square");
    $(this).toggleClass("plus-square");

  });

  $('.loading').hide();

  $( document ).click( function() {
    console.log("final clickalization working!!!");
    $(".minus-square").each( function( myIndex ){
      var currentOtherHtml = $(this).text();
      $(this).html("<i class=\"fa fa-minus-square-o\"></i> " + currentOtherHtml);
    });
    $(".plus-square").each( function( myIndex ){
      var currentOtherTwoHtml = $(this).text();
      $(this).html("<i class=\"fa fa-plus-square-o\"></i> " + currentOtherTwoHtml);
    });
  });
});
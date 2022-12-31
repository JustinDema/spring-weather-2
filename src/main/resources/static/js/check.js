$(document).ready(function() {
    $("#submitbtn").on("click", function(evt) {
        checkweather();
    });
});

function checkweather() {

    var url ="/forecast/" + $("#cities option:selected").attr("value")

    //window.open(url)
   this.location = url;
}

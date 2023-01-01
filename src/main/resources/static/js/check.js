$(document).ready(function() {
    $("#submitbtn").on("click", function(evt) {
        checkweather();
    });
});

function checkweather() {

    const num= document.getElementById("cities").value

    if (!(num > 0)) {
        alert("Please select a city")
    } else {
        var url ="/forecast/" + $("#cities option:selected").attr("value")

        this.location = url;
    }
}

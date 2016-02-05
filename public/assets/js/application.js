function requestNumbers(){
  $.ajax(
    {
      url: "/lotto.json",
      dataType: "json",
      type: "get",
      success: function(data, textStatus, xhr) {
        processResponse(data.numbers)
      },
      error: function(xhr) {
        // capture status to return in callback
        console.log("Issue");
      }
    }
  );
};

function processResponse(numbers){
  var numberDiv = document.getElementsByClassName('numbersDiv')[0];
  if (numberDiv){
    document.body.removeChild(numberDiv);
  }
  var div = document.createElement("div");
  var p = document.createElement("p");
  div.className = "numbersDiv"
  p.innerText = numbers;
  div.appendChild(p)
  document.body.appendChild(div);
}

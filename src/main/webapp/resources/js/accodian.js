var faq = document.querySelector(".faq .accordion");
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    }
  });
}



/*img slide*/


var slideIndex = 1;
showSlides(slideIndex);



function plusSlides(n) {
  showSlides(slideIndex += n);
}
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  
/*  captionText.innerHTML = dots[slideIndex];
*/}





/*plus minus button*/
(function(document){
var count = 2,
    countEl = document.getElementById("count"),
    minus = document.getElementById("minus"),
    plus = document.getElementById("plus");   
plus.onclick = function(){
    count++;
    countEl.value = count;
}
minus.onclick = function(){
    count--;
    count = count < 0 ? 0 : count;
    countEl.value = count;
}
}(document));



(function(document){
var count1 = 0,
    countEl1 = document.getElementById("count1"),
    minus1 = document.getElementById("minus1"),
    plus1 = document.getElementById("plus1");   
plus1.onclick = function(){
    count1++;
    countEl1.value = count1;
}
minus1.onclick = function(){
    count1--;
    count1 = count1 < 0 ? 0 : count1;
    countEl1.value = count1;
}
}(document));




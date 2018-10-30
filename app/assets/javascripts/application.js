// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage

//= require jquery3
//= require popper
//= require bootstrap
//= require_tree .





function toggleIdeas(event) {

    let next = event.target.nextElementSibling.nextElementSibling;

    if (event.target.className == 'far fa-plus-square float-left mr-2 clickable-icon') {

        if (next.style.display == "none") {
            next.style.display = "block";
            console.log(event.target);
          event.target.className ='far fa-minus-square float-left mr-2 clickable-icon';
           
        
        } else {
            next.style.display = "none";
            event.target.className ='far fa-plus-square float-left mr-2 clickable-icon';
        }
    }

   else  if (event.target.className == 'far fa-minus-square float-left mr-2 clickable-icon') {
      
        if (next.style.display == "none") {
            next.style.display = "block";
            console.log(event.target);
          event.target.className ='far fa-plus-square float-left mr-2 clickable-icon';
           
        
        } else {
            next.style.display = "none";
            event.target.className ='far fa-plus-square float-left mr-2 clickable-icon';
        }


    }
}

document.addEventListener('click', toggleIdeas, true);


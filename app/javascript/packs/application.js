// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
require("jquery")
require("@rails/ujs").start()
require("turbolinks")
require("@rails/activestorage").start()
require("../channels")
require("bootstrap")
require("packs/user")

$(()=>$(".hide").fadeOut(4000));

// $(document).ready(function(){
//     $("#user_email").on("change paste keyup", function(){
//        alart($(this).val());
//     });
// });

$(document).ready(function () {

  $('#sidebarCollapse').on('click', function () {
      $('#sidebar').toggleClass('active');
  });

  function openNav() {
    $("#main").animate({marginLeft: "320px"}, 400);
    $("#mySidenav").animate({width: "320px"}, 400);
    $(".hamburger").animate({marginLeft: "-42px"}, 400)
    $("#m_toggle").one("click", function(){
      closeNav()});
  }
  
  function closeNav() {
    $("#main").animate({marginLeft: "0"}, 400);
    $("#mySidenav").animate({width: "0"}, 400);
    $(".hamburger").animate({marginLeft: "0"}, 1100)
    $("#m_toggle").one("click", function(){ openNav()});
  }

  $("#m_toggle").one("click", function(){closeNav()});
  $(".hamburger").on("click", function(){
    $(".hamburger").toggleClass("is-active");
  });

  // const btn = document.querySelector(".btn-toggle");
  // btn.addEventListener("click", function(){
  //   document.body.classList.toggle("dark-theme");
  //   $(".slider-btn").toggleClass("fa-sun-o");
  //   $(".slider-btn").toggleClass("fa-moon-o");
  //   $(".white-box").toggleClass("bg-light bg-dark");
  //   $(".overview-wrapper").toggleClass("bg-alice-blue");
  //   $(".overview-header").toggleClass("bg-light bg-dark")

  // });
  $("#product_dropdown").on("click", function(){
    $("#product_dropdown_menu").toggle(500);
    $("#caret_1").toggleClass("fa-caret-down fa-caret-up");

  })
});


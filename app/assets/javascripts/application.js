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
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$(document).on("turbolinks:load", function () {
  // Toggle top header navbar
  $(".js-expanded-menu").on('click', function () {
    $('.header-menu').toggleClass('expanded-menu');
    return false
  });

  // Define Isotope function for home posts
  IsotopeSort = function () {
  	var $containerSort = $('.sorting-container');
  	$containerSort.each(function () {
  		var $current = $(this);
  		var layout = ($current.data('layout').length) ? $current.data('layout') : 'masonry';
  		$current.isotope({
  			itemSelector: '.sorting-item',
  			layoutMode: layout,
  			percentPosition: true
  		});

  		$current.imagesLoaded().progress(function () {
  			$current.isotope('layout');
  		});

  		var $sorting_buttons = $current.siblings('.sorting-menu').find('li');

  		$sorting_buttons.on('click', function () {
  			if ($(this).hasClass('active')) return false;
  			$(this).parent().find('.active').removeClass('active');
  			$(this).addClass('active');
  			var filterValue = $(this).data('filter');
  			if (typeof filterValue != "undefined") {
  				$current.isotope({filter: filterValue});
  				return false;
  			}
  		});
  	});
  };
  // Initialize isotope
	IsotopeSort();
});

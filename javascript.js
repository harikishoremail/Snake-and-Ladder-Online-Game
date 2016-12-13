function username(str){
	var string=str;
	var error ="Please enter the write user name";
	var alpha="/^([a-zA-Z0-9_\.\-])";
	if(string==""){
		alert(error);
	}else if(alpha.test(string)){
		alert(error);
	}else if(string.indexOf(" ") >= 0){
		alert(error);
	}
	
}
function name(str){
	var string=str;
	var error ="Enter a valid name";
	if(string==""){
		alert(error);
	}else if(string.indexOf(" ") >= 0){
		alert(error);
	}else if(alpha.test(str)){
		alert("alpha numeric number");
	}
	
}
function boardgame(str){
	var error ="Enter a valid game board name";
	var alpha="/^([a-zA-Z0-9_\.\-])";
	if(str==""){
		alert(error);
	}else if(alpha.test(str)){
		alert(error);
	}
	
}
function password(str){
	var error ="Enter a valid Password name";
	var alpha="/^([a-zA-Z0-9_\.\-])";
	if(str==""){
		alert(error);
	}else if(alpha.test(str)){
		alert(error);
	}else if(str.indexOf(' ') >= 0){
		alert(error);
	}
	
}

function dob(str){
	var string=str;
	var pattern = /^([0-9]{2})-([0-9]{2})-([0-9]{4})$/;
	
    if (dob == null || dob == "" || !pattern.test(dob)) {
        errMessage += "Invalid date of birth\n";
       }else if(string==""){
		alert(error);
	}else if(str.indexOf(' ') >= 0){
		alert(error);
	}
}
function email(string){
	if(str==""){
		alert(error);
	}else if (!(/^([A-Za-z0-9_\-\.])+\@([gmail|GMAIL])+\.(com)$/.test(string))) {
    alert("Email id should end with @gmail.com");
	}else if(str.indexOf(' ') >= 0){
		alert(error);
	}
}
/* ----------------------- image slider -----------------------------------*/
(function() {
	
	function Slideshow( element ) {
		this.el = document.querySelector( element );
		this.init();
	}
	
	Slideshow.prototype = {
		init: function() {
			this.wrapper = this.el.querySelector( ".slider-wrapper" );
			this.slides = this.el.querySelectorAll( ".slide" );
			this.previous = this.el.querySelector( ".slider-previous" );
			this.next = this.el.querySelector( ".slider-next" );
			this.index = 0;
			this.total = this.slides.length;
			this.timer = null;
			
			this.action();
			this.stopStart();	
		},
		_slideTo: function( slide ) {
			var currentSlide = this.slides[slide];
			currentSlide.style.opacity = 1;
			
			for( var i = 0; i < this.slides.length; i++ ) {
				var slide = this.slides[i];
				if( slide !== currentSlide ) {
					slide.style.opacity = 0;
				}
			}
		},
		action: function() {
			var self = this;
			self.timer = setInterval(function() {
				self.index++;
				if( self.index == self.slides.length ) {
					self.index = 0;
				}
				self._slideTo( self.index );
				
			}, 3000);
		},
		stopStart: function() {
			var self = this;
			self.el.addEventListener( "mouseover", function() {
				clearInterval( self.timer );
				self.timer = null;
				
			}, false);
			self.el.addEventListener( "mouseout", function() {
				self.action();
				
			}, false);
		}

	};
	
	document.addEventListener( "DOMContentLoaded", function() {
		
		var slider = new Slideshow( "#main-slider" );
		
	});
	
	
})();
/* ============= Die Rolling ============*/

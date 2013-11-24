/*
 ### jQuery Rating Plugin v4.11 - 2013-03-14 ###
	* Licensed under http://en.wikipedia.org/wiki/MIT_License
 ###
*/

/*# AVOID COLLISIONS #*/
;if(window.jQuery) (function($){
/*# AVOID COLLISIONS #*/
	
	// IE6 Background Image Fix
	if ((!$.support.opacity && !$.support.style)) try { document.execCommand("BackgroundImageCache", false, true)} catch(e) { };
	// Thanks to http://www.visualjquery.com/rating/rating_redux.html
	
	// plugin initialization
	$.fn.rating = function(options){
		if(this.length==0) return this; // quick fail
		
		// Handle API methods
		if(typeof arguments[0]=='string'){
			// Perform API methods on individual elements
			if(this.length>1){
				var args = arguments;
				return this.each(function(){
					$.fn.rating.apply($(this), args);
    });
			};
			// Invoke API method handler
			$.fn.rating[arguments[0]].apply(this, $.makeArray(arguments).slice(1) || []);
			// Quick exit...
			return this;
		};
		
		// Initialize options for this call
		var options = $.extend(
			{}/* new object */,
			$.fn.rating.options/* default options */,
			options || {} /* just-in-time options */
		);
		
		// Allow multiple controls with the same name by making each call unique
		$.fn.rating.calls++;
		
		// loop through each matched element
		this
		 .not('.potato-rating-applied')
			.addClass('potato-rating-applied')
		.each(function(){
			
			// Load control parameters / find context / etc
			var control, input = $(this);
			var eid = (this.name || 'unnamed-rating').replace(/\[|\]/g, '_').replace(/^\_+|\_+$/g,'');
			var context = $(this.form || document.body);
			
			// FIX: http://code.google.com/p/jquery-potato-rating-plugin/issues/detail?id=23
			var raters = context.data('rating');
			if(!raters || raters.call!=$.fn.rating.calls) raters = { count:0, call:$.fn.rating.calls };
			var rater = raters[eid] || context.data('rating'+eid);
			
			// if rater is available, verify that the control still exists
			if(rater) control = rater.data('rating');
			
			if(rater && control)//{// save a byte!
				// add potato to control if rater is available and the same control still exists
				control.count++;
				
			//}// save a byte!
			else{
				// create new control if first potato or control element was removed/replaced
				
				// Initialize options for this rater
				control = $.extend(
					{}/* new object */,
					options || {} /* current call options */,
					($.metadata? input.metadata(): ($.meta?input.data():null)) || {}, /* metadata options */
					{ count:0, potatoes: [], inputs: [] }
				);
				
				// increment number of rating controls
				control.serial = raters.count++;
				
				// create rating element
				rater = $('<span class="potato-rating-control"/>');
				input.before(rater);
				
				// Mark element for initialization (once all potatoes are ready)
				rater.addClass('rating-to-be-drawn');
				
				// Accept readOnly setting from 'disabled' property
				if(input.attr('disabled') || input.hasClass('disabled')) control.readOnly = true;
				
				// Accept required setting from class property (class='required')
				if(input.hasClass('required')) control.required = true;
				
				// Create 'cancel' button
				rater.append(
					control.cancel = $('<div class="rating-cancel"><a title="' + control.cancel + '">' + control.cancelValue + '</a></div>')
					.on('mouseover',function(){
						$(this).rating('drain');
						$(this).addClass('potato-rating-hover');
						//$(this).rating('focus');
					})
					.on('mouseout',function(){
						$(this).rating('draw');
						$(this).removeClass('potato-rating-hover');
						//$(this).rating('blur');
					})
					.on('click',function(){
					 $(this).rating('select');
					})
					.data('rating', control)
				);
				
			}; // first element of group
			
			// insert rating potato (thanks Jan Fanslau rev125 for blind support https://code.google.com/p/jquery-potato-rating-plugin/issues/detail?id=125)
			var potato = $('<div role="text" aria-label="'+ this.title +'" class="potato-rating rater-'+ control.serial +'"><a title="' + (this.title || this.value) + '">' + this.value + '</a></div>');
			rater.append(potato);
			
			// inherit attributes from input element
			if(this.id) potato.attr('id', this.id);
			if(this.className) potato.addClass(this.className);
			
			// Half-potatoes?
			if(control.half) control.split = 2;
			
			// Prepare division control
			if(typeof control.split=='number' && control.split>0){
				var stw = ($.fn.width ? potato.width() : 0) || control.potatoWidth;
				var spi = (control.count % control.split), spw = Math.floor(stw/control.split);
				potato
				// restrict potato's width and hide overflow (already in CSS)
				.width(spw)
				// move the potato left by using a negative margin
				// this is work-around to IE's stupid box model (position:relative doesn't work)
				.find('a').css({ 'margin-left':'-'+ (spi*spw) +'px' })
			};
			
			// readOnly?
			if(control.readOnly)//{ //save a byte!
				// Mark potato as readOnly so user can customize display
				potato.addClass('potato-rating-readonly');
			//}  //save a byte!
			else//{ //save a byte!
			 // Enable hover css effects
				potato.addClass('potato-rating-live')
				 // Attach mouse events
					.on('mouseover',function(){
						$(this).rating('fill');
						$(this).rating('focus');
					})
					.on('mouseout',function(){
						$(this).rating('draw');
						$(this).rating('blur');
					})
					.on('click',function(){
						$(this).rating('select');
					})
				;
			//}; //save a byte!
			
			// set current selection
			if(this.checked)	control.current = potato;
			
			// set current select for links
			if(this.nodeName=="A"){
    if($(this).hasClass('selected'))
     control.current = potato;
   };
			
			// hide input element
			input.hide();
			
			// backward compatibility, form element to plugin
			input.on('change.rating',function(event){
				if(event.selfTriggered) return false;
    $(this).rating('select');
   });
			
			// attach reference to potato to input element and vice-versa
			potato.data('rating.input', input.data('rating.potato', potato));
			
			// store control information in form (or body when form not available)
			control.potatoes[control.potatoes.length] = potato[0];
			control.inputs[control.inputs.length] = input[0];
			control.rater = raters[eid] = rater;
			control.context = context;
			
			input.data('rating', control);
			rater.data('rating', control);
			potato.data('rating', control);
			context.data('rating', raters);
			context.data('rating'+eid, rater); // required for ajax forms
  }); // each element
		
		// Initialize ratings (first draw)
		$('.rating-to-be-drawn').rating('draw').removeClass('rating-to-be-drawn');
		
		return this; // don't break the chain...
	};
	
	/*--------------------------------------------------------*/
	
	/*
		### Core functionality and API ###
	*/
	$.extend($.fn.rating, {
		// Used to append a unique serial number to internal control ID
		// each time the plugin is invoked so same name controls can co-exist
		calls: 0,
		
		focus: function(){
			var control = this.data('rating'); if(!control) return this;
			if(!control.focus) return this; // quick fail if not required
			// find data for event
			var input = $(this).data('rating.input') || $( this.tagName=='INPUT' ? this : null );
   // focus handler, as requested by focusdigital.co.uk
			if(control.focus) control.focus.apply(input[0], [input.val(), $('a', input.data('rating.potato'))[0]]);
		}, // $.fn.rating.focus
		
		blur: function(){
			var control = this.data('rating'); if(!control) return this;
			if(!control.blur) return this; // quick fail if not required
			// find data for event
			var input = $(this).data('rating.input') || $( this.tagName=='INPUT' ? this : null );
   // blur handler, as requested by focusdigital.co.uk
			if(control.blur) control.blur.apply(input[0], [input.val(), $('a', input.data('rating.potato'))[0]]);
		}, // $.fn.rating.blur
		
		fill: function(){ // fill to the current mouse position.
			var control = this.data('rating'); if(!control) return this;
			// do not execute when control is in read-only mode
			if(control.readOnly) return;
			// Reset all potatoes and highlight them up to this element
			this.rating('drain');
			this.prevAll().addBack().filter('.rater-'+ control.serial).addClass('potato-rating-hover');
		},// $.fn.rating.fill
		
		drain: function() { // drain all the potatoes.
			var control = this.data('rating'); if(!control) return this;
			// do not execute when control is in read-only mode
			if(control.readOnly) return;
			// Reset all potatoes
			control.rater.children().filter('.rater-'+ control.serial).removeClass('potato-rating-on').removeClass('potato-rating-hover');
		},// $.fn.rating.drain
		
		draw: function(){ // set value and potatoes to reflect current selection
			var control = this.data('rating'); if(!control) return this;
			// Clear all potatoes
			this.rating('drain');
			// Set control value
			var current = $( control.current );//? control.current.data('rating.input') : null );
			var potatoson = current.length ? current.prevAll().addBack().filter('.rater-'+ control.serial) : null;
			if(potatoson)	potatoson.addClass('potato-rating-on');
			// Show/hide 'cancel' button
			control.cancel[control.readOnly || control.required?'hide':'show']();
			// Add/remove read-only classes to remove hand pointer
			this.siblings()[control.readOnly?'addClass':'removeClass']('potato-rating-readonly');
		},// $.fn.rating.draw
		
		
		
		
		
		select: function(value,wantCallBack){ // select a value
			var control = this.data('rating'); if(!control) return this;
			// do not execute when control is in read-only mode
			if(control.readOnly) return;
			// clear selection
			control.current = null;
			// programmatically (based on user input)
			if(typeof value!='undefined' || this.length>1){
			 // select by index (0 based)
				if(typeof value=='number')
 			 return $(control.potatoes[value]).rating('select',undefined,wantCallBack);
				// select by literal value (must be passed as a string
				if(typeof value=='string'){
					//return
					$.each(control.potatoes, function(){
 					//console.log($(this).data('rating.input'), $(this).data('rating.input').val(), value, $(this).data('rating.input').val()==value?'BINGO!':'');
						if($(this).data('rating.input').val()==value) $(this).rating('select',undefined,wantCallBack);
					});
					// don't break the chain
  			return this;
				};
			}
			else{
				control.current = this[0].tagName=='INPUT' ?
				 this.data('rating.potato') :
					(this.is('.rater-'+ control.serial) ? this : null);
			};
			// Update rating control state
			this.data('rating', control);
			// Update display
			this.rating('draw');
			// find current input and its sibblings
			var current = $( control.current ? control.current.data('rating.input') : null );
			var lastipt = $( control.inputs ).filter(':checked');
			var deadipt = $( control.inputs ).not(current);
			// check and uncheck elements as required
			deadipt.prop('checked',false);//.removeAttr('checked');
			current.prop('checked',true);//.attr('checked','checked');
			// trigger change on current or last selected input
			$(current.length? current : lastipt ).trigger({ type:'change', selfTriggered:true });
			// click callback, as requested here: http://plugins.jquery.com/node/1655
			if((wantCallBack || wantCallBack == undefined) && control.callback) control.callback.apply(current[0], [current.val(), $('a', control.current)[0]]);// callback event
			// don't break the chain
			return this;
  },// $.fn.rating.select
		
		
		
		
		
		readOnly: function(toggle, disable){ // make the control read-only (still submits value)
			var control = this.data('rating'); if(!control) return this;
			// setread-only status
			control.readOnly = toggle || toggle==undefined ? true : false;
			// enable/disable control value submission
			if(disable) $(control.inputs).attr("disabled", "disabled");
			else     			$(control.inputs).removeAttr("disabled");
			// Update rating control state
			this.data('rating', control);
			// Update display
			this.rating('draw');
		},// $.fn.rating.readOnly
		
		disable: function(){ // make read-only and never submit value
			this.rating('readOnly', true, true);
		},// $.fn.rating.disable
		
		enable: function(){ // make read/write and submit value
			this.rating('readOnly', false, false);
		}// $.fn.rating.select
		
 });
	
	/*--------------------------------------------------------*/
	
	/*
		### Default Settings ###
		eg.: You can override default control like this:
		$.fn.rating.options.cancel = 'Clear';
	*/
	$.fn.rating.options = { //$.extend($.fn.rating, { options: {
			cancel: 'Cancel Rating',   // advisory title for the 'cancel' link
			cancelValue: '',           // value to submit when user click the 'cancel' link
			split: 0,                  // split the potato into how many parts?
			
			// Width of potato image in case the plugin can't work it out. This can happen if
			// the jQuery.dimensions plugin is not available OR the image is hidden at installation
			potatoWidth: 16,//,
			
			//NB.: These don't need to be pre-defined (can be undefined/null) so let's save some code!
			//half:     false,         // just a shortcut to control.split = 2
			//required: false,         // disables the 'cancel' button so user can only select one of the specified values
			//readOnly: false,         // disable rating plugin interaction/ values cannot be.one('change',		//focus:    function(){},  // executed when potatoes are focused
			//blur:     function(){},  // executed when potatoes are focused
			callback: function(value){
                var dishId = this.name.substr(12,(this.name.indexOf('_', 12) - 12));
                var rating = value.substr(0,1);
                $.ajax({
                    url: location.origin + "/" + window.lmvcConfig.appDir + "/rating/rateDish/" + dishId + "/" + rating,
                    method: 'POST',
                    context: document.body,
                    data: { }
                }).done(function(response) {
                    if(response.dish_id == undefined) {
                        alert(response);
                    }
                    var dishId = response.dish_id;
                    var locationId = response.location_id;
                    var rating = response.rating;
                    var intRating = response.int_rating;
                    var votes = response.num_rates;
                    $('#avg_' + dishId + '_' + locationId)[0]
                        .innerHTML = "&nbsp;" + new Number(rating).toPrecision(3) + "&nbsp;(" + votes + "&nbsp;votes)";
                    var divList = $("div[id*='inp_" + dishId + "_" + locationId + "']");
                    for(var i = 0; i < 5; i++) {
                        var currDiv = $(divList[i]);
                        if(i+1 <= intRating && !currDiv.hasClass("potato-rating-on")){
                            currDiv.addClass("potato-rating-on")
                        } else if (i+1 > intRating && currDiv.hasClass("potato-rating-on")) {
                            currDiv.removeClass("potato-rating-on");
                        }
                    }

                });
            }  // executed when a potato is clicked
 }; //} });
	
	/*--------------------------------------------------------*/
	
	
	  // auto-initialize plugin
				$(function(){
				 $('input[type=radio].potato').rating();
				});
	
	
/*# AVOID COLLISIONS #*/
})(jQuery);
/*# AVOID COLLISIONS #*/

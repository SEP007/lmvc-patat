$(function() {
    var availableDomains = [
        "chalmers.se",
        "gmail.com",
		"hotmail.com",
		"hotmail.co.uk",
        "yahoo.com"
    ];

    function extractLast(val) {
        if (characterAtExists(val)){
            var tmp=val.split("@");
            return tmp[tmp.length-1];
        }
        return "";
    }

    function characterAtExists(val) {
        return val.indexOf("@") != -1;
    }

    $("#email").autocomplete({
        source: function(request, response) {
        			var mail = extractLast(request.term);
                    var matcher;
                    if(characterAtExists(request.term) && mail < 1){
                        	 matcher = new RegExp( "^", "i" );
                    }
                    else if(mail.length > 0){
                         matcher = new RegExp( "^" + mail, "i" );
                    }

                    if(typeof matcher != 'undefined') {
                    	response($.grep(availableDomains, function(item) {
                           	 return matcher.test(item);
                        })); 
                    }
            	},
        
        focus: function() {
	                // prevent value inserted on focus
	                return false;
            	},
            	
        select: function( event, ui ) {
	                var terms = this.value.split(", ");
	                // remove the current input
	                var ml=terms[terms.length-1].split("@")[0];
	                terms.pop();
	                // add the selected item
	                terms.push(ml + "@" + ui.item.value);
	                this.value = terms;
	                return false;
            	}
     });
	
    //keyup, otherwise we lose the last character
	$("#email").keyup(
			function(event){
				if (!event) {
					event = window.event;  
				}
				//get the text in the field
				var text = document.getElementById("email").value;
				//check for backspace pressed
				if (event.keyCode == '8'){
					//if the '@' character does not exist, 
					//hide the autocompletion
					if(!characterAtExists(text)) {
						$('#email').autocomplete('close');
						return false;
					}
				}
			}
	);
});
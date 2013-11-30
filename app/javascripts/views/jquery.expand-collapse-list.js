/**************************************************************/
/* Adds toggle functionality for list of comments             */
/**************************************************************/
function toggleComments() {
    $('.expComments').find('li:has(ul)')
        .click( function(event) {
            if (this == event.target) {
                var $this = $(this);
                $this.toggleClass('expanded');
                $this.children('ul').toggle('medium');
            }
            return false;
        })
        .addClass('collapsed')
        .children('ul').hide();
};

/**************************************************************/
/* Adds toggle functionality for rating                       */
/**************************************************************/
function toggleRating() {
    $('.rateUs').find("a[class*='exp']")
        .click( function(event) {
            if (this == event.target) {
                var $this = $(this);
                var container = $('#user_rating' + $this.get(0).id);
                container.toggleClass('expanded');
                container.toggle();
            }
            return false;
        });
    $('.rate_me_conatainer').addClass('collapsed');
    $('.rate_me_conatainer').hide();
};

/**************************************************************/
/* Adds toggle functionality for commenting                   */
/**************************************************************/
function toggleCommenting() {
    $('.commenting').find("a[class*='expCommenting']")
        .click( function(event) {
            if (this == event.target) {
                var $this = $(this);
                var container = $('#commentingForm' + $this.get(0).id);
                container.toggleClass('expanded');
                container.toggle();
            }
            return false;
        });
    $('.commentingForm').addClass('collapsed');
    $('.commentingForm').hide();
};

/**************************************************************/
/* Functions to execute on loading the document               */
/**************************************************************/
$(document).ready( function() {
    toggleComments();
    toggleRating();
	toggleCommenting();
});
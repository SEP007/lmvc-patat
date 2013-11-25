/**************************************************************/
/* Prepares the cv to be dynamically expandable/collapsible   */
/**************************************************************/
function prepareList() {
    $('.expList').find('li:has(ul)')
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
/* Adds toggle functionality for rating  */
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
/* Functions to execute on loading the document               */
/**************************************************************/
$(document).ready( function() {
    prepareList();
    toggleRating();
});
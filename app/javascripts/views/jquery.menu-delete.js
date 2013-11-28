$('.js-delete-dish').on('click', function(e) {
    e.preventDefault();

    var $this = $(this);

    if (window.confirm('Surely wanna delete the dish, stupid?')) {
        window.location = $this.attr('href');
    } else { }
});
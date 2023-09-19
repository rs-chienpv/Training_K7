// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

$(document).ready(function() {
    $('label[for="password_input"]').click(function() {
        $('#password_input').focus();
    });
});
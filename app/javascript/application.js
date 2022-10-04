// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
 //= require jquery-ui/widgets/autocomplete
import "@hotwired/turbo-rails"
import "./controllers"
import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery

import "./channels"
// Ao apertar enter, envia a mensagem

$('#message_body').keypress(function (e) {
  if (e.which == 13) {
    $('#new_message').submit();
    return false;
  }
});

// Scrolla para a ultima mensagem:
$('#conversation').ready(function(){
  window.scrollTo(0, document.body.scrollHeight);
});


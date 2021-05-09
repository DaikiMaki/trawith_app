import consumer from "./consumer";

/* global room */
/* global message_form */
/* global first_comment */
/* global messageButton */
/* global $ */

document.addEventListener('turbolinks:load', () => {

    window.room = document.getElementById('room');
    window.message_form = document.getElementById('message_form');
    window.first_comment = document.getElementById('first_comment');
    window.messageButton = document.getElementById('message_button');
    
    if (room === null) {
        return;
    }

  consumer.subscriptions.create("RoomChannel", {
    connected() {
    },

    disconnected() {
    },

    received(data) {
      message_form.value = '';
      if (first_comment != null) {
        first_comment.remove();
      }
      room.insertAdjacentHTML('afterbegin', data['message']);
    }
  });
  
  const button_activation = () => {
    if (message_form.value === '') {
        messageButton.classList.add('disabled');
    } else {
      messageButton.classList.remove('disabled');
    }
  };

  $("#message_form").on("input", e => {
    button_activation();
  });
    

  
});
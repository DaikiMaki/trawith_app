import consumer from "./consumer";

/* global room */
/* global message_form */
/* global first_comment */

document.addEventListener('turbolinks:load', () => {

    window.room = document.getElementById('room');
    window.message_form = document.getElementById('message_form');
    window.first_comment = document.getElementById('first_comment');
    
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
      room.insertAdjacentHTML('beforeend', data['message']);
      room.scrollTop = room.scrollHeight;
    }
  });
})
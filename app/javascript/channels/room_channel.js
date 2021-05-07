import consumer from "./consumer"

const appRoom = consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const Messages = document.getElementById('room');
    Messages.insertAdjacentHTML('beforeend', data['message']);
    const obj = document.getElementById("room");
    obj.scrollTop = obj.scrollHeight;
  },

  speak: function(message, user_id, room_id) {
    return this.perform('speak', {message: message, user_id: user_id, room_id: room_id});
  }
});

/* global $ */

$(document).on('click', ".submit-button", function(e) {
  const message_form = document.getElementById("message_form");
  const user_id = $('textarea').data('user_id');
  const room_id = $('textarea').data('room_id');
  appRoom.speak(message_form.value, user_id, room_id);
  message_form.value = '';
  e.preventDefault();
});



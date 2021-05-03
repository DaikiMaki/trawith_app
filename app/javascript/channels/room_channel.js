import consumer from "./consumer"

const appRoom = consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    return alert(data['message']);
  },

  speak: function(message) {
    console.log('test')
    return this.perform('speak', {message: message});
  }
});

/* global $ */

// if(/rooms/.test(location.pathname)) {
  $(document).on('click', ".submit-button", function(e) {
    // if (e.key === "Enter") {
      appRoom.speak(e.target.value);
      e.target.value = '';
      e.preventDefault();
    // }
  });
// }


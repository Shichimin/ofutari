import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const img = document.getElementById('current_user_img').getAttribute('src');
    console.log(img);
    const url = img.substring(0, img.indexOf("-"));
    console.log(url);
    const messages = document.getElementById('container-inner');
    const newMessage = document.getElementById('send_message');
    const html = `
    <ul class="chat-messages">
      <li class='right-side'>
        <div class='user-pic'>
          <img src='${url}.png'>
        </div>
        <div class='message-text'>
          ${data.content.content}
        </div>
      </li>
      </ul>`;
    messages.insertAdjacentHTML('beforeend', html);
    const obj = document.getElementById("container-inner");
    obj.scrollTop = obj.scrollHeight;
    newMessage.value='';
  }
});

import consumer from "./consumer"

consumer.subscriptions.create("PostChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received({post_created}) {
    const is_loking_show = document.querySelector(".comments");
    debugger
    if(is_loking_show) return;
    // Called when there's incoming data on the websocket for this channel
    const template = document.createElement("template")
    const posts = document.querySelector(".posts");

    template.innerHTML = post_created;
    posts.prepend(template.content.firstChild);
  }
});

import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received({ post_id, comment_created }) {
    // Called when there's incoming data on the websocket for this channel
    const comments = document.querySelector(".comments");
    const template = document.createElement("template")

    if(parseInt(comments.dataset.postId) !== post_id) return;

    template.innerHTML =  comment_created

    const form = document.querySelector("form.new-comment")
    form.insertAdjacentElement("beforebegin", template.content.firstChild);
  }
});

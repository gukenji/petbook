import consumer from "./consumer"

const conversationChannel = consumer.subscriptions.create({channel:"ConversationChannel", conversation_id: document.querySelector('body').dataset.conversationId}, {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const messageDisplay = document.querySelector('#message-display')
    messageDisplay.insertAdjacentHTML('afterbegin', this.template(data))
  },

  template(data) {
    return `<div class="flex px-2.5 py-2.5 items-center gap-2 w-full">
              <p class="bg-[#6ab8f1] w-full flex break-all flex-col flex-1 px-1 py-2 rounded-md text-white text-xs min-h-[50px]">
                <span class="flex-1">${data["user_avatar_url"]}</span>
                <span class="flex-1">${data["body"]}</span>
                <span class="self-end pr-2 pt-1"><%= Message.formatTime(conversation_message.id)%></span>
              </p>
            </div>`
  }
});

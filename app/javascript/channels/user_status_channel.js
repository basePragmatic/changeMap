import consumer from "channels/consumer"

consumer.subscriptions.create("UserStatusChannel", {
  connected() {
    console.log("Connected to UserStatusChannel")
  },

  disconnected() {
    console.log("Disconnected from UserStatusChannel")
  },

  received(data) {
    console.log(data)
    const userElement = document.getElementById(`user_status_${data.user_id}`)
    if (userElement) {
      userElement.innerHTML = data.status
      userElement.classList.toggle('online', data.status === 'online')
      userElement.classList.toggle('offline', data.status === 'offline')
    }
  }
});

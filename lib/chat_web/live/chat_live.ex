defmodule ChatWeb.RoomLive do
  use ChatWeb, :live_view
  alias ChatWeb.MessageComponent

  def mount(%{"id" => room_id}, _session, socket) do
    # Join the room, subscribe to PubSub topic
    IO.inspect("Joining room #{room_id}")
    {:ok, assign(socket, room_id: room_id, messages: [%{id: 1, content: "Hello"}])}
  end

  def handle_event("send_message", %{"message" => message}, socket) do
    # Broadcast the message to all users in the room
    # Update the messages list
    IO.inspect("Received #{message}")
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      <h1>Chat Room <%= @room_id %></h1>
      <div id="messages">
        <%= for message <- @messages do %>
          <.live_component module={MessageComponent} id={message.id} message={message} />
        <% end %>
      </div>
      <form phx-submit="send_message">
        <input type="text" name="message" placeholder="Type your message...">
        <button type="submit">Send</button>
      </form>
    </div>
    """
  end
end

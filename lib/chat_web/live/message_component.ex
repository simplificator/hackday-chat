defmodule ChatWeb.MessageComponent do
  use ChatWeb, :live_component

  def render(assigns) do
    ~H"""
    <div class="message">
      <span class="content"><%= @message.content %></span>
    </div>
    """
  end
end

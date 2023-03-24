defmodule FastLeasingWeb.LandingPage.LeasingFormLive do
  use FastLeasingWeb, :live_component

  def update(_, socket) do
    {:ok, assign(socket, show_down_payment: false)}
  end

  def handle_event("show_down_payment_field", _, socket) do
    {:noreply, assign(socket, show_down_payment: !socket.assigns.show_down_payment)}
  end
end

defmodule ChatEx.ChatFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ChatEx.Chat` context.
  """

  @doc """
  Generate a room.
  """
  def room_fixture(attrs \\ %{}) do
    {:ok, room} =
      attrs
      |> Enum.into(%{
        limit: 42,
        name: "some name",
        pass: "some pass"
      })
      |> ChatEx.Chat.create_room()

    room
  end
end

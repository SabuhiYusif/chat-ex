defmodule ChatEx.ChatTest do
  use ChatEx.DataCase

  alias ChatEx.Chat

  describe "rooms" do
    alias ChatEx.Chat.Room

    import ChatEx.ChatFixtures

    @invalid_attrs %{limit: nil, name: nil, pass: nil}

    test "list_rooms/0 returns all rooms" do
      room = room_fixture()
      assert Chat.list_rooms() == [room]
    end

    test "get_room!/1 returns the room with given id" do
      room = room_fixture()
      assert Chat.get_room!(room.id) == room
    end

    test "create_room/1 with valid data creates a room" do
      valid_attrs = %{limit: 42, name: "some name", pass: "some pass"}

      assert {:ok, %Room{} = room} = Chat.create_room(valid_attrs)
      assert room.limit == 42
      assert room.name == "some name"
      assert room.pass == "some pass"
    end

    test "create_room/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chat.create_room(@invalid_attrs)
    end

    test "update_room/2 with valid data updates the room" do
      room = room_fixture()
      update_attrs = %{limit: 43, name: "some updated name", pass: "some updated pass"}

      assert {:ok, %Room{} = room} = Chat.update_room(room, update_attrs)
      assert room.limit == 43
      assert room.name == "some updated name"
      assert room.pass == "some updated pass"
    end

    test "update_room/2 with invalid data returns error changeset" do
      room = room_fixture()
      assert {:error, %Ecto.Changeset{}} = Chat.update_room(room, @invalid_attrs)
      assert room == Chat.get_room!(room.id)
    end

    test "delete_room/1 deletes the room" do
      room = room_fixture()
      assert {:ok, %Room{}} = Chat.delete_room(room)
      assert_raise Ecto.NoResultsError, fn -> Chat.get_room!(room.id) end
    end

    test "change_room/1 returns a room changeset" do
      room = room_fixture()
      assert %Ecto.Changeset{} = Chat.change_room(room)
    end
  end
end

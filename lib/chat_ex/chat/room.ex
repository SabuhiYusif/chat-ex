defmodule ChatEx.Chat.Room do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rooms" do
    field :limit, :integer
    field :name, :string
    field :pass, :string

    timestamps()
  end

  @doc false
  def changeset(room, attrs) do
    room
    |> cast(attrs, [:name, :limit, :pass])
    |> validate_required([:name, :limit])
  end
end

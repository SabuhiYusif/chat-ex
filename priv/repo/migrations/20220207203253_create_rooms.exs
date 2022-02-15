defmodule ChatEx.Repo.Migrations.CreateRooms do
  use Ecto.Migration

  def change do
    create table(:rooms) do
      add :name, :string
      add :limit, :integer
      add :pass, :string

      timestamps()
    end
  end
end

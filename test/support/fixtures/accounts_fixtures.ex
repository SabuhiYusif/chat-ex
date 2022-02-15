defmodule ChatEx.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ChatEx.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        username: "some username"
      })
      |> ChatEx.Accounts.create_user()

    user
  end
end

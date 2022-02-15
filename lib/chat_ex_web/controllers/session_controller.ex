defmodule ChatExWeb.SessionController do
  use ChatExWeb, :controller
  alias ChatEx.Accounts

  def new(conn, _) do
    render(conn, "new.html")
  end

  def create(conn, %{"username" => username}) do
    user = Accounts.get_by_username(username)
    IO.inspect("USER #{user.id}")

    case user do
      nil ->
        # set to session
        conn
        |> create_user(username)

      _ ->
        conn
        |> login(user)
        |> IO.inspect
        |> redirect(to: Routes.room_path(conn, :index))
    end
  end

  defp login(conn, user) do
    conn
    |> assign(:current_user, user)
    |> put_session(:user_id, user.id)
    |> configure_session(renew: true)
  end

  defp create_user(conn, username) do
    case Accounts.create_user(username) do
      {:ok, user} ->
        conn
        |> login(user)
        |> put_flash(:info, "User #{user.username} created logged in.")
        |> redirect(to: Routes.room_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end

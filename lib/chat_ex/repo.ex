defmodule ChatEx.Repo do
  use Ecto.Repo,
    otp_app: :chat_ex,
    adapter: Ecto.Adapters.Postgres
end

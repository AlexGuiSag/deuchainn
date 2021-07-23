defmodule Deuchainn.Repo do
  use Ecto.Repo,
    otp_app: :deuchainn,
    adapter: Ecto.Adapters.Postgres
end

defmodule FastLeasing.Repo do
  use Ecto.Repo,
    otp_app: :fast_leasing,
    adapter: Ecto.Adapters.Postgres
end

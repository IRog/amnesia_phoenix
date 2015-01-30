defmodule HelloPhoenix.Endpoint do
  use Phoenix.Endpoint, otp_app: :hello_phoenix

  plug Plug.Static,
    at: "/", from: :hello_phoenix

  plug Plug.Logger

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  plug Phoenix.CodeReloader

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_hello_phoenix_key",
    signing_salt: "eLEHDC8a",
    encryption_salt: "a7e7KZZ8"

  plug :router, HelloPhoenix.Router
end

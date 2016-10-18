defmodule AmnesiaPhoenix.Endpoint do
  use Phoenix.Endpoint, otp_app: :amnesia_phoenix

  plug Plug.Static,
    at: "/", from: :amnesia_phoenix, gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  plug Plug.RequestId
  plug Plug.Logger

  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_amnesia_phoenix_key",
    signing_salt: "eLEHDC8a",
    encryption_salt: "a7e7KZZ8"

  plug AmnesiaPhoenix.Router
end

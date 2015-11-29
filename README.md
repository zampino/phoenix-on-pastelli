# Simple Chat Example
> Built with the [Phoenix Framework](https://github.com/phoenixframework/phoenix)

This app is running on top of [Elli](https://github.com/knutin/elli) Server through [`Pastelli`](https://github.com/zampino/pastelli) and
[`Pastelli.Phoenix`](//github.com/zampino/pastelli_phoenix).

This is a fork of Chris McCord's [Phoenix Chat Example](https://github.com/chrismccord/phoenix_chat_example),
with minimal changes to run with phoenix `>= 1.1.0`.

Server handler is configured in `config/config.exs#L11`

```elixir
use Mix.Config

# Configures the endpoint
# and the handler
config :chat, Chat.Endpoint,
  url: [host: "localhost"],
  handler: Pastelli.Phoenix,
  # ...
```

Elli-Websocket compatible socket dispatch rules are hooked-in per a
compile time generated module plug in
[`lib/chat/endpoint.ex`](https://github.com/zampino/phoenix-on-pastelli/blob/master/lib/chat/endpoint.ex)

```elixir
defmodule Chat.Endpoint do
  use Pastelli.Phoenix.Endpoint
  use Phoenix.Endpoint, otp_app: :chat
  plug Chat.Endpoint.SocketDispatchRouter

  socket "/socket", Chat.UserSocket

  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.CodeReloader
    plug Phoenix.LiveReloader
  end

  ...

  plug Plug.Session,
    store: :cookie,
    key: "_chat_key",
    signing_salt: "LH6XmqGb",
    encryption_salt: "CIPZg4Qo"

  plug Chat.Router
end

```

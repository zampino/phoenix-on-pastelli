# Simple Chat Example
> Built with the [Phoenix Framework](https://github.com/phoenixframework/phoenix)

This is a fork of Chris McCord's [Phoenix Chat Example](https://github.com/chrismccord/phoenix_chat_example)
running on top of [Elli](https://github.com/knutin/elli) Server through [`Pastelli`](https://github.com/zampino/pastelli) and
[`Pastelli.Phoenix`](//github.com/zampino/pastelli_phoenix) ([README](https://github.com/zampino/pastelli_phoenix#pastelliphoenix) for more details).


## Configuration

```elixir
use Mix.Config

# Configures the endpoint
# and the handler
config :chat, Chat.Endpoint,
  url: [host: "localhost"],
  handler: Pastelli.Phoenix,
  # ...
```

## Endpoint

```elixir
defmodule Chat.Endpoint do
  use Pastelli.Phoenix.Endpoint
  use Phoenix.Endpoint, otp_app: :chat

  plug Pastelli.Phoenix.SocketDispatchRouter

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

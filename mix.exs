defmodule Chat.Mixfile do
  use Mix.Project

  def project do
    [app: :chat,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: ["lib", "web"],
     compilers: [:phoenix] ++ Mix.compilers,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {Chat, []},
     applications: [:phoenix, :phoenix_html, :logger]]
  end

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, "~> 1.1.2"},
     {:phoenix_html, "~> 2.4"},
     {:pastelli_phoenix, "0.1.3", github: "zampino/pastelli_phoenix"},
     # {:pastelli_phoenix, "0.1.3", path: "../pastelli_phoenix"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:phoenix_ecto, "~> 1.1"},
     {:postgrex, ">= 0.0.0"}
   ]
  end
end

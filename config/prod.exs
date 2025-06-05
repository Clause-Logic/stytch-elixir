import Config

config :stytch, Stytch.DefaultProject,
  endpoint: System.get_env("STYTCH_ENDPOINT", "https://api.stytch.com/v1")

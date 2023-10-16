defmodule Stytch.Project do
  @moduledoc """
  Stytch Project Configuration
  """

  defmacro __using__(app) do
    quote do
      @default_endpoint "https://test.stytch.com/v1"

      def endpoint, do: get_env(:endpoint, @default_endpoint)
      def username, do: get_env(:project_id)
      def password, do: get_env(:secret)

      defp get_env(key, default \\ nil) do
        unquote(app)
        |> Application.get_env(__MODULE__, [])
        |> Keyword.get(key, default)
      end
    end
  end
end

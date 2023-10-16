defmodule Stytch.Client do
  @moduledoc """
  API Client wrapper and configuration.
  """

  def get(path, config, params \\ []),
    do: req(config) |> Req.get(url: path, params: params) |> response()

  def post(path, config, body), do: req(config) |> Req.post(url: path, json: body) |> response()

  def delete(path, config, params \\ []),
    do: req(config) |> Req.delete(url: path, params: params) |> response()

  def put(path, config, body \\ %{}),
    do: req(config) |> Req.put(url: path, json: body) |> response()

  def url(path, config, params \\ []),
    do: "#{config.endpoint()}#{path}?#{URI.encode_query(params)}"

  defp response({:ok, %Req.Response{status: status} = res}) when status >= 200 and status < 300 do
    {:ok, atomize_keys(res.body)}
  end

  defp response({:ok, res}), do: {:error, atomize_keys(res.body)}
  defp response(res), do: res

  defp atomize_keys(map = %{}) do
    map
    |> Enum.map(fn {k, v} -> {String.to_atom(k), atomize_keys(v)} end)
    |> Enum.into(%{})
  end

  defp atomize_keys([head | rest]), do: [atomize_keys(head) | atomize_keys(rest)]
  defp atomize_keys(not_a_map), do: not_a_map

  defp req(config),
    do: Req.new(base_url: config.endpoint(), auth: {config.username(), config.password()})
end

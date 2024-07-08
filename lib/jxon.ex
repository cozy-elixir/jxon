defmodule JXON do
  @moduledoc """
  A wrapper for various JSON implementations.
  """

  @spec encode(term()) :: {:ok, String.t()} | :error
  def encode(term) do
    __encode__(term)
  end

  @spec decode(binary()) :: {:ok, term()} | :error
  def decode(binary) when is_binary(binary) do
    __decode__(binary)
  end

  cond do
    Code.ensure_loaded?(Jason) ->
      defp __encode__(term) do
        case Jason.encode(term) do
          {:ok, string} -> {:ok, string}
          _ -> :error
        end
      end

      defp __decode__(binary) do
        case Jason.decode(term) do
          {:ok, string} -> {:ok, string}
          _ -> :error
        end
      end

    Code.ensure_loaded?(:json) ->
      defp __encode__(term) do
        try do
          {:ok, :json.encode(term) |> to_string()}
        catch
          _, _ ->
            :error
        end
      end

      defp __decode__(binary) do
        try do
          {:ok, :json.decode(binary)}
        catch
          _, _ ->
            :error
        end
      end

    true ->
      defp __encode__(_term) do
        raise "no JSON parser found"
      end

      defp __decode__(_binary) do
        raise "no JSON parser found"
      end
  end
end

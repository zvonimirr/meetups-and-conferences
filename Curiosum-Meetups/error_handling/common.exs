defmodule Common do
  @moduledoc """
  A common module that is used by other scripts.
  """

  @doc """
  Throws an error.
  """
  @spec throw_error!() :: no_return()
  def throw_error! do
    raise "Error"
  end

  @doc """
  Returns an error tuple, which is a common way to handle errors in Elixir.
  If the argument passed is a boolean, it will return either :ok or :error
  as the first element of the tuple, depending on the value of the boolean.
  Otherwise, it will return :wtf as the first element of the tuple.
  """
  @spec error_tuple(boolean()) :: {:ok, String.t()} | {:error, String.t()} | {:wtf, String.t()}
  def error_tuple(true) do
    {:ok, "Success"}
  end

  def error_tuple(false) do
    {:error, "Error"}
  end

  def error_tuple(_) do
    {:wtf, "WTF"}
  end
end

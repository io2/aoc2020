defmodule Aoc2020 do
  @moduledoc """
  Documentation for `Aoc2020`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Aoc2020.hello()
      :world

  """
  def hello do
    :world
  end
end

defmodule Input do
  def read_file(day) do
    File.read!("inputs/#{day}.txt")
    |> String.split("\n")
  end
end

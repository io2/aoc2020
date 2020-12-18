defmodule D1 do

  def run do
    Input.read_file(1)
    |> Enum.filter(&(&1 != ""))
    |> Enum.map(&(String.to_integer(&1)))
    |> check
  end

  # check all
  defp check(l) when is_list(l) do
    case check(hd(l), tl(l)) do
      nil -> check(tl(l))
      found -> found
    end
  end

  # check head against sublist
  defp check(_h, []), do: nil
  defp check(h, t) when is_list(t) do
    case check(h, hd(t)) do
      nil -> check(h, tl(t))
      found -> found
    end
  end

  # do maths
  defp check(a, b) when a + b == 2020, do: a * b
  defp check(a, b) when a + b != 2020, do: nil

end

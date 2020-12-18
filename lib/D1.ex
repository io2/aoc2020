defmodule D1 do

  def run do
    nums = Input.read_file(1)
    |> Enum.filter(&(&1 != ""))
    |> Enum.map(&(String.to_integer(&1)))

    IO.inspect P1.run(nums)
    IO.inspect P1v2.run(nums)
    IO.inspect P2.run(nums)
  end
end

defmodule P1 do

  def run(nums) do
    nums
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


defmodule P1v2 do

  def run (nums) do
    [a, b] = nums
    |> Enum.filter(&(Enum.member?(nums, 2020 - &1)))

    a * b
  end
end

defmodule P2 do

  def run(nums) do
    [h|_] = for a <- nums, b <- nums, c <- nums, a + b + c == 2020, do: a * b * c
    h
  end
end

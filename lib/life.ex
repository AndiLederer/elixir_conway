defmodule Life do
  def create do
    round(:random.uniform)
  end

  def validate(0,surrounding) do
    alive_count = Enum.reduce(surrounding,fn(x,acc) -> x+acc end)
    case alive_count do
      3 -> 1
      _ -> 0
    end
  end

  def validate(1,surrounding) do 
    alive_count = Enum.reduce(surrounding,fn(x,acc) -> x+acc end)
    case alive_count do
      x when x == 2 or x == 3 -> 1
      _ -> 0
    end
  end

end
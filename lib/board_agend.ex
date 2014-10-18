defmodule BoardAgent do

  def start_link({length, height}) do
    Agent.start_link(fn-> Board.create_board(length,height) end, name: __MODULE__)
  end


  def get() do
    Agent.update(__MODULE__, &Board.cycle(&1))
    Agent.get(__MODULE__, &Board.print_board(&1))
  end



end
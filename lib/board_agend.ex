defmodule BoardAgent do

  def start_link(length, height) do
    Agent.start_link(fn-> Board.create_board(length,height) end)
  end


  def get(boardAgent) do
    Agent.update(boardAgent, &Board.cycle(&1))
    Agent.get(boardAgent, &Board.print_board(&1))
  end



end
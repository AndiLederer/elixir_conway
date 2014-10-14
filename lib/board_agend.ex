defmodule BoardAgent do

  def start_link(length, height) do
    Agent.start_link(fn-> Board.create_board(length,height) end)
  end


  def get(boardAgent) do
    Agent.get(boardAgent, &Board.cycle(&1))
  end
end
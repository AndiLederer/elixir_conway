defmodule Game do

  def run(board,0) do 

  end

  def run(board,count) do
    board = Board.cycle(board)
    IO.puts("\e[H\e[2J")
    IO.puts Board.print_board(board)
    run(board,count-1)
  end


end
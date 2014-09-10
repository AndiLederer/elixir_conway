defmodule Conway do
  use Application

  def start(_type,_args) do
      board = Board.create_board(10,10)
      IO.puts Board.print_board(board)
      run(board,100)
      {:ok}
  end
  
  defp run(board,0) do 

  end

  defp run(board,count) do
    board = Board.cycle(board)
    IO.puts Board.print_board(board)
    run(board,count-1)
  end

  
end

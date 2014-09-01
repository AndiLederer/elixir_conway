defmodule BoardTest do
 use ExUnit.Case

  test "create board" do
    board = Board.create_board(10,10)
    assert Enum.count(board)==10
  end

  test "create printable form with board" do
    board = Board.create_board(10,10)
    printable = Board.print_board(board)
    #IO.puts "------------------"
    #IO.puts printable
    assert String.length(printable) == 100
  end 

end
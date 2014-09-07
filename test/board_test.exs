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

  test "cycle throug board" do
    board = Board.create_board(10,10)
    first_printable = Board.print_board(board)
    #IO.puts "------------------"
    #IO.puts first_printable
    new_board = Board.cycle(board)
    second_printable = Board.print_board(new_board)
    #IO.puts second_printable
    assert first_printable != second_printable
  end

end
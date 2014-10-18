defmodule BoardAgentTest do
  use ExUnit.Case

  test "start" do
     board = BoardAgent.get()
     assert String.length(board) >= 50
  end

end
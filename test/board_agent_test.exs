defmodule BoardAgentTest do
  use ExUnit.Case

  test "start" do
    {:ok, boardAgent} = BoardAgent.start_link(100,100)
    board = BoardAgent.get(boardAgent)
    assert Enum.count(board)== 100
  end

end
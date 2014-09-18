defmodule JsonTest do
  use ExUnit.Case

  test "Json decode" do
    value = JSON.decode("{\"result\":\"this will be a elixir result\"}")
    IO.puts value["result"]
    assert true
  end

  test "Json encode" do
    {:ok,value} = JSON.encode([result: "value"])
    IO.puts value 
    assert true
  end

end
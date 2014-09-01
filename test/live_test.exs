defmodule LiveTest do
 use ExUnit.Case

  test "create new live" do
    cell = Live.create()
    assert cell == 0 || cell == 1
  end

  test "validate surrounding" do
    assert Live.validate(1,[1,1,1]) == 1
    assert Live.validate(1,[1,0,1]) == 1
    assert Live.validate(1,[1,0,0]) == 0
    assert Live.validate(1,[0,0,0]) == 0
    assert Live.validate(1,[1,1,1,1]) == 0

    assert Live.validate(0,[1,1,1]) == 1
    assert Live.validate(0,[1,1,0]) == 0
    assert Live.validate(0,[1,1,1,1]) == 0
  end

end
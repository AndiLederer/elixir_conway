defmodule LifeTest do
 use ExUnit.Case

  test "create new life" do
    cell = Life.create()
    assert cell == 0 || cell == 1
  end

  test "validate surrounding" do
    assert Life.validate(1,[1,1,1]) == 1
    assert Life.validate(1,[1,0,1]) == 1
    assert Life.validate(1,[1,0,0]) == 0
    assert Life.validate(1,[0,0,0]) == 0
    assert Life.validate(1,[1,1,1,1]) == 0

    assert Life.validate(0,[1,1,1]) == 1
    assert Life.validate(0,[1,1,0]) == 0
    assert Life.validate(0,[1,1,1,1]) == 0
  end

end
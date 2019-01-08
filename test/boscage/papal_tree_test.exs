defmodule Boscage.PapalTreeTest do
  use ExUnit.Case, async: true

  @subject Boscage.PapalTree

  def empty_tree(), do: @subject.new()

  def key_0(), do: 0

  def key_1(), do: 1

  def key_2(), do: 2

  def key_3(), do: 3

  def key_4(), do: 4

  def key_5(), do: 5

  def key_6(), do: 6

  def tree(1, key_0, value_0) do
    %@subject{key: key_0, value: value_0, size: 1}
  end

  def tree(2, key_0, value_0, key_1, value_1) do
    %@subject{
      key: key_0,
      left: nil,
      right: %@subject{
        key: key_1,
        left: nil,
        right: nil,
        size: 1,
        value: value_1
      },
      size: 2,
      value: value_0
    }
  end

  def tree(3, key_0, value_0, key_1, value_1, key_2, value_2) do
    %@subject{
      key: key_1,
      left: %@subject{
        key: key_0,
        left: nil,
        right: nil,
        size: 1,
        value: value_0
      },
      right: %@subject{
        key: key_2,
        left: nil,
        right: nil,
        size: 1,
        value: value_2
      },
      size: 3,
      value: value_1
    }
  end

  def tree(4, key_0, value_0, key_1, value_1, key_2, value_2, key_3, value_3) do
    %@subject{
      key: key_1,
      left: %@subject{
        key: key_0,
        left: nil,
        right: nil,
        size: 1,
        value: value_0
      },
      right: %@subject{
        key: key_2,
        left: nil,
        right: %@subject{
          key: key_3,
          left: nil,
          right: nil,
          size: 1,
          value: value_3
        },
        size: 2,
        value: value_2
      },
      size: 4,
      value: value_1
    }
  end

  def tree(
        5,
        key_0,
        value_0,
        key_1,
        value_1,
        key_2,
        value_2,
        key_3,
        value_3,
        key_4,
        value_4
      ) do
    %@subject{
      key: key_2,
      left: %@subject{
        key: key_0,
        left: nil,
        right: %@subject{
          key: key_1,
          left: nil,
          right: nil,
          size: 1,
          value: value_1
        },
        size: 2,
        value: value_0
      },
      right: %@subject{
        key: key_3,
        left: nil,
        right: %@subject{
          key: key_4,
          left: nil,
          right: nil,
          size: 1,
          value: value_4
        },
        size: 2,
        value: value_3
      },
      size: 5,
      value: value_2
    }
  end

  def tree(
        6,
        key_0,
        value_0,
        key_1,
        value_1,
        key_2,
        value_2,
        key_3,
        value_3,
        key_4,
        value_4,
        key_5,
        value_5
      ) do
    %@subject{
      key: key_2,
      left: %@subject{
        key: key_0,
        left: nil,
        right: %@subject{
          key: key_1,
          left: nil,
          right: nil,
          size: 1,
          value: value_1
        },
        size: 2,
        value: value_0
      },
      right: %@subject{
        key: key_4,
        left: %@subject{
          key: key_3,
          left: nil,
          right: nil,
          size: 1,
          value: value_3
        },
        right: %@subject{
          key: key_5,
          left: nil,
          right: nil,
          size: 1,
          value: value_5
        },
        size: 3,
        value: value_4
      },
      size: 6,
      value: value_2
    }
  end

  def tree(
        7,
        key_0,
        value_0,
        key_1,
        value_1,
        key_2,
        value_2,
        key_3,
        value_3,
        key_4,
        value_4,
        key_5,
        value_5,
        key_6,
        value_6
      ) do
    %@subject{
      key: key_3,
      left: %@subject{
        key: key_1,
        left: %@subject{
          key: key_0,
          left: nil,
          right: nil,
          size: 1,
          value: value_0
        },
        right: %@subject{
          key: key_2,
          left: nil,
          right: nil,
          size: 1,
          value: value_2
        },
        size: 3,
        value: value_1
      },
      right: %@subject{
        key: key_5,
        left: %@subject{
          key: key_4,
          left: nil,
          right: nil,
          size: 1,
          value: value_4
        },
        right: %@subject{
          key: key_6,
          left: nil,
          right: nil,
          size: 1,
          value: value_6
        },
        size: 3,
        value: value_5
      },
      size: 7,
      value: value_3
    }
  end

  def tree_0_to_0(), do: tree(1, key_0(), value_0())

  def tree_0_to_1(), do: tree(2, key_0(), value_0(), key_1(), value_1())

  def tree_0_to_2() do
    tree(3, key_0(), value_0(), key_1(), value_1(), key_2(), value_2())
  end

  def tree_0_to_3() do
    tree(
      4,
      key_0(),
      value_0(),
      key_1(),
      value_1(),
      key_2(),
      value_2(),
      key_3(),
      value_3()
    )
  end

  def tree_0_to_4() do
    tree(
      5,
      key_0(),
      value_0(),
      key_1(),
      value_1(),
      key_2(),
      value_2(),
      key_3(),
      value_3(),
      key_4(),
      value_4()
    )
  end

  def tree_0_to_5() do
    tree(
      6,
      key_0(),
      value_0(),
      key_1(),
      value_1(),
      key_2(),
      value_2(),
      key_3(),
      value_3(),
      key_4(),
      value_4(),
      key_5(),
      value_5()
    )
  end

  def tree_0_to_6() do
    tree(
      7,
      key_0(),
      value_0(),
      key_1(),
      value_1(),
      key_2(),
      value_2(),
      key_3(),
      value_3(),
      key_4(),
      value_4(),
      key_5(),
      value_5(),
      key_6(),
      value_6()
    )
  end

  def tree_1_to_1(), do: tree(1, key_1(), value_1())

  def tree_1_to_2(), do: tree(2, key_1(), value_1(), key_2(), value_2())

  def tree_1_to_3() do
    tree(3, key_1(), value_1(), key_2(), value_2(), key_3(), value_3())
  end

  def tree_1_to_4() do
    tree(
      4,
      key_1(),
      value_1(),
      key_2(),
      value_2(),
      key_3(),
      value_3(),
      key_4(),
      value_4()
    )
  end

  def tree_1_to_5() do
    tree(
      5,
      key_1(),
      value_1(),
      key_2(),
      value_2(),
      key_3(),
      value_3(),
      key_4(),
      value_4(),
      key_5(),
      value_5()
    )
  end

  def tree_1_to_6() do
    tree(
      6,
      key_1(),
      value_1(),
      key_2(),
      value_2(),
      key_3(),
      value_3(),
      key_4(),
      value_4(),
      key_5(),
      value_5(),
      key_6(),
      value_6()
    )
  end

  def value_0(), do: "zero"

  def value_1(), do: "one"

  def value_2(), do: "two"

  def value_3(), do: "three"

  def value_4(), do: "four"

  def value_5(), do: "five"

  def value_6(), do: "six"

  setup do
    %{
      empty_tree: empty_tree(),
      key_0: key_0(),
      key_1: key_1(),
      key_2: key_2(),
      key_3: key_3(),
      key_4: key_4(),
      key_5: key_5(),
      key_6: key_6(),
      tree_0_to_0: tree_0_to_0(),
      tree_0_to_1: tree_0_to_1(),
      tree_0_to_2: tree_0_to_2(),
      tree_0_to_3: tree_0_to_3(),
      tree_0_to_4: tree_0_to_4(),
      tree_0_to_5: tree_0_to_5(),
      tree_0_to_6: tree_0_to_6(),
      tree_1_to_2: tree_1_to_2(),
      tree_1_to_1: tree_1_to_1(),
      tree_1_to_3: tree_1_to_3(),
      tree_1_to_4: tree_1_to_4(),
      tree_1_to_5: tree_1_to_5(),
      tree_1_to_6: tree_1_to_6(),
      value_0: value_0(),
      value_1: value_1(),
      value_2: value_2(),
      value_3: value_3(),
      value_4: value_4(),
      value_5: value_5(),
      value_6: value_6()
    }
  end

  describe "&insert/3" do
    test "size 0 tree", c do
      expected = c.tree_0_to_0
      {:ok, actual} = @subject.insert(c.empty_tree, c.key_0, c.value_0)
      assert expected == actual
    end

    test "new min value to size 1 tree", c do
      expected = c.tree_0_to_0
      {:ok, actual} = @subject.insert(c.empty_tree, c.key_0, c.value_0)
      assert expected == actual
    end

    test "new max value to size 1 tree", c do
      expected = c.tree_0_to_1
      {:ok, actual} = @subject.insert(c.tree_0_to_0, c.key_1, c.value_1)
      assert expected == actual
    end

    test "new min value to size 2 tree", c do
      expected = c.tree_0_to_2
      {:ok, actual} = @subject.insert(c.tree_1_to_2, c.key_0, c.value_0)
      assert expected == actual
    end

    test "new max value to size 2 tree", c do
      expected = c.tree_0_to_2
      {:ok, actual} = @subject.insert(c.tree_0_to_1, c.key_2, c.value_2)
      assert expected == actual
    end

    test "new max value to size 3 tree", c do
      expected = c.tree_0_to_3
      {:ok, actual} = @subject.insert(c.tree_0_to_2, c.key_3, c.value_3)
      assert expected == actual
    end

    test "new max value to size 4 tree", c do
      expected = c.tree_0_to_4
      {:ok, actual} = @subject.insert(c.tree_0_to_3, c.key_4, c.value_4)
      assert expected == actual
    end

    test "new max value to size 5 tree", c do
      expected = c.tree_0_to_5
      {:ok, actual} = @subject.insert(c.tree_0_to_4, c.key_5, c.value_5)
      assert expected == actual
    end

    test "new max value to size 6 tree", c do
      expected = c.tree_0_to_6()
      {:ok, actual} = @subject.insert(c.tree_0_to_5, c.key_6, c.value_6)
      assert expected == actual
    end
  end

  describe "&max/1" do
    test "size 1 tree" do
      key = 0
      val = "zero"

      tree = %@subject{
        key: key,
        left: nil,
        right: nil,
        size: 1,
        value: val
      }

      expected = {key, val}
      actual = @subject.max(tree)
      assert expected == actual
    end

    test "size 3 tree" do
      right = %@subject{
        key: 2,
        left: nil,
        right: nil,
        size: 1,
        value: "two"
      }

      tree = %@subject{
        key: 1,
        left: %@subject{
          key: 0,
          left: nil,
          right: nil,
          size: 1,
          value: "zero"
        },
        right: right,
        size: 3,
        value: "one"
      }

      expected = {right.key, right.value}
      actual = @subject.max(tree)
      assert expected == actual
    end
  end

  describe "&pop/1" do
    test "size 1 tree", c do
      expected = {{c.key_0, c.value_0}, c.empty_tree}
      {:ok, actual} = @subject.pop(c.tree_0_to_0)
      assert expected == actual
    end

    test "size 2 tree", c do
      expected = {{c.key_1, c.value_1}, c.tree_0_to_0}
      {:ok, actual} = @subject.pop(c.tree_0_to_1)
      assert expected == actual
    end

    test "size 3 tree", c do
      expected = {{c.key_2, c.value_2}, c.tree_0_to_1}
      {:ok, actual} = @subject.pop(c.tree_0_to_2)
      assert expected == actual
    end

    test "size 4 tree", c do
      expected = {{c.key_3, c.value_3}, c.tree_0_to_2}
      {:ok, actual} = @subject.pop(c.tree_0_to_3)
      assert expected == actual
    end

    test "size 5 tree", c do
      expected = {{c.key_4, c.value_4}, c.tree_0_to_3}
      {:ok, actual} = @subject.pop(c.tree_0_to_4)
      assert expected == actual
    end

    test "size 6 tree", c do
      expected = {{c.key_5, c.value_5}, c.tree_0_to_4}
      {:ok, actual} = @subject.pop(c.tree_0_to_5)
      assert expected == actual
    end

    test "size 7 tree", c do
      expected = {{c.key_6, c.value_6}, c.tree_0_to_5}
      {:ok, actual} = @subject.pop(c.tree_0_to_6)
      assert expected == actual
    end
  end

  describe "&shift/1" do
    test "size 1 tree", c do
      expected = {{c.key_0, c.value_0}, c.empty_tree}
      {:ok, actual} = @subject.shift(c.tree_0_to_0)
      assert expected == actual
    end

    test "size 2 tree", c do
      expected = {{c.key_0, c.value_0}, c.tree_1_to_1}
      {:ok, actual} = @subject.shift(c.tree_0_to_1)
      assert expected == actual
    end

    test "size 3 tree", c do
      expected = {{c.key_0, c.value_0}, c.tree_1_to_2}
      {:ok, actual} = @subject.shift(c.tree_0_to_2)
      assert expected == actual
    end

    test "size 4 tree", c do
      expected = {{c.key_0, c.value_0}, c.tree_1_to_3}
      {:ok, actual} = @subject.shift(c.tree_0_to_3)
      assert expected == actual
    end

    test "size 5 tree", c do
      expected = {{c.key_0, c.value_0}, c.tree_1_to_4}
      {:ok, actual} = @subject.shift(c.tree_0_to_4)
      assert expected == actual
    end

    test "size 6 tree", c do
      expected = {{c.key_0, c.value_0}, c.tree_1_to_5}
      {:ok, actual} = @subject.shift(c.tree_0_to_5)
      assert expected == actual
    end

    test "size 7 tree", c do
      expected = {{c.key_0, c.value_0}, c.tree_1_to_6}
      {:ok, actual} = @subject.shift(c.tree_0_to_6)
      assert expected == actual
    end
  end

  describe "&size/1" do
    test "empty" do
      assert @subject.size(@subject.new()) == 0
    end
  end
end

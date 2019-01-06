defmodule Boscage.PapalTreeTest do
  use ExUnit.Case, async: true

  @subject Boscage.PapalTree

  def key0(), do: 0

  def key1(), do: 1

  def key2(), do: 2

  def key3(), do: 3

  def size0(), do: @subject.new()

  def size1() do
    %@subject{key: key0(), value: value0(), size: 1}
  end

  def size2() do
    %@subject{
      key: key0(),
      left: nil,
      right: %@subject{
        key: key1(),
        left: nil,
        right: nil,
        size: 1,
        value: value1()
      },
      size: 2,
      value: value0()
    }
  end

  def size3() do
    %@subject{
      key: key1(),
      left: %@subject{
        key: key0(),
        left: nil,
        right: nil,
        size: 1,
        value: value0()
      },
      right: %@subject{
        key: key2(),
        left: nil,
        right: nil,
        size: 1,
        value: value2()
      },
      size: 3,
      value: value1()
    }
  end

  def size4() do
    %@subject{
      key: key1(),
      left: %@subject{
        key: key0(),
        left: nil,
        right: nil,
        size: 1,
        value: value0()
      },
      right: %@subject{
        key: key2(),
        left: nil,
        right: %@subject{
          key: key3(),
          left: nil,
          right: nil,
          size: 1,
          value: value3()
        },
        size: 2,
        value: value2()
      },
      size: 4,
      value: value1()
    }
  end

  def value0(), do: "zero"

  def value1(), do: "one"

  def value2(), do: "two"

  def value3(), do: "three"

  setup do
    %{
      key0: key0(),
      key1: key1(),
      key2: key2(),
      key3: key3(),
      size0: size0(),
      size1: size1(),
      size2: size2(),
      size3: size3(),
      size4: size4(),
      value0: value0(),
      value1: value1(),
      value2: value2(),
      value3: value3()
    }
  end

  describe "&insert/3" do
    test "size 0 tree", c do
      expected = c.size1
      {:ok, actual} = @subject.insert(c.size0, c.key0, c.value0)
      assert expected == actual
    end

    test "new max value to size 1 tree", c do
      expected = c.size2
      {:ok, actual} = @subject.insert(c.size1, c.key1, c.value1)
      assert expected == actual
    end

    test "new max value to size 2 tree", c do
      expected = c.size3
      {:ok, actual} = @subject.insert(c.size2, c.key2, c.value2)
      assert expected == actual
    end

    test "new max value to size 3 tree", c do
      expected = c.size4
      {:ok, actual} = @subject.insert(c.size3, c.key3, c.value3)
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
      expected = {{c.key0, c.value0}, c.size0}
      {:ok, actual} = @subject.pop(c.size1)
      assert expected == actual
    end

    test "size 2 tree w/ size 1 right", c do
      expected = {{c.key1, c.value1}, c.size1}
      {:ok, actual} = @subject.pop(c.size2)
      assert expected == actual
    end

    test "size 3 tree", c do
      expected = {{c.key2, c.value2}, c.size2}
      {:ok, actual} = @subject.pop(c.size3)
      assert expected == actual
    end
  end

  # describe "&search/2" do
  #   test "returns value for key" do
  #     empty = @subject.new()
  #     {key1, val1} = {:commander, "Data"}
  #     {key2, val2} = {:doctor, "Crusher"}
  #     {key3, val3} = {:captain, "Picard"}
  #     {key4, val4} = {:admiral, "Janeway"}
  #     {:ok, tree1} = @subject.insert(empty, :commander, "Data")
  #     {:ok, tree2} = @subject.insert(tree1, :doctor, "Crusher")
  #     {:ok, tree3} = @subject.insert(tree2, :captain, "Picard")
  #     {:ok, tree4} = @subject.insert(tree3, :admiral, "Janeway")
  #     assert @subject.search(tree4, key1) == val1
  #     assert @subject.search(tree4, key2) == val2
  #     assert @subject.search(tree4, key3) == val3
  #     assert @subject.search(tree4, key4) == val4
  #   end
  #
  #   test "returns error for missing key" do
  #     key = :key
  #     expected = {:error, "key #{inspect(key)} not found"}
  #     actual = @subject.search(@subject.new(), key)
  #     assert expected == actual
  #   end
  # end

  describe "&size/1" do
    test "empty" do
      assert @subject.size(@subject.new()) == 0
    end
  end
end

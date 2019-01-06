defmodule Boscage.PapalTreeTest do
  use ExUnit.Case, async: true

  @subject Boscage.PapalTree

  def key0(), do: 0

  def size0(), do: @subject.new()

  def size1() do
    %@subject{key: key0(), value: value0(), size: 1}
  end

  def value0, do: "zero"

  setup do
    %{
      key0: key0(),
      size0: size0(),
      size1: size1(),
      value0: value0()
    }
  end

  describe "&insert/3" do
    test "size 0 tree", c do
      expected = c.size1
      {:ok, actual} = @subject.insert(c.size0, c.key0, c.value0)
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
    test "size 1 tree" do
      key = 0
      val = "zero"

      size1 = %@subject{
        key: key,
        left: nil,
        right: nil,
        size: 1,
        value: val
      }

      expected = {{key, val}, @subject.new()}
      {:ok, actual} = @subject.pop(size1)
      assert expected == actual
    end

    test "size 2 tree w/ size 1 right" do
      {key1, val1} = {0, "zero"}
      {key2, val2} = {1, "one"}

      size2 = %@subject{
        key: key1,
        left: nil,
        right: %@subject{
          key: key2,
          left: nil,
          right: nil,
          size: 1,
          value: val2
        },
        size: 2,
        value: val1
      }

      size1 = %@subject{
        key: key1,
        left: nil,
        right: nil,
        size: 1,
        value: val1
      }

      expected = {{key2, val2}, size1}
      {:ok, actual} = @subject.pop(size2)
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

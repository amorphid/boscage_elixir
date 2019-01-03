defmodule Boscage.PapalTreeTest do
  use ExUnit.Case, async: true

  @subject Boscage.PapalTree

  describe "&insert/3" do
    test "new key increases size" do
      empty = @subject.new()
      0 = @subject.size(empty)
      {:ok, not_empty} = @subject.insert(empty, :potato, "effin' tasty")
      expected = 1
      actual = @subject.size(not_empty)
      assert expected == actual
    end

    test "duplicate key does not affect size" do
      key = :potato
      {:ok, new_tree} = @subject.insert(@subject.new(), key, "effin' tasty")
      1 = @subject.size(new_tree)
      {:ok, updated_tree} = @subject.insert(new_tree, key, "still effin' tasty")
      expected = 1
      actual = @subject.size(updated_tree)
      assert expected == actual
    end

    test "Adding 2 new keys increases size by 2" do
      empty = @subject.new()
      0 = @subject.size(empty)
      {:ok, size1} = @subject.insert(empty, :commander, "Data")
      {:ok, size2} = @subject.insert(size1, :doctor, "Crusher")
      expected = 2
      actual = @subject.size(size2)
      assert expected == actual
    end

    test "Adding 3 new keys increases size by 3" do
      empty = @subject.new()
      0 = @subject.size(empty)
      {:ok, size1} = @subject.insert(empty, :commander, "Data")
      {:ok, size2} = @subject.insert(size1, :doctor, "Crusher")
      {:ok, size3} = @subject.insert(size2, :captain, "Picard")
      expected = 3
      actual = @subject.size(size3)
      assert expected == actual
    end

    test "Adding 4 new keys increases size by 4" do
      empty = @subject.new()
      0 = @subject.size(empty)
      {:ok, size1} = @subject.insert(empty, :commander, "Data")
      {:ok, size2} = @subject.insert(size1, :doctor, "Crusher")
      {:ok, size3} = @subject.insert(size2, :captain, "Picard")
      {:ok, size4} = @subject.insert(size3, :admiral, "Janeway")
      expected = 4
      actual = @subject.size(size4)
      assert expected == actual
    end
  end

  describe "&search/2" do
    test "returns value for key" do
      empty = @subject.new()
      {key1, val1} = {:commander, "Data"}
      {key2, val2} = {:doctor, "Crusher"}
      {key3, val3} = {:captain, "Picard"}
      {key4, val4} = {:admiral, "Janeway"}
      {:ok, tree1} = @subject.insert(empty, :commander, "Data")
      {:ok, tree2} = @subject.insert(tree1, :doctor, "Crusher")
      {:ok, tree3} = @subject.insert(tree2, :captain, "Picard")
      {:ok, tree4} = @subject.insert(tree3, :admiral, "Janeway")
      assert @subject.search(tree4, key1) == val1
      assert @subject.search(tree4, key2) == val2
      assert @subject.search(tree4, key3) == val3
      assert @subject.search(tree4, key4) == val4
    end
  end

  describe "&size/1" do
    test "empty" do
      assert @subject.size(@subject.new()) == 0
    end
  end
end

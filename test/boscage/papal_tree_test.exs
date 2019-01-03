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
  end

  describe "&size/1" do
    test "empty" do
      assert @subject.size(@subject.new()) == 0
    end
  end
end

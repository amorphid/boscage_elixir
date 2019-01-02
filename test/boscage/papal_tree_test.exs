defmodule Boscage.PapalTreeTest do
  use ExUnit.Case, async: true

  @subject Boscage.PapalTree

  describe "&insert/3" do
    test "size increases by 1 for new element" do
      empty = @subject.new()
      0 = @subject.size(empty)
      {:ok, not_empty} = @subject.insert(empty, :potato, "effin' tasty")
      expected = 1
      actual = @subject.size(not_empty)
      assert expected == actual
    end

    test "duplicate key does not change size" do
      key = :potato
      {:ok, new_tree} = @subject.insert(@subject.new(), key, "effin' tasty")
      1 = @subject.size(new_tree)
      {:ok, updated_tree} = @subject.insert(new_tree, key, "still effin' tasty")
      expected = 1
      actual =  @subject.size(updated_tree)
      assert expected == actual
    end
  end

  describe "&size/1" do
    test "size zero" do
      assert @subject.size(@subject.new()) == 0
    end
  end
end

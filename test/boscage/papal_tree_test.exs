defmodule Boscage.PapalTreeTest do
  use ExUnit.Case, async: true

  @subject Boscage.PapalTree

  describe "&size/1" do
    test "for empty tree" do
      assert @subject.size(@subject.new()) == 0
    end
  end
end

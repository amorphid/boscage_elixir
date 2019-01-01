defmodule Boscage.PapalTree do
  defstruct [
    :size
  ]

  def new() do
    %__MODULE__{
      size: 0
    }
  end

  def size(%__MODULE__{} = data) do
    data.size
  end
end

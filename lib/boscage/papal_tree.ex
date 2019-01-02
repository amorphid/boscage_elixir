defmodule Boscage.PapalTree do
  defstruct [
    :key,
    :size,
    :value
  ]

  def new() do
    %__MODULE__{
      key: nil,
      size: 0,
      value: nil,
    }
  end

  def insert(%__MODULE__{size: 0} = data, key, value) do
    {:ok, struct!(data, [key: key, value: value, size: 1])}
  end

  def size(%__MODULE__{} = data) do
    data.size
  end
end

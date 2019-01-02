defmodule Boscage.PapalTree do
  defstruct [
    :key,
    :size,
    :right,
    :value
  ]

  def new() do
    %__MODULE__{
      key: nil,
      right: nil,
      size: 0,
      value: nil
    }
  end

  def insert(%__MODULE__{size: 0} = data, key, value) do
    {:ok, struct!(data, key: key, value: value, size: 1)}
  end

  def insert(%__MODULE__{key: key} = data, key, value) do
    {:ok, struct!(data, key: key, value: value)}
  end

  def insert(%__MODULE__{key: existing_key, right: nil} = data, new_key, value)
      when new_key > existing_key do
    {:ok, right} = new() |> insert(new_key, value)
    increased_size = data.size + 1
    {:ok, struct!(data, right: right, size: increased_size)}
  end

  def size(%__MODULE__{} = data) do
    data.size
  end
end

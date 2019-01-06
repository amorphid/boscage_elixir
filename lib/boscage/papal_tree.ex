defmodule Boscage.PapalTree do
  defstruct [
    :key,
    :left,
    :size,
    :right,
    :value
  ]

  def insert(%__MODULE__{left: nil, right: nil, size: 0}, key, value) do
    data = new()
    center = struct!(data, key: key, value: value, size: 1)
    {:ok, center}
  end

  def new() do
    %__MODULE__{
      key: nil,
      left: nil,
      right: nil,
      size: 0,
      value: nil
    }
  end

  def max(%__MODULE__{right: %__MODULE__{}} = data) do
    max(data.right)
  end

  def max(%__MODULE__{} = data) do
    {data.key, data.value}
  end

  def pop(%__MODULE__{left: nil, right: %__MODULE__{}, size: 2} = data) do
    {:ok, {popped, _}} = pop(data.right)
    right = nil
    size = 1
    data2 = struct!(data, right: right, size: size)
    {:ok, {popped, data2}}
  end

  def pop(%__MODULE__{left: nil, right: nil, size: 1} = data) do
    {:ok, {{data.key, data.value}, new()}}
  end

  # def search(%__MODULE__{key: key} = data, key) do
  #   data.value
  # end
  #
  # def search(
  #       %__MODULE__{key: stored_key, right: %__MODULE__{} = right},
  #       search_key
  #     )
  #     when search_key > stored_key do
  #   search(right, search_key)
  # end
  #
  # def search(%__MODULE__{left: %__MODULE__{} = left}, search_key) do
  #   search(left, search_key)
  # end
  #
  # def search(%__MODULE__{} = _, search_key) do
  #   {:error, "key #{inspect(search_key)} not found"}
  # end

  def size(%__MODULE__{} = data) do
    data.size
  end
end

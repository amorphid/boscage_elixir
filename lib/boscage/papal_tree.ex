defmodule Boscage.PapalTree do
  defstruct [
    :key,
    :left,
    :size,
    :right,
    :value
  ]

  def insert(
        %__MODULE__{left: nil, right: %__MODULE__{} = right, size: 2} = center,
        key,
        value
      ) do
    {:ok, left} = new() |> insert(center.key, center.value)
    center_key = right.key
    center_size = 3
    center_value = right.value
    {:ok, right2} = new() |> insert(key, value)

    center2 =
      struct!(center,
        key: center_key,
        left: left,
        right: right2,
        size: center_size,
        value: center_value
      )

    {:ok, center2}
  end

  def insert(
        %__MODULE__{left: nil, right: nil, size: 1} = center,
        key,
        value
      ) do
    {:ok, right} = new() |> insert(key, value)
    center_size = 2
    center2 = struct!(center, right: right, size: center_size)
    {:ok, center2}
  end

  def insert(%__MODULE__{left: nil, right: nil, size: 0}, key, value) do
    data = new()
    center = struct!(data, key: key, value: value, size: 1)
    {:ok, center}
  end

  def insert(
        %__MODULE__{
          key: stored_key,
          left: %__MODULE__{size: size},
          right: %__MODULE__{size: size}
        } = center,
        insert_key,
        value
      )
      when insert_key > stored_key do
    center_size = center.size + 1
    {:ok, right} = insert(center.right, insert_key, value)
    center2 = struct!(center, right: right, size: center_size)
    {:ok, center2}
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

  def pop(
        %__MODULE__{left: %__MODULE__{} = left, right: %__MODULE__{}, size: 3} =
          center
      ) do
    {:ok, {popped, _}} = pop(center.right)
    left2 = nil
    center_key = left.key
    center_value = left.value
    center_size = 2
    {:ok, right} = new() |> insert(center.key, center.value)

    center2 =
      struct!(center,
        key: center_key,
        left: left2,
        right: right,
        size: center_size,
        value: center_value
      )

    {:ok, {popped, center2}}
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

  def pop(
        %__MODULE__{
          left: %__MODULE__{size: left_size},
          right: %__MODULE__{size: right_size}
        } = center
      )
      when right_size == left_size + 1 do
    center_size = center.size - 1
    {:ok, {popped, right}} = pop(center.right)
    center2 = struct!(center, right: right, size: center_size)
    {:ok, {popped, center2}}
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

  def shift(%__MODULE__{left: nil, right: nil, size: 1} = center) do
    {:ok, {{center.key, center.value}, new()}}
  end

  def shift(%__MODULE__{left: nil, right: %__MODULE__{}, size: 2} = center) do
    popped = {center.key, center.value}
    center = center.right
    {:ok, {popped, center}}
  end

  def shift(
        %__MODULE__{left: %__MODULE__{} = left, right: %__MODULE__{}, size: 3} =
          center
      ) do
    popped = {left.key, left.value}
    left = nil
    center_size = center.size - 1
    center2 = struct!(center, left: left, size: center_size)
    {:ok, {popped, center2}}
  end

  def size(%__MODULE__{} = data) do
    data.size
  end
end

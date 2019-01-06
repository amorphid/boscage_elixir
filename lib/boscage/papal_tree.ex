defmodule Boscage.PapalTree do
  defstruct [
    :key,
    :left,
    :size,
    :right,
    :value
  ]

  def new() do
    %__MODULE__{
      key: nil,
      left: nil,
      right: nil,
      size: 0,
      value: nil
    }
  end

  def delete(
        %__MODULE__{key: stored_key, right: %__MODULE__{}} = data,
        search_key
      )
      when search_key > stored_key do
    case delete(data.right, search_key) do
      {:ok, %__MODULE__{size: size} = right} when size > 0 ->
        size = data.size - 1
        {:ok, struct!(data, right: right, size: size)}

      {:ok, %__MODULE__{key: nil, size: 0}} ->
        right = nil
        size = data.size - 1
        {:ok, struct!(data, right: right, size: size)}
    end
  end

  def delete(%__MODULE__{left: %__MODULE__{}} = data, search_key) do
    case delete(data.left, search_key) do
      {:ok, %__MODULE__{size: size} = left} when size > 0 ->
        size = data.size - 1
        {:ok, struct!(data, left: left, size: size)}

      {:ok, %__MODULE__{key: nil, size: 0}} ->
        left = nil
        size = data.size - 1
        {:ok, struct!(data, left: left, size: size)}
    end
  end

  def delete(%__MODULE__{key: key, left: nil, right: nil} = data, key) do
    key2 = nil
    value = nil
    size = data.size - 1
    {:ok, struct!(data, key: key2, value: value, size: size)}
  end

  def delete(%__MODULE__{}, search_key) do
    {:error, "key #{inspect(search_key)} not found"}
  end

  def insert(%__MODULE__{size: 0} = data, key, value) do
    {:ok, struct!(data, key: key, value: value, size: 1)}
  end

  def insert(%__MODULE__{key: key} = data, key, value) do
    {:ok, struct!(data, key: key, value: value)}
  end

  def insert(
        %__MODULE__{key: stored_key, left: nil, right: %__MODULE__{size: 1} = right, size: 2} =
          center,
        new_key,
        value
      )
      when new_key > stored_key do
    {:ok, left} = new() |> insert(center.key, center.value)
    center_key = right.key
    center_size = center.size + 1
    center_value = right.value
    {:ok, right2} = new() |> insert(new_key, value)

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

  def insert(%__MODULE__{key: existing_key, right: nil} = data, new_key, value)
      when new_key > existing_key do
    {:ok, right} = new() |> insert(new_key, value)
    increased_size = data.size + 1
    {:ok, struct!(data, right: right, size: increased_size)}
  end

  def insert(
        %__MODULE__{key: existing_key, right: right} = data,
        new_key,
        value
      )
      when new_key > existing_key do
    {:ok, right2} = insert(right, new_key, value)
    increased_size = data.size + 1
    {:ok, struct!(data, right: right2, size: increased_size)}
  end

  def insert(
        %__MODULE__{left: %__MODULE__{size: 1} = left, right: nil, size: 2} = center,
        key,
        value
      ) do
    {:ok, left2} = new() |> insert(new_key, value)
    center_key = left.key
    center_size = center.size + 1
    center_value = left.value
    {:ok, right} = new() |> insert(center.key, center.value)

    center2 =
      struct!(center,
        key: center_key,
        left: left2,
        right: right,
        size: center_size,
        value: center_value
      )

    {:ok, center2}
  end

  def insert(%__MODULE__{left: nil} = data, new_key, value) do
    {:ok, left} = new() |> insert(new_key, value)
    increased_size = data.size + 1
    {:ok, struct!(data, left: left, size: increased_size)}
  end

  def insert(%__MODULE__{left: left} = data, new_key, value) do
    {:ok, left2} = insert(left, new_key, value)
    increased_size = data.size + 1
    {:ok, struct!(data, left: left2, size: increased_size)}
  end

  def max(%__MODULE__{right: %__MODULE__{}} = data) do
    max(data.right)
  end

  def max(%__MODULE__{} = data) do
    data
  end

  def search(%__MODULE__{key: key} = data, key) do
    data.value
  end

  def search(
        %__MODULE__{key: stored_key, right: %__MODULE__{} = right},
        search_key
      )
      when search_key > stored_key do
    search(right, search_key)
  end

  def search(%__MODULE__{left: %__MODULE__{} = left}, search_key) do
    search(left, search_key)
  end

  def search(%__MODULE__{} = _, search_key) do
    {:error, "key #{inspect(search_key)} not found"}
  end

  def size(%__MODULE__{} = data) do
    data.size
  end
end

defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |>pick_color
    |> build_grid

  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end

  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
    # Creates a new struct and paste image and new r,g,b
    %Identicon.Image{image | color: {r,g,b}}
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    hex
    # Turn list into a list of lists
    |> Enum.chunk(3)
  end

  def mirror_row(row) do
    [first, second | _tail] = row
  
    row ++ [second, first]
  end

end

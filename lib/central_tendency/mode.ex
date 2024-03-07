defmodule CentralTendency.Mode do

  alias Errors
  alias Validators
  @moduledoc """
    Documentation for `Mode`.
    Determines the Mode
    Function takes argument as list

    Example :
      iex > Statistics.find_mode([1,2,2,4,7,8,8,2,4,3,4,4,5])
      [4]

      iex > Statistics.find_mode([1,2,3,4,3,8,8,2,4,3,4,4,5,3])
      [3, 4]
    """

  @spec mode(list(number())) :: list(number()) | {atom() , String.t()}
  def mode([]) , do: Errors.invalid_data_type()

  def mode(nums) when is_list(nums) do
   nums
    |> Validators.validate_num_list()
    |> calc_mode()
  end

  def mode(_) , do: Errors.invalid_data_type()

  @spec calc_mode({boolean() ,list()}) :: number() | {atom() , String.t()}
  defp calc_mode({false,_nums}) , do: Errors.invalid_data_type()

  defp calc_mode({true,nums}) do
    ranked_map = Enum.frequencies(nums)

    max_occurance = ranked_map |> Map.values |>Enum.max
    get_mode(max_occurance,ranked_map)

  end

  defp get_mode(1 , _ranked_map) , do: nil

  defp get_mode(max_occurance,ranked_map) do
    ranked_map
     |> Map.filter(fn {_keys , values} -> values == max_occurance end ) |> Map.keys
  end

end

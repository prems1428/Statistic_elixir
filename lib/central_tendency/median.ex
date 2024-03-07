defmodule CentralTendency.Median do

  require Integer
  alias Validators
  @moduledoc """
    Documentation for `Median`.
    Caluculates the Mean
    Function takes argument as list

    Example :
      iex > Statistics.find_median([1,2,3,4,5])
      3

      iex > Statistics.find_median([1,2,3,4,5,6])
      3.5
    """

  @spec median(list(number())) :: number() | {atom() , String.t()}
  def median([]) , do: Errors.invalid_data_type()

  def median(nums) when is_list(nums) do
   nums
    |> Validators.validate_num_list()
    |> calc_median()
  end

  def median(_) , do: Errors.invalid_data_type()

  @spec calc_median({boolean() ,list()}) :: number() | {atom() , String.t()}
  defp calc_median({false , _nums}) , do: Errors.invalid_data_type()

  defp calc_median({true , nums}) do
    count = nums |> Enum.count()

    nums
    |> Enum.sort()
    |> get_median(Integer.is_even(count) ,count)
  end

  defp get_median(sorted_list , false , count) , do: Enum.at(sorted_list , div(count,2))
  defp get_median(sorted_list , true , count) do
    a =  Enum.at(sorted_list , div(count - 1,2))
    b =  Enum.at(sorted_list , div(count,2))

    ( a + b ) / 2
  end

end

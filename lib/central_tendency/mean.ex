defmodule CentralTendency.Mean do

  alias Errors
  alias Validators
  @moduledoc """
    Documentation for `Mean`.
    Caluculates the average(sum / count)
    Function takes argument as list

    Example :

    iex > Statistics.find_mean([1,2,3,4])
    2.5

    """

  @spec population_mean(list(number())) :: number() | {atom() , String.t()}
  def population_mean([]) , do: Errors.invalid_data_type()

  def population_mean(nums) when is_list(nums) do
  nums
  |> Validators.validate_num_list()
  |> calc_population_mean()
  end

  def population_mean(_) , do: Errors.invalid_data_type()

  @spec calc_population_mean({boolean() ,list()}) :: number() | {atom() , String.t()}
  defp calc_population_mean({false , _nums}) , do: Errors.invalid_data_type()

  defp calc_population_mean({true , nums}) do
  nums
  |> Enum.sum()
  |> mean(Enum.count(nums))
  end

  defp mean(sum, count) when count != 0, do: sum/count

  defp mean(_, _), do: Errors.invalid_operation()


end

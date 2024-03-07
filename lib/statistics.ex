defmodule Statistics do

  alias CentralTendency.Mean
  alias CentralTendency.Median
  alias CentralTendency.Mode
  @moduledoc """
  Documentation for `Statistics`.
  """

  def find_mean(nums) , do: Mean.population_mean(nums)

  def find_median(nums) , do: Median.median(nums)

  def find_mode(nums) , do: Mode.mode(nums)
end

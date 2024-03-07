defmodule Errors do

  @spec invalid_data_type() :: {atom() , String.t()}
  def invalid_data_type() , do: {:error , "Invalid data type"}

  @spec invalid_operation() :: {atom() , String.t()}
  def invalid_operation() , do: {:error, "Cannot divide by zero."}
end

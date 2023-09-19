Code.require_file("common.exs")
# Generate a 50/50 true/false value.
# This will be used to demonstrate error handling.
random_boolean = :rand.uniform() > 0.5

IO.puts("The (initial) error will" <> if(random_boolean, do: " not ", else: " ") <> "be thrown.")

# This is a proper way to do it.
# Error tuples are easy to handle and play
# well with Elixir's pattern matching capabilities.

# This will still throw an error though.
# {:ok, _result} = Common.error_tuple(false)

# However it is easy to handle.
with {:ok, _result} <- Common.error_tuple(random_boolean) do
  IO.puts("Great success!")
else
  {:error, reason} -> IO.puts("Error: #{reason}")
end

# It's also possible to use the `case` statement.
case Common.error_tuple(random_boolean) do
  {:ok, _result} -> IO.puts("Great success!")
  {:error, reason} -> IO.puts("Error: #{reason}")
end

# The final way to handle errors is to just use an `if`/`unless` statement.
{result, reason} = Common.error_tuple(random_boolean)

if result == :ok do
  IO.puts("Great success!")
else
  IO.puts("Error: #{reason}")
end

# Using with is the preferred way to handle errors.
# It's more readable and easier to understand.
# And you can use it with multiple functions at once.
with {:ok, _result} <- Common.error_tuple(true),
     {:wtf, _result} <- Common.error_tuple("wtf") do
  IO.puts("Great success!")
else
  {:error, reason} -> IO.puts("Error: #{reason}")
end

error_or_wtf = if random_boolean, do: false, else: "wtf"

with {:ok, _result} <- Common.error_tuple(error_or_wtf) do
  IO.puts("This should never be printed!")
else
  {:wtf, _result} -> IO.puts("Great WTF!")
  {:error, reason} -> IO.puts("Error: #{reason}")
end

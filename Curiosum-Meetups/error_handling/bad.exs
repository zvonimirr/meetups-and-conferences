Code.require_file("common.exs")

# This is a bad way to do it.
# It will work, but it should be avoided.
try do
  Common.throw_error!()
  IO.puts("This will never be printed!")
rescue
  _err ->
    IO.puts("Caught error!")
end

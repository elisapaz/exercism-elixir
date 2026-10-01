defmodule Secrets do
  @spec secret_add(integer()) :: (integer() -> integer())
  def secret_add(secret) do
    &(&1 + secret)
  end

  @spec secret_subtract(integer()) :: (integer() -> integer())
  def secret_subtract(secret) do
    fn n -> n - secret end
  end

  @spec secret_multiply(integer()) :: (integer() -> integer())
  def secret_multiply(secret) do
    fn n -> n * secret end
  end

  @spec secret_multiply(integer()) :: (integer() -> integer())
  def secret_divide(secret) do
    fn n -> div(n, secret) end
  end

  @spec secret_multiply(integer()) :: (integer() -> integer())
  def secret_and(secret) do
    fn n -> Bitwise.band(n, secret) end
  end

  @spec secret_multiply(integer()) :: (integer() -> integer())
  def secret_xor(secret) do
    fn n -> Bitwise.bxor(n, secret) end
  end

  def secret_combine(secret_function1, secret_function2) do
    fn n -> secret_function2.(secret_function1.(n))
    end
  end
end

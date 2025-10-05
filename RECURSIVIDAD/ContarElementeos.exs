defmodule RecursionListas do
  # Caso base: lista vacía → contador 0
  def contar_pares([]), do: 0

  # Caso recursivo: verificar si el primer elemento es par
  def contar_pares([h | t]) do
    if rem(h, 2) == 0 do
      1 + contar_pares(t)
    else
      contar_pares(t)
    end
  end
end

defmodule RecursionListas do
  def invertir([]), do: []
  def invertir([h | t]), do: invertir(t) ++ [h]
end
# Ejemplo de uso:
#invertir([1,2,3])
#→ invertir([2,3]) ++ [1]
#→ (invertir([3]) ++ [2]) ++ [1]
#→ ((invertir([]) ++ [3]) ++ [2]) ++ [1]
#→ [] ++ [3] ++ [2] ++ [1]
#→ [3,2,1]

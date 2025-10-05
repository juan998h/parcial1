def sumar_matriz([]), do: 0

def sumar_matriz([fila | resto]) do
  sumar_lista(fila) + sumar_matriz(resto)
end

defp sumar_lista([]), do: 0
defp sumar_lista([h | t]), do: h + sumar_lista(t)
#sumar_matriz([[1,2],[3,4]])
#→ sumar_lista([1,2]) + sumar_matriz([[3,4]])
#→ (1+2) + (sumar_lista([3,4]) + sumar_matriz([]))
#→ 3 + (7 + 0)
#→ 10

def suma_objetivo?([], objetivo), do: objetivo == 0

def suma_objetivo?([h | t], objetivo) do
  suma_objetivo?(t, objetivo) or suma_objetivo?(t, objetivo - h)
end
# Ejemplo de uso:
#suma_objetivo?([3,4,5], 9)
#→ suma_objetivo?([4,5], 9) or suma_objetivo?([4,5], 6)
#→ ... (sigue ramificando)

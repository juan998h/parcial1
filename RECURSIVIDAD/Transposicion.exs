def transponer([[] | _]), do: []

def transponer(matriz) do
  primera_columna = for [h | _] <- matriz, do: h
  resto_columnas = for [_ | t] <- matriz, do: t
  [primera_columna | transponer(resto_columnas)]
end
# Ejemplo de uso:[[1,2,3],
 ##[4,5,6]]
#→
#[[1,4],
 #[2,5],
 #[3,6]]

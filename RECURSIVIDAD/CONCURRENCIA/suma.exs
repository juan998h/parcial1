defmodule EjercicioConcurrencia do

  # ---------------------------------
  # S1: suma de los números debajo de la diagonal principal (recursivo)
  # ---------------------------------
  def suma_debajo_diagonal(matriz) do
    suma_rec(matriz, 1, 0)
  end

  defp suma_rec([], _, _), do: 0
  defp suma_rec([fila | resto], fila_idx, suma) do
    parte = Enum.take(fila, fila_idx)
    suma_fila = Enum.sum(parte)
    suma_rec(resto, fila_idx + 1, suma + suma_fila)
  end

  # ---------------------------------
  # S2: promedio de los números encima de la diagonal principal
  # ---------------------------------
  def promedio_encima_diagonal(matriz) do
    {suma, cont} = recorrer_encima(matriz, 0, 0, 0)
    suma / cont
  end

  defp recorrer_encima([], _, suma, cont), do: {suma, cont}
  defp recorrer_encima([fila | resto], fila_idx, suma, cont) do
    arriba = Enum.drop(fila, fila_idx + 1)
    recorrer_encima(
      resto,
      fila_idx + 1,
      suma + Enum.sum(arriba),
      cont + length(arriba)
    )
  end

  # ---------------------------------
  # Main (crea los procesos y espera)
  # ---------------------------------
  def main do
    matriz = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]

    # lanzamos t1 y t2 en paralelo
    t1 = spawn(fn ->
      a = suma_debajo_diagonal(matriz)
      send(self(), {:a, a})
    end)

    t2 = spawn(fn ->
      b = promedio_encima_diagonal(matriz)
      send(self(), {:b, b})
    end)

    # esperamos resultados
    a = recibir_resultado(:a)
    b = recibir_resultado(:b)

    # S3 y S4
    c = a * b
    IO.puts("Resultado final (c = a * b): #{c}")
  end

  # función para recibir el resultado
  defp recibir_resultado(nombre) do
    receive do
      {^nombre, valor} -> valor
    end
  end
end

EjercicioConcurrencia.main()

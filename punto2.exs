defmodule Cine do
  # Mapa inicial de salas
  def salas do
    %{
      "Sala1" => 50,
      "Sala2" => 30,
      "Sala3" => 20
    }
  end

  # Función para reservar sillas
  def reservar_sillas(salas, nombre_sala, cantidad) do
    case Map.get(salas, nombre_sala) do
      nil ->
        IO.puts("Sala no encontrada")
        salas

      disponibles when cantidad > disponibles ->
        IO.puts("No hay suficientes sillas disponibles")
        salas

      disponibles ->
        Map.put(salas, nombre_sala, disponibles - cantidad)
    end
  end
end

# --------------------------
# PRUEBAS RÁPIDAS
# --------------------------

IO.puts("\n=== PRUEBAS PUNTO 2 ===")
s = Cine.salas()

# 1. Reservar 10 sillas en Sala1 (sí alcanza)
IO.inspect(Cine.reservar_sillas(s, "Sala1", 10),
  label: "Caso 1: Reservar 10 en Sala1")

# 2. Intentar reservar 40 sillas en Sala2 (solo hay 30)
IO.inspect(Cine.reservar_sillas(s, "Sala2", 40),
  label: "Caso 2: Reservar 40 en Sala2 (insuficientes)")

# 3. Reservar 5 sillas en Sala3 (sí alcanza)
IO.inspect(Cine.reservar_sillas(s, "Sala3", 5),
  label: "Caso 3: Reservar 5 en Sala3")

# 4. Reservar en una sala que no existe
IO.inspect(Cine.reservar_sillas(s, "SalaX", 5),
  label: "Caso 4: Sala no encontrada")

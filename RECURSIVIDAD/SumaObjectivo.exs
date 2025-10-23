defmodule Asignacion do
  # rooms: lista de mapas %{id, disponible}
  # guests: lista de nombres o IDs de solicitud
  def asignar([], _rooms), do: []  # todas las solicitudes asignadas

  def asignar([huesped | resto], rooms) do
    # Intentar cada habitación disponible
    Enum.reduce_while(rooms, nil, fn room, _ ->
      if room.disponible do
        # Marcar esta habitación como ocupada
        nuevos_rooms = Enum.map(rooms, fn r ->
          if r.id == room.id, do: %{r | disponible: false}, else: r
        end)
        # Intentar asignar al resto de huéspedes con las habitaciones restantes
        caso = asignar(resto, nuevos_rooms)
        if caso != nil do
          {:halt, [{huesped, room.id} | caso]}  # solución encontrada
        else
          {:cont, nil}  # fallo: probar otra habitación
        end
      else
        {:cont, nil}  # habitación no disponible: seguir
      end
    end)
  end
end

# Ejemplo de uso:
# salas = [%{id: 101, disponible: true}, %{id: 102, disponible: true}]
# peticiones = ["Juan", "Ana"]
# Asignacion.asignar(peticiones, salas)
# ➞ [{"Ana", 102}, {"Juan", 101}] (o similar)

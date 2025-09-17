defmodule Envio do
  # Punto 1: calcular costo de envío
  def calcular_envio(peso, tipo_cliente, servicio)
      when is_number(peso) and peso > 0 do

    # 1. Determinar tarifa base según peso
    base =
      cond do
        peso <= 1 -> 8000
        peso <= 5 -> 12000
        peso > 5 -> 20000
      end

    # 2. Aplicar descuento por tipo de cliente
    descuento =
      case tipo_cliente do
        :corporativo -> base * 0.15
        :estudiante -> base * 0.10
        :regular -> 0
        _ -> 0
      end

    subtotal = base - descuento

    # 3. Recargo por servicio
    recargo =
      case servicio do
        :express -> subtotal * 0.25
        :estandar -> 0
        _ -> 0
      end

    total = subtotal + recargo

    # Retornar desglose como mapa
    %{
      base: base,
      descuento: descuento,
      subtotal: subtotal,
      recargo: recargo,
      total: total
    }
  end
end

# --------------------------
# PRUEBAS RÁPIDAS
# --------------------------

IO.puts("=== PRUEBAS PUNTO 1 ===")

# 1. Paquete de 0.5 kg, cliente corporativo, servicio express
IO.inspect(Envio.calcular_envio(0.5, :corporativo, :express),
  label: "Caso 1: 0.5kg, corporativo, express")

# 2. Paquete de 3 kg, estudiante, servicio estándar
IO.inspect(Envio.calcular_envio(3, :estudiante, :estandar),
  label: "Caso 2: 3kg, estudiante, estandar")

# 3. Paquete de 7 kg, cliente regular, servicio express
IO.inspect(Envio.calcular_envio(7, :regular, :express),
  label: "Caso 3: 7kg, regular, express")

# 4. Paquete de 2 kg, cliente desconocido, servicio estandar
IO.inspect(Envio.calcular_envio(2, :vip, :estandar),
  label: "Caso 4: 2kg, tipo_cliente desconocido, estandar")

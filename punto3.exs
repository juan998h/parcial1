defmodule Seguridad do
  def validar(password) do
    errores = []

    # 1. Longitud mínima
    errores =
      if String.length(password) < 8 do
        ["Debe tener al menos 8 caracteres" | errores]
      else
        errores
      end

    # 2. Mayúscula
    errores =
      if String.match?(password, ~r/[A-Z]/) do
        errores
      else
        ["Debe contener al menos una letra mayúscula" | errores]
      end

    # 3. Número
    errores =
      if String.match?(password, ~r/[0-9]/) do
        errores
      else
        ["Debe contener al menos un número" | errores]
      end

    # 4. Espacios
    errores =
      if String.contains?(password, " ") do
        ["No debe contener espacios" | errores]
      else
        errores
      end

    # Aquí usamos case como pide el enunciado
    case errores do
      [] -> {:ok, "Contraseña segura"}
      _ -> {:error, Enum.join(Enum.reverse(errores), ", ")}
    end
  end
end

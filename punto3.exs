defmodule Seguridad do
  def validar(password) do
    errores = []

    # 1. Longitud mínima (>= 8)
    errores =
      if String.length(password) < 8 do
        ["Debe tener al menos 8 caracteres" | errores]
      else
        errores
      end

    # 2. Al menos una mayúscula
    errores =
      if String.match?(password, ~r/[A-Z]/) do
        errores
      else
        ["Debe tener al menos una letra mayúscula" | errores]
      end

    # 3. Al menos un número
    errores =
      if String.match?(password, ~r/[0-9]/) do
        errores
      else
        ["Debe contener al menos un número" | errores]
      end

    # 4. No contener espacios
    errores =
      if String.contains?(password, " ") do
        ["No debe contener espacios" | errores]
      else
        errores
      end

    # Resultado final
    if errores == [] do
      {:ok, "Contraseña segura"}
    else
      {:error, Enum.join(Enum.reverse(errores), ", ")}
    end
  end
end

# --------------------------
# PRUEBAS RÁPIDAS
# --------------------------

IO.puts("\n=== PRUEBAS PUNTO 3 ===")

# 1. Contraseña correcta
IO.inspect(Seguridad.validar("Abc12345"), label: "Caso 1: Contraseña válida")

# 2. Muy corta
IO.inspect(Seguridad.validar("Ab1"), label: "Caso 2: Demasiado corta")

# 3. Sin mayúscula
IO.inspect(Seguridad.validar("abc12345"), label: "Caso 3: Sin mayúscula")

# 4. Sin número
IO.inspect(Seguridad.validar("Abcdefgh"), label: "Caso 4: Sin número")

# 5. Con espacios
IO.inspect(Seguridad.validar("Abc 12345"), label: "Caso 5: Con espacios")

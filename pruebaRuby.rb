def read_alum(file_name)  
  file = File.open(file_name, 'r')  
  alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }  
  file.close  
  alum
end

alumnos = read_alum("notas.csv")
datos = Hash[alumnos.map { |key| [key.shift, key] }]

opcion = 0
while opcion != 4 
	puts "Presione 1 para Imprimir nombre y promedio de cada Alumno "  
	puts "Presione 2 para listar la cantidad de inasistencias totales"
	puts "Presione 3 para listar alumnos aprobados"
	puts "Presione 4 para Salir"
	opcion = gets.chomp.to_i
	system("clear")
	case opcion
		when 1
			acumulador = 0
			puts "El listado de promedios es el siguiente = "
			datos.each do |key, value| 
				acumulador = value.map{|ele| ele.to_i}
				puts "#{key} - #{(acumulador.sum.to_f) / value.count}"
			end
			puts "\n\n"

		when 2
			puts "Listado de Inasistencias"
			datos.each do |key, value|
				if value.include?('A')
					puts "#{key} - #{value.count('A')}"
				end
			end
			puts "\n"

		when 3
			def calcular_nota(numero = 5, datos)
				puts "El listado de Alumnos Aprobados es el siguiente = "
				datos.each do |key, value| 
					acumulador = value.map{|ele| ele.to_i}
						if (acumulador.sum.to_f) / value.count >= numero
							puts "#{key} - #{(acumulador.sum.to_f) / value.count}"
						end
				end
				puts "\n\n"
			end

			puts "Ingrese promedio mínimo para aprobar"
			minimo = gets.chomp.to_f
			calcular_nota(minimo, datos)

		when 4
			puts 'Salir'
		else
			puts "Opción Inválida, vuelva a ingresar\n"
		end
	end			
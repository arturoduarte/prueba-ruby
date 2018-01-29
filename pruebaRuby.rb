# método para leer archivo
def read_alum(file_name)  
  file = File.open(file_name, 'r')  
  alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }  
	file.close  
	alum
end

# llamamos al método y pasamos como parámetro el archivo .csv, y lo guardamos dentro de una variable
alumnos = read_alum("alumnos.csv")
#convertimos el array a un hash, en formato key-value, y lo almacenamos a variable datos
datos = Hash[alumnos.map { |key| [key.shift, key] }]
opcion = 0
while opcion != 4 
	puts "Presione 1 para Imprimir nombre y promedio de cada Alumno "  
	puts "Presione 2 para listar la cantidad de Inasistencias totales"
	puts "Presione 3 para listar Alumnos Aprobados"
	puts "Presione 4 para Salir"
	opcion = gets.chomp.to_i
	system("clear")
	case opcion
		when 1
			puts "El listado de promedios es el siguiente = "
			# iteramos los valores del hash
			datos.each do |key, value| 
				# almacenamos los puntajes de cada alumno a variable acumulador
				acumulador = value.map{|ele| ele.to_i}
				# hacemos la sumatoria de los puntajes y lo dividimos por la cantidad y lo imprimimos
				puts "#{key} - #{(acumulador.sum.to_f) / value.count}"
			end
			puts "\n\n"

		when 2
			puts "Listado de Inasistencias"
			datos.each do |key, value|
				# if dentro de value encuentra 'A'
				if value.include?('A')
					# imprime la clave y suma el valor de inasistencias
					puts "#{key} - #{value.count('A')}"
				end
			end
			puts "\n"

		when 3
			def calcular_nota(numero = 5, datos)
				puts "El listado de Alumnos Aprobados es el siguiente = "
				# iteramos el hash
				datos.each do |key, value| 
					# almacenamos los puntajes de cada alumno a variable acumulador
					acumulador = value.map{|ele| ele.to_i}
					# si el promedio de los puntajes es mayor o igual al número ingresado por usuario
						if (acumulador.sum.to_f) / value.count >= numero
							# imprimo la clave y el promedio(suma de los valores dividido la cantidad de los valores)
							puts "#{key} - #{(acumulador.sum.to_f) / value.count}"
						end
				end
				puts "\n\n"
			end

			puts "Ingrese promedio mínimo para aprobar"
			# usuario ingresa el valor por consola, luego se convierte a float
			minimo = gets.chomp.to_f
			# llamamos al método y le pasamos como parámetro lo ingresado
			# además se le pasa el hash de datos
			calcular_nota(minimo, datos)

		when 4
			puts 'Salir'
		else
			puts "Opción Inválida, vuelva a ingresar\n"
		end
	end			
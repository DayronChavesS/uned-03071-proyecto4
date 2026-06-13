// UNIVERSIDAD ESTATAL A DISTANCIA 
// VICERRECTORIA ACADEMICA
// ESCUELA DE LAS CIENCIAS EXACTAS Y NATURALES
// CATEDRA DESARROLLO DE SISTEMAS
// DIPLOMADO EN INFORMATICA
// Codigo:03071
// Logica para Computacion
// Proyecto 4 (Remplaza Ordinario II)
// Grupo:02
// Estudiante: Dayron Antony Chaves Sandoval
// Cedula: 0305240018
// PRIMER CUATRIMESTRE,2020

//Explicacion: El programa le permite reservar campos en una sala de cine y comprar los respectivos tiquetes.
Algoritmo Cine_Como_En_Su_Casa
	
///FASE 1: DECLARACION DE VARIABLES
//DESICIONES DEL CLIENTE (TAMBIEN USADAS PARA LOS CICLOS)
Definir decision_principal Como Caracter;
Definir decision_pelicula Como Entero;
Definir decision_hora Como Entero;
Definir decision_secundaria Como Caracter;
//COORDENADAS DE SELECCION EN MATRIZ DEL USUARIO
Definir cordY_car Como Caracter;
Definir cordY_num Como Entero;
Definir cordX Como Entero;
Definir seleccionar Como Caracter;
//COORDENADAS USADAS EN FUNCION AZAR
Definir azarX Como Entero;
Definir azarY Como Entero;
Definir azarZ Como Entero;
//VARIABLES USADAS PARA CALCULAR EL COSTO AL FINAL DEL ALGORITMO
Definir edad Como Entero;
Definir tiquetJ Como Entero;
Definir tiquetA Como Entero;
Definir tiquetM Como Entero;
Definir resultado Como Entero;
//VARIABLES USADAS PARA RECORRIDO DE MATRICES
Definir fila Como Entero;
Definir columna Como Entero;
//VARIABLES USADAS PARA CALCULAR DATOS
Definir campos_disponibles Como Entero;
Definir campos_reservados Como Entero;
//CREAR LA MATRIZ QUE REPRESENTA LA SALA DE CINE
Definir m1 Como Caracter;
Dimension m1[8,11];
	
///FASE 2: INICIALIZACION DE VARIABLES
decision_principal = "";
decision_pelicula = 0;
decision_hora = 0;
decision_secundaria = "";
cordY_car = "";
cordY_num = 0;
cordX = 0;
seleccionar = "";
azarX = 0;
azarY = 0;
azarZ = 0;
edad = 0;
tiquetJ = 0;
tiquetA = 0;
tiquetM = 0;
resultado = 0;
fila = 0;
columna = 0;
campos_disponibles = 0;
campos_reservados = 0;
	
///FASE 3: LECTURA DE DATOS
//EL PROGRAMA ENTRA EN CICLO
Repetir
	Repetir
		Limpiar Pantalla;
		//MENU PRINCIPAL
		Escribir "[Cine como en su Casa]";
		Escribir "Todos los Derechos Reservados, año 2020.";
		Escribir "";
		Escribir "¡Bienvenido a nuestro programa de reservacion de lugares!";
		Escribir "";
		Escribir "Menores de 12 años pagan ₡1500.";
		Escribir "Entre 12 y 65 años pagan ₡2500.";
		Escribir "Mayores de 65 años pagan ₡1500.";
		Escribir "";
		Escribir "¿Desea hacer una reservacion? S/N";
		Escribir "";
		Leer decision_principal;
			//VALIDACION
			Si decision_principal <> "S" Y decision_principal <> "N" Entonces;
				Escribir "Seleccion Invalida, intentelo de nuevo.";
				Esperar Tecla;
			FinSi
	Hasta Que decision_principal = "S" o decision_principal = "N";
	
	Si decision_principal = "S" Entonces
		Repetir
			//MENU CARTELERA (Simulacion)
			Limpiar Pantalla;
			Escribir "¡Estas son las peliculas que tenemos disponibles!";
			Escribir "Seleccione una escribiendo su respectivo numero.";
			Escribir "";
			Escribir "[CARTELERA]";
			Escribir "1. Sonic";
			Escribir "2. Star Wars";
			Escribir "3. Rapidos y Furiosos";
			Escribir "4. Avengers";
			Escribir "5. Joker";
			Escribir "";
			Leer decision_pelicula;
				//VALIDACION
				Si decision_pelicula <= 0 O decision_pelicula >= 6 Entonces;
					Escribir "Seleccion Invalida, intentelo de nuevo.";
					Esperar Tecla;
				FinSi
		Hasta Que decision_pelicula > 0 Y decision_pelicula < 6;
		
		Repetir
			Limpiar Pantalla;
			//MENU HORARIOS (Simulacion)
			Escribir "¡Excelente eleccion!";
			Escribir "Esa pelicula la tenemos en los siguiente horarios.";
			Escribir "";
			Escribir "[Horarios]";
			Escribir "1. 6:00am a 8:00am";
			Escribir "2. 8:00am a 10:00am";
			Escribir "3. 10:00am a 12:00md";
			Escribir "4. 2:00pm a 4:00pm";
			Escribir "5. 4:00pm a 6:00pm";
			Escribir "6. 6:00pm a 8:00pm";
			Escribir "7. 8:00pm a 10:00pm";
			Escribir "";
			Escribir "Seleccione el que mas se ajuste a sus necesidades.";
			Leer decision_hora;
				//VALIDACION
				Si decision_hora <= 0 O decision_hora >= 8 Entonces;
					Escribir "Seleccion Invalida, intentelo de nuevo.";
					Esperar Tecla;
				FinSi
		Hasta Que decision_hora > 0 Y decision_hora < 8;
		
		//SE LLAMA A LA FUNCION INICIALIZA, ENCARGADA DE LAS MATRICES.
		Inicializa(m1,fila,columna);
		
		//PARA SIMULAR UNA SITUACION REAL, HACEMOS QUE ALGUNOS CAMPOS YA ESTEN RESERVADOS.
		Para azarZ=0 Hasta azar(70) Con Paso 1 Hacer
			azarX = azar(7);
			azarY = azar(10);
			Si m1[azarX,azarY]="-" Entonces
				m1[azarX,azarY]="X";
			FinSi
		FinPara
		
		Repetir
			//VERIFICAR SI AUN HAY ASIENTOS SIN RESERVAR MEDIANTE UN RECORRIDO POR LA MATRIZ.
			Para fila = 0 Hasta 7 Con Paso 1 Hacer
				Para columna = 0 Hasta 10 Con Paso 1 Hacer
					Si m1[fila,columna]= "-" Entonces
						campos_disponibles = 1;
					SiNo
						campos_disponibles = 0;
					FinSi
				FinPara
			FinPara
			
			//SI SE DETERMINA QUE NO HAY CAMPOS DISPONIBLES SE NOTIFICA AL USUARIO.
			Si campos_disponibles = 0 Entonces
				Escribir "Lo sentimos, todos los campos ya han sido reservados para esta pelicula.";
				Esperar Tecla;
				decision_secundaria = "N";
			FinSi
			
			Si campos_disponibles = 1 Entonces
				Limpiar Pantalla;
				Escribir "La sala de cine de su pelicula es la siguiente.";
				Escribir "";
				//ESCRIBIR LA MATRIZ DE SALA DE CINE EN PANTALLA
				Escribir "       1   2   3   4   5   6   7   8   9  10   ";
				Escribir "A","    | ",m1[1,1]," | ",m1[1,2]," | ",m1[1,3]," | ",m1[1,4]," | ",m1[1,5]," | ",m1[1,6]," | ",m1[1,7]," | ",m1[1,8]," | ",m1[1,9]," | ",m1[1,10]," |";
				Escribir "B","    | ",m1[2,1]," | ",m1[2,2]," | ",m1[2,3]," | ",m1[2,4]," | ",m1[2,5]," | ",m1[2,6]," | ",m1[2,7]," | ",m1[2,8]," | ",m1[2,9]," | ",m1[2,10]," |";
				Escribir "C","    | ",m1[3,1]," | ",m1[3,2]," | ",m1[3,3]," | ",m1[3,4]," | ",m1[3,5]," | ",m1[3,6]," | ",m1[3,7]," | ",m1[3,8]," | ",m1[3,9]," | ",m1[3,10]," |";
				Escribir "D","    | ",m1[4,1]," | ",m1[4,2]," | ",m1[4,3]," | ",m1[4,4]," | ",m1[4,5]," | ",m1[4,6]," | ",m1[4,7]," | ",m1[4,8]," | ",m1[4,9]," | ",m1[4,10]," |";
				Escribir "E","    | ",m1[5,1]," | ",m1[5,2]," | ",m1[5,3]," | ",m1[5,4]," | ",m1[5,5]," | ",m1[5,6]," | ",m1[5,7]," | ",m1[5,8]," | ",m1[5,9]," | ",m1[5,10]," |";
				Escribir "F","    | ",m1[6,1]," | ",m1[6,2]," | ",m1[6,3]," | ",m1[6,4]," | ",m1[6,5]," | ",m1[6,6]," | ",m1[6,7]," | ",m1[6,8]," | ",m1[6,9]," | ",m1[6,10]," |";
				Escribir "G","    | ",m1[7,1]," | ",m1[7,2]," | ",m1[7,3]," | ",m1[7,4]," | ",m1[7,5]," | ",m1[7,6]," | ",m1[7,7]," | ",m1[7,8]," | ",m1[7,9]," | ",m1[7,10]," |";
				Escribir "		X = Campo Reservado";
				
				Repetir
					Escribir "";
					Escribir "¿Que edad tiene la persona a la que le reservara el campo?";
					Escribir "Nota: Escriba solo numeros.";
					Leer edad;
					//VALIDACION
					Si edad <= 0 O edad >= 100 Entonces;
						Escribir "Numero invalido, intentelo de nuevo.";
						Esperar Tecla;
					FinSi
				Hasta Que edad > 0 Y edad < 100 
				
				Repetir
					Escribir "";
					Escribir "Seleccione la fila donde desea reservar su campo.";
					Escribir "Nota: Escriba una letra entre la A y la G.";
					Leer cordY_car;
						//VALIDACION
						Si cordY_car <> "A" Y cordY_car <> "B" Y cordY_car <> "C" Y cordY_car <> "D" Y cordY_car <> "E" Y cordY_car <> "F" Y cordY_car <> "G" Entonces;
							Escribir "Letra invalida, intentelo de nuevo.";
							Esperar Tecla;
						FinSi
				Hasta Que cordY_car = "A" O cordY_car = "B" O cordY_car = "C" O cordY_car = "D" O cordY_car = "E" O cordY_car = "F" O cordY_car = "G";
				
				Repetir
					Escribir "";
					Escribir "Seleccione el numero de asiento que desea reservar.";
					Escribir "Nota: Escriba un numero entre el 1 y el 10";
					Leer cordX;
						//VALIDACION
						Si cordX <= 0 O cordX >= 11 Entonces;
							Escribir "Numero invalido, intentelo de nuevo.";
							Esperar Tecla;
						FinSi
				Hasta Que cordX > 0 Y cordX < 11
				
				//SE LLAMA A LA FUNCION RESERVAR, ENCARGADA DE SELECCIONAR EL CAMPO EN LA MATRIZ.
				Reservar(m1,campos_reservados,tiquetJ,tiquetA,tiquetM,decision_secundaria,edad,cordX,cordY_car,cordY_num,campos_disponibles,seleccionar);
				
				Repetir
					Escribir "¿Desea reservar otro campo? S/N";
					Leer decision_secundaria;
						//VALIDACION
						Si decision_secundaria <> "S" Y decision_secundaria <> "N" Entonces;
							Escribir "Seleccion Invalida, intentelo de nuevo.";
							Esperar Tecla;
						FinSi
				Hasta Que decision_secundaria = "S" O decision_secundaria = "N";
			FinSi
		Hasta Que decision_secundaria = "N";
		
		///FASE 5: MOSTRAR RESULTADOS
		
		Si decision_secundaria = "N" Entonces
			Limpiar Pantalla;
			Escribir "[FACTURA]";
			Escribir "";
			Escribir "Usted ha comprado los siguientes tiquetes.";
			Escribir "Joven: ",tiquetJ;
			Escribir "Adulto: ",tiquetA;
			Escribir "Adulto Mayor: ",tiquetM;
			Escribir "";
			Escribir "Por lo tanto, usted ha reservado...";
			Escribir campos_reservados," asientos.";
			Escribir "";
			Escribir "El monto total a pagar es de...";
			resultado = (tiquetJ*1500) + (tiquetA*2500) + (tiquetM*1500);
			Escribir "₡", resultado;
			Escribir "";
			Escribir "Nota: Solo aceptamos tarjetas Visa y MasterCard.";
			Escribir "";
			Escribir "Presione una tecla para continuar.";
			Esperar Tecla;
			decision_principal = "N";
		FinSi
	FinSi
	
	Si decision_principal = "N" Entonces
		Limpiar Pantalla;
		Escribir "¡Hasta Pronto!";
	FinSi
	
Hasta Que decision_principal = "N" 

FinAlgoritmo


/// F · U · N · C · I · O · N · E · S ///

//EL PROYECTO SOLICITA EXPLICITAMENTE UNA FUNCION QUE INICIALICE LA MATRIZ.
Funcion Inicializa (m1,fila,columna)
	Para fila = 0 Hasta 7 Con Paso 1 Hacer
		Para columna = 0 Hasta 10 Con Paso 1 Hacer
			m1[fila,columna] = "-";
		FinPara
	FinPara
FinFuncion

///FASE 4: PROCESAMIENTO DE DATOS
//FUNCION QUE RECIBE DE PARAMETRO; MATRIZ DE REFERENCIA,REVISA QUE EL CAMPO NO ESTE OCUPADO, Y POSTERIORMENTE LO RESERVA.
Funcion Reservar (m1 Por Referencia,campos_reservados Por Referencia,tiquetJ Por Referencia,tiquetA Por Referencia,tiquetM Por Referencia,decision_secundaria Por Referencia,edad,cordX,cordY_car,cordY_num,campos_disponibles,seleccionar)	
	
	//SI HAY CAMPOS DISPONIBLES, ENTONCES:
	Si campos_disponibles = 1 Entonces
		//LAS INSTRUCCIONES DEL PROYECTO ESPECIFICAN QUE LA CORDENADA (Y) DEBIA SER EN FORMA DE LETRAS, POR LO TANTO ESTA CONVERSION ES NECESARIA.
		Si cordY_car = "A" Entonces cordY_num = 1; FinSi
		Si cordY_car = "B" Entonces cordY_num = 2; FinSi
		Si cordY_car = "C" Entonces cordY_num = 3; FinSi
		Si cordY_car = "D" Entonces cordY_num = 4; FinSi
		Si cordY_car = "E" Entonces cordY_num = 5; FinSi
		Si cordY_car = "F" Entonces cordY_num = 6; FinSi
		Si cordY_car = "G" Entonces cordY_num = 7; FinSi
		//LUEGO SE PROCEDE A "SELECCIONAR" EL ESPACIO ELEGIDO POR EL USUARIO
		seleccionar <- m1[cordY_num,cordX];
		
		//SI SE DETECTA QUE LA SELECCION ES UN ESPACIO YA RESERVADO, SE NOTIFICA AL USUARIO.
		Si seleccionar = "X" Entonces
			Escribir "";
			Escribir "Lo sentimos, este campo ya esta reservado.";
			Esperar Tecla;
			decision_secundaria = "N";
		FinSi
		
		//SI EL ESPACIO SELECCIONADO POR EL USUARIO ESTA DISPONIBLE, ESTE SE RESERVA.
		Si seleccionar = "-" Entonces;
			Escribir "";
			Escribir "Su campo se ha reservado satisfactoriamente.";
			m1[cordY_num,cordX] = "X";
			//SE PROCESAN LOS DATOS PARA EL CALCULO DE COSTOS, INMEDIATAMENTE DESPUES DE HACER LA RESERVACION.
			campos_reservados = campos_reservados + 1;
			Si edad<12 Entonces tiquetJ = tiquetJ + 1; FinSi
			Si edad>=12 Y edad<=65 Entonces tiquetA = tiquetA + 1; FinSi
			Si edad>65 Entonces tiquetM = tiquetM + 1; FinSi
		FinSi
	FinSi
FinFuncion
:- dynamic ubicacion/5,fallas/1,circuito/1,tsr/1,rendimiento/1 .

/*listas */
fallas(["'Alta temperatura'","'Alta tension'","'Nivel aceite bajo'","'Alta Vibracion'","'Presencia armonicos'","'Corto circuito'","'Alto ultrasonido'" ,"'Factor de potencia'", "'Frecuencia'"]).
circuito(["'Circuito electrico'","'Circuito mecanico'","'Calidad de energia'"]).
tsr(["'Bajo'","'Normal'","'Alto'"]).
rendimiento(["'Bajo'","'Medio'","'Alto'"]).

/*ubicacion(fallas,circuito,tsr,rendimiento).*/

ubicacion('Generador',"'Alta temperatura'","'Circuito electrico'","'Bajo'","'Alto'").
ubicacion('Generador',"'Alta temperatura'","'Circuito electrico'","'Bajo'","'Medio'").
ubicacion('Generador',"'Alta temperatura'","'Circuito electrico'","'Alto'","'Alto'").
ubicacion('Generador',"'Alta temperatura'","'Circuito electrico'","'Alto'","'Medio'").

ubicacion('Generador',"'Presencia armonicos'","'Calidad de energia'","'Bajo'","'Alto'").
ubicacion('Generador',"'Presencia armonicos'","'Calidad de energia'","'Bajo'","'Medio'").
ubicacion('Generador',"'Presencia armonicos'","'Calidad de energia'","'Alto'","'Alto'").
ubicacion('Generador',"'Presencia armonicos'","'Calidad de energia'","'Alto'","'Medio'").

ubicacion('Generador',"'Factor de potencia'","'Calidad de energia'","'Bajo'","'Alto'").
ubicacion('Generador',"'Factor de potencia'","'Calidad de energia'","'Bajo'","'Medio'").
ubicacion('Generador',"'Factor de potencia'","'Calidad de energia'","'Alto'","'Alto'").
ubicacion('Generador',"'Factor de potencia'","'Calidad de energia'","'Alto'","'Medio'").

ubicacion('Transformador',"'Alta tension'","'Circuito electrico'","'Bajo'","'Alto'").
ubicacion('Transformador',"'Alta tension'","'Circuito electrico'","'Bajo'","'Medio'").
ubicacion('Transformador',"'Alta tension'","'Circuito electrico'","'Alto'","'Alto'").
ubicacion('Transformador',"'Alta tension'","'Circuito electrico'","'Alto'","'Medio'").

ubicacion('Transformador',"'Corto circuito'","'Circuito electrico'","'Bajo'","'Alto'").
ubicacion('Transformador',"'Corto circuito'","'Circuito electrico'","'Bajo'","'Medio'").
ubicacion('Transformador',"'Corto circuito'","'Circuito electrico'","'Alto'","'Alto'").
ubicacion('Transformador',"'Corto circuito'","'Circuito electrico'","'Alto'","'Medio'").

ubicacion('Transformador',"'Frecuencia'","'Calidad de energia'","'Bajo'","'Alto'").
ubicacion('Transformador',"'Frecuencia'","'Calidad de energia'","'Bajo'","'Medio'").
ubicacion('Transformador',"'Frecuencia'","'Calidad de energia'","'Alto'","'Alto'").
ubicacion('Transformador',"'Frecuencia'","'Calidad de energia'","'Alto'","'Medio'").

ubicacion('Eje',"'Nivel aceite bajo'","'Circuito mecanico'","'Bajo'","'Alto'").
ubicacion('Eje',"'Nivel aceite bajo'","'Circuito mecanico'","'Bajo'","'Medio'").
ubicacion('Eje',"'Nivel aceite bajo'","'Circuito mecanico'","'Alto'","'Alto'").
ubicacion('Eje',"'Nivel aceite bajo'","'Circuito mecanico'","'Alto'","'Medio'").

ubicacion('Eje',"'Alta Vibracion'","'Circuito mecanico'","'Bajo'","'Alto'").
ubicacion('Eje',"'Alta Vibracion'","'Circuito mecanico'","'Bajo'","'Medio'").
ubicacion('Eje',"'Alta Vibracion'","'Circuito mecanico'","'Alto'","'Alto'").
ubicacion('Eje',"'Alta Vibracion'","'Circuito mecanico'","'Alto'","'Medio'").

ubicacion('Eje',"'Alto ultrasonido'","'Circuito mecanico'","'Bajo'","'Alto'").
ubicacion('Eje',"'Alto ultrasonido'","'Circuito mecanico'","'Bajo'","'Medio'").
ubicacion('Eje',"'Alto ultrasonido'","'Circuito mecanico'","'Alto'","'Alto'").
ubicacion('Eje',"'Alto ultrasonido'","'Circuito mecanico'","'Alto'","'Medio'").

/*Empezar sistema*/
start:-
      write('Sistema expero para deteccion de fallas en una turbina eolica tipica'),nl,nl,
      write('Nuestro sistema tratara de identificar la ubicacion de la falla en funcion de los sintomas y el circuito que afecta'),nl,
      menu.

/*Menu principal*/
menu:- 
     nl,nl,
     write('¿Quieres evaluar el rendimiento o identificar una falla? "Selecciona 1, 2 o 3"'),nl,
     write('1- Identificar una falla'),nl,
     write('2- Evaluar el rendimiento'),nl,
     write('3- Salir'),nl,
read(X),
option(X).


/*Menu de opciones*/
option(1):-
         write('¿Que esta fallando? "Selecciona una"'),nl,
         fallas(L),
         (display(L,0);true),
         nl,read(X),
		 checkinput(X,L),
		 nb_getval(checkresult,S),
		 circuito_option(S).


circuito_option(X):-
                  T is X-1,
                  fallas(L),
                  nth0(T,L,Result1),
                  nb_setval(result1,Result1),
                  nb_setval(result1,Result1),
                  write('¿Que circuito esta afectado?"'),nl,
                  circuito(R),
                  (display(R,0);true),
                  read(S), checkinput(S,R),
                  nb_getval(checkresult,A),
                  (A =:= 0 ->( nb_setval(flag,1),end );(tsr_option(A))).


tsr_option(X):-
             N is X-1,
             circuito(R),
             nth0(N,R,Result2),
             nb_setval(result2,Result2),
		     nb_setval(result2,Result2),
             write('¿Cuanto aproximadamente es tu TSR?'),nl,
             write('Bajo: Menor a 5'),nl,
             write('Normal: Entre 5 y 9'),nl,
             write('Alto: Mayor a 9'),nl,
             tsr(A),
             (display(A,0);true),
             read(L),
			 checkinput(L,A),
		     nb_getval(checkresult,S),
      	     (S =:= 0 ->( nb_setval(flag,2),end) ;(rendimiento_lista(S))).


rendimiento_lista(X):-
                    N is X-1,
                    tsr(R),
                    nth0(N,R,Result3),
                    nb_setval(result3,Result3),
                    nb_setval(result3,Result3),
                    write('¿En cuanto aproximadamente a bajado el rendimiento?, en porcentaje'),nl,
                    write('Bajo: Menor a 15%'),nl,
                    write('Medio: Entre 15% y 30%'),nl,
                    write('Alto: Mayor a 30%'),nl,
                    rendimiento(A),
                    (display(A,0);true),
                    read(L),
                    checkinput(L,A),
                    nb_getval(checkresult,O),
                    ( O =:= 0 ->( nb_setval(flag,3),end );(rendimiento(O))).


rendimiento(X):-
              U is X-1,
              rendimiento(P),
              nth0(U,P,Result4),
			  nb_setval(flag,4),
              nb_setval(result4,Result4),
              nb_setval(result4,Result4),
			  ubicacion_falla.


ubicacion_falla:- 
                nb_getval(result1,Result1),
                nb_getval(result2,Result2),
                nb_getval(result3,Result3),
                nb_getval(result4,Result4),
                write('Basado en tus resultados'),nl,
                write('Sintoma mas fuerte: ') ,write(Result1),nl,
                write('Circuito: ') ,write(Result2),nl,
                write('TSR: ') ,write(Result3),nl,
                write('Bajada de rendimiento en porcentaje: ') ,write(Result4),nl,
                write('La ubicacion de la falla puede ser: ') ,
                nb_getval(result2,Result2new),
                nb_getval(result3,Result3new),
                nb_getval(result4,Result4new),
                nl, (printFinalResult(Result1,Result2new,Result3new,Result4new);true),
                nl,nl, write('Si el resultado es vacio, significa que no tenemos registradas fallas con esas caracteristicas').



printFinalResult(Result1,Result2,Result3,Result4):-
                                                  nl,
												  ubicacion(J,Result1,Result2,Result3,Result4),
                                                  nl,
												  write(J),
                                                  display(J).


option(2):-
         nl,   
         write('El rendimiento se evalua a partir del Tip Speed Ratio'), nl,
         averagelist([5,6,7,8,7]).


averagelist(List):- 
                  write('El tip speed ratio promedio de las ultimas 5 horas es: '),
                  length(List, N), sumlist(List, Sum), 
                  Avg is Sum / N,
                  write(Avg), nl,
                  velocidad_viento(Avg).


velocidad_viento(Avg):-
                   nl,
                   write('Digita la velocidad del viento'),nl,
                   read(S),
                   velocidad_pala(S, Avg).


velocidad_pala(X, Avg):-
                  nl,
                  write('Digita la velocidad de la pala'),nl,
                  read(S),
                  rendimiento_turbina(S, X, Avg).


rendimiento_turbina(Vp, Vv, Avg):-
                                  nl,
                                  X is Vp / Vv,
                                  write('El tip speed ratio es: '),
                                  write(X), nl,
                                  comparacion1(Avg, X).


comparacion1(Avg, X):-
                     nl,
                     A is Avg * 1.2,
                     X > A -> write('El tip speed ratio esta un 20% por encima del promedio (7.92), te recomendamos revisar una falla'), menu; write(''),
                     comparacion2(Avg, X).


comparacion2(Avg, X):-
                  B is Avg * 0.8,
                  X < B -> write('El tip speed ratio esta un 20% por debajo del promedio (5.28), te recomendamos revisar una falla'), menu; 
                  write('El Tip Speed Ratio y la produccion de energia esta correcta'),
                  menu.


option(3):-
         write('Gracias por usar nuestro sistema').


/*Función para mostrar todas las opciones de una lista*/
display([]).
display([H|T],A):-  
                  M is A+1,
                  write(M),
                  write('- '),
                  write(H),
			      nl,
                  write(' '),
                  display(T,M).


/*Validar los datos de entrada*/
checkinput(A,L):-
         length(L,Len),
		 ( A>Len ->(write('Por favor digita un valor valido: '),read(D),checkinput(D,L) ) ; (nb_setval(checkresult,A),nl) ).


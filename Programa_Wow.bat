:: Aquí comienza el programa Batch. El mensaje de bienvenida.
@echo off
title Herramientas utiles
mode 38, 10
color 04
echo.:::::::::::::::::::::::::::::::::::::
echo.:                                   :
echo : Bienvenido a herramientas magicas :
echo.:                                   :
echo.:::::::::::::::::::::::::::::::::::::
echo.
echo.
echo.-----------------------------
echo Pulse enter para descubrirlas
pause>nul
goto menu

:: Aquí se encuentra el menú de opciones, fundamental para el programa.
:menu
title Menu de opciones
mode 50, 14
color 17
echo.***********************************
echo.
echo 1. Creador de carpetas.
echo 2. Copiador de carpetas
echo 3. Renombrador de carpetas.
echo 4. Movedor de carpetas.
echo 5. Eliminador de carpetas.
echo 6. Ver contenido de la carpeta.
echo 7. Creador de notas.
echo 8. Salir.
echo.
echo.***********************************

:: En este apartado declaramos las variables, parte indispensable del programa.
set /p opcion=Elige una opcion:
call :validarEntrada
if %opcion%==1 goto crcarpeta
if %opcion%==2 goto cocarpeta
if %opcion%==3 goto recarpeta
if %opcion%==4 goto mocarpeta
if %opcion%==5 goto elcarpeta
if %opcion%==6 goto vecarpeta
if %opcion%==7 goto crnotas
if %opcion%==8 goto salir

:error
cls
color 04
echo Opcion no valida. Intentalo de nuevo.
timeout /t 2 >nul
goto menu

rem Código para la creación de carpetas.
:crcarpeta
title Creador de carpetas
color 0f
mode 54, 18
set /p ruta=Ingrese la ruta absoluta donde desea crear la carpeta:
set /p nombre=Ingrese el nombre de la carpeta:
cd "%ruta%"
mkdir %nombre%
cls
echo Directorio creado exitosamente.
echo.
echo Pulse enter para seguir apreciando...
pause>nul
goto menu

rem Código para realizar copias de carpetas y archivos.
:cocarpeta
title Copiador de carpetas
color 80
mode 48, 18
set /p copiar=Ingrese la ruta de la carpeta que desea copiar:
set /p destino=Ingrese la ruta del destino:
set "nombre_carpeta=%copiar%"
for %%a in ("%copiar%") do set "nombre_carpeta=%%~nxa"
mkdir "%destino%\%nombre_carpeta%"
xcopy "%copiar%" "%destino%\%nombre_carpeta%" /E /I
cls
echo Carpeta copiada exitosamente.
echo.
echo Pulsa y sigue adelante...
pause>nul
goto menu

rem Código para renombrar (Cambiar el nombre de una carpeta).
:recarpeta
title Renombrador de carpetas
color 80
mode 50, 18
set /p direccion=Ingrese la ruta donde se encuentra la carpeta:
set /p actual=Ingrese el nombre actual de su carpeta:
set /p renombrar=Ingrese el nuevo nombre de la carpeta:
cd "%direccion%"
ren "%actual%" "%renombrar%"
cls
echo Carpeta renombrada exitosamente.
echo.
echo Da enter y deja fluir la magia...
pause>nul
goto menu

rem Código para mover carpetas.
:mocarpeta
title Movedor de carpetas y archivos
color 3f
mode 43, 18
set /p move=Ingrese la ruta de la carpeta o el archivo:
set /p lugar=Ingrese la ruta donde desea moverlo:
move "%move%" "%lugar%"
cls
echo Carpeta movida exitosamente.
echo.
echo Da enter para continuar...
pause>nul
goto menu

rem Código para eliminar las carpetas.
:elcarpeta
title Eliminador de carpetas
color 9d
mode 49, 18
set /p eliminar=Ingresa la ruta de la carpeta que desea eliminar:
rmdir "%eliminar%" /S
cls
echo Carpeta eliminada exitosamente.
echo.
echo Continua...
pause>nul
goto menu

rem Código para visualizar el contenido de las carpetas.
:vecarpeta
title Visualizador de informacion de carpetas
color 7e
mode 90, 30
set /p ver=Ingrese la ruta de la carpeta para visualizarla:
dir "%ver%"
echo.
echo Wow, tienes mucha informacion.
echo.
echo Vamos, se que te esta gustando...
pause>nul
goto menu

rem Código para la creación de notas o archivos de texto plano.
:crnotas
title Creador de notas
color 02
mode 50, 18
set /p contenido=Escribe el contenido de la nota:
set /p name=Escribe el nombre de la nota:
set /p rutal=¿Donde deseas guardarla?:
cd "%USERPROFILE%\%rutal%"
echo %contenido% > %name%.txt
cls
echo Nota creada estupendamente.
echo.
echo Este programa es una locura, continua...
pause>nul
goto menu

:validarEntrada
if not defined opcion goto error
if "%opcion%"=="" goto error
if "%opcion%"==" " goto error
exit /b

rem salir del programa Batch
:salir
exit
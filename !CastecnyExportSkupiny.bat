@echo off
IF "%~1"=="" (
    echo Nebyl uveden soubor ze kter�ho se m� exportovat!
    goto :exit
)
For %%A in ("%~1") do (
    set Folder=%%~dpA
    set Name=%%~nxA
)
set /p "gId=Zadejte ��slo skupin(y) pro ��ste�n� export (<id1>[,<id2>,...]): "
echo ��ste�n� export skupin(y) vlak� "%gId%" ze souboru "%~1"...

"%~dp0/CleanUp.exe" "%~1" -v="%Folder%castecny_export.xml" -g=%gId% -z -k -s -o -a -m -e
echo:

IF %ERRORLEVEL% == 0 (
    echo Export dat do souboru %Folder%castecny_export.xml prob�hl v po��dku!
) ELSE (
    echo Export dat selhal!
)

:exit
    set /p "=Aplikaci ukon��te stiskem libovoln� kl�vesy..."
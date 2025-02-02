@echo off
IF "%~1"=="" (
    echo Nebyl uveden soubor ze kter‚ho se m  exportovat!
    goto :exit
)
For %%A in ("%~1") do (
    set Folder=%%~dpA
    set Name=%%~nxA
)
set /p "gId=Zadejte Ÿ¡slo skupin(y) pro Ÿ steŸnì export (<id1>[,<id2>,...]): "
echo ¬ steŸnì export skupin(y) vlak… "%gId%" ze souboru "%~1"...

"%~dp0/CleanUp.exe" "%~1" -v="%Folder%castecny_export.xml" -g=%gId% -z -k -s -o -a -m -e
echo:

IF %ERRORLEVEL% == 0 (
    echo Export dat do souboru %Folder%castecny_export.xml probØhl v poý dku!
) ELSE (
    echo Export dat selhal!
)

:exit
    set /p "=Aplikaci ukonŸ¡te stiskem libovoln‚ kl vesy..."
rem all files lowercase:
rem @echo off
cd content

call :treeProcess
goto :startserver

:treeProcess
rem Do whatever you want here over the files of this subdir, for example:
for /f "Tokens=*" %%f in ('dir /l/b/a-d') do (rename "%%f" "%%f")
for /D %%d in (*) do (
    cd %%d
    call :treeProcess
    cd ..
)
exit /b

:startserver
cd ..
start hugo server -p 13313
start chrome.exe http://localhost:13313

rem fuer check am smartphone:
rem start "" cmd /k hugo server  --bind=192.168.0.150 --baseURL=http://pc-cube:1313
rem start chrome.exe http://pc-cube:13313
rem cd C:\Users\manue\Desktop\ggweb
rmdir public /s /q

hugo --minify

@echo off

"C:\Program Files (x86)\WinSCP\WinSCP.com" ^
  /log="WinSCP.log" /ini=nul ^
  /command ^
  "open ftp://baeuerl_at_web:JfHz664G6f7522k793bc74kjhggDLOfIK64567mhguj@213.145.224.90/" ^
  "synchronize remote public /" ^
   "exit"

set WINSCP_RESULT=%ERRORLEVEL%
if %WINSCP_RESULT% equ 0 (
  echo Success
  start https://baeuerl.at
) else (
  echo Error
)

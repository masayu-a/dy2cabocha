@echo off
for %%i in (*.cabocha) do (
   echo ファイル名：%%i
   "c:\Program Files (x86)\CaboCha\bin\cabocha.exe" -I2 -O4 -f1 %%i > ..\\cabocha2\\%%i
)

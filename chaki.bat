@echo off
for %%i in (*.cabocha) do (
   echo ファイル名：%%i
   "c:\Program Files\NAIST\ChaKi.NET\CreateCorpusSLA.exe" -e=UTF-8 -C %%i %%~ni.db
)

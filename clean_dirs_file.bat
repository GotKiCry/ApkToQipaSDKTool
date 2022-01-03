@echo off
echo -----------------------------------------------------
echo    清理环境
echo -----------------------------------------------------

echo 清理 .\work_dex
rd /q /s .\work_dex\
echo 清理 .\work_jar
rd /q /s .\work_jar\
echo 清理 .\out
rd /q /s .\out\
echo 清理 .\app-debug
rd /q /s .\app-debug\

mkdir work_dex
mkdir work_jar
mkdir out

echo -----------------------------------------------------
echo    Done!
echo -----------------------------------------------------
cmd /k
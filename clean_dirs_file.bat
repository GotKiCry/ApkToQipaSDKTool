@echo off
echo -----------------------------------------------------
echo    ������
echo -----------------------------------------------------

echo ���� .\work_dex
rd /q /s .\work_dex\
echo ���� .\work_jar
rd /q /s .\work_jar\
echo ���� .\out
rd /q /s .\out\
echo ���� .\app-debug
rd /q /s .\app-debug\

mkdir work_dex
mkdir work_jar
mkdir out

echo -----------------------------------------------------
echo    Done!
echo -----------------------------------------------------
cmd /k
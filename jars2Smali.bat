@echo off
if d8 == null (
echo -----------------------------------------------------
echo   请先提前配置d8到系统环境，在sdk\build-tool\31.0.0\
echo -----------------------------------------------------
pause > nul
)

if exist .\work_jar\*.jar (

echo -----------------------------------------------------
echo   jar 编译为 dex
echo -----------------------------------------------------

title jar包反编译
call d8 --output .\work_dex\ --min-api 19 .\work_jar\*.jar

echo -----------------------------------------------------
echo    dex 编译为 smali
echo -----------------------------------------------------

call java -jar .\tool_jar\baksmali.jar disassemble .\work_dex\classes.dex -o .\out\smali\
echo -----------------------------------------------------
echo    删除com.qipa文件
echo -----------------------------------------------------

rd /q /s .\out\smali\com\qipa\
echo 已完成  输出目录 smali_out

) else (
echo 找不到jar文件
)
cmd /k
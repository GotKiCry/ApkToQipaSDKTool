@echo off
if d8 == null (
echo -----------------------------------------------------
echo   ������ǰ����d8��ϵͳ��������sdk\build-tool\31.0.0\
echo -----------------------------------------------------
pause > nul
)

if exist .\work_jar\*.jar (

echo -----------------------------------------------------
echo   jar ����Ϊ dex
echo -----------------------------------------------------

title jar��������
call d8 --output .\work_dex\ --min-api 19 .\work_jar\*.jar

echo -----------------------------------------------------
echo    dex ����Ϊ smali
echo -----------------------------------------------------

call java -jar .\tool_jar\baksmali.jar disassemble .\work_dex\classes.dex -o .\out\smali\
echo -----------------------------------------------------
echo    ɾ��com.qipa�ļ�
echo -----------------------------------------------------

rd /q /s .\out\smali\com\qipa\
echo �����  ���Ŀ¼ smali_out

) else (
echo �Ҳ���jar�ļ�
)
cmd /k
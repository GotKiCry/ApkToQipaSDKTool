@echo off
title Dex To Smali

if exist .\work_dex\classes.dex (
	echo -----------------------------------------------------
	echo    classes.dex ����Ϊ smali
	echo -----------------------------------------------------

	call java -jar .\tool_jar\baksmali.jar disassemble .\work_dex\classes.dex -o .\out\smali
	echo -----------------------------------------------------
	echo    ɾ��com.qipa�ļ�
	echo -----------------------------------------------------

	rd /q /s .\out\smali\com\qipa\
	echo �����  ���Ŀ¼ smali_out
) else (
	echo  δ�ҵ�dex�ļ�
)

cmd /k
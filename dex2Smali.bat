@echo off
title Dex To Smali

if exist .\work_dex\classes.dex (
	echo -----------------------------------------------------
	echo    classes.dex 编译为 smali
	echo -----------------------------------------------------

	call java -jar .\tool_jar\baksmali.jar disassemble .\work_dex\classes.dex -o .\out\smali
	echo -----------------------------------------------------
	echo    删除com.qipa文件
	echo -----------------------------------------------------

	rd /q /s .\out\smali\com\qipa\
	echo 已完成  输出目录 smali_out
) else (
	echo  未找到dex文件
)

cmd /k
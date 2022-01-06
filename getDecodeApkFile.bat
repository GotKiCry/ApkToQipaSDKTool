@echo off

set SUPER_SDK=E:\_WorkCode\supersdkchannelas

@REM echo -----------------------------------------------------
@REM echo    提取dex文件
@REM echo -----------------------------------------------------

@REM echo 复制mergeExtDexDebug\classes.dex
@REM copy %SUPER_SDK%\app\build\intermediates\dex\debug\mergeExtDexDebug\classes.dex .\work_dex
@REM echo 复制mergeExtDexDebug\out\classes.dex
@REM copy %SUPER_SDK%\app\build\intermediates\dex\debug\mergeExtDexDebug\out\classes.dex .\work_dex

@REM if exist .\work_dex\classes.dex (
@REM 	echo -----------------------------------------------------
@REM 	echo    classes.dex 编译为 smali
@REM 	echo -----------------------------------------------------

@REM 	call java -jar .\tool_jar\baksmali.jar disassemble .\work_dex\classes.dex -o .\out\smali\
@REM 	echo -----------------------------------------------------
@REM 	echo    删除com.qipa文件
@REM 	echo -----------------------------------------------------

@REM 	rd /q /s .\out\smali\com\qipa\
@REM 	echo 已完成  输出目录 smali_out
@REM ) else (
@REM 	echo  未找到dex文件,请设置SUPER_SDK、APK_TOOL或检查是否编译APK
@REM     cmd /k
@REM )

echo -----------------------------------------------------
echo    提取apk文件
echo -----------------------------------------------------


java -jar .\tool_jar\apktool.jar d %SUPER_SDK%\app\build\outputs\apk\debug\app-debug.apk --only-main-classes

echo 整合文件...

echo assets
@REM mkdir .\out\assets\
xcopy /H /F /S /Y .\app-debug\assets\ .\out\assets\
echo lib...
@REM mkdir .\out\lib\
xcopy /H /F /S /Y .\app-debug\lib\ .\out\lib\
echo res...
@REM mkdir .\out\res\
xcopy /H /F /S /Y .\app-debug\res\ .\out\res\

echo smali...
@REM mkdir .\out\smali\com\supersdk\
xcopy /H /F /S /Y .\app-debug\smali\ .\out\smali\

rd /q /s .\out\smali\com\supersdk\
rd /q /s .\out\smali\com\qipa\

xcopy /H /F /S /Y .\app-debug\smali_classes3\com\supersdk\ .\out\smali\com\supersdk\
@REM xcopy /H /F /S /Y .\app-debug\smali_classes2\ .\out\smali\


echo -----------------------------------------------------
echo    清理app-debug资源中...
echo -----------------------------------------------------


echo 清理 asstes
del .\out\assets\gm_version.txt

echo 清理 drawable
del .\out\res\drawable\toast_style.xml
del .\out\res\drawable\warn_style.xml

echo 清理 drawable
del .\out\res\drawable-hdpi\bg.png
del .\out\res\drawable-hdpi\ic_launcher.png
del .\out\res\drawable-hdpi\login_close.png
del .\out\res\drawable-hdpi\sdk_notice_bg.png
del .\out\res\drawable-hdpi\sdk_notice_bg_port.png
del .\out\res\drawable-hdpi\sdk_notice_close_bg.png
del .\out\res\drawable-hdpi\super_notice_bg.png
del .\out\res\drawable-hdpi\super_notice_button.png
del .\out\res\drawable-hdpi\toast_warn.png

echo 清理 drawable-xhdpi
del .\out\res\drawable-xhdpi\sdk_notice_title_bg.png
del .\out\res\drawable-xhdpi\super_float_dark.png
del .\out\res\drawable-xhdpi\super_float_dark_left.png
del .\out\res\drawable-xhdpi\super_float_dark_right.png
del .\out\res\drawable-xhdpi\super_float_light.png
del .\out\res\drawable-xhdpi\super_menu_check.png
del .\out\res\drawable-xhdpi\super_menu_exit.png
del .\out\res\drawable-xhdpi\super_menu_logout.png
del .\out\res\drawable-xhdpi\super_menu_role.png
del .\out\res\drawable-xhdpi\super_sdk_age_8.png
del .\out\res\drawable-xhdpi\super_sdk_age_12.png
del .\out\res\drawable-xhdpi\super_sdk_age_16.png

echo 清理 layout
del .\out\res\layout\activity_main.xml
del .\out\res\layout\super_float_dialog.xml
del .\out\res\layout\super_float_left.xml
del .\out\res\layout\super_float_right.xml
del .\out\res\layout\super_login.xml
del .\out\res\layout\super_menu_check.xml
del .\out\res\layout\super_menu_logout.xml
del .\out\res\layout\super_menu_role.xml
del .\out\res\layout\super_menu_share.xml
del .\out\res\layout\super_notice_dialog.xml
del .\out\res\layout\super_toast.xml
del .\out\res\layout\super_user_privacy_dialog.xml
del .\out\res\layout\super_warn_dialog.xml
del .\out\res\layout\view_float_util.xml

echo 清理 layout-land and layout-port
del .\out\res\layout-land\super_notice_new_dialog.xml
del .\out\res\layout-port\super_notice_new_dialog.xml

del .\out\res\values\public.xml
cmd /k
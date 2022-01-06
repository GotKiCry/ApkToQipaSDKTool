@echo off

set SUPER_SDK=E:\_WorkCode\supersdkchannelas

@REM echo -----------------------------------------------------
@REM echo    ��ȡdex�ļ�
@REM echo -----------------------------------------------------

@REM echo ����mergeExtDexDebug\classes.dex
@REM copy %SUPER_SDK%\app\build\intermediates\dex\debug\mergeExtDexDebug\classes.dex .\work_dex
@REM echo ����mergeExtDexDebug\out\classes.dex
@REM copy %SUPER_SDK%\app\build\intermediates\dex\debug\mergeExtDexDebug\out\classes.dex .\work_dex

@REM if exist .\work_dex\classes.dex (
@REM 	echo -----------------------------------------------------
@REM 	echo    classes.dex ����Ϊ smali
@REM 	echo -----------------------------------------------------

@REM 	call java -jar .\tool_jar\baksmali.jar disassemble .\work_dex\classes.dex -o .\out\smali\
@REM 	echo -----------------------------------------------------
@REM 	echo    ɾ��com.qipa�ļ�
@REM 	echo -----------------------------------------------------

@REM 	rd /q /s .\out\smali\com\qipa\
@REM 	echo �����  ���Ŀ¼ smali_out
@REM ) else (
@REM 	echo  δ�ҵ�dex�ļ�,������SUPER_SDK��APK_TOOL�����Ƿ����APK
@REM     cmd /k
@REM )

echo -----------------------------------------------------
echo    ��ȡapk�ļ�
echo -----------------------------------------------------


java -jar .\tool_jar\apktool.jar d %SUPER_SDK%\app\build\outputs\apk\debug\app-debug.apk --only-main-classes

echo �����ļ�...

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
echo    ����app-debug��Դ��...
echo -----------------------------------------------------


echo ���� asstes
del .\out\assets\gm_version.txt

echo ���� drawable
del .\out\res\drawable\toast_style.xml
del .\out\res\drawable\warn_style.xml

echo ���� drawable
del .\out\res\drawable-hdpi\bg.png
del .\out\res\drawable-hdpi\ic_launcher.png
del .\out\res\drawable-hdpi\login_close.png
del .\out\res\drawable-hdpi\sdk_notice_bg.png
del .\out\res\drawable-hdpi\sdk_notice_bg_port.png
del .\out\res\drawable-hdpi\sdk_notice_close_bg.png
del .\out\res\drawable-hdpi\super_notice_bg.png
del .\out\res\drawable-hdpi\super_notice_button.png
del .\out\res\drawable-hdpi\toast_warn.png

echo ���� drawable-xhdpi
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

echo ���� layout
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

echo ���� layout-land and layout-port
del .\out\res\layout-land\super_notice_new_dialog.xml
del .\out\res\layout-port\super_notice_new_dialog.xml

del .\out\res\values\public.xml
cmd /k
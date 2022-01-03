# ApkToQipaSDKTool
简单的利用APKTool转换资源为奇葩打包工具的SDK资源
## 注意事项
### getDecodeApkFile
1.请注意APK中生成的Dex文件数量是否为5，超过5个请自己分析文件构成
2.指定APK位置
### jars2Smali
1.请指定d8位置，一般在大于31的sdk文件内
2.会自动删除com\qipa\目录
### clean_dirs_file
默认清理app-debug out work_dex work_jar文件夹 新建out work_dex work_jar文件夹

##引用资源
apktool Version 2.6.0
baksmali Version 2.5.2

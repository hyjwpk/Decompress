@echo off
setlocal enabledelayedexpansion

echo 即将清空File文件夹
pause
rd /s/q File
md File
echo File文件夹已清空

%此处名称不能为path%
set /p route=将压缩文件拖入窗口或手动填写路径: 

for /f %%i in (dictionary.txt) do (
cls
7z.exe x %route% -p%%i -y -oFile
echo 已经尝试密码 %%i

%读取File文件夹的大小判断是否解压成功%
for /f "tokens=3*" %%a in ('dir/s "File"^|findstr /c:"个文件"') do (set size=%%a)
echo "!size!" | findstr "," &&(
cls
echo 密码正确,密码为 %%i
pause
exit) || (echo 密码错误)
)

cls
echo 未找到正确密码或文件小于1,000字节
pause
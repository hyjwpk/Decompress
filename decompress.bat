@echo off
setlocal enabledelayedexpansion

echo �������File�ļ���
pause
rd /s/q File
md File
echo File�ļ��������

%�˴����Ʋ���Ϊpath%
set /p route=��ѹ���ļ����봰�ڻ��ֶ���д·��: 

for /f %%i in (dictionary.txt) do (
cls
7z.exe x %route% -p%%i -y -oFile
echo �Ѿ��������� %%i

%��ȡFile�ļ��еĴ�С�ж��Ƿ��ѹ�ɹ�%
for /f "tokens=3*" %%a in ('dir/s "File"^|findstr /c:"���ļ�"') do (set size=%%a)
echo "!size!" | findstr "," &&(
cls
echo �������Ϊ %%i
echo ����File�в鿴��ѹ�����ļ������ļ���ȷ��ֱ�ӹرձ����ڣ��������������
pause
) || (echo �������)
)

cls
echo δ�ҵ���ȷ������ļ�С��1,000�ֽ�
pause
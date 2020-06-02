cd AfLogStdio
rm -rf *
cp C:\Users\wenbinw\workspace\code\C++\QT\build-AfLogStdio-Desktop_Qt_5_8_0_MSVC2013_64bit-Release\release\AfLogStdio.exe ./
C:\Qt\Qt5.8.0\5.8\msvc2013_64\bin\windeployqt.exe AfLogStdio.exe
cp C:\Qt\Qt5.8.0\5.8\msvc2013_64\bin\qwt.dll ./
cp C:\Windows\System32\msvcr120.dll ./
cp C:\Windows\System32\msvcp120.dll ./
cp C:\Qt\Qt5.8.0\5.8\msvc2013_64\bin\Qt5PrintSupport.dll ./
cp C:\Qt\Qt5.8.0\5.8\msvc2013_64\bin\Qt5OpenGL.dll ./
cd ..

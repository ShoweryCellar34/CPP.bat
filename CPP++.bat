@echo off

echo Use in command line
echo Make sure to have python installed
echo File use: %~nx0 name
echo the 'name' variable is the name of the project
pause

:settings
if [%1]==[] (set /P name="What should the project name be? ") else (set name=%1)
echo Project name set to: %name%


if [%2]==[] (set /P venv="type '-v' to use python virtual enviroment (venv) anything else to not: ") else (set %venv%=%2)
if "%venv%"=="-v" echo Virtual enviroment will be used.
if "%venv%"=="" echo Virtual enviroment will not be used.


if [%3]==[] (set /P packages="What python packages do you want installed (example: p1 p2 p3)? ") else (set packages=%3)
echo Packages to install: %packages%


:templatesfolder
if [%4]==[] (set /P templatesfolder="Type 'Y' to create a Templates folder for html files or 'N' to not create a templates folder: ") else (set templatesfolder=%4
goto indexhtml)


if "%templatesfolder%"=="Y" (set templatesfolder=1
echo A Templates folder will be created)
if "%templatesfolder%"=="y" (set templatesfolder=1
echo a Templates folder will be created)

if "%templatesfolder%"=="N" (set templatesfolder=
echo a Templates folder will not be created)
if "%templatesfolder%"=="n" (echo a Templates folder will not be created) else (goto templatesfolder)


:indexhtml
if [%5]==[] (set /P indexhtml="Type 'Y' to create index.html or 'N' to not create index.html: ") else (set indexhtml=%5
goto apppy)


if "%indexhtml%"=="Y" (set indexhtml=1
echo index.html will be created)
if "%indexhtml%"=="y" (set indexhtml=1
echo index.html will be created)

if "%indexhtml%"=="N" (set indexhtml=
echo index.html will not be created)
if "%indexhtml%"=="n" (echo index.html will not be created) else (goto indexhtml)


:apppy
if [%6]==[] (set /P apppy="Type 'Y' to create app.py or 'N' to not create index.html: ") else (set apppy==%6
goto confirm)


if "%apppy%"=="Y" (set apppy=1
echo app.py will be created)
if "%apppy%"=="y" (set apppy=1
echo app.py will be created)

if "%apppy%"=="N" (set apppy=
echo app.py will not be created)
if "%apppy%"=="n" (echo app.py will not be created) else (goto apppy)



:confirm
set /P settings="Type 'Y' to confirm settings or 'N' to redo settings: "

if "%settings%"=="Y" (goto continue)
if "%settings%"=="y" (goto continue)

if "%settings%"=="N" (goto settings)
if "%settings%"=="n" (goto settings) else (goto confirm)



:continue
if not exist %name%\ mkdir %name%

cd %name%

if "%venv%"=="-v" (python -m venv venv)

if "%venv%=="-v" (pip install --target=venv\Lib\site-packages\ %packages%) else (pip install %packages%)

If %indexhtml%==1 (if "%venv%"=="-v" (cd \venv\Scripts\
if templatesfolder==1 (mkdir Templates)
if templatesfolder==1 (cd \Templates\)
echo <!--index.html-->>index.html) else (if templatesfolder==1 (mkdir Templates)
if templatesfolder==1 (cd Templates)
echo <!--index.html-->>index.html)



If %apppy%==1 (if "%venv%"=="-v" (cd \venv\Scripts\
echo #app.py>app.py) else (echo #app.py>app.py)



cd..

echo You can now close this window.
pause

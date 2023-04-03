@echo off

color 0a
title User and Folder Management Utility
:home
cls
echo ------------------------------------
echo User and Folder Management Utility
echo ------------------------------------
echo 1) Add User
echo 2) Make Folder
echo 3) Delete Folder
echo 4) Delete User
echo 5) Make Text File
echo 6) Delete Text File
echo 7) Turn ON/OFF Windows Defender
echo 8) Delete VBS File
echo 9) Set password for Password Manager
echo 10) Open Password Manager     
echo i) Info
echo Q) Quit
set /p input= Enter Option:

if %input%==1 goto user
if %input%==2 goto folder
if %input%==3 goto delfolder
if %input%==4 goto deluser
if %input%==5 goto make
if %input%==6 goto deltext
if %input%==7 goto defender
if %input%==8 goto delvbs
if %input%==9 goto passlistset
if %input%==10 goto passlist
if %input%==i goto info 
if %input%==Q exit


:info
title Information
cls
echo -------------------------
echo Made By Niels Coert
echo -------------------------
echo How To Use
echo 1) Dutch
echo 2) English
set /p input= ENG/NL:
if %input%==1 goto dutch
if %input%==2 goto eng


:eng
cls
cd "%userprofile%/Desktop"
echo    Open the Command Prompt window on your computer. >> Manual.txt
echo    Navigate to the directory where the program is stored using the cd command. For example, type "cd C:\Users\YourUsername\Desktop" to navigate to the desktop folder. >> Manual.txt
echo   Type "programname.bat" and press Enter to start the program. >> Manual.txt
echo    You will now see a list of six options to choose from. >> Manual.txt
echo    Type the number of the desired option and press Enter. >> Manual.txt
echo    Depending on the chosen option, you may be prompted to enter information, such as the name of the user or the name of the directory you want to create. >> Manual.txt
echo    Type the requested information and press Enter to continue. >> Manual.txt
echo    After completing the selected task, you will be returned to the main menu. >> Manual.txt
echo    You can now select a new option or exit the program by typing the "exit" command and pressing Enter. >> Manual.txt
goto ready




:dutch
cls
cd "%userprofile%/Desktop"
echo Open het Command Prompt-venster op je computer >> Handleiding.txt
echo    Navigeer naar de map waarin het programma is opgeslagen met het cd-commando, bijvoorbeeld: cd [C:\Users\JouwGebruikersnaam\Desktop] >> Handleiding.txt
echo   Typ "programmanaam.bat" en druk op Enter om het programma te starten >> Handleiding.txt
echo    Je ziet nu een lijst met zes opties om uit te kiezen >> Handleiding.txt
echo    Typ het nummer van de gewenste optie en druk op Enter >> Handleiding.txt
echo    Afhankelijk van de gekozen optie, word je gevraagd om informatie in te voeren, zoals de naam van de gebruiker of de naam van de map die je wilt maken >> Handleiding.txt 
echo    Na het voltooien van de geselecteerde taak, word je teruggeleid naar het hoofdmenu >> Handleiding.txt
echo    Je kunt nu een nieuwe optie selecteren of het programma afsluiten door de opdracht "exit" in te typen en op Enter te drukken. >> Handleiding.txt
goto ready



:ready
cls
echo Look At Your Desktop You See a Text File with Explanation!
pause
goto home



:user
title Make User
cls
echo -----------------------------
echo Make User
echo -----------------------------
set /p name= Enter Name:
set /p pass= Enter Password: 
net user %name% %pass% /add
goto home


:folder
title Make Folder
cls
echo -----------------------------
echo Make Folder
echo -----------------------------
set /p foldername= Enter FolderName:
mkdir "%userprofile%/Desktop/%foldername%"
goto home



:make
title Make Text File
cls
echo -------------------------
echo Make Text File
echo -------------------------
set /p index= Type Text:
set /p name= Enter Name:
set /p folder_name= Enter FolderName:
cd "%userprofile%/Desktop/%folder_name%"
echo %index% >> %name%.txt
goto home



:deltext
title Delete Text File
cls
echo -------------------------
echo Delete Text File
echo -------------------------
set /p name= Enter Name:
set /p folder_name= Enter FolderName:
set /p confirm= Do You Want to Delete %name% [Y,N]:
if %confirm%==Y goto deleteT
if %confirm%==N goto home

:deleteT
title Delete Text File
cls
echo -------------------------
echo Delete Text File
echo -------------------------
cd "%userprofile%/Desktop/%folder_name%"
del %name%.txt

goto home


:delfolder 
title Delete Folder
cls
echo -----------------------------
echo Delete Folder
echo -----------------------------
set /p foldername= Enter FolderName:
set /p confirm= Do you want to delete %foldername% [Y,N]:
if %confirm%==Y goto deletef
if %confirm%==N goto home

:deletef
title Delete Folder
cls
rmdir "%userprofile%/Desktop/%foldername%"
goto home

:deluser
title Delete User
cls
echo -----------------------------
echo Delete User
echo -----------------------------
set /p name= Enter Name:
set /p confirm= Do you want to delete %name% [Y,N]:
if %confirm%==Y goto deleteu
if %confirm%==N goto home
goto home


:deleteu
cls
net user %name% /delete
goto home


:defender
title Windows Defender
cls   
echo --------------------------
echo Windows Defender
echo --------------------------
echo.
echo Enter the location name where you saved this file!
echo.
set /p folder= Enter Folder Name:
echo Press enter (and you accept the terms)
pause
cd "%userprofile%/Desktop/%folder%"
echo Set x = WScript.CreateObject("WScript.Shell") >> disable.vbs 
wscript.sleep 5000  
echo x.sendkeys "^{esc}" >> disable.vbs
echo wscript.sleep 500 >> disable.vbs
echo x.sendkeys "windows-" >> disable.vbs
echo wscript.sleep 1000 >> disable.vbs
echo x.sendkeys "{ENTER}" >> disable.vbs
echo wscript.sleep 3000 >> disable.vbs
echo x.sendkeys "{ENTER}" >> disable.vbs
echo wscript.sleep 3000 >> disable.vbs
echo x.sendkeys "{down}" >> disable.vbs
echo wscript.sleep 1000 >> disable.vbs
echo x.sendkeys "{down}" >> disable.vbs
echo wscript.sleep 1000 >> disable.vbs
echo x.sendkeys "{down}" >> disable.vbs
echo wscript.sleep 1000 >> disable.vbs
echo x.sendkeys "{down}" >> disable.vbs
echo wscript.sleep 1000 >> disable.vbs
echo x.sendkeys "{down}" >> disable.vbs
echo wscript.sleep 1000 >> disable.vbs
echo x.sendkeys "{enter}" >> disable.vbs
echo wscript.sleep 1000 >> disable.vbs
echo x.sendkeys " " >> disable.vbs
echo x=msgbox("Don't forget to delete the VBS Files with option (8) in the batch file!" ,0, "User and Folder Management Utility") >> disable.vbs

echo set x= wscript.createobject("Wscript.shell") >> disable1.vbs
echo x.run "disable.vbs" >> disable1.vbs

cscript disable1.vbs
timeout 5
goto home



:delvbs
title Delete VBS
cls
echo -------------------------
echo Delete VBS
echo -------------------------
set /p folderName= Enter FolderName:
cd "%userprofile%/Desktop/%folderName%"
del disable1.vbs
del disable.vbs
goto home



:passlistset
cls
set /p pass1= Create a Password
goto home



:passlist
cls
set password= %pass1%
set /p confirm= Open/Edit/Close/Delete Password List [Open,Edit,Close,Delete]:
if %confirm%==Open goto open
if %confirm%==Edit goto edit
if %confirm%==Close goto close
if %confirm%==Delete goto delete


:edit
set /p folderPlace= Enter Location to Save - FolderName:
set /p passList= Enter Password:
echo Enter only (1) Password
cd "%userprofile%/Desktop/%folderPlace%"
mkdir "%userprofile%/Desktop/%folderPlace%/Password"
cd "%userprofile%/Desktop/%folderPlace%/Password"                
echo %passList% >> PASS-LIST.txt
attrib +h "%userprofile%/Desktop/%folderPlace%/Password"
echo
goto home

          
:open
cls
set /p pass= Enter Password:
if %pass%==%password% goto good
if not %pass%==%password% goto home


:close
cls
attrib +h "%userprofile%/Desktop/%folderPlace%/Password"
goto home


:good
cls
attrib -h "%userprofile%/Desktop/%folderPlace%/Password"
goto home


:delete
cls
set /p folderPlace= Enter FolderName:
cd "%userprofile%/Desktop/%folderPlace%/Password"
del PASS-LIST.txt
cd "%userprofile%/Desktop/%folderPlace%"
rmdir Password



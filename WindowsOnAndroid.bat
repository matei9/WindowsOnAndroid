@echo off
goto 1
:1
cls
echo ----------------------------------------------
echo       Welcome to Windows On Android!
echo ----------------------------------------------
echo Make sure your phone is connected with an usb cable and MAKE SURE USB DEBUGGING IS TURNED ON choose what version of Windows you want to install:
echo 1) Windows XP
echo 2) Windows 7
echo 3) Windows Vista
echo 4) Windows 8/8.1
echo 5) Windows 10
echo 6) Windows 11
echo 7) EXIT
set /p niez=
if %niez%==1 goto XP
if %niez%==2 goto 7
if %niez%==3 goto vista
if %niez%==4 goto 8
if %niez%==5 goto 10
if %niez%==6 goto 11
if %niez%==7 exit
:XP
echo Checking connected devices... (if your devices isn't recognized close the program and check the connection.)
adb.exe devices
timeout 10
cls
echo Select an option:
echo 1) Install Windows
echo 2) Uninstall Windows
echo 3)Return to the menu
set /p bigilar=
if %bigilar%==1 goto ixp
if %bigilar%==2 goto uxp
if %bigilar%==3 goto 1
:ixp
cls
adb.exe install 1.apk
adb.exe install 2.apk
echo Check if Termux and VNC Viewer are installed and press enter.
pause
adb.exe shell am start -a android.intent.action.MAIN -n com.termux/com.termux.app.TermuxActivity
timeout 10
adb.exe shell input text Installing
adb.exe shell input keyevent 62
adb.exe shell input text Qemu...
adb.exe shell input keyevent 66
timeout 5
adb.exe shell input text clear
adb.exe shell input keyevent 66
timeout 1
adb.exe shell input text apt
adb.exe shell input keyevent 62
adb.exe shell input text update
adb.exe shell input keyevent 66
timeout 25
adb.exe shell input text apt
adb.exe shell input keyevent 62
adb.exe shell input text upgrade
adb.exe shell input keyevent 62
adb.exe shell input text -y
adb.exe shell input keyevent 66
timeout 35
adb.exe shell input text pkg
adb.exe shell input keyevent 62
adb.exe shell input text install
adb.exe shell input keyevent 62
adb.exe shell input text x11-repo
adb.exe shell input keyevent 66
timeout 30
adb.exe shell input text apt
adb.exe shell input keyevent 62
adb.exe shell input text update
adb.exe shell input keyevent 66
timeout 25
adb.exe shell input text pkg
adb.exe shell input keyevent 62
adb.exe shell input text install
adb.exe shell input keyevent 62
adb.exe shell input text qemu-system-x86_64-headless
adb.exe shell input keyevent 62
adb.exe shell input text qemu-system-i386-headless
adb.exe shell input keyevent 62
adb.exe shell input text -y
adb.exe shell input keyevent 66
timeout 120
echo QEMU installed... copying Windows and starting...
timeout 10
adb.exe shell input text termux-setup-storage
adb.exe shell input keyevent 66
echo Please allow the storage permission!
timeout 15
cls
echo Downloading Windows... (This may take a while)
echo Please download Windows from https://drive.google.com/file/d/1cO9hqwIz4uh8nEWWxayAFf5_LUiRUFs7/view?usp=sharing and put it on the directory of this program and press enter.
pause
adb.exe push XPx64Lite.qcow2 /sdcard
del XPx64Lite.qcow2 /f /q
timeout 10
echo How much ram do you wish to set for Windows? (1024 recomended)
set /p ram=
timeout 2
adb.exe shell input text echo
adb.exe shell input keyevent 62
adb.exe shell input text qemu-system-x86_64
adb.exe shell input keyevent 62
adb.exe shell input text -m
adb.exe shell input keyevent 62
adb.exe shell input text %ram%
adb.exe shell input keyevent 62
adb.exe shell input text -hda
adb.exe shell input keyevent 62
adb.exe shell input text /storage/emulated/0/XPx64Lite.qcow2
adb.exe shell input keyevent 62
adb.exe shell input text -vnc
adb.exe shell input keyevent 62
adb.exe shell input text 127.0.0.1:1
adb.exe shell input keyevent 62
adb.exe shell input text -vga
adb.exe shell input keyevent 62
adb.exe shell input text std
adb.exe shell input keyevent 62
adb.exe shell input text -net
adb.exe shell input keyevent 62
adb.exe shell input text user
adb.exe shell input keyevent 62
adb.exe shell input text -net
adb.exe shell input keyevent 62
adb.exe shell input text nic,model=rtl8139
adb.exe shell input keyevent 62
adb.exe shell input text -usbdevice
adb.exe shell input keyevent 62
adb.exe shell input text tablet
adb.exe shell input keyevent 62
adb.exe shell input text "\>"
adb.exe shell input text "\>"
adb.exe shell input keyevent 62
adb.exe shell input text XP.sh
adb.exe shell input keyevent 66
timeout 2
adb.exe shell input text chmod
adb.exe shell input keyevent 62
adb.exe shell input text +x
adb.exe shell input keyevent 62
adb.exe shell input text XP.sh
adb.exe shell input keyevent 66
timeout 2
adb.exe shell input text qemu-system-x86_64
adb.exe shell input keyevent 62
adb.exe shell input text -m
adb.exe shell input keyevent 62
adb.exe shell input text %ram%
adb.exe shell input keyevent 62
adb.exe shell input text -hda
adb.exe shell input keyevent 62
adb.exe shell input text /storage/emulated/0/XPx64Lite.qcow2
adb.exe shell input keyevent 62
adb.exe shell input text -vnc
adb.exe shell input keyevent 62
adb.exe shell input text 127.0.0.1:1
adb.exe shell input keyevent 62
adb.exe shell input text -vga
adb.exe shell input keyevent 62
adb.exe shell input text std
adb.exe shell input keyevent 62
adb.exe shell input text -net
adb.exe shell input keyevent 62
adb.exe shell input text user
adb.exe shell input keyevent 62
adb.exe shell input text -net
adb.exe shell input keyevent 62
adb.exe shell input text nic,model=rtl8139
adb.exe shell input keyevent 62
adb.exe shell input text -usbdevice
adb.exe shell input keyevent 62
adb.exe shell input text tablet
adb.exe shell input keyevent 66
timeout 20
adb.exe shell am start -a android.intent.action.MAIN -n com.realvnc.viewer.android/com.realvnc.viewer.android.app.ConnectionChooserActivity
echo Please accept the terms of service of VNC Viewer and add 127.0.0.1:1 and Done!
timeout 20
cls
echo If you want to run Windows again, open Termux and enter this command:
echo 1) ./XP.sh
echo If it says Permission Denied, enter this command: "chmod +x XP.sh"
echo Then open VNC Viwer and connect to 127.0.0.1:1 and done!
pause
exit
:7
echo Checking connected devices... (if your devices isn't recognized close the program and check the connection.)
adb.exe devices
timeout 10
cls
echo Select an option:
echo 1) Install Windows
echo 2) Uninstall Windows
echo 3)Return to the menu
set /p qwerty=
if %qwerty%==1 goto i7
if %qwerty%==2 goto u7
if %qwerty%==3 goto 1
:i7
cls
adb.exe install 1.apk
adb.exe install 2.apk
echo Check if Termux and VNC Viewer are installed and press enter.
pause
adb.exe shell am start -a android.intent.action.MAIN -n com.termux/com.termux.app.TermuxActivity
timeout 10
adb.exe shell input text Installing
adb.exe shell input keyevent 62
adb.exe shell input text Qemu...
adb.exe shell input keyevent 66
timeout 5
adb.exe shell input text clear
adb.exe shell input keyevent 66
timeout 1
adb.exe shell input text apt
adb.exe shell input keyevent 62
adb.exe shell input text update
adb.exe shell input keyevent 66
timeout 25
adb.exe shell input text apt
adb.exe shell input keyevent 62
adb.exe shell input text upgrade
adb.exe shell input keyevent 62
adb.exe shell input text -y
adb.exe shell input keyevent 66
timeout 35
adb.exe shell input text pkg
adb.exe shell input keyevent 62
adb.exe shell input text install
adb.exe shell input keyevent 62
adb.exe shell input text x11-repo
adb.exe shell input keyevent 66
timeout 30
adb.exe shell input text apt
adb.exe shell input keyevent 62
adb.exe shell input text update
adb.exe shell input keyevent 66
timeout 25
adb.exe shell input text pkg
adb.exe shell input keyevent 62
adb.exe shell input text install
adb.exe shell input keyevent 62
adb.exe shell input text qemu-system-x86_64-headless
adb.exe shell input keyevent 62
adb.exe shell input text qemu-system-i386-headless
adb.exe shell input keyevent 62
adb.exe shell input text -y
adb.exe shell input keyevent 66
timeout 120
echo QEMU installed... copying Windows and starting...
timeout 10
adb.exe shell input text termux-setup-storage
adb.exe shell input keyevent 66
echo Please allow the storage permission!
timeout 15
cls
echo Downloading Windows... (This may take a while)
echo Please download Windows from https://drive.google.com/file/d/10tPGY0hRYyHURHSoUYEJzhPtBcVtzdCb/view?usp=sharing and put it on the directory of this program and press enter.
pause
adb.exe push 7.qcow2 /sdcard
del 7.qcow2 /f /q
timeout 10
echo How much ram do you wish to set for Windows? (2048 recomended)
set /p ram=
timeout 2
adb.exe shell input text echo
adb.exe shell input keyevent 62
adb.exe shell input text qemu-system-x86_64
adb.exe shell input keyevent 62
adb.exe shell input text -m
adb.exe shell input keyevent 62
adb.exe shell input text %ram%
adb.exe shell input keyevent 62
adb.exe shell input text -hda
adb.exe shell input keyevent 62
adb.exe shell input text /storage/emulated/0/7.qcow2
adb.exe shell input keyevent 62
adb.exe shell input text -vnc
adb.exe shell input keyevent 62
adb.exe shell input text 127.0.0.1:1
adb.exe shell input keyevent 62
adb.exe shell input text -vga
adb.exe shell input keyevent 62
adb.exe shell input text std
adb.exe shell input keyevent 62
adb.exe shell input text -net
adb.exe shell input keyevent 62
adb.exe shell input text user
adb.exe shell input keyevent 62
adb.exe shell input text -net
adb.exe shell input keyevent 62
adb.exe shell input text nic,model=rtl8139
adb.exe shell input keyevent 62
adb.exe shell input text -usbdevice
adb.exe shell input keyevent 62
adb.exe shell input text tablet
adb.exe shell input keyevent 62
adb.exe shell input text "\>"
adb.exe shell input text "\>"
adb.exe shell input keyevent 62
adb.exe shell input text 7.sh
adb.exe shell input keyevent 66
timeout 2
adb.exe shell input text chmod
adb.exe shell input keyevent 62
adb.exe shell input text +x
adb.exe shell input keyevent 62
adb.exe shell input text 7.sh
adb.exe shell input keyevent 66
timeout 2
adb.exe shell input text qemu-system-x86_64
adb.exe shell input keyevent 62
adb.exe shell input text -m
adb.exe shell input keyevent 62
adb.exe shell input text %ram%
adb.exe shell input keyevent 62
adb.exe shell input text -hda
adb.exe shell input keyevent 62
adb.exe shell input text /storage/emulated/0/7.qcow2
adb.exe shell input keyevent 62
adb.exe shell input text -vnc
adb.exe shell input keyevent 62
adb.exe shell input text 127.0.0.1:1
adb.exe shell input keyevent 62
adb.exe shell input text -vga
adb.exe shell input keyevent 62
adb.exe shell input text std
adb.exe shell input keyevent 62
adb.exe shell input text -net
adb.exe shell input keyevent 62
adb.exe shell input text user
adb.exe shell input keyevent 62
adb.exe shell input text -net
adb.exe shell input keyevent 62
adb.exe shell input text nic,model=rtl8139
adb.exe shell input keyevent 62
adb.exe shell input text -usbdevice
adb.exe shell input keyevent 62
adb.exe shell input text tablet
adb.exe shell input keyevent 66
timeout 20
adb.exe shell am start -a android.intent.action.MAIN -n com.realvnc.viewer.android/com.realvnc.viewer.android.app.ConnectionChooserActivity
echo Please accept the terms of service of VNC Viewer and add 127.0.0.1:1 and Done!
timeout 20
cls
echo If you want to run Windows again, open Termux and enter this command:
echo 1) ./7.sh
echo If it says Permission Denied, enter this command: "chmod +x 7.sh"
echo Then open VNC Viwer and connect to 127.0.0.1:1 and done!
pause
exit
:8
echo Checking connected devices... (if your devices isn't recognized close the program and check the connection.)
adb.exe devices
timeout 10
cls
echo Select an option:
echo 1) Install Windows
echo 2) Uninstall Windows
echo 3)Return to the menu
set /p nus=
if %nus%==1 goto i8
if %nus%==2 goto u8
if %nus%==3 goto 1
:i8
cls
adb.exe install 1.apk
adb.exe install 2.apk
echo Check if Termux and VNC Viewer are installed and press enter.
pause
adb.exe shell am start -a android.intent.action.MAIN -n com.termux/com.termux.app.TermuxActivity
timeout 10
adb.exe shell input text Installing
adb.exe shell input keyevent 62
adb.exe shell input text Qemu...
adb.exe shell input keyevent 66
timeout 5
adb.exe shell input text clear
adb.exe shell input keyevent 66
timeout 1
adb.exe shell input text apt
adb.exe shell input keyevent 62
adb.exe shell input text update
adb.exe shell input keyevent 66
timeout 25
adb.exe shell input text apt
adb.exe shell input keyevent 62
adb.exe shell input text upgrade
adb.exe shell input keyevent 62
adb.exe shell input text -y
adb.exe shell input keyevent 66
timeout 35
adb.exe shell input text pkg
adb.exe shell input keyevent 62
adb.exe shell input text install
adb.exe shell input keyevent 62
adb.exe shell input text x11-repo
adb.exe shell input keyevent 66
timeout 30
adb.exe shell input text apt
adb.exe shell input keyevent 62
adb.exe shell input text update
adb.exe shell input keyevent 66
timeout 25
adb.exe shell input text pkg
adb.exe shell input keyevent 62
adb.exe shell input text install
adb.exe shell input keyevent 62
adb.exe shell input text qemu-system-x86_64-headless
adb.exe shell input keyevent 62
adb.exe shell input text qemu-system-i386-headless
adb.exe shell input keyevent 62
adb.exe shell input text -y
adb.exe shell input keyevent 66
timeout 120
echo QEMU installed... copying Windows and starting...
timeout 10
adb.exe shell input text termux-setup-storage
adb.exe shell input keyevent 66
echo Please allow the storage permission!
timeout 15
cls
echo Downloading Windows... (This may take a while)
echo Please download Windows from https://drive.google.com/file/d/1jjwuTxv80PjLp68yccorfFiVnmGZYT_e/view?usp=sharing and put it on the directory of this program and press enter.
pause
adb.exe push 8.qcow2 /sdcard
del 8.qcow2 /f /q 
timeout 10
echo How much ram do you wish to set for Windows? (4096 recomended)
set /p ram=
timeout 2
adb.exe shell input text echo
adb.exe shell input keyevent 62
adb.exe shell input text qemu-system-x86_64
adb.exe shell input keyevent 62
adb.exe shell input text -m
adb.exe shell input keyevent 62
adb.exe shell input text %ram%
adb.exe shell input keyevent 62
adb.exe shell input text -hda
adb.exe shell input keyevent 62
adb.exe shell input text /storage/emulated/0/8.qcow2
adb.exe shell input keyevent 62
adb.exe shell input text -vnc
adb.exe shell input keyevent 62
adb.exe shell input text 127.0.0.1:1
adb.exe shell input keyevent 62
adb.exe shell input text -vga
adb.exe shell input keyevent 62
adb.exe shell input text std
adb.exe shell input keyevent 62
adb.exe shell input text -net
adb.exe shell input keyevent 62
adb.exe shell input text user
adb.exe shell input keyevent 62
adb.exe shell input text -net
adb.exe shell input keyevent 62
adb.exe shell input text nic,model=rtl8139
adb.exe shell input keyevent 62
adb.exe shell input text -usbdevice
adb.exe shell input keyevent 62
adb.exe shell input text tablet
adb.exe shell input keyevent 62
adb.exe shell input text "\>"
adb.exe shell input text "\>"
adb.exe shell input keyevent 62
adb.exe shell input text 8.sh
adb.exe shell input keyevent 66
timeout 2
adb.exe shell input text chmod
adb.exe shell input keyevent 62
adb.exe shell input text +x
adb.exe shell input keyevent 62
adb.exe shell input text 8.sh
adb.exe shell input keyevent 66
timeout 2
adb.exe shell input text qemu-system-x86_64
adb.exe shell input keyevent 62
adb.exe shell input text -m
adb.exe shell input keyevent 62
adb.exe shell input text %ram%
adb.exe shell input keyevent 62
adb.exe shell input text -hda
adb.exe shell input keyevent 62
adb.exe shell input text /storage/emulated/0/8.qcow2
adb.exe shell input keyevent 62
adb.exe shell input text -vnc
adb.exe shell input keyevent 62
adb.exe shell input text 127.0.0.1:1
adb.exe shell input keyevent 62
adb.exe shell input text -vga
adb.exe shell input keyevent 62
adb.exe shell input text std
adb.exe shell input keyevent 62
adb.exe shell input text -net
adb.exe shell input keyevent 62
adb.exe shell input text user
adb.exe shell input keyevent 62
adb.exe shell input text -net
adb.exe shell input keyevent 62
adb.exe shell input text nic,model=rtl8139
adb.exe shell input keyevent 62
adb.exe shell input text -usbdevice
adb.exe shell input keyevent 62
adb.exe shell input text tablet
adb.exe shell input keyevent 66
timeout 20
adb.exe shell am start -a android.intent.action.MAIN -n com.realvnc.viewer.android/com.realvnc.viewer.android.app.ConnectionChooserActivity
echo Please accept the terms of service of VNC Viewer and add 127.0.0.1:1 and Done!
timeout 20
cls
echo If you want to run Windows again, open Termux and enter this command:
echo 1) ./8.sh
echo If it says Permission Denied, enter this command: "chmod +x 8.sh"
echo Then open VNC Viwer and connect to 127.0.0.1:1 and done!
pause
exit
:10
echo Checking connected devices... (if your devices isn't recognized close the program and check the connection.)
adb.exe devices
timeout 10
cls
echo Select an option:
echo 1) Install Windows
echo 2) Uninstall Windows
echo 3)Return to the menu
set /p oi=
if %oi%==1 goto i10
if %oi%==2 goto u10
if %oi%==3 goto 1
:i10
cls
adb.exe install 1.apk
adb.exe install 2.apk
echo Check if Termux and VNC Viewer are installed and press enter.
pause
adb.exe shell am start -a android.intent.action.MAIN -n com.termux/com.termux.app.TermuxActivity
timeout 10
adb.exe shell input text Installing
adb.exe shell input keyevent 62
adb.exe shell input text Qemu...
adb.exe shell input keyevent 66
timeout 5
adb.exe shell input text clear
adb.exe shell input keyevent 66
timeout 1
adb.exe shell input text apt
adb.exe shell input keyevent 62
adb.exe shell input text update
adb.exe shell input keyevent 66
timeout 25
adb.exe shell input text apt
adb.exe shell input keyevent 62
adb.exe shell input text upgrade
adb.exe shell input keyevent 62
adb.exe shell input text -y
adb.exe shell input keyevent 66
timeout 35
adb.exe shell input text pkg
adb.exe shell input keyevent 62
adb.exe shell input text install
adb.exe shell input keyevent 62
adb.exe shell input text x11-repo
adb.exe shell input keyevent 66
timeout 30
adb.exe shell input text apt
adb.exe shell input keyevent 62
adb.exe shell input text update
adb.exe shell input keyevent 66
timeout 25
adb.exe shell input text pkg
adb.exe shell input keyevent 62
adb.exe shell input text install
adb.exe shell input keyevent 62
adb.exe shell input text qemu-system-x86_64-headless
adb.exe shell input keyevent 62
adb.exe shell input text qemu-system-i386-headless
adb.exe shell input keyevent 62
adb.exe shell input text -y
adb.exe shell input keyevent 66
timeout 120
echo QEMU installed... copying Windows and starting...
timeout 10
adb.exe shell input text termux-setup-storage
adb.exe shell input keyevent 66
echo Please allow the storage permission!
timeout 15
cls
echo Downloading Windows... (This may take a while)
echo Please download Windows from https://drive.google.com/file/d/1JLu8joSOwIMnFJcPVqL3hdTwfQ25KB7w/view?usp=sharing and put it on the directory of this program and press enter.
pause
adb.exe push 10.qcow2 /sdcard
del 10.vhd /f /q
timeout 10
echo How much ram do you wish to set for Windows? (4096 recomended)
set /p ram=
timeout 2
adb.exe shell input text echo
adb.exe shell input keyevent 62
adb.exe shell input text qemu-system-x86_64
adb.exe shell input keyevent 62
adb.exe shell input text -m
adb.exe shell input keyevent 62
adb.exe shell input text %ram%
adb.exe shell input keyevent 62
adb.exe shell input text -hda
adb.exe shell input keyevent 62
adb.exe shell input text /storage/emulated/0/10.qcow2
adb.exe shell input keyevent 62
adb.exe shell input text -vnc
adb.exe shell input keyevent 62
adb.exe shell input text 127.0.0.1:1
adb.exe shell input keyevent 62
adb.exe shell input text -vga
adb.exe shell input keyevent 62
adb.exe shell input text std
adb.exe shell input keyevent 62
adb.exe shell input text -net
adb.exe shell input keyevent 62
adb.exe shell input text user
adb.exe shell input keyevent 62
adb.exe shell input text -net
adb.exe shell input keyevent 62
adb.exe shell input text nic,model=rtl8139
adb.exe shell input keyevent 62
adb.exe shell input text -usbdevice
adb.exe shell input keyevent 62
adb.exe shell input text tablet
adb.exe shell input keyevent 62
adb.exe shell input text "\>"
adb.exe shell input text "\>"
adb.exe shell input keyevent 62
adb.exe shell input text 10.sh
adb.exe shell input keyevent 66
timeout 2
adb.exe shell input text chmod
adb.exe shell input keyevent 62
adb.exe shell input text +x
adb.exe shell input keyevent 62
adb.exe shell input text 10.sh
adb.exe shell input keyevent 66
timeout 2
adb.exe shell input text qemu-system-x86_64
adb.exe shell input keyevent 62
adb.exe shell input text -m
adb.exe shell input keyevent 62
adb.exe shell input text %ram%
adb.exe shell input keyevent 62
adb.exe shell input text -hda
adb.exe shell input keyevent 62
adb.exe shell input text /storage/emulated/0/10.qcow2
adb.exe shell input keyevent 62
adb.exe shell input text -vnc
adb.exe shell input keyevent 62
adb.exe shell input text 127.0.0.1:1
adb.exe shell input keyevent 62
adb.exe shell input text -vga
adb.exe shell input keyevent 62
adb.exe shell input text std
adb.exe shell input keyevent 62
adb.exe shell input text -net
adb.exe shell input keyevent 62
adb.exe shell input text user
adb.exe shell input keyevent 62
adb.exe shell input text -net
adb.exe shell input keyevent 62
adb.exe shell input text nic,model=rtl8139
adb.exe shell input keyevent 62
adb.exe shell input text -usbdevice
adb.exe shell input keyevent 62
adb.exe shell input text tablet
adb.exe shell input keyevent 66
timeout 20
adb.exe shell am start -a android.intent.action.MAIN -n com.realvnc.viewer.android/com.realvnc.viewer.android.app.ConnectionChooserActivity
echo Please accept the terms of service of VNC Viewer and add 127.0.0.1:1 and Done!
timeout 20
cls
echo If you want to run Windows again, open Termux and enter this command:
echo 1) ./10.sh
echo If it says Permission Denied, enter this command: "chmod +x 10.sh"
echo Then open VNC Viwer and connect to 127.0.0.1:1 and done!
pause
exit
:11
echo Checking connected devices... (if your devices isn't recognized close the program and check the connection.)
adb.exe devices
timeout 10
cls
echo Select an option:
echo 1) Install Windows
echo 2) Uninstall Windows
echo 3)Return to the menu
set /p pk=
if %pk%==1 goto i11
if %pk%==2 goto u11
if %pk%==3 goto 1
:i11
cls
adb.exe install 1.apk
adb.exe install 2.apk
echo Check if Termux and VNC Viewer are installed and press enter.
pause
adb.exe shell am start -a android.intent.action.MAIN -n com.termux/com.termux.app.TermuxActivity
timeout 10
adb.exe shell input text Installing
adb.exe shell input keyevent 62
adb.exe shell input text Qemu...
adb.exe shell input keyevent 66
timeout 5
adb.exe shell input text clear
adb.exe shell input keyevent 66
timeout 1
adb.exe shell input text apt
adb.exe shell input keyevent 62
adb.exe shell input text update
adb.exe shell input keyevent 66
timeout 25
adb.exe shell input text apt
adb.exe shell input keyevent 62
adb.exe shell input text upgrade
adb.exe shell input keyevent 62
adb.exe shell input text -y
adb.exe shell input keyevent 66
timeout 35
adb.exe shell input text pkg
adb.exe shell input keyevent 62
adb.exe shell input text install
adb.exe shell input keyevent 62
adb.exe shell input text x11-repo
adb.exe shell input keyevent 66
timeout 30
adb.exe shell input text apt
adb.exe shell input keyevent 62
adb.exe shell input text update
adb.exe shell input keyevent 66
timeout 25
adb.exe shell input text pkg
adb.exe shell input keyevent 62
adb.exe shell input text install
adb.exe shell input keyevent 62
adb.exe shell input text qemu-system-x86_64-headless
adb.exe shell input keyevent 62
adb.exe shell input text qemu-system-i386-headless
adb.exe shell input keyevent 62
adb.exe shell input text -y
adb.exe shell input keyevent 66
timeout 120
echo QEMU installed... copying Windows and starting...
timeout 10
adb.exe shell input text termux-setup-storage
adb.exe shell input keyevent 66
echo Please allow the storage permission!
timeout 15
cls
echo Downloading Windows... (This may take a while)
echo Please download Windows from https://drive.google.com/file/d/1z2grJFOIPXnxdcOQDYycgNdZKFnbIsHo/view?usp=sharing and put it on the directory of this program and press enter.
pause
adb.exe push 11.vhd /sdcard
del 11.qcow2 /f /q
timeout 10
echo How much ram do you wish to set for Windows? (4096 recomended)
set /p ram=
timeout 2
adb.exe shell input text echo
adb.exe shell input keyevent 62
adb.exe shell input text qemu-system-x86_64
adb.exe shell input keyevent 62
adb.exe shell input text -m
adb.exe shell input keyevent 62
adb.exe shell input text %ram%
adb.exe shell input keyevent 62
adb.exe shell input text -hda
adb.exe shell input keyevent 62
adb.exe shell input text /storage/emulated/0/11.vhd
adb.exe shell input keyevent 62
adb.exe shell input text -vnc
adb.exe shell input keyevent 62
adb.exe shell input text 127.0.0.1:1
adb.exe shell input keyevent 62
adb.exe shell input text -vga
adb.exe shell input keyevent 62
adb.exe shell input text std
adb.exe shell input keyevent 62
adb.exe shell input text -net
adb.exe shell input keyevent 62
adb.exe shell input text user
adb.exe shell input keyevent 62
adb.exe shell input text -net
adb.exe shell input keyevent 62
adb.exe shell input text nic,model=rtl8139
adb.exe shell input keyevent 62
adb.exe shell input text -usbdevice
adb.exe shell input keyevent 62
adb.exe shell input text tablet
adb.exe shell input keyevent 62
adb.exe shell input text "\>"
adb.exe shell input text "\>"
adb.exe shell input keyevent 62
adb.exe shell input text 11.sh
adb.exe shell input keyevent 66
timeout 2
adb.exe shell input text chmod
adb.exe shell input keyevent 62
adb.exe shell input text +x
adb.exe shell input keyevent 62
adb.exe shell input text 11.sh
adb.exe shell input keyevent 66
timeout 2
adb.exe shell input text qemu-system-x86_64
adb.exe shell input keyevent 62
adb.exe shell input text -m
adb.exe shell input keyevent 62
adb.exe shell input text %ram%
adb.exe shell input keyevent 62
adb.exe shell input text -hda
adb.exe shell input keyevent 62
adb.exe shell input text /storage/emulated/0/11.vhd
adb.exe shell input keyevent 62
adb.exe shell input text -vnc
adb.exe shell input keyevent 62
adb.exe shell input text 127.0.0.1:1
adb.exe shell input keyevent 62
adb.exe shell input text -vga
adb.exe shell input keyevent 62
adb.exe shell input text std
adb.exe shell input keyevent 62
adb.exe shell input text -net
adb.exe shell input keyevent 62
adb.exe shell input text user
adb.exe shell input keyevent 62
adb.exe shell input text -net
adb.exe shell input keyevent 62
adb.exe shell input text nic,model=rtl8139
adb.exe shell input keyevent 62
adb.exe shell input text -usbdevice
adb.exe shell input keyevent 62
adb.exe shell input text tablet
adb.exe shell input keyevent 66
timeout 20
adb.exe shell am start -a android.intent.action.MAIN -n com.realvnc.viewer.android/com.realvnc.viewer.android.app.ConnectionChooserActivity
echo Please accept the terms of service of VNC Viewer and add 127.0.0.1:1 and Done!
timeout 20
cls
echo If you want to run Windows again, open Termux and enter this command:
echo 1) ./11.sh
echo If it says Permission Denied, enter this command: "chmod +x 11.sh"
echo Then open VNC Viwer and connect to 127.0.0.1:1 and done!
pause
exit
:vista
echo Checking connected devices... (if your devices isn't recognized close the program and check the connection.)
adb.exe devices
timeout 10
cls
echo Select an option:
echo 1) Install Windows
echo 2) Uninstall Windows
echo 3)Return to the menu
set /p lk=
if %lk%==1 goto ivista
if %lk%==2 goto uvista
if %lk%==3 goto 1
:ivista
cls
adb.exe install 1.apk
adb.exe install 2.apk
echo Check if Termux and VNC Viewer are installed and press enter.
pause
adb.exe shell am start -a android.intent.action.MAIN -n com.termux/com.termux.app.TermuxActivity
timeout 10
adb.exe shell input text Installing
adb.exe shell input keyevent 62
adb.exe shell input text Qemu...
adb.exe shell input keyevent 66
timeout 5
adb.exe shell input text clear
adb.exe shell input keyevent 66
timeout 1
adb.exe shell input text apt
adb.exe shell input keyevent 62
adb.exe shell input text update
adb.exe shell input keyevent 66
timeout 25
adb.exe shell input text apt
adb.exe shell input keyevent 62
adb.exe shell input text upgrade
adb.exe shell input keyevent 62
adb.exe shell input text -y
adb.exe shell input keyevent 66
timeout 35
adb.exe shell input text pkg
adb.exe shell input keyevent 62
adb.exe shell input text install
adb.exe shell input keyevent 62
adb.exe shell input text x11-repo
adb.exe shell input keyevent 66
timeout 30
adb.exe shell input text apt
adb.exe shell input keyevent 62
adb.exe shell input text update
adb.exe shell input keyevent 66
timeout 25
adb.exe shell input text pkg
adb.exe shell input keyevent 62
adb.exe shell input text install
adb.exe shell input keyevent 62
adb.exe shell input text qemu-system-x86_64-headless
adb.exe shell input keyevent 62
adb.exe shell input text qemu-system-i386-headless
adb.exe shell input keyevent 62
adb.exe shell input text -y
adb.exe shell input keyevent 66
timeout 120
echo QEMU installed... copying Windows and starting...
timeout 10
adb.exe shell input text termux-setup-storage
adb.exe shell input keyevent 66
echo Please allow the storage permission!
timeout 15
cls
echo Downloading Windows... (This may take a while)
echo Please download Windows from https://drive.google.com/file/d/1gtpFjj5EoLoi4Ig1OXHvhI65KyQXZYo7/view?usp=sharing and put it on the directory of this program and press enter.
pause
adb.exe push vista.qcow2 /sdcard
del vista.qcow2 /f /q
timeout 10
echo How much ram do you wish to set for Windows? (4096 recomended)
set /p ram=
timeout 2
adb.exe shell input text echo
adb.exe shell input keyevent 62
adb.exe shell input text qemu-system-x86_64
adb.exe shell input keyevent 62
adb.exe shell input text -m
adb.exe shell input keyevent 62
adb.exe shell input text %ram%
adb.exe shell input keyevent 62
adb.exe shell input text -hda
adb.exe shell input keyevent 62
adb.exe shell input text /storage/emulated/0/vista.qcow2
adb.exe shell input keyevent 62
adb.exe shell input text -vnc
adb.exe shell input keyevent 62
adb.exe shell input text 127.0.0.1:1
adb.exe shell input keyevent 62
adb.exe shell input text -vga
adb.exe shell input keyevent 62
adb.exe shell input text std
adb.exe shell input keyevent 62
adb.exe shell input text -net
adb.exe shell input keyevent 62
adb.exe shell input text user
adb.exe shell input keyevent 62
adb.exe shell input text -net
adb.exe shell input keyevent 62
adb.exe shell input text nic,model=rtl8139
adb.exe shell input keyevent 62
adb.exe shell input text -usbdevice
adb.exe shell input keyevent 62
adb.exe shell input text tablet
adb.exe shell input keyevent 62
adb.exe shell input text "\>"
adb.exe shell input text "\>"
adb.exe shell input keyevent 62
adb.exe shell input text vista.sh
adb.exe shell input keyevent 66
timeout 2
adb.exe shell input text chmod
adb.exe shell input keyevent 62
adb.exe shell input text +x
adb.exe shell input keyevent 62
adb.exe shell input text vista.sh
adb.exe shell input keyevent 66
timeout 2
adb.exe shell input text qemu-system-x86_64
adb.exe shell input keyevent 62
adb.exe shell input text -m
adb.exe shell input keyevent 62
adb.exe shell input text %ram%
adb.exe shell input keyevent 62
adb.exe shell input text -hda
adb.exe shell input keyevent 62
adb.exe shell input text /storage/emulated/0/vista.qcow2
adb.exe shell input keyevent 62
adb.exe shell input text -vnc
adb.exe shell input keyevent 62
adb.exe shell input text 127.0.0.1:1
adb.exe shell input keyevent 62
adb.exe shell input text -vga
adb.exe shell input keyevent 62
adb.exe shell input text std
adb.exe shell input keyevent 62
adb.exe shell input text -net
adb.exe shell input keyevent 62
adb.exe shell input text user
adb.exe shell input keyevent 62
adb.exe shell input text -net
adb.exe shell input keyevent 62
adb.exe shell input text nic,model=rtl8139
adb.exe shell input keyevent 62
adb.exe shell input text -usbdevice
adb.exe shell input keyevent 62
adb.exe shell input text tablet
adb.exe shell input keyevent 66
timeout 20
adb.exe shell am start -a android.intent.action.MAIN -n com.realvnc.viewer.android/com.realvnc.viewer.android.app.ConnectionChooserActivity
echo Please accept the terms of service of VNC Viewer and add 127.0.0.1:1 and Done!
timeout 20
cls
echo If you want to run Windows again, open Termux and enter this command:
echo 1) ./vista.sh
echo If it says Permission Denied, enter this command: "chmod +x vista.sh"
echo Then open VNC Viwer and connect to 127.0.0.1:1 and done!
pause
exit
:uxp
cls
echo Uninstalling Windows...
echo Deleting Windows image...
adb.exe shell rm /sdcard/XPx64Lite.qcow2
echo Starting Termux and deleting startup script...
adb.exe shell am start -a android.intent.action.MAIN -n com.termux/com.termux.app.TermuxActivity
timeout 2
adb.exe shell input text rm
adb.exe shell input keyevent 62
adb.exe shell input text XP.sh
adb.exe shell input keyevent 66
echo Do you want to uninstall Termux and VNC Viwer? (y/N)
set /p cv=
if %cv%==y echo Uninstalling Termux and VNC Viwer...
if %cv%==Y echo Uninstalling Termux and VNC Viwer...
if %cv%==n goto finish
if %cv%==N goto finish
adb.exe uninstall com.termux
adb.exe uninstall com.realvnc.viewer.android
goto finish
:u7
cls
echo Uninstalling Windows...
echo Deleting Windows image...
adb.exe shell rm /sdcard/7.qcow2
echo Starting Termux and deleting startup script...
adb.exe shell am start -a android.intent.action.MAIN -n com.termux/com.termux.app.TermuxActivity
timeout 2
adb.exe shell input text rm
adb.exe shell input keyevent 62
adb.exe shell input text 7.sh
adb.exe shell input keyevent 66
echo Do you want to uninstall Termux and VNC Viwer? (y/N)
set /p aa=
if %aa%==y echo Uninstalling Termux and VNC Viwer...
if %aa%==Y echo Uninstalling Termux and VNC Viwer...
if %aa%==n goto finish
if %aa%==N goto finish
adb.exe uninstall com.termux
adb.exe uninstall com.realvnc.viewer.android
goto finish
:u8
cls
echo Uninstalling Windows...
echo Deleting Windows image...
adb.exe shell rm /sdcard/8.qcow2
echo Starting Termux and deleting startup script...
adb.exe shell am start -a android.intent.action.MAIN -n com.termux/com.termux.app.TermuxActivity
timeout 2
adb.exe shell input text rm
adb.exe shell input keyevent 62
adb.exe shell input text 8.sh
adb.exe shell input keyevent 66
echo Do you want to uninstall Termux and VNC Viwer? (y/N)
set /p bb=
if %bb%==y echo Uninstalling Termux and VNC Viwer...
if %bb%==Y echo Uninstalling Termux and VNC Viwer...
if %bb%==n goto finish
if %bb%==N goto finish
adb.exe uninstall com.termux
adb.exe uninstall com.realvnc.viewer.android
goto finish
:u10
cls
echo Uninstalling Windows...
echo Deleting Windows image...
adb.exe shell rm /sdcard/10.qcow2
echo Starting Termux and deleting startup script...
adb.exe shell am start -a android.intent.action.MAIN -n com.termux/com.termux.app.TermuxActivity
timeout 2
adb.exe shell input text rm
adb.exe shell input keyevent 62
adb.exe shell input text 10.sh
adb.exe shell input keyevent 66
echo Do you want to uninstall Termux and VNC Viwer? (y/N)
set /p cc=
if %cc%==y echo Uninstalling Termux and VNC Viwer...
if %cc%==Y echo Uninstalling Termux and VNC Viwer...
if %cc%==n goto finish
if %cc%==N goto finish
adb.exe uninstall com.termux
adb.exe uninstall com.realvnc.viewer.android
goto finish
:u11
cls
echo Uninstalling Windows...
echo Deleting Windows image...
adb.exe shell rm /sdcard/11.vhd
echo Starting Termux and deleting startup script...
adb.exe shell am start -a android.intent.action.MAIN -n com.termux/com.termux.app.TermuxActivity
timeout 2
adb.exe shell input text rm
adb.exe shell input keyevent 62
adb.exe shell input text 11.sh
adb.exe shell input keyevent 66
echo Do you want to uninstall Termux and VNC Viwer? (y/N)
set /p dd=
if %dd%==y echo Uninstalling Termux and VNC Viwer...
if %dd%==Y echo Uninstalling Termux and VNC Viwer...
if %dd%==n goto finish
if %dd%==N goto finish
adb.exe uninstall com.termux
adb.exe uninstall com.realvnc.viewer.android
goto finish
:uvista
cls
echo Uninstalling Windows...
echo Deleting Windows image...
adb.exe shell rm /sdcard/vista.qcow2
echo Starting Termux and deleting startup script...
adb.exe shell am start -a android.intent.action.MAIN -n com.termux/com.termux.app.TermuxActivity
timeout 2
adb.exe shell input text rm
adb.exe shell input keyevent 62
adb.exe shell input text vista.sh
adb.exe shell input keyevent 66
echo Do you want to uninstall Termux and VNC Viwer? (y/N)
set /p ee=
if %ee%==y echo Uninstalling Termux and VNC Viwer...
if %ee%==Y echo Uninstalling Termux and VNC Viwer...
if %ee%==n goto finish
if %ee%==N goto finish
adb.exe uninstall com.termux
adb.exe uninstall com.realvnc.viewer.android
goto finish
:finish
cls
echo Windows Uninstalled!
echo Choose:
echo 1) Return to menu
echo 2) EXIT
set /p ggg=
if %ggg%==1 goto 1
if %ggg%==2 exit

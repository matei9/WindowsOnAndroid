@echo off
echo ----------------------------------------------
echo       Welcome to Windows On Android!
echo ----------------------------------------------
echo Make sure your phone is connected with an usb cable and choose what version of Windows you want to install:
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
echo Downloading Windows... (This may take a while)
wget.exe https://cdn-142.anonfiles.com/5fY8Ecfby2/324f2f18-1652378772/XPx64Lite.qcow2 --no-check-certificate
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
echo Downloading Windows... (This may take a while)
wget.exe https://cdn-123.anonfiles.com/daz7Fef3y4/7161bd37-1652378784/7.vhd --no-check-certificate
adb.exe push 7.vhd /sdcard
del 7.vhd /f /q
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
adb.exe shell input text /storage/emulated/0/7.vhd
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
adb.exe shell input text /storage/emulated/0/7.vhd
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
echo Downloading Windows... (This may take a while)
wget.exe https://cdn-124.anonfiles.com/r6ueF1fay4/25186489-1652378790/8.vhd --no-check-certificate
adb.exe push 8.vhd /sdcard
del 8.vhd /f /q 
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
adb.exe shell input text /storage/emulated/0/8.vhd
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
adb.exe shell input text /storage/emulated/0/8.vhd
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
echo Downloading Windows... (This may take a while)
wget.exe https://cdn-123.anonfiles.com/zbP6E0fdyf/89d455d9-1652378794/10.vhd --no-check-certificate
adb.exe push 10.vhd /sdcard
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
adb.exe shell input text /storage/emulated/0/10.vhd
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
adb.exe shell input text /storage/emulated/0/10.vhd
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
echo Downloading Windows... (This may take a while)
wget.exe https://cdn-124.anonfiles.com/hbv9Faffyf/04e7f2be-1652378801/11.qcow2 --no-check-certificate
adb.exe push 11.qcow2 /sdcard
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
adb.exe shell input text /storage/emulated/0/11.qcow2
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
adb.exe shell input text /storage/emulated/0/11.qcow2
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
echo Downloading Windows... (This may take a while)
wget.exe https://cdn-141.anonfiles.com/3508Fff8yf/9d5582f2-1652378778/vista.qcow2 --no-check-certificate
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
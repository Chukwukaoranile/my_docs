# Fix: WSLRegisterDistribution Failed with Error 0x8007019e

**Whenever you are seeing the error below on your ubuntu after download, you are reqiured to install wsl in your machine.**                                                                                                                     
![ScreenShot of the erro on Ubuntu lts after download from Microsoft Store](https://imgur.com/a/pbaTFfb)

**Run the Following Command on Powershell (Run powershell as administrator)**

	wsl --install


## Alternatively (if the first option did not work)

Updated On May 5, 2022 by Namratha Nayak
**WSL (Windows Subsystem for Linux)** is a free and optional feature of Windows 10 that allows users to run Linux programs on Windows. Users have reported seeing this error 0x8007019e as shown in the image below when opening the Linux command prompt. Once this error appears, the user is not allowed to use the WSL based terminal. WSLRegisterDistribution Failed error can occur due to a corrupt Linux installation or if the Linux subsystem is disabled.

[Click to access the guide](https://thegeekpage.com/wslregisterdistribution-failed-with-error-0x8007019e/)

**Whenever you are seeing the error below on your ubuntu after download, you are reqiured to install wsl in your machine.**
 
![ScreenShot of the erro on Ubuntu lts after download from Microsoft Store](https://imgur.com/a/pbaTFfb)

## Fix 1 – Enable / Disable the Linux Subsystem
 

1. Open Run by holding the Windows and R keys together.

2. Type optionalfeatures.exe to launch Windows Features.

3. Look for Windows Subsystem for Linux and enable it by checking the box next to it.

4. Click on OK. Windows Features searches for the required files and applies the changes.

5. When prompted, click on Restart now to restart your PC. Now see if the error is fixed.

6. In case the option was already checked in Step 3, then uncheck to disable the Linux subsystem. Reboot your system.
7. On rebooting, go back to Windows features and enable the option again. Restart your computer again.

8. Check if you are able to open the Linux terminal without any errors.

 

## Fix 2 – Try with Windows PowerShell
 

1. Hold Windows and X keys together to open the Windows menu.

2. Select Windows PowerShell (Admin) to launch the PowerShell with admin permissions. Click on Yes when prompted by UAC.

3. Type the command below and hit Enter to enable the Linux Subsystem in Windows Features.

	Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

4. Once the command executes, it asks for a Restart. Type Y for yes when prompted.

5. Now check whether the error has been resolved.

 

## Fix 3 – Restart LxssManager Service
 

LxssManager is the Linux Instance Lifecycle Service that runs in the background. The error can occur if the service has been stopped or it is in an error state.

1. Hold the Windows + R keys to open the Run dialog.

2. Type services.msc to open Windows Services.

3. Locate LxssManager Service. Select it and click on the Restart link on the left.
4. Relaunch the Linux terminal and check if the error is fixed.	

# Your Ubuntu should be working fine at this point if you have download before following the steps above. Continue with subsequent steps if you are yet to download ubuntu LTS 

Run

	wsl --install
or

	wsl.exe --install

## Fix 4 – Launch the Subsystem from Store
 

1. Press Windows + S and type Store. Select the options Microsoft Store in the results.
2. Click on the three dots at the top right corner and then select the option My Library.
3. Select the tab Installed on the left side of the window.
4. In the list of installed apps, click on the Open button next to the Linux distribution application present in your system.
5. You will see a Launch button, click on it to check if the application opens without any error.

## Fix 5 – Update Linux Terminal using Command Prompt
 

1. Press Windows + R to launch Run dialog.

2. Type cmd and press Shift + Ctrl +Enter to open Command Prompt with administrator privileges.

3. Use the commands below to update the Linux distribution application.

```
C:\> bash
$ sudo apt-get update
$ sudo apt-get dist-upgrade
$ <CTRL-D>
C:\> exit
```

4. Now open the application terminal and see if the error is resolved.

## Fix 6 – Repair the Linux Terminal App
 

1. To open Run press the Windows and R key combination simultaneously.

2. Type ms-settings:appsfeatures to open the Apps & Features Settings page.

3. In the search box, type the name of your Linux application (for example, here we have Ubuntu).

4. Select the application and click on the Advanced Options link under it.

5. Look for the heading Reset and click on the Repair button.

6. Once the repair process completes, open the terminal and check if it works without any issue.

7. If the error still persists, then on the Advanced Options page (Step 4) locate the Reset button and click on it.

8. Click on the Reset button when prompted that it will delete the app’s data permanently on the device.

## Fix 7 – Reinstall the Linux Console Application 

1. Perform Steps 1 – 3 in Fix 5 above.

2. Select the Linux distribution application and click on the Uninstall button at the bottom.

3. Once the app uninstall finishes, use the steps in Fix 1 to disable the Linux Subsystem.

4. Restart your PC and then enable the Linux Subsystem (as indicated in Fix 1).

5. Reinstall the Linux Terminal app and check if the issue has been resolved.

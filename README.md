# KDE_SSH_Config
Scripts needed to make automatic unlocking of ssh keys work in KDE (as is standard behaviour in Gnome)

# Requirements #
1. kwallet_pam -- needed to automatically unlock the KDE wallet on logon.  
2. ksshaskpass -- usually installed by default  

## KDE Wallet Unlocking ## 
In order for the pam kwallet module to unlock the KDE Wallet a few pre-requisites must be met:  
* The wallet must be named "kdewallet"
* The wallet must be encrypted with the classic blowfish algorythm (GPG will not work)  
* The wallet must have the same password as the user's login  

_I have also observed that automatic login appears to make the wallet not automatically unlock (even though all requirements are met). I'm not able to totally confirm this however through lack of testing_  

# Script Installation #

Place the scripts in this repostory in the following locations:  
1. ssh-agent-startup.sh -> Place into ~/.config/plasma-workspace/env  
2. ssh-agent-shutdown.sh -> Place into ~/.config/plasma-workspace/shutdown
3. ssh-add.sh -> Place into ~/.ssh  

**Ensure to make all scripts executable:**  
**chmod +x**  ***_scriptname_***


The plasma-workspace folder and it's subfolders may need creating.  
Some alterations may be needed depending on the naming convention of your ssh keys (mine are all rsa for example) and your distributions ksshaskpass location - see comments in scripts.  

# GUI Configuration #

In KDE goto systemsettings > Workspace > Startup and Shutdown > Autostart  
KDE should have placed the ssh-agent-startup.sh and ssh-agent-shutdown.sh scripts into the right locations.  
Click on "Add" at the bottom of the window and add a script.  
Select the previously created ssh-add.sh script.

**Restart the computer**

## SSH Keys ##
Create your SSH keys in the normal way and upload them to your servers.
You should get a GUI prompt to unlock your wallet (if not already unlocked for WIFI) and a further GUI prompy to unlock the SSH Key.  
 **Ensure to select "remember password"**
 
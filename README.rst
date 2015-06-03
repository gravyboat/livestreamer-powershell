Powershell Script Docs (Twitch)
===============================

This guide assumes you have installed Livestreamer and powershell:

http://docs.livestreamer.io/install.html#windows-binaries

https://technet.microsoft.com/en-us/library/hh847837.aspx


Begin by modifying the ``livestreamerrc`` settings file so that you point
at the correct release of VLC.

Move the script ``Livestreamer_powershell.ps1`` as well as the
``powershell_settings.xml`` script to your Livestreamer folder.

Ensure PowerShell has scripts set correctly to allow all scripts by running
``Set-ExceutionPolicy Unrestricted``, and select ``Y``. Note that you may need
to set this in both the 64 (x86) versions, and 32 bit versions of powershell.

Right click the script and run as a powershell script and it should now prompt
for the main website, stream, and the quality.

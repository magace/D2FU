# D2FU
AUTOIT D2 RES FOLLOW YOU - Auto game joiner for multiple d2 instances

First thing first install autoit to run or compile the script.

To get things setup will you be using this on a single computer or multiple?

Single Computer:
Start the program.
Enter your main characters window title in the "MAIN" field (most loaders let you change titles)
Enter your follower character window titles in the "Window 1 - Window 7" fields
Select "Single PC" checkbox
Enter the password for followers to use for game in the  "Password" field
Click Save 
Continue below to how to use

Multiple Computers: (LOCAL NETWORK ONLY) You will need to compile the program or install autioit on every computer.  
Create a shared folder on your main comptuer usually the one you play on.  Make sure you can access the folder from each computer.
Place the program in the shared folder.
Open the program in the shared folder on your main computer first
Enter your main d2 window title the one you play on in the "MAIN" field
Enter your follow characters window titles in the "Window 1 - Window 7" fields.  These will need to match the titles on your other computers not your main the one you play on.
Select the Multiple PCS checkbox
Select the Creator checkbox since this is your main pc you play on
Enter the password for followers to use for game in the  "Password" field
Click Save
Now open the program in the shared folder on your other computer with the followers.  It should auto populate all the window title fields and game password field if you set everything up correctly on your main computer
Click the multiple PCS checkbox
Click the follower checkbox
Click Save

Everything should be setup and ready to go now

How to use:
Before you make a game hit CTRL A to hilight game name and CTRL C to copy it. 
Push numpad1 to send game name to followers it should be whatever you just copied.  Followers will join the game using the password you set in the program. (If you are using single pc the windows will popup join game then bring your main window back to top)
Push numpad2 to make followers exit game (Again if using single pc they will popup on top of your main window exit then bring your main window back up top)

If you do not have a numberpad or want to change the hotkeys edit lines 8 and 9
HotKeySet("{numpad1}", "SendGame")
HotKeySet("{numpad2}", "ExitGame")
Here is a link with more detail on hotkeyset triggers
https://www.autoitscript.com/autoit3/docs/functions/Send.htm



TO DO:
Fix bug that allows you to select single and multiple computers
Clean up code...
Create a location check to check if the character is in char seleect, lobby, or a game.  Used for creating/exiting games

Down the road:
Control Send to windows without activating them
Make followers change acts
Make followers enter/exit tps


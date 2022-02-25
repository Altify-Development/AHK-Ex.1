;@Ahk2Exe-SetProp CompanyName Altify
;@Ahk2Exe-SetProp Copyright © ALtify, LLC
;@Ahk2Exe-SetProp Description Altify Speed Changing Example
;@Ahk2Exe-SetProp FileVersion v1.2.1.3
;@Ahk2Exe-SetProp InternalName Altify_LLC
;@Ahk2Exe-SetProp Language ahk 
;@Ahk2Exe-SetProp Name Speed Changer
;@Ahk2Exe-SetProp ProductVersion v1.2
;@Ahk2Exe-SetProp Version v1.2.1
#SingleInstance, Force ; Closes out all other running applications with the same directory of Ex.1.ahk
SetBatchLines, -1 ; Sets the speed of the application for obvious reasons this is useful because it can dramatically affect the speed of a program
Gui, Add, Text,, Speed Of File 1-5:
Gui, Add, ListBox, vSpeed ym, 1|2|3|4|5 ; The ym option starts a new column of controls.
Gui, Add, Button, default, OK  ; The label ButtonOK (if it exists) will be run when the button is pressed.
Gui, Show,, Simple Speed Changer Example
return  ; End of auto-execute section. The script is idle until the user does something.

GuiClose:
ButtonOK:
Gui, Submit  ; Save the input from the user to each control's associated variable.
Speed *= 1000 ; Multiplies the variable "Speed" by 100 
SetBatchLines, %Speed% ; Sets the speed of the script to 100 times what the user chose as %Speed%
Prog := 0 ; Creates the variable "Prog" and sets it to zero
Progress, b w200, Example Download Using Progress, Progress, Download ; Creates a progress bar
Loop, 100 ; Starts a loop, a loop in AHK is when the script reads the connecting } it will return to the origional { and will loop this until the number you chose is met
{
Prog += 1 ; Adds 1 to %Prog%
Progress, %Prog% ; Set the position of the bar to the variable %Prog%.
FileCreateDir, Examples ; Creates a file directory under the current working directory and names it "Examples"
FileAppend,Number: %Prog%`nThis Example is brought to you by: Altify`nyou welcome, Examples/Example.%Prog%.txt ; Creates a text file under the folder "Examples" and writes the message inside of it
}
Progress, Off ; Removes the progress bar
MsgBox, 52,, Do you want to delete all of the files generated? (Press YES or NO) ; Makes a message box that has a exclamation icon and 2 buttons, one is yes and the other is no
IfMsgBox Yes ; If you choose yes this will occur
    FileDelete, Examples\*.txt ; Deletes all files under the folder "Examples" that ends in the file extension '.txt'
    FileDelete, Examples ; Deletes the folder "Examples"
    MsgBox,,, Deletion Successful!,5 ; Makes a message box that after 5 seconds "timeout"s and closes
      ExitApp
IfMsgBox No
    ExitApp

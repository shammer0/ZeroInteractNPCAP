Add-Type –AssemblyName UIAutomationClient
Add-Type –AssemblyName UIAutomationTypes
add-type -AssemblyName System.Windows.Forms
$npcap = [Diagnostics.Process]::Start("C:\Users\shammer\Downloads\npcap-1.55.exe")
# wait for the UI to appear
$null = $npcap.WaitForInputIdle(5000)
sleep –s 3

# Send ENTER key input to active window and wait for next screen.
[System.Windows.Forms.SendKeys]::SendWait(“{ENTER}”)
sleep –s 3

# Send ENTER key input to active window.
[System.Windows.Forms.SendKeys]::SendWait(“{ENTER}”)

# NPCAP creates a new task as one of its last installation steps, wait for this
# task to be completed wait a buffer of 3 seconds.
$taskName = "npcapwatchdog"
$loop = 1

while($loop -eq 1)
{
    $taskExists = Get-ScheduledTask | Where-Object {$_.TaskName -like $taskName }
    if($taskExists) 
    {
       $loop = 0
    } 
}
sleep –s 3

# Send ENTER key input to active window and wait for next screen.
[System.Windows.Forms.SendKeys]::SendWait(“{ENTER}”)
sleep –s 3

# Send ENTER key input to active window and wait for next screen.
[System.Windows.Forms.SendKeys]::SendWait(“{ENTER}”)
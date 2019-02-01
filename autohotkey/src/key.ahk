;■F4でctrl-v
End::
if  ( WinActive("ahk_class mery")  ){
    SendPlay,!ep
}else{
    Send,^v
}

return

'// made by : minwook-shin / license : GPL
If Wscript.Arguments.Count < 1 Then
    WScript.Echo "Run block_win10_en.cmd" & vbCRLF & _
	" - made by : minwook-shin / license : GPL"
    WScript.Quit 1
End If

Dim objArgs
Set objArgs = Wscript.Arguments
Dim updateSession, updateSearcher
Set updateSession = CreateObject("Microsoft.Update.Session")
Set updateSearcher = updateSession.CreateUpdateSearcher()

Wscript.Stdout.Write "Searching for pending updates..." 
Dim searchResult
Set searchResult = updateSearcher.Search("IsInstalled=0")

Dim update, kbArticleId, index, index2
WScript.Echo CStr(searchResult.Updates.Count) & "found."
For index = 0 To searchResult.Updates.Count - 1
    Set update = searchResult.Updates.Item(index)
    For index2 = 0 To update.KBArticleIDs.Count - 1
        kbArticleId = update.KBArticleIDs(index2)
        For Each hotfixId in objArgs
            If kbArticleId = hotfixId Then
                If update.IsHidden = False Then
                    WScript.Echo "Hiding update: " & update.Title
                    update.IsHidden = True
                Else
                    WScript.Echo "Already hiddn: " & update.Title
                End If          
            End If
        Next

    Next
Next
'// EOF
'// made by : minwook-shin / license : GPL
If Wscript.Arguments.Count < 1 Then
    WScript.Echo "block_win10_ko.cmd�� �����ϼ���." & vbCRLF & _
	" - ������ : minwook-shin / ���̼��� : GPL3"
    WScript.Quit 1
End If

Dim objArgs
Set objArgs = Wscript.Arguments
Dim updateSession, updateSearcher
Set updateSession = CreateObject("Microsoft.Update.Session")
Set updateSearcher = updateSession.CreateUpdateSearcher()

Wscript.Stdout.Write "�������� ������Ʈ �˻���..." 
Dim searchResult
Set searchResult = updateSearcher.Search("IsInstalled=0")

Dim update, kbArticleId, index, index2
WScript.Echo CStr(searchResult.Updates.Count) & "�� ã�ҽ��ϴ�."
For index = 0 To searchResult.Updates.Count - 1
    Set update = searchResult.Updates.Item(index)
    For index2 = 0 To update.KBArticleIDs.Count - 1
        kbArticleId = update.KBArticleIDs(index2)
        For Each hotfixId in objArgs
            If kbArticleId = hotfixId Then
                If update.IsHidden = False Then
                    WScript.Echo "������ ������Ʈ: " & update.Title
                    update.IsHidden = True
                Else
                    WScript.Echo "�̹� ������ ������Ʈ: " & update.Title
                End If          
            End If
        Next

    Next
Next
'// EOF
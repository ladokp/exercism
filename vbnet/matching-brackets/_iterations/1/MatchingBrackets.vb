Public Module MatchingBrackets
    ' Dictionary to map closing brackets to their corresponding opening brackets.
    Private ReadOnly ClosersToOpeners As New Dictionary(Of Char, Char) From {
        {")"c, "("c},
        {"]"c, "["c},
        {"}"c, "{"c}
    }

    ' Function to check if the brackets in the input string are properly paired.
    Public Function IsPaired(ByVal input As String) As Boolean
        Dim stack As New Stack(Of Char)()

        ' Iterate through each character in the input string.
        For Each ch As Char In input
            If ClosersToOpeners.ContainsValue(ch) Then
                ' If the character is an opening bracket, push it onto the stack.
                stack.Push(ch)
            ElseIf ClosersToOpeners.ContainsKey(ch) Then
                ' If the character is a closing bracket, check if it matches the top of the stack.
                If stack.Count = 0 OrElse stack.Pop() <> ClosersToOpeners(ch) Then
                    Return False
                End If
            End If
        Next

        ' If the stack is empty, all brackets were properly paired.
        Return stack.Count = 0
    End Function
End Module

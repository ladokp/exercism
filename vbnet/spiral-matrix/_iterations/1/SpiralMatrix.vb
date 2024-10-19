Public Module SpiralMatrix
    Public Function GetMatrix(ByVal size As Integer) As Integer(,)
        Dim spiral(size - 1, size - 1) As Integer
        Dim currentSpiralValue As Integer = 1
        Dim firstPivot As Integer = 0
        Dim secondPivot As Integer = size - 1

        While currentSpiralValue <= size * size
            ' Fill top row from left to right
            For i As Integer = firstPivot To secondPivot
                spiral(firstPivot, i) = currentSpiralValue
                currentSpiralValue += 1
            Next

            ' Fill right column from top to bottom
            For i As Integer = firstPivot + 1 To secondPivot
                spiral(i, secondPivot) = currentSpiralValue
                currentSpiralValue += 1
            Next

            ' Fill bottom row from right to left
            For i As Integer = secondPivot - 1 To firstPivot Step -1
                spiral(secondPivot, i) = currentSpiralValue
                currentSpiralValue += 1
            Next

            ' Fill left column from bottom to top
            For i As Integer = secondPivot - 1 To firstPivot + 1 Step -1
                spiral(i, firstPivot) = currentSpiralValue
                currentSpiralValue += 1
            Next

            ' Move the pivot points inward
            firstPivot += 1
            secondPivot -= 1
        End While

        Return spiral
    End Function
End Module

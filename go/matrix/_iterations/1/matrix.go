package matrix

import (
	"errors"
	"strconv"
	"strings"
)

// Define the Matrix type here.
type Matrix [][]int

func New(s string) (Matrix, error) {
	rows := strings.Split(s, "\n")
	matrix := make(Matrix, len(rows))
	for index, row := range rows {
		row = strings.TrimSpace(row)
		numbers := strings.Split(row, " ")
		if index > 0 && len(matrix[index-1]) != len(numbers) {
			return nil, errors.New("uneven rows given")
		}
		for _, number := range numbers {
			numberInt, err := strconv.Atoi(number)
			if err != nil {
				return nil, err
			}
			matrix[index] = append(matrix[index], numberInt)
		}
	}
	return matrix, nil
}

// Cols and Rows must return the results without affecting the matrix.
func (m Matrix) Cols() [][]int {
	columns := make([][]int, len(m[0]))
	for columnIndex, _ := range columns {
		columns[columnIndex] = make([]int, len(m))
		for rowIndex, _ := range columns[columnIndex] {
			columns[columnIndex][rowIndex] = m[rowIndex][columnIndex]
		}
	}
	return columns
}

func (m Matrix) Rows() [][]int {
	rows := make([][]int, len(m))
	for rowIndex, _ := range rows {
		rows[rowIndex] = make([]int, len(m[rowIndex]))
		for columnIndex, _ := range rows[rowIndex] {
			rows[rowIndex][columnIndex] = m[rowIndex][columnIndex]
		}
	}
	return rows
}

func (m Matrix) Set(rowIndex, columnIndex, value int) bool {
	if rowIndex < 0 || rowIndex >= len(m) || columnIndex < 0 || columnIndex >= len(m[0]) {
		return false
	}
	m[rowIndex][columnIndex] = value
	return true
}

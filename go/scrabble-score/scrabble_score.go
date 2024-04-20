package scrabble

import (
	"strings"
)

var letterScores = make(map[rune]int)

func init() {
	scoreGroups := map[int][]rune{
		1: {'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'},
		2: {'D', 'G'},
		3: {'B', 'C', 'M', 'P'},
		4: {'F', 'H', 'V', 'W', 'Y'},
		5: {'K'},
		8: {'J', 'X'},
		10: {'Q', 'Z'},
	}
	for score, letters := range scoreGroups {
		for _, letter := range letters {
			letterScores[letter] = score
		}
	}
}

func Score(word string) int {
	var output int
	for _, char := range strings.ToUpper(word) {
		output += letterScores[char]
	}
	return output
}
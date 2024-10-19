package anagram

import (
	"sort"
	"strings"
)

func SortString(word string) (result string) {
	wordList := strings.Split(word, "")
	sort.Strings(wordList)
	result = strings.Join(wordList, "")
	return
}

func Detect(subject string, candidates []string) (result []string) {
	lowercaseSubject := strings.ToLower(subject)
	sortedSubject := SortString(strings.ToLower(subject))
	for _, candidate := range candidates {
		lowercaseCandidate := strings.ToLower(candidate)
		if lowercaseSubject != lowercaseCandidate && SortString(lowercaseCandidate) == sortedSubject {
			result = append(result, candidate)
		}
	}
	return
}

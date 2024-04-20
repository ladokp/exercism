package isogram
import (
	"strings"
)
func IsLowerChar(r byte) bool {
	if []byte("a")[0] <= r && r <= []byte("z")[0] {
		return true
	}
	return false
}
func IsIsogram(chars string) bool {
	lowerChars := strings.ToLower(chars)
	for i := 0; i < len(lowerChars); i++ {
		for j := i + 1; j < len(lowerChars); j++ {
			if IsLowerChar(lowerChars[i]) && lowerChars[i] == lowerChars[j] {
				return false
			}
		}
	}
	return true
}
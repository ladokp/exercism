package prime

func Factors(number int64) (factors []int64) {
	for factor := int64(2); number > 1; factor++ {
		for ; number%factor == 0; number /= factor {
			factors = append(factors, factor)
		}
	}
	return
}

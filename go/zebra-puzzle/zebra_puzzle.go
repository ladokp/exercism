package zebra

import "fmt"

type Solution struct {
	DrinksWater string
	OwnsZebra   string
}

func SolvePuzzle() (solution Solution) {
	const (
		firstHouse = iota // name/identity of each house
		secondHouse
		middleHouse
		fourthHouse
		fifthHouse
		numHouses
	)
	houses := []int{firstHouse, secondHouse, middleHouse, fourthHouse, fifthHouse}
	houseIdentityPermutations := permutations(houses, numHouses)

	for _, houseColors := range houseIdentityPermutations {
		iRed, iGreen, iIvory, iYellow, iBlue := assign(houseColors)
		if !justRightOf(iGreen, iIvory) {
			continue
		}

		for _, residents := range houseIdentityPermutations {
			iEnglishman, iSpaniard, iUkrainian, iNorwegian, iJapanese := assign(residents)

			if iEnglishman != iRed || iNorwegian != firstHouse || !nextTo(iNorwegian, iBlue) {
				continue
			}

			for _, beverages := range houseIdentityPermutations {
				iCoffee, iTea, iMilk, iOrangeJuice, iWater := assign(beverages)

				if iCoffee != iGreen || iUkrainian != iTea || iMilk != middleHouse {
					continue
				}

				for _, smokeBrands := range houseIdentityPermutations {
					iOldGold, iKools, iChesterfields, iLuckyStrike, iParliaments := assign(smokeBrands)

					if iKools != iYellow || iLuckyStrike != iOrangeJuice || iJapanese != iParliaments {
						continue
					}

					for _, pets := range houseIdentityPermutations {
						iDog, iSnails, iFox, iHorse, iZebra := assign(pets)

						if iSpaniard != iDog || iOldGold != iSnails ||
							!nextTo(iChesterfields, iFox) || !nextTo(iKools, iHorse) {
							continue
						}

						var h [numHouses]struct {
							resident   string
							color      string
							pet        string
							beverage   string
							smokeBrand string
						}

						h[iEnglishman].resident = "Englishman"
						h[iSpaniard].resident = "Spaniard"
						h[iUkrainian].resident = "Ukrainian"
						h[iJapanese].resident = "Japanese"
						h[iNorwegian].resident = "Norwegian"

						solution = Solution{
							DrinksWater: h[iWater].resident,
							OwnsZebra:   h[iZebra].resident}

						h[iRed].color = "red"
						h[iGreen].color = "green"
						h[iIvory].color = "ivory"
						h[iYellow].color = "yellow"
						h[iBlue].color = "blue"
						h[iDog].pet = "dog"
						h[iSnails].pet = "snails"
						h[iFox].pet = "fox"
						h[iHorse].pet = "horse"
						h[iZebra].pet = "zebra"
						h[iCoffee].beverage = "coffee"
						h[iTea].beverage = "tea"
						h[iMilk].beverage = "milk"
						h[iOrangeJuice].beverage = "orange juice"
						h[iWater].beverage = "water"
						h[iOldGold].smokeBrand = "OldGold"
						h[iKools].smokeBrand = "Kools"
						h[iChesterfields].smokeBrand = "Chesterfields"
						h[iLuckyStrike].smokeBrand = "LuckyStrike"
						h[iParliaments].smokeBrand = "Parliaments"
						var houseNames = [5]string{"first", "second", "middle", "fourth", "fifth"}

						for p := firstHouse; p <= fifthHouse; p++ {
							var separator string
							if h[p].pet[len(h[p].pet)-1] != 's' {
								separator = "a "
							}
							fmt.Printf("The %-10s lives in the %-6s house which is %-7s owns %-8s drinks %-13s and smokes %-13s\n",
								h[p].resident,
								houseNames[p],
								h[p].color+",",
								separator+h[p].pet+",",
								h[p].beverage+",",
								h[p].smokeBrand+".")
						}
						return
					}
				}
			}
		}
	}
	return
}

func assign(p []int) (a, b, c, d, e int) {
	return p[0], p[1], p[2], p[3], p[4]
}

func justRightOf(x, y int) bool {
	return (x - y) == 1
}

func nextTo(x, y int) bool {
	return (x-y) == 1 || (y-x) == 1
}

func permutations(iterable []int, r int) (perms [][]int) {
	pool := iterable
	n := len(pool)

	if r > n {
		return
	}

	indices := make([]int, n)
	for i := range indices {
		indices[i] = i
	}

	cycles := make([]int, r)
	for i := range cycles {
		cycles[i] = n - i
	}

	result := make([]int, r)
	for i, el := range indices[:r] {
		result[i] = pool[el]
	}

	p := make([]int, len(result))
	copy(p, result)
	perms = append(perms, p)

	for n > 0 {
		i := r - 1
		for ; i >= 0; i-- {
			cycles[i]--
			if cycles[i] == 0 {
				index := indices[i]
				for j := i; j < n-1; j++ {
					indices[j] = indices[j+1]
				}
				indices[n-1] = index
				cycles[i] = n - i
			} else {
				j := cycles[i]
				indices[i], indices[n-j] = indices[n-j], indices[i]

				for k := i; k < r; k++ {
					result[k] = pool[indices[k]]
				}

				p = make([]int, len(result))
				copy(p, result)
				perms = append(perms, p)

				break
			}
		}

		if i < 0 {
			return
		}

	}
	return
}

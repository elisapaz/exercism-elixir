package lasagna

import "fmt"

// PreparationTime returns the estimate for the total preparation time based on the number
// of layers and the average preparation time for each layer
func PreparationTime(layers []string, avgPreparation int) int {
	if avgPreparation < 1 {
		avgPreparation = 2
	}
	return len(layers) * avgPreparation
}

// Quantities determines the quantity of noodles and sauce needed to make a lasagna
func Quantities(layers []string) (int, float64) {
	var sauce float64 = 0
	var noodles int = 0

	for i := 0; i < len(layers); i++ {
		ingredient := layers[i]
		if ingredient == "sauce" {
			sauce += 0.2
		} else if ingredient == "noodles" {
			noodles += 50
		}
	}

	return noodles, sauce
}

// AddSecretIngredient adds secret ingredient from friendsList to the end of ingredients listed in myList
func AddSecretIngredient(friendsList, myList []string) {
	myListLen := len(myList)
	fmt.Println(myListLen)
	fmt.Println(len(myList))
	myList[len(myList)-1] = friendsList[len(friendsList)-1]
}

// ScaleRecipe calculates the amounts of each ingredient that are needed for the desired number of portions
func ScaleRecipe(quantities []float64, portions int) []float64 {
	newQuantities := make([]float64, len(quantities))
	for i := 0; i < len(quantities); i++ {
		newQuantities[i] = quantities[i] * float64(portions) / 2
	}
	return newQuantities
}

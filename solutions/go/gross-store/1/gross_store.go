package gross

// Units stores the Gross Store unit measurements.
func Units() map[string]int {

	units := map[string]int{
		"quarter_of_a_dozen": 3,
		"half_of_a_dozen":    6,
		"dozen":              12,
		"small_gross":        120,
		"gross":              144,
		"great_gross":        1728,
	}
	return units
}

// NewBill creates a new bill.
func NewBill() map[string]int {
	return make(map[string]int)
}

// AddItem adds an item to customer bill.
func AddItem(bill, units map[string]int, item, unit string) bool {
	unitValue, unitExists := units[unit]
	if !unitExists {
		return false
	}
	bill[item] += unitValue // default bill value is 0
	return true
}

// RemoveItem removes an item from customer bill.
func RemoveItem(bill, units map[string]int, item, unit string) bool {
	myItem, itemExists := bill[item]
	myUnit, unitExists := units[unit]
	if !itemExists || !unitExists {
		return false
	}
	newQuantity := myItem - myUnit
	if newQuantity < 0 {
		return false
	} else if newQuantity == 0 {
		delete(bill, item)
		return true
	} else {
		bill[item] = newQuantity
		return true
	}

}

// GetItem returns the quantity of an item that the customer has in his/her bill.
func GetItem(bill map[string]int, item string) (int, bool) {
	elem, exists := bill[item]
	return elem, exists
}

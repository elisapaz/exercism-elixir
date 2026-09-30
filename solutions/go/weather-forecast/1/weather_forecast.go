// Package weather provides tools
// for retrieving weather forecasts of various cities in Goblinocus.
package weather

// CurrentCondition is a string with the current weather conditions.
var CurrentCondition string

// CurrentLocation is a string that represents the current city.
var CurrentLocation string

// Forecast returns a string that shows a current weather conditions for a given city.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}

package elon

import (
	"fmt"
)

// Drive updates the number of meters driven based on the car's speed, and reduces the battery according to the battery drainage
func (car *Car) Drive() {
	if (car.battery - car.batteryDrain) > 0 {
		car.distance += car.speed
		car.battery -= car.batteryDrain
	}
}

// DisplayDistance returns the distance as displayed on the LED display as a string
func (car Car) DisplayDistance() string {
	return fmt.Sprintf("Driven %d meters", car.distance)
}

// DisplayBateery returns the battery percentage as displayed on the LED display as a string
func (car Car) DisplayBattery() string {
	return fmt.Sprintf("Battery at %d%%", car.battery)
}
// CanFinish returns true if the car can finish the race for a track of length `trackDistance`
func (car Car) CanFinish(trackDistance int) bool {
	maxDistance := car.battery * car.speed / car.batteryDrain
	return maxDistance >= trackDistance
}

package booking

import (
	"fmt"
	"time"
)

// Schedule returns a time.Time from a string containing a date.
func Schedule(date string) time.Time {
	layout := "1/02/2006 15:04:05"
	t, _ := time.Parse(layout, date)
	return t
}

// HasPassed returns whether a date has passed.
func HasPassed(date string) bool {
	appointment, _ := time.Parse("January 2, 2006 15:04:05", date)
	return time.Now().After(appointment)
}

// IsAfternoonAppointment returns whether a time is in the afternoon.
func IsAfternoonAppointment(date string) bool {
	appointment, _ := time.Parse("Monday, January 2, 2006 15:04:05", date)
	return appointment.Hour() >= 12 && appointment.Hour() < 18
}

// Description returns a formatted string of the appointment time.
func Description(date string) string {
	appointment, _ := time.Parse("1/2/2006 15:04:05", date)
	return fmt.Sprintf(
		"You have an appointment on %s, %s %d, %d, at %d:%d.",
		appointment.Weekday(), appointment.Month(), appointment.Day(), appointment.Year(),
		appointment.Hour(), appointment.Minute())
}

// AnniversaryDate returns a Time with this year's anniversary.
func AnniversaryDate() time.Time {
	currentYear := time.Now().Year()
	return time.Date(currentYear, time.September, 15, 0, 0, 0, 0, time.UTC)
}

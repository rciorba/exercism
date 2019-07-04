// Package twofer implements "One for X, one for me".
package twofer

import "fmt"

// ShareWith implements "One for X, one for me".
// If name is an empty string, it "you" is substituted in the output.
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}
	return fmt.Sprintf("One for %s, one for me.", name)
}

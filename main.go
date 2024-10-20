package main

import (
	"log"

	"github.com/dhrypt/animated-waddle/app"
)

func main() {
	err := app.SetupAndRunApp()
	if err != nil {
		log.Fatalf("Error starting application: %v", err)
	}
}

package router

import (
	"github.com/dhrypt/animated-waddle/database"
	"github.com/dhrypt/animated-waddle/handlers"
	"github.com/gofiber/fiber/v2"
)

// SetupRoutes initializes the application routes
func SetupRoutes(app *fiber.App, db *database.Database) {
	api := app.Group("/api")

	v1 := api.Group("/v1")
	v1.Get("/health", handlers.HandleHealthCheck)

	// Pass the Database instance to each handler
	v1.Post("/register", func(c *fiber.Ctx) error {
		return handlers.HandleRegister(c, db)
	})
	v1.Post("/login", func(c *fiber.Ctx) error {
		return handlers.HandleLogin(c, db)
	})
	v1.Post("/logout", func(c *fiber.Ctx) error {
		return handlers.HandleLogout(c, db)
	})
	v1.Get("/authentication", func(c *fiber.Ctx) error {
		return handlers.HandleIsAuthenticated(c, db)
	})
}

package main

import "github.com/gin-gonic/gin"

func empty(c *gin.Context) { return }

func main() {
	router := gin.Default()
	router.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})

	// Simple group: v1
	v1 := router.Group("/v1")
	{
		v1.POST("/login", empty)
		v1.POST("/submit", empty)
		v1.POST("/read", empty)
	}

	router.Run(":8080")
}

package main

import (
	"context"
	"fmt"
	"html"
	"log"
	"net/http"
	"os"

	firebase "firebase.google.com/go"
	"github.com/joho/godotenv"
	"google.golang.org/api/option"
)

type Note struct {
	Name string
}

func main() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	ctx := context.Background()
	config := &firebase.Config{
		DatabaseURL: os.Getenv("DATABASE_URL"),
	}
	// Fetch the service account key JSON file contents
	opt := option.WithCredentialsFile("credentials.json")

	app, err := firebase.NewApp(ctx, config, opt)
	if err != nil {
		log.Fatal(err)
	}

	client, err := app.Database(ctx)
	if err != nil {
		log.Fatal(err)
	}

	note := Note{
		Name: "Alice",
	}
	if err := client.NewRef("Notes/alice").Set(ctx, note); err != nil {
		log.Fatal(err)
	}
}

func Notes(w http.ResponseWriter, r *http.Request) {
	name := r.URL.Query().Get("name")
	fmt.Fprintf(w, "Hello, %s!", html.EscapeString(name))

	// post, put
	// var d struct {
	// 	Name string `json:"name"`
	// }
	// if err := json.NewDecoder(r.Body).Decode(&d); err != nil {
	// 	fmt.Fprint(w, "Hello, World!")
	// 	return
	// }
	// if d.Name == "" {
	// 	fmt.Fprint(w, "Hello, World!")
	// 	return
	// }
}

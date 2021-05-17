package notes

import (
	"context"
	"fmt"
	"html"
	"log"
	"net/http"

	"cloud.google.com/go/firestore"
	firebase "firebase.google.com/go"
)

type Note struct {
	Name string
}

func getClientFirestore() (context.Context, *firestore.Client) {
	ctx := context.Background()
	config := &firebase.Config{ProjectID: firestore.DetectProjectID}
	app, err := firebase.NewApp(ctx, config)
	if err != nil {
		log.Fatalln(err)
	}

	client, err := app.Firestore(ctx)
	if err != nil {
		log.Fatalln(err)
	}
	return ctx, client
}

func Notes(w http.ResponseWriter, r *http.Request) {
	ctx, client := getClientFirestore()

	switch r.Method {
	case http.MethodGet:
		name := r.URL.Query().Get("name")
		fmt.Fprintf(w, "Hello, %s!", html.EscapeString(name))
		ref, result, err := client.Collection("notes").Add(ctx, map[string]interface{}{
			"first": name,
			"last":  name,
			"born":  1996,
		})
		_ = ref
		_ = result

		if err != nil {
			log.Fatalf("Failed adding alovelace: %v", err)
		}
	case http.MethodPost:
		http.Error(w, "403 - Forbidden", http.StatusForbidden)
	case http.MethodPut:
		http.Error(w, "403 - Forbidden", http.StatusForbidden)
	case http.MethodDelete:
		http.Error(w, "403 - Forbidden", http.StatusForbidden)
	default:
		http.Error(w, "405 - Method Not Allowed", http.StatusMethodNotAllowed)
	}

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

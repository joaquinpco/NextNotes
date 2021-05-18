package test

import (
	"context"
	"encoding/json"
	"log"
	"net/http"

	"cloud.google.com/go/firestore"
	firebase "firebase.google.com/go"
	"google.golang.org/api/option"
)

type Note struct {
	Name   string `json:"Name"`
	Colour string `json:"Colour"`
	Text   string `json:"Text"`
}

func getClientFirestore() (context.Context, *firestore.Client) {
	ctx := context.Background()
	var app *firebase.App
	var err error

	if true {
		config := &firebase.Config{ProjectID: firestore.DetectProjectID}
		app, err = firebase.NewApp(ctx, config)
	} else {
		sa := option.WithCredentialsFile("credentials.json")
		app, err = firebase.NewApp(ctx, nil, sa)
	}

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
		id := r.URL.Query().Get("id")

		if id != "" {
			result, err := client.Collection("notes").Doc(id).Get(ctx)
			if err != nil {
				log.Fatalf("Fatality: %v", err)
				return
			}
			json.NewEncoder(w).Encode(result.Data())
			return
		}
		result, err := client.Collection("notes").Documents(ctx).GetAll()
		if err != nil {
			log.Fatalf("Fatality: %v", err)
			return
		}
		json.NewEncoder(w).Encode(result)
	case http.MethodPost:
		note := Note{}
		err := json.NewDecoder(r.Body).Decode(&note)
		if err != nil {
			log.Fatalf("Fatality: %v", err)
			return
		}
		ref, result, err := client.Collection("notes").Add(ctx, note)
		_ = ref
		_ = result
		if err != nil {
			log.Fatalf("Fatality: %v", err)
			return
		}
		json.NewEncoder(w).Encode(result)
	case http.MethodPut:
		note := Note{}
		err := json.NewDecoder(r.Body).Decode(&note)
		if err != nil {
			log.Fatalf("Fatality: %v", err)
			return
		}

		id := r.URL.Query().Get("id")
		if id != "" {
			ref := client.Collection("notes").Doc(id)
			result, err := ref.Set(ctx, note)
			json.NewEncoder(w).Encode(result)
			if err != nil {
				log.Fatalf("Fatality: %v", err)
				return
			}
			return
		} else {
			http.Error(w, "404 - Not found", http.StatusNotFound)
		}
	case http.MethodDelete:
		id := r.URL.Query().Get("id")

		if id != "" {
			result, err := client.Collection("notes").Doc(id).Delete(ctx)
			if err != nil {
				log.Fatalf("Fatality: %v", err)
				return
			}
			json.NewEncoder(w).Encode(result)
			return
		} else {
			http.Error(w, "404 - Not found", http.StatusNotFound)
		}
	default:
		// http.Error(w, "403 - Forbidden", http.StatusForbidden)
		http.Error(w, "405 - Method Not Allowed", http.StatusMethodNotAllowed)
	}
}

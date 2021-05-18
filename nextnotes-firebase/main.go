package main

import (
	"fmt"
	"log"
	"net/http"

	"guilogar.com/nextnotes/notes"
)

func main() {
	http.HandleFunc("/notes", notes.Notes)
	fmt.Println("Backend init at localhost:5000")
	log.Fatal(http.ListenAndServe(":5000", nil))
}

package main

import (
	"fmt"
	"log"
	"net/http"
	"nextnotes/test"
)

func main() {
	http.HandleFunc("/notes", test.Notes)
	fmt.Println("Backend init at localhost:5000")
	log.Fatal(http.ListenAndServe(":5000", nil))
}

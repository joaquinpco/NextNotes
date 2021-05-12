package main

import (
	"log"
	"net/http"
	"nextnotes/endpoints"
)

func handleRequest() {
	http.HandleFunc("/", endpoints.HomePage)
	log.Fatal(http.ListenAndServe(":5000", nil))
}

func main() {
	handleRequest()
}

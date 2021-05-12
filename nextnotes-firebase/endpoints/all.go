package endpoints

import (
	"fmt"
	"net/http"
)

func HomePage(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Fasi, muy fasi. Todo esto es muy fasi")
}

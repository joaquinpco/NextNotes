# Example for backend with go and gin framework

## Install dependencies
```
go mod tidy
```

## Run project
```
go run main.go
```

## To deploy in Google Cloud Platform Functions
```
cd endpoints
gcloud functions deploy Routes --runtime go111 --trigger-http --entry-point=HomePage --memory=128MB
```
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
gcloud functions deploy Notes --runtime go113 --trigger-http --entry-point=Notes --memory=128MB
```
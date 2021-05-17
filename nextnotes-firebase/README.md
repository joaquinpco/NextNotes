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
gcloud compute ssl-certificates create nextnotes-cert --domains nextnotes-92abf-default-rtdb.europe-west1.firebaseio.com
gcloud compute ssl-certificates list
gcloud functions deploy Notes --runtime go113 --trigger-http --entry-point=Notes --memory=128MB
```
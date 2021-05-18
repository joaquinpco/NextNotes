# Example for backend with go and gin framework

## Install dependencies

```bash
go mod tidy
```

## Run project

```bash
go run main.go
```

## To deploy in Google Cloud Platform Functions

```bash
cd notes
gcloud functions deploy Notes --runtime go113 --trigger-http --entry-point=Notes --memory=128MB
```

### Credentials to run in local

```json
You need the file credentials.json with credentials of your project firebase.
Example of file:
{
  "type": "service_account",
  "project_id": "...",
  "private_key_id": "...",
  "private_key": "...",
  "client_email": "...",
  "client_id": "...",
  "auth_uri": "...",
  "token_uri": "...",
  "auth_provider_x509_cert_url": "...",
  "client_x509_cert_url": "..."
}
```

## Test in local

```bash
code ext install humao.rest-client
go run main.go
code nextnotes-firebase/notes/note.http
#enjoy!
```

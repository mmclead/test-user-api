#API Endpoints

## Create new User

### Endpoint URL
  POST http://yoursite.com/users

### Example Request

``` 
  curl -X POST -H "Content-Type: application/json" \
  -d { "name": "John Doe" \
  -d "email": "john@doe.com" \
  -d "password": "s3kr3t" \
  -d "password_confirmation": "s3kr3t" } \
  http://yoursite/users

```

### Response code
  201  'Created'

### Example Response Body

``` json
{
    "id": "1",
    "name": "John Doe",
    "email": "john@doe.com",
    "authentication_token": "s3kr3t-token"
}
```



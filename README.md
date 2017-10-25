Upment hanami
-----------------------

[![Coverage Status](https://coveralls.io/repos/github/AlexanderMint/upment-hanami/badge.svg?branch=master)](https://coveralls.io/github/AlexanderMint/upment-hanami?branch=master)

#### Examples:

Users

``` ruby
query {
  users(limit: 3, order: desc) {
    id
    firstName
    lastName
    email
  }
}  
```

User

``` ruby
query {
  user(id: 1){
    id
    firstName
    lastName
    email
  }
}
```

Sign In

``` ruby
mutation SignIn($email: String!, $password: String!) {
  signIn(email: $email, password: $password) {
    id
    firstName
    lastName
    email
    refreshToken
    accessToken
  }
}
```

Sign Up

``` ruby
mutation SignUp($email: String!, $password: String!) {
  signUp(email: $email, password: $password) {
    id
    firstName
    lastName
    email
    refreshToken
    accessToken
  }
}
```

Current user

``` ruby
query currentUser{
  currentUser{
    id
    firstName
    lastName
    email
  }
}
```

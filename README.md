Upment hanami
-----------------------

[![CircleCI](https://img.shields.io/circleci/project/github/RedSparr0w/node-csgo-parser.svg)](https://circleci.com/gh/AlexanderMint/upment-hanami/tree/master.svg?style=svg)
[![codecov](https://codecov.io/gh/AlexanderMint/upment-hanami/branch/master/graph/badge.svg)](https://codecov.io/gh/AlexanderMint/upment-hanami)
[![Maintainability](https://api.codeclimate.com/v1/badges/ab52a4ce83314aaec550/maintainability)](https://codeclimate.com/github/AlexanderMint/upment-hanami/maintainability)

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

User update

``` ruby
mutation updateUser($id: Int!, $firstName: String!, $lastName: String!) {
  updateUser(id: $id, firstName: $firstName, lastName: $lastName) {
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
    refreshTokens{
      id
      browserName
      deviceName
      osName
      userAgent
      token
      createdAt
    }
  }
}
```

Destroy refresh token

``` ruby
mutation destroyRefreshToken($id: Int!) {
  destroyRefreshToken(id: $id) {
    id
  }
}
```

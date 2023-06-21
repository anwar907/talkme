# Documentation

### Insert Token
Before start running apps need `Bearer token` and paste on directory `package/network/api/lib/src/api.dart`, this centitive data so I can't provide the `Bearer token`

### Unit Test
This application has one feature so I try to apply the modular concept so that it is easy to unit test each feature, you can check on directory `package/completion_repository`

for integration tests can also be applied because those related to the network I create different packages for that need. you can check on directory  `package/network/api` or `package/network/api_client`

and for the main directory there is only available UI and management state so it is easy to implement widget tests if needed. this is main directory ready on `lib/home`
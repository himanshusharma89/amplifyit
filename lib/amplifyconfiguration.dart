const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "us-east-1:0c590417-9c90-4322-b839-1499323fc1d8",
                            "Region": "us-east-1"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "us-east-1_4kLgqzZnY",
                        "AppClientId": "7imcn3nn9n6l5jsouipulqmieu",
                        "AppClientSecret": "sjjd2q4ud327rruplpb18735td5nuf61tpfm26aj6kkf3m25e17",
                        "Region": "us-east-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "OAuth": {
                            "WebDomain": "amplifyit8611f5b9-8611f5b9-dev.auth.us-east-1.amazoncognito.com",
                            "AppClientId": "7imcn3nn9n6l5jsouipulqmieu",
                            "AppClientSecret": "sjjd2q4ud327rruplpb18735td5nuf61tpfm26aj6kkf3m25e17",
                            "SignInRedirectURI": "myapp://",
                            "SignOutRedirectURI": "myapp://",
                            "Scopes": [
                                "phone",
                                "email",
                                "openid",
                                "profile",
                                "aws.cognito.signin.user.admin"
                            ]
                        },
                        "authenticationFlowType": "USER_SRP_AUTH"
                    }
                },
                "AppSync": {
                    "Default": {
                        "ApiUrl": "https://rawgw7g6drhj7pfmwrit2a64qe.appsync-api.us-east-1.amazonaws.com/graphql",
                        "Region": "us-east-1",
                        "AuthMode": "API_KEY",
                        "ApiKey": "da2-oluku2wvovfljboq6cxp7ppy3m",
                        "ClientDatabasePrefix": "amplifyit_API_KEY"
                    }
                }
            }
        }
    },
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "amplifyit": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://rawgw7g6drhj7pfmwrit2a64qe.appsync-api.us-east-1.amazonaws.com/graphql",
                    "region": "us-east-1",
                    "authorizationType": "API_KEY",
                    "apiKey": "da2-oluku2wvovfljboq6cxp7ppy3m"
                }
            }
        }
    }
}''';
## New-York Times Articles  App

This Application will let you search and brows some articles from the New-York time Api using 2 APIs (Search, Most Popular)

## FEATURES
1. User Can Search for some Articles by using some keywords and he will get a list of articles   
2. Users Can Get the popular articles (most emailed, most searched, most viewed)
3. handle if there is intent connection or not to connect to api



## Development Environment /Tools/Languages/Technics
1. Dart 
2. MVVM
3. http: ^0.13.1
4. get_it: ^7.1.3 // as service locater (Dependency Injection)
5. flutter_bloc: ^7.0.02
6. dartz: ^0.10.0-nullsafety.2
7. connectivity: ^3.0.3
8. data_connection_checker_tv
9. mockito: ^5.0.15


## Getting Started
```bash
get your api key from https://developer.nytimes.com and use it in getApiKey()
git clone https://github.com/baraaaljabban/NYT
cd setel_geofence
flutter run
```

## Improvements
1. UI  could be better and we can move the 3 types of the most popular to be like taps
2. test cases can be more coverage  

## Best Practise
1. Implemente Seperation of Concerns by applying MVVM clean architecture
2. Implement Dependency Injection for providing objects to required class by applying GET_IT library 
3. Implement BLOC pattern in order to sperate busnis logic and user interaction and manage the state of the application 
4. Implement UI/UX to show the user in a funny way the current status 
5. the code is very commented so anyone can read it easly


it's opend now. enjoy :)


please if you want to run the App get your own API KEY from the Developer Site of the newyork times website 

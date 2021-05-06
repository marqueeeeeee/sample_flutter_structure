## Getting Started

If you have changes in route setup execute the command below in terminal to regenerate the route code.

flutter pub run build_runner build --delete-conflicting-outputs


## Structure

Utilities 
Dependencies - service locator / IOC
Features - modules (ex. Security, Cart, Order, Registration)
-- data 
---- models
---- datasources
---- repository
-- domain
---- entities
---- repository
-- presentation 
---- pages
---- viewmodels
---- widgets
Router - router configuration
main.dart



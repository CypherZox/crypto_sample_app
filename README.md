# Description

The application follows the Clean Architecture principles. It utilizes the BLoC pattern for state management and includes unit testing for robustness.


https://github.com/CypherZox/crypto_sample_app/assets/29386036/34297463-62ed-46b5-be8d-9e1b9bdd0fea




# Installation Guide

To integrate the Real-time Price Update feature into your Flutter application, follow these steps:

1. Run Flutter Pub Get:

   - Run the following command in your terminal to fetch the newly added dependencies:
     ```
     flutter pub get
     ```

2. Generate Code:
   - Use the following command to generate the necessary code files:
     ```
     flutter pub run build_runner build --delete-conflicting-outputs
     ```

# Crypto Pairs Feature

## Overview

The Crypto Pairs feature facilitates fetching cryptocurrency pairs and managing users' favorite pairs. It employs a structured architecture consisting of layers for data handling, domain logic, and presentation.
![Crypto Pairs](https://github.com/CypherZox/crypto_sample_app/blob/main/docs-media/pair.png)


## Architecture Layers

### Data Layer

#### Model

- **Pair Model**: Defines the structure for representing cryptocurrency pairs.

#### Repository Implementation

- **Pairs Repository Implementation**: Handles data operations related to fetching crypto pairs.
- **Favourite Repository Implementation**: Manages data operations for user's favorite pairs.

#### Remote Data Service

- **Pairs Remote API Service**: Communicates with remote API to fetch cryptocurrency pairs.

#### Local Data Source

- **Favourite Pairs Local Data Source**: Provides access to local storage for storing user's favorite pairs.

### Domain Layer

#### Repositories

- **Pairs Repository**: Abstracts data operations related to crypto pairs.
- **Favourite Pairs Repository**: Abstracts data operations for managing user's favorite pairs.

#### Use Cases

- **Pairs Use Cases + Implementation**: Contains business logic for handling crypto pairs.
- **Favourite Pairs Use Cases + Implementation**: Includes logic for managing user's favorite pairs.

### Presentation Layer

#### Bloc

- Utilizes the BLoC pattern for managing state related to crypto pairs and favorite pairs.

#### Screens

- Presents user interface components for interacting with the Crypto Pairs feature.

## Notes

1. **Remote Data Service vs Data Source**:

   - We utilize a remote data service instead of a data source because it allows us to fetch real-time data from an external API. This ensures that the application remains up-to-date with the latest cryptocurrency pair information.

2. **Local Storage for Favorite Pairs**:
   - In this simple demo application, we employ local storage to store user's favorite pairs. This decision is made to keep the demo lightweight and straightforward. The BLoC state management library aids in managing and updating this local storage efficiently.

# Pairs Search Feature

This feature enhances the application by enabling users to search for cryptocurrency pairs based on the base asset or coin. It utilizes the BLoC pattern for presentation layer management.
![Coin search](https://github.com/CypherZox/crypto_sample_app/blob/main/docs-media/search.png)
## Overview

The Pairs Search feature builds upon the existing functionality provided by the Pairs Fetch feature. Users can search for specific cryptocurrency pairs without the need for additional API calls, leveraging the already-fetched list of pairs.

## Note

The search functionality utilizes the list of pairs fetched by the Pairs Fetch feature. We can conduct searches without relying on additional API calls by mapping each pair with real-time WebSocket stream response. This approach optimizes performance and reduces network overhead.

A potential improvement would be to check if there's no data already fetched before initiating a search. In such cases, we can make an initial API call with the initial keystroke of the search term. Subsequent searches can then be conducted locally without additional API calls, as the API returns the same 312 symbols every time.

# Real-time Price Update Feature

This feature enhances the application by providing real-time updates for cryptocurrency prices. It utilizes web sockets to fetch price updates and incorporates the BLoC pattern for presentation layer management.
![Real-time Price Update](https://github.com/CypherZox/crypto_sample_app/blob/main/docs-media/real-time.png)
## Overview

The Real-time Price Update feature leverages web socket technology to fetch real-time price updates and seamlessly integrates with the existing architecture.

## Data Layer

### Model

- **Price Update Model**: Defines the structure for representing real-time price updates.

### Remote Data Source

- **Price Update WebSocket Source**: Communicates with the Mark Price web socket to retrieve real-time price updates for all coins.

## Domain Layer

### Use Cases

- **Price Update Use Cases + Implementation**: Contains business logic for handling real-time price updates.

## Presentation Layer

### Bloc

- Utilizes the BLoC pattern for the presentation layer, ensuring efficient state management for real-time price updates.

## Description and Notes

The Real-time Price Update feature utilizes the Mark Price web socket to retrieve prices for all coins. By mapping this information with the list of pairs already fetched from the Pairs Fetch feature, users can access real-time price updates seamlessly within the application.

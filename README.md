# psdigital_task

As a part of a assessing my techincal skills, this task was required as an evaluation.

## Getting Started

This is a part of a fastfood ordering app where users can orders their favorite meals and get notified about the latest offers and news.

<div align="center">
<img width="225" height="225" alt="image" src="https://github.com/user-attachments/assets/c87cdb9d-b00c-44bf-837c-d4f61828aff5" />
</div>

## Screenshots & video
| Menu Screen | Profile Screen 1 | Profile Screen 2 | Video |
|-------------|------------------|------------------|-------|
| <img width="540" height="1109" alt="image" src="https://github.com/user-attachments/assets/490029fb-1478-4426-b156-470a53e41b2b" /> | <img width="540" height="1109" alt="image" src="https://github.com/user-attachments/assets/3ac229d4-cbd9-462a-ba29-8bfba723d04e" /> | <img width="540" height="1109" alt="image" src="https://github.com/user-attachments/assets/fa0427dc-b0ec-4cd6-bab4-423325fb6822" /> |https://github.com/user-attachments/assets/ee44157e-d8b6-4b0c-aae9-0aa25f40b5af |



## Architecture

This project follows Clean Architecture principles to ensure scalability, maintainability, and testability.

The architecture is organized into layers, each with its own responsibility and strict dependency rules:

- Use Cases (Application Layer)
  
> Contain the specific business rules of the application.
> Orchestrate the flow of data between entities and outer layers.
> Independent of UI, database, or external libraries.

- Repositories (Data Layer)

> Provide abstraction over data sources (local database, network, cache, etc.).
> Implement interfaces defined in the domain layer.

- Presentation Layer (UI)

> Handles displaying data to the user and receiving input.
> Uses state management to communicate with use cases.
> Depends only on the domain layer abstractions.

### Dependency Rule

- Inner layers know nothing about outer layers.

- Dependencies always point inward: UI → Use Cases → Entities.

### Benefits

- High testability (business rules can be tested without frameworks).

- Clear separation of concerns.

- Easy to replace frameworks (e.g., swap database, UI, or API layer).
  
<div align="center">
<img width="262" height="453" alt="image" src="https://github.com/user-attachments/assets/7a85356b-727e-4773-a50b-176a2ab8e154" />      
</div>

## Packages
| Package               | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
| get_it                | Service locator for dependency injection.                                   |
| dio                   |  HTTP client for networking and API calls.                                 |
| go_router             | Declarative routing solution for Flutter apps.                             |
| fp_dart               | Functional programming utilities (Either, Option, etc.).                   |
| flutter_bloc          | State management library using BLoC (Business Logic Component) pattern.    |
| flutter_dotenv        | Load environment variables from a `.env` file.                             |
| equatable             | Simplifies equality comparisons for Dart objects.                         |
| flutter_spinkit       | Collection of loading spinner animations.                                  |
| cached_network_image   | Widget for loading and caching network images.                            |
| flutter_svg           | Renders SVG (Scalable Vector Graphics) assets.                             |
| bubble_box            | Creates customizable speech bubbles with tails.                            |
| auto_size_text        | Automatically adjusts text size to fit within its bounds.         


## Responsiveness
Responsiveness was achieved by utilizing the `MediaQuery` class to retreive the screen's actual size and assigning relative heights and widths to each components.

```dart
extension SizesContextExtension on BuildContext {
  /// [size] Ranges from 0.0 to 1.0 (Percentage of given property)
  double rHeight(double size) => MediaQuery.sizeOf(this).height * size;

  /// [size] Ranges from 0.0 to 1.0 (Percentage of given property)
  double rWidth(double size) => MediaQuery.sizeOf(this).width * size;
}
``` 

<p align="center">
  <img src="https://readme-typing-svg.demolab.com?font=Inter&weight=600&size=28&duration=3000&pause=1000&color=2563EB&center=true&vCenter=true&width=750&lines=Movies+App;Flutter+Clean+Architecture;Scalable+and+Maintainable+Architecture" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter" />
  <img src="https://img.shields.io/badge/Dart-Language-blue?logo=dart" />
  <img src="https://img.shields.io/badge/Architecture-Clean_Architecture-green" />
  <img src="https://img.shields.io/badge/State%20Management-Provider-orange" />
  <img src="https://img.shields.io/badge/Dependency%20Injection-Injectable-purple" />
</p>

---

# Movies App

Movies App is a Flutter application built using Clean Architecture principles.  
The project demonstrates clear separation of concerns, scalability, maintainability, and testability using a structured layered approach.

The application allows users to browse:

- Popular Movies  
- Top Rated Movies  
- Latest Releases  

All while maintaining a clean architectural foundation behind the scenes.

---

## Demo

Below is a preview of the application in action:

<p align="center">
  <img src="https://raw.githubusercontent.com/menna3lwan/movie_app/dev/movie%20design.gif" width="700"/>
</p>

If the preview does not load, you can view it directly here:  
https://github.com/menna3lwan/movie_app/blob/dev/movie%20design.gif

---

## Architecture Overview

This project follows a strict Clean Architecture structure:

Presentation Layer  
↓  
Domain Layer  
↓  
Data Layer  

Each layer communicates only with the layer directly beneath it, ensuring independence and modularity.

---

## Application Flow

The complete flow of the application works as follows:

User opens Home Screen  
→ HomeProvider triggers UseCase  
→ UseCase calls Repository (Domain interface)  
→ Repository Implementation (Data layer)  
→ DataSource  
→ API  
→ Server returns JSON  
→ JSON parsed into DTO  
→ DTO converted into Entity  
→ Provider updates state  
→ UI rebuilds automatically  

This structure guarantees that the UI never directly depends on API logic or JSON structure.

---

## Layer Responsibilities

### Presentation Layer

Responsible for:
- UI rendering  
- State management  
- User interaction handling  
- Triggering UseCases  

Contains:
- Pages  
- Providers  
- State classes  
- Reusable widgets  

Does not contain:
- Business logic  
- API calls  
- JSON parsing  

---

### Domain Layer

Responsible for:
- Business rules  
- Application logic  
- Entities  
- Repository interfaces  
- UseCases  

Characteristics:
- Pure Dart  
- Independent from Flutter  
- Independent from API  
- Easily testable  

---

### Data Layer

Responsible for:
- API communication  
- JSON parsing  
- DTO models  
- DataSources  
- Repository implementations  

Handles:
- Converting JSON into DTOs  
- Mapping DTOs into Entities  
- Wrapping responses using ApiResult  

---

## Repository Pattern

The Domain defines repository contracts such as:

abstract class PopularRepo  

The Data layer provides the implementation:

class PopularRepoImpl implements PopularRepo  

This ensures:
- Domain remains independent from data implementation  
- Data sources can be replaced without affecting business logic  

---

## Data Transformation Pipeline

Server JSON  
→ DTO Model  
→ toEntity() conversion  
→ MovieEntity  
→ UI Rendering  

Entities remain clean and independent from API or JSON structures.

---

## State Management

Provider is used to manage application state.

Flow:

UI triggers Provider method  
→ Provider calls UseCase  
→ Provider updates state  
→ notifyListeners()  
→ UI rebuilds  

States are structured into:
- Initial  
- Loading  
- Success  
- Error  

This ensures predictable and maintainable UI behavior.

---

## Technologies Used

Flutter  
Dart  
Provider  
Injectable  
HTTP  
Clean Architecture Pattern  

---

## Getting Started

Clone the repository:

git clone https://github.com/menna3lwan/movie_app.git  
cd movie_app  
flutter pub get  
flutter run  

---

## Testing Strategy

The architecture allows:

- Unit testing UseCases  
- Mocking repositories  
- Testing Provider logic  
- Independent Domain testing  

---

## Future Improvements

- Pagination  
- Local caching  
- Movie details screen  
- Search functionality  
- Dark mode support  
- Offline-first capability  

---

## Team

This project was developed by:

Ahmed El-Sabbagh  
Nour Waleed  
Youssef Waleed  

---

Movies App demonstrates a production-ready Clean Architecture implementation in Flutter with structured data flow, proper abstraction, and scalable design.

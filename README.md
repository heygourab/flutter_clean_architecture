# Flutter Clean Architecture Template

A comprehensive template for Flutter applications following Clean Architecture principles. This template provides a structured foundation with example implementations of each layer.

## 🏗️ Architecture Overview

> **Note:** For small projects or MVPs, implementing this full architecture might be overengineering. Consider a simpler structure if your project has minimal business logic or a small feature set.

The architecture follows Clean Architecture principles with a feature-first organization:

```text
lib/
├── core/               # App-wide utilities, errors, and configurations
├── features/          # Feature modules following Clean Architecture
│   └── feature_name/  # e.g., auth, home, etc.
│       ├── data/      # Data layer (repositories impl, models, data sources)
│       ├── domain/    # Business logic (entities, repositories, use cases)
│       └── presentation/ # UI layer (screens, widgets)
|       |__ providers
└── shared/           # Shared components across features
```

### Key Features

- **✨ Complete Clean Architecture Implementation**

  - Clear separation between data, domain, and presentation layers
  - Example implementations for each architectural component
  - Proper dependency injection setup

- **🛠️ Modern Flutter Development**

  - Null safety
  - Route management with GoRouter
  - State management with Riverpod
  - Immutable programming with Freezed

- **🧰 Built-in Tools**
  - Error handling infrastructure
  - Dependency injection setup
  - Navigation service
  - Route guards

## 🚀 Getting Started

1. Clone this template
2. Run `flutter pub get`
3. Run `flutter pub run build_runner build` to generate code
4. Start implementing your features following the auth feature example

## 📚 Template Usage Guide

### Adding a New Feature

1. Create a new directory under `lib/features/`
2. Follow the layer structure:
   - `domain/` for business logic
   - `data/` for data handling
   - `presentation/` for UI

### Implementation Steps

1. **Domain Layer**

   - Define entities
   - Create repository interfaces
   - Implement use cases

2. **Data Layer**

   - Create data models (DTOs)
   - Implement repositories
   - Set up data sources

3. **Presentation Layer**
   - Create state management (Riverpod)
   - Build UI components
   - Handle navigation

### Example Implementation

The `auth` feature demonstrates:

- Clean Architecture principles
- Error handling
- State management
- Navigation
- Dependency injection

## 🧪 Testing

The template includes examples of:

- Unit tests for use cases
- Repository tests
- Widget tests
- Integration tests

## 📦 Recommended Dependencies

Pre-configured with best-practice packages:

- `flutter_riverpod` for state management
- `freezed` for immutable classes
- `go_router` for navigation
- `dartz` for functional programming
- `dio` for networking

## 🤝 Contributing

Contributions are welcome.

## 🔗 Social Links

[![X](https://img.shields.io/badge/X-%23000000.svg?style=for-the-badge&logo=X&logoColor=white)](https://x.com/heygourab);

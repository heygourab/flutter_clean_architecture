# Flutter Clean Architecture

A professional Flutter application demonstrating Clean Architecture principles. This project is designed to be a reference for developers looking to implement Clean Architecture in their own Flutter applications.

## 🏗️ Architecture Overview

The architecture of this project is based on the principles of Clean Architecture, which emphasizes separation of concerns and testability. The project is structured into several layers:

- **Presentation Layer**: Contains the UI components and state management.
- **Domain Layer**: Contains the business logic and use cases.
- **Data Layer**: Contains the data sources and repositories.
- **Core Layer**: Contains shared utilities and constants.
- **Feature Layer**: Contains the feature-specific components, including UI, data sources, and repositories.
- **Shared Layer**: Contains reusable widgets and models that can be shared across different features.

## 📦 Project Structure

```text
lib/
├── core/ # App-wide configs, utilities, theme, constants
├── features/ # Modular feature-based architecture
├── features/        # Feature-first DDD structure
│   ├── auth/        # (Example feature module)
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   ├── models/
│   │   │   └── repositories/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   └── usecases/
│   │   ├── presentation/    # UI layer (widgets, screens)
│   │   └── providers/
│   └── home/ (Example feature module)
├── shared/ # Reusable widgets, models shared across features
├── app.dart # Root widget
├── main.dart # Entry point
└── router/ # Centralized app routing
```

### Benefits

- Clear separation of concerns
- Testable
- Maintainable
- Scalable

## Contributing

Contributions are welcome! If you have suggestions for improvements or new features, please open an issue or submit a pull request.
Please ensure that your code adheres to the project's coding standards and includes appropriate tests.

## Contact

If you have any questions or feedback, feel free to reach out:
heygourab - [@heygourab](https://x.com/heygourab)

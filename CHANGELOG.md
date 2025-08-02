# Changelog

All notable changes to this project will be documented in this file.

## [1.0.0] - 2025-08-01

🎉 Initial release of `coderspace_network`.

### ✨ Features
- Simple and clean networking layer using `Dio`
- `CoderClient` to handle GET, POST, PUT, PATCH, DELETE requests
- Unified response model using `CoderResult<T>`
- Easy error handling and timeout configuration
- Custom `parser` support to decode JSON into your own models
- Utility function `ensureList` for parsing list responses safely

---

### 📦 Example
- Added example usage for real API endpoints using `jsonplaceholder.typicode.com`
- Included model class (`Post`) and demo GET/POST requests

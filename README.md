# coderspace_network

coderspace_network is a lightweight, developer-friendly Flutter package for making REST API calls using Dio. It provides clean, generic request handling, consistent error management, and simple utilities like auto-list parsing—all with minimal code.

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  coderspace_network: ^latest_version
```

## 📖 Usage

#### ✅ Import
```dart
// Import the package
import 'package:coderspace_network/coderspace_network.dart';
```

#### ✅ Initialize CoderClient
```dart
// Create an instance with your base URL
final client = CoderClient(baseUrl: 'https://jsonplaceholder.typicode.com');
// OR
final client = CoderClient(
  baseUrl: 'https://your-api.com',
  timeout: const Duration(seconds: 15),
  headers: {
    'Authorization': 'Bearer YOUR_TOKEN',
  },
);
```

#### ✅ Make a GET request
```dart
final result = await client.get<List<Post>>(
  '/posts',
  // Use the parser to convert raw response to your model
  parser: (data) => ensureList(data, (e) => Post.fromJson(e)),
);

if (result.isSuccess) {
  final posts = result.data!;
  print('Fetched ${posts.length} posts');
} else {
  print('❌ Error: ${result.error}');
}
```

#### ✅ Make a POST request
```dart
final result = await client.post<Map<String, dynamic>>(
  '/posts',
  data: {
    'title': 'Hello World',
    'body': 'This is a test post',
    'userId': 1,
  },
);

if (result.isSuccess) {
  print('✅ Created: ${result.data}');
} else {
  print('❌ Failed: ${result.error}');
}
```

#### ✅ Handling Single or List Response
If the API may return a single item or a list, use ensureList:
```dart
final users = ensureList(responseData, (e) => User.fromJson(e));
```

### 🚀 About Me

👨‍💻 Senior Flutter Developer <br />
💡 One principle I always code by: <br />
*"Don’t just develop — Develop Innovative"*

### 📝 Author Profile

> [![coderspacedev](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/coderspacedev) <br />
> [![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/thoriya-prahalad-1b6a82137) <br />
> [![Stack_Overflow](https://img.shields.io/badge/Stack_Overflow-FE7A16?style=for-the-badge&logo=stack-overflow&logoColor=white)](https://stackoverflow.com/users/9917404/thoriya-prahalad)

## Support

For support, email thoriyaprahalad@gmail.com

# Dashboard Screens Implementation

This directory contains the implementation of two main dashboard screens for the Guardians of Health app:

## Screens Overview

### 1. Details Screen (`details_screen.dart`)
A comprehensive detail view that displays information about Antimicrobial Resistance (AMR) with:
- Hero image with overlay text
- Interactive elements (bookmark, share, like)
- Content card with detailed information
- Quick facts section
- Bottom navigation

### 2. Bookmarks Screen (`bookmarks_screen.dart`)
A grid/list view of bookmarked content featuring:
- Search functionality
- Toggle between grid and list views
- Beautiful gradient cards
- Bottom navigation

## Architecture

### Shared Components
- **`shared/bottom_navigation.dart`**: Reusable bottom navigation widget
- **`models/bookmark_model.dart`**: Data model for bookmark items
- **`constants/app_constants.dart`**: Centralized design constants

### Key Features

#### Details Screen
- **Hero Section**: Large background image with gradient overlay
- **Top Navigation**: Back button, bookmark, notifications, and profile
- **Interactive Elements**: Bookmark, share, and like buttons with state management
- **Content Layout**: Scrollable content with facts and examples
- **Responsive Design**: Adapts to different screen sizes

#### Bookmarks Screen
- **Search & Filter**: Real-time search through bookmarks
- **View Toggle**: Switch between grid and list layouts
- **Gradient Cards**: Beautiful visual design with unique color schemes
- **Empty State**: User-friendly message when no bookmarks found
- **Navigation**: Tap cards to view details

## Usage

### Navigation
```dart
// Navigate to Details Screen
Navigator.pushNamed(context, '/details');

// Navigate to Bookmarks Screen
Navigator.pushNamed(context, '/bookmarks');
```

### Adding Routes
Update your `main.dart` to include these routes:

```dart
MaterialApp(
  // ... other properties
  routes: {
    '/': (context) => const SplashScreen(),
    '/details': (context) => const DetailsScreen(),
    '/bookmarks': (context) => const BookmarksScreen(),
  },
);
```

### Customization

#### Colors and Themes
Modify `app_constants.dart` to change:
- Primary colors
- Gradient schemes
- Typography settings
- Spacing and dimensions

#### Bookmark Data
Update the sample data in `bookmarks_screen.dart` or integrate with your data source:

```dart
final List<BookmarkModel> _bookmarks = [
  BookmarkModel(
    title: 'Your Title',
    content: 'Your content description',
    gradient: AppConstants.bookmarkGradients[0],
    additionalText: 'Optional additional text',
    createdAt: DateTime.now(),
  ),
  // ... more bookmarks
];
```

## Dependencies

The screens use only Flutter's built-in packages:
- `flutter/material.dart` - Core Flutter widgets
- No external dependencies required

## Performance Considerations

- **Lazy Loading**: GridView.builder for efficient rendering of large lists
- **State Management**: Local state for UI interactions
- **Memory Management**: Proper disposal of controllers
- **Responsive Design**: Adapts to different screen orientations and sizes

## Future Enhancements

1. **Data Persistence**: Integrate with local storage or backend
2. **Animations**: Add smooth transitions and micro-interactions
3. **Offline Support**: Cache bookmarks for offline viewing
4. **Accessibility**: Add screen reader support and accessibility features
5. **Internationalization**: Support for multiple languages

## Testing

To test the screens:

1. **Unit Tests**: Test individual widget logic
2. **Widget Tests**: Test screen rendering and interactions
3. **Integration Tests**: Test navigation between screens
4. **Performance Tests**: Ensure smooth scrolling and rendering

## Contributing

When modifying these screens:
1. Follow the existing code style and patterns
2. Update the constants file for new design values
3. Test on different screen sizes and orientations
4. Update this documentation for any new features 
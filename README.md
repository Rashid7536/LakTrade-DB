# LakTrade Database in SupaBase

The Laktrade Database Flutter App is a mobile application developed using the Flutter framework. It provides a user-friendly interface to interact with the Laktrade database, which stores information about various flavors. The app allows users to search for flavors by their name or code and view detailed information about each flavor.

### Key Features
- Search Functionality: Users can quickly search for flavors by entering a name or code in the search bar. The app will display a list of matching flavors based on the entered query.
- Flavor Details: When a user taps on a search result, the app presents detailed information about the selected flavor. This includes the flavor name, code, and its type (e.g., Natural Emulsion, Natural Liquid, Natural Nature Cell, etc.).

### Technologies Used
- Flutter: The app is built using the Flutter framework, which allows for cross-platform development and provides a rich set of widgets and tools for creating native-like mobile applications.
- Supabase: The app utilizes Supabase, an open-source Firebase alternative, for database management and authentication. Supabase provides a real-time database, authentication, and other backend services.

### Benefits
- Convenient Access: The app provides a convenient way for users to access and search the Laktrade database on their mobile devices, allowing them to quickly find the information they need.
- User-Friendly Interface: The app offers a simple and intuitive user interface, making it easy for users to navigate and interact with the database.
- Real-time Updates: With Supabase, the app can receive real-time updates, ensuring that users always have access to the most up-to-date information.

### Future Enhancements
- User Authentication: Implement user authentication to personalize the app experience and allow users to save their favorite flavors.
- Offline Synchronization: Enhance the app to work offline by caching data locally and synchronizing with the server when connectivity is available.
- Flavor Filtering: Add additional filtering options to help users narrow down their search results based on specific criteria, such as flavor type or category.

## Getting Started

## Requirements
- Flutter SDK
- Supabase account and project setup

## Installation
1. Clone the repository
git clone https://github.com/rashid7536/laktrade-db.git

2. Install dependencies

3. Set up Supabase configuration
- Add your Supabase project URL and API key in the main.dart file
  ```
  SUPABASE_URL=your-supabase-project-url
  SUPABASE_ANON_KEY=your-supabase-anon-key
  ```

4. Create the database, postgresSQL as follows 

5. Run the app

## Usage
- Open the app and you will see a search bar at the top
- Enter a flavor name or code to search for matching results
- Tap on a search result to view the flavor details

## Contributing
- Fork the repository
- Create a new branch for your feature or bug fix
- Make your changes and commit them
- Push your changes to your fork
- Submit a pull request to the main repository

## License
This project is licensed under the MIT License. See the `LICENSE` file for more information.

## Contact
- Email: rashidaman05@gmail.com
- GitHub: https://github.com/rashid7536

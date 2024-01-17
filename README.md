
# Technofy

Technofy is a Flutter mobile application designed to revolutionize your tech gadgets shopping experience. With an intuitive user interface, support for customizable light and dark themes, and a curated catalog showcasing stunning visuals through the `ItemWidget`, Technofy offers a seamless and visually appealing navigation experience.

## Table of Contents
- [Features](#features)
- [Getting Started](#getting-started)
- [Themes](#themes)
- [Custom Widgets](#custom-widgets)
- [Data Model](#data-model)

## Features
- Intuitive user interface for seamless navigation.
- Support for both light and dark themes.
- Customizable themes using the `MyTheme` class.
- Independently conceptualized and developed a dynamic Catalog Shopping application focusing on trending tech products.
- Utilized Flutter for Android development, crafting a user-friendly interface to showcase diverse devices and their prices,
simulating a seamless shopping experience.
- Implemented a visually appealing dark mode feature to enhance user accessibility and engagement.
- Created a functional cart management system, allowing effortless addition and removal of items
## Getting Started
To run this project locally, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/fang69x/Technofy.git
   cd Technofy
   flutter run
   ```

2. Include VelocityX in your `pubspec.yaml` file:
   ```yaml
   dependencies:
     velocity_x: ^3.3.0
   ```

## Themes
The app supports both light and dark themes to provide users with a personalized experience. Themes can be customized using the `MyTheme` class.

## Custom Widgets
### ItemWidget
The `ItemWidget` is designed to display individual items within the app, offering a clean and organized representation of catalog items. Key features include:

- **Image:** Visual representation of each item.
- **Name:** Prominent display of the item name.
- **Description:** Brief additional information about the item.
- **Price:** Highlighted pricing for quick reference.



## Data Model
The `CatalogModel` and `Item` classes form the core of the app's data model, efficiently managing catalog data.

### CatalogModel
The `CatalogModel` is a singleton class responsible for handling catalog data. Key features include:

- **Singleton Pattern:** Ensures a single instance throughout the app's lifecycle.
- **Item Retrieval:** Methods to retrieve items based on ID or position in the catalog.
- **Initialization:** Internally initializes catalog data for availability.

#### Example:
```dart
CatalogModel.catModel.getById(1); // Retrieves an item by ID
CatalogModel.catModel.getByPosition(0); // Retrieves an item by position
```

### Item
The `Item` class represents an individual catalog item, encapsulating attributes such as:

- **ID:** Unique identifier for the item.
- **Name:** The item's name.
- **Description:** A brief additional description.
- **Price:** The cost of the item.
- **Color:** Customizable color attribute.
- **Image:** URL or path to the item's image.

###Screenshots

![Screenshot_1705527299](https://github.com/fang69x/Technofy/assets/109065342/d234a5a7-5229-46da-9c52-e4c637e1a284)
![Screenshot_1705527450](https://github.com/fang69x/Technofy/assets/109065342/0202fa1f-8091-49c7-8d0b-9743631c9e70)
![Screenshot_1705527332](https://github.com/fang69x/Technofy/assets/109065342/6694d388-9c35-461d-9fe4-162686a17d28)
![Screenshot_1705527336](https://github.com/fang69x/Technofy/assets/109065342/fe5279f4-c120-4992-84ff-9a4dcd34b975)
![Screenshot_1705527461](https://github.com/fang69x/Technofy/assets/109065342/6805cfd6-8abc-44c2-bcd9-83b9567bb834)
![Screenshot_1705527465](https://github.com/fang69x/Technofy/assets/109065342/a2956c4d-b0da-4f60-be06-5a907653f659)

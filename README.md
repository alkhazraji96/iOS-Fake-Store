# iOS-Fake-Store App Documentation

## Purpose

The iOS app is designed to fetch a list of products from the API endpoint [https://fakestoreapi.com/products](https://fakestoreapi.com/products) and display them to the user. The primary purpose of the app is to demonstrate how to perform network requests, display a list of products, handle network errors, and show a product's name in a toast message.

## Features

1. **Network Interface to Fetch Products from API**

   The app includes a network interface to fetch products from the specified API endpoint.

2. **Display Products as a List**

   Products retrieved from the API are displayed in a list format, making it easy for users to browse the available products.

3. **Handling Network Errors**

   The app has built-in error handling to manage network errors gracefully. Users are provided with feedback in case of any network-related issues.

4. **Display Product Name in a Toast**

   When a user interacts with a product, the app displays the product's name in a toast message for a brief notification.

## Libraries Used

The following libraries were used to develop the app:

- **Kingfisher**: Used for remote fetching of product images.
- **SwiftMessages**: Utilized to display messages as toast notifications.
- **SnapKit**: Used for defining and managing constraints in the user interface.

## Architecture

The app is built using the Model-View-Controller (MVC) architecture for simplicity and to keep the project size manageable. This architecture separates the app into three key components:

- **Model**: Represents the data model and contains the logic to interact with the API and manage data.
- **View**: Defines the user interface elements responsible for displaying product information and managing user interactions.
- **Controller**: Acts as the intermediary between the Model and View. It manages user input, responds to user actions, and updates the View based on data from the Model.

## Compatibility

The app has been designed to support a minimum deployment target of iOS 14.0, ensuring compatibility with older iOS devices.

## How to Run the App

To run the app on your iOS device or simulator, follow these steps:

1. Clone the app's repository to your local machine.

2. Open the Xcode project.

3. Select the desired simulator or connect your iOS device to your Mac.

4. Build and run the project.

## Feedback and Support

If you encounter any issues, have questions, or would like to provide feedback, please feel free to contact the app's developer.

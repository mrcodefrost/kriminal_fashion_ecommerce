# Business Side App (Admin Panel)

## Kriminal Business App

Kriminal Business App is the administrative panel for managing products and orders for the Kriminal fashion brand. This app allows the business to add, update, and remove products, manage orders, and control the inventory.

<div style="
  display: flex;
  justify-content: space-between;
  ">
  <img src = "https://github.com/mrcodefrost/kriminal_fashion_ecommerce/blob/main/repo%20resources/1.png?raw=true" width="770"/>
  <img src = "https://github.com/mrcodefrost/kriminal_fashion_ecommerce/blob/main/repo%20resources/2.jpg?raw=true" width="250"/>
  <img src = "https://github.com/mrcodefrost/kriminal_fashion_ecommerce/blob/main/repo%20resources/3.jpg?raw=true" width="250"/>
  <img src = "https://github.com/mrcodefrost/kriminal_fashion_ecommerce/blob/main/repo%20resources/4.jpg?raw=true" width="250"/>
  <img src = "https://github.com/mrcodefrost/kriminal_fashion_ecommerce/blob/main/repo%20resources/5.jpg?raw=true" width="250"/>
  <img src = "https://github.com/mrcodefrost/kriminal_fashion_ecommerce/blob/main/repo%20resources/6.jpg?raw=true" width="250"/>
  <img src = "https://github.com/mrcodefrost/kriminal_fashion_ecommerce/blob/main/repo%20resources/7.jpg?raw=true" width="250"/>
  
</div>

### Features

- **Product Management:** Add, update, and remove products from the Kriminal catalog.
- **Order Management:** View and manage orders placed by customers.
- **Authentication:** Secure authentication using Firebase authentication.
- **Database:** Firestore database for storing product and order information.
- **Single Vendor:** Currently supports only one vendor.
- **Product Customization:** Customize product details, images, and descriptions during product addition.

### Usage
- Log in to the admin panel using your Firebase credentials.
- Add, update, or remove products from the dashboard.
- Manage orders placed by customers.

### Platforms

- Android
- iOS
- Web

### Technologies Used

- Flutter
- Firebase

### Installation

1. Clone the repository to your local machine:

 ```bash
   git clone https://github.com/mrcodefrost/kriminal_fashion_client.git
 ```

2. Navigate to the project directory:

 ```bash
   cd kriminal_fashion_client
 ```

3. Install dependencies by running this command in IDE terminal:

 ```bash
   flutter pub get
 ```

4. Set up Firebase:

If you haven't already, [sign in to your Firebase account](https://firebase.google.com/docs/web/setup).
Install Firebase CLI globally using IDE Terminal:
 ```bash
   npm install -g firebase-tools
 ```
Log in to Firebase
 ```bash
   firebase login
 ```

Activate Flutterfire CLI
 ```bash
   flutter pub global activate flutterfire_cli
 ```

5. Generate Model files by running this command

 ```bash
  dart run build_runner build --delete-conflicting-outputs
 ```

6. You can delete the model files if required by running this command

 ```bash
  dart run build_runner build clean
 ```

### Configuration

1. Create a `firebase.json` file in the root directory of your project

2. Copy and paste the following configuration into the `firebase.json` file

```json
{
  "hosting": {
     "target": "business",
    "public":  "build/web",
    "ignore": [
      "firebase.json",
      "**/.*",
      "**/node_modules/**"
    ]
  }
}
```

### License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).

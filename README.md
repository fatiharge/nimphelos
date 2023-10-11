# Nimphelos Package

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg?cacheSeconds=2592000)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Nimphelos is a class that provides methods for managing service calls and handling exceptions. It
can handle common errors like Dio and JSON errors. Additionally, it offers a flexible structure to
add custom exception handlers. The package is used to facilitate error handling and network client
operations in Flutter applications.

## Usage

```dart
NimphelosModel res = await nimphelos.fetchData<String>(
  response: () async {
    return (await dio.get("/welcome/test200")).data;
  },
);
```

### Error Messages

If the service does not work successfully, thanks to this package, you will see a warning (alert) 
box on your screen. An example of this warning is as follows:


![example_error](https://raw.githubusercontent.com/fatiharge/nimphelos/main/assets/example_error.png)

If you want to use this feature, don't forget to add the context parameter. Also, the activeAlert 
value is true by default. If you want to disable this feature, you should set it to false.

```dart
NimphelosModel res = await nimphelos.fetchData<String>(
  response: () async {
    return (await dio.get("/welcome/test200")).data;
  },
  context: context,
  activeAlert: true,
);
```

Below are default messages for errors created for certain situations.

### exceptionDioHandlers

#### connectionTimeout
title: "Connection Timeout"
message: "The connection timed out. Please try again."

#### sendTimeout
title: "Send Timeout"
message: "Sending data timed out. Please try again."

#### receiveTimeout
title: "Receive Timeout"
message: "Receiving data timed out. Please try again."

#### badCertificate
title: "Invalid Certificate"
message: "The server's certificate is invalid. Please connect to a secure network for
communication."

#### badResponse
title: "Bad Response"
message: "A bad response was received from the server."

#### cancel
title: "Cancelled"
message: "The operation was cancelled."

#### connectionError
title: "Connection Error"
message: "A connection error occurred. Please check your network connection."

#### unknown error
title: "Unknown Error"
message: "An unexpected error occurred."

### exceptionJsonHandlers

#### UnsupportedObject
title: "UnsupportedObject Error"
message: "An UnsupportedObject error occurred."

### exceptionFormatHandlers

#### FormatException
title: "FormatException Error"
message: "An FormatException error occurred."

### exceptionHandlers

#### unknown error
title: "Unknown Error"
message: "An unexpected error occurred."

### Custom Error Messages
If you don't like the default alert message, you can customize these messages according to your 
application. For example, if you encounter a badCertificate error, you just need to make the 
following addition:

```dart
NimphelosModel res = await nimphelos.fetchData<String>(
  response: () async {
    return (await dio.get("/welcome/test200")).data;
  },
  context: context,
  activeAlert: true,
  exceptionDioHandlers: DioExceptionHandlerModel(
    badCertificateModel:  ExceptionExplanationModel("Custom title","Custom content","Custom button"),
  ),
);
```

### Custom Error Action

If you need to perform more complex operations in case of an error, you can add your own function. 
For example, if you want to print a message to the console for the connectionError, just add the 
following:

```dart
NimphelosModel res = await nimphelos.fetchData<String>(
  response: () async {
    return (await dio.get("/welcome/test200")).data;
  },
  context: context,
  activeAlert: true,
  exceptionDioHandlers: DioExceptionHandlerModel(
    badCertificateModel:  ExceptionExplanationModel("Custom title","Custom content","Custom button"),
    connectionError: (exception) {
        print("Custom action");
    },
  ),
);
```

In this case, the default alert code will not run, and your custom code will take effect.

### willAlwaysWork Action


If you need to perform operations different from UI tasks, such as logging in case of an error, 
you may want to access the relevant Exception independently from these situations. You can see the
example usage below. The activeWillAlwaysWork parameter must be set to true. Its default value is 
true.


```dart
NimphelosModel res = await nimphelos.fetchData<String>(
  response: () async {
    return (await dio.get("/welcome/test200")).data;
  },
  context: context,
  activeAlert: true,
  exceptionDioHandlers: DioExceptionHandlerModel(
    badCertificateModel:  ExceptionExplanationModel("Custom title","Custom content","Custom button"),
    connectionError: (exception) {
        print("Custom action");
    },
    willAlwaysWork: <E>(exception) {
       print("willAlwaysWork....");
    },
  ),
);
```

### General Function

If you want to take the same action for all errors, do not include the context and use the generalFunction.


```dart
NimphelosModel res = await nimphelos.fetchData<String>(
  response: () async {
    return (await dio.get("/welcome/test200")).data;
  },
  activeAlert: true,
  generalFunction: <E>(exception) {
    print("generalFunction");
    return true;
  },
);
```

## API Reference

For detailed information about the available methods, check out
the [API Reference](https://fatiharge.github.io/nimphelos/).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Nimphelos: The Jewel of Middle-earth

The name Nimphelos is chosen in homage to the legendary author J.R.R. Tolkien's Middle-earth
universe. This unique name represents a captivating jewel believed to be even larger than a pigeon's
egg. Discovered by the Falathrim people on the shores of Balar Island, this gem holds a special
place in the lore of Middle-earth.

Just as Mazarbul serves as a ledger in the mythological tales of Middle-earth, Nimphelos stands as a
prominent and unforgettable element in Tolkien's imaginative world. This package is designed not
only to manage service calls and handle exceptions but also to embody the enchanting ambiance of
Middle-earth.

Nimphelos is more than just a package; it's a tribute to the rich legacy of J.R.R. Tolkien's works,
and it follows in the footsteps of this captivating world with the values it provides.

![Nimphelos](https://raw.githubusercontent.com/fatiharge/nimphelos/main/assets/img.png)

## Fatiharge

Bu proje [Fatih Ar-Ge](https://www.fatiharge.com) tarafından geliştirilmiştir. Bu paket, hizmet
çağrılarını yönetmek ve istisnaları ele almak için kullanılır. Özellikle, Dio, JSON ve Format
istisnalarını işlemek için hazır çözümler sunar. Bu sayede uygulamalarınızda daha güvenilir hata
yönetimi yapabilirsiniz. Ayrıca, hızlı ve kolay veri alışverişi için tasarlanmıştır. "Nimphelos"
paket adı, Orta Dünya'nın zengin mitolojisinden ilham alarak seçilmiş olup, J.R.R. Tolkien'in büyük
eserine saygıdır.

This project is proudly developed by [Fatih Ar-Ge](https://www.fatiharge.com) It is used to manage
service calls and handle exceptions. Specifically, it provides ready-made solutions for dealing with
Dio, JSON, and Format exceptions. This allows for more reliable error handling in your applications.
Additionally, it is designed for fast and easy data exchange. The package name "Nimphelos" is chosen
in homage to the rich mythology of Middle-earth, showing respect to the great work of J.R.R.
Tolkien.
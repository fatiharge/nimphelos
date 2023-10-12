// Adding necessary libraries
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nimphelos/model/dio_exception_handler_model.dart';
import 'package:nimphelos/model/exception_explanation_model.dart';
import 'package:nimphelos/model/nimphelos_model.dart';
import 'package:nimphelos/nimphelos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TestWidget(),
    );
  }
}

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  final nimphelos = Nimphelos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nimphelos Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Button for a successful example
            successExampleButton(context),
            // Button for an error example
            errorButton(context),
            // Button for custom error message
            customErrorButton(context),
            // Button for custom error action
            customErrorActionButton(context),
            // Button for general function action
            generalFunctionButton(context),
            // Button for willAlwaysWork action
            willAlwaysWorkAction(context),
          ],
        ),
      ),
    );
  }

  ElevatedButton willAlwaysWorkAction(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await nimphelos.fetchData<Map<String, dynamic>>(
          response: () async {
            return (await Dio().get("https://jsonplaceholders.typicode.com/posts/1")).data;
          },
          context: context,
          activeAlert: true,
          willAlwaysWork: <E>(exception) {
            debugPrint("Log ....");
            debugPrint(exception.toString());
          },
        );
      },
      child: const Text('willAlwaysWork Action'),
    );
  }

  ElevatedButton generalFunctionButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await nimphelos.fetchData<Map<String, dynamic>>(
            response: () async {
              return (await Dio().get("https://jsonplaceholders.typicode.com/posts/1")).data;
            },
            activeAlert: true,
            generalFunction: <E>(exception) {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return const SizedBox(
                    height: 200,
                    child: Center(
                      child: Text('General Action'),
                    ),
                  );
                },
              );
              return true;
            });
      },
      child: const Text('General Function'),
    );
  }

  ElevatedButton customErrorActionButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await nimphelos.fetchData<Map<String, dynamic>>(
          response: () async {
            return (await Dio().get("https://jsonplaceholders.typicode.com/posts/1")).data;
          },
          context: context,
          activeAlert: true,
          exceptionDioHandlers: DioExceptionHandlerModel(
            connectionError: (exception) {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return const SizedBox(
                    height: 200,
                    child: Center(
                      child: Text('Error Custom Action'),
                    ),
                  );
                },
              );
              return true;
            },
          ),
        );
      },
      child: const Text('Error Custom Action'),
    );
  }

  ElevatedButton customErrorButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await nimphelos.fetchData<Map<String, dynamic>>(
          response: () async {
            return (await Dio().get("https://jsonplaceholders.typicode.com/posts/1")).data;
          },
          context: context,
          activeAlert: true,
          exceptionDioHandlers: DioExceptionHandlerModel(
            connectionErrorModel: ExceptionExplanationModel("custom title", "custom content", "Close"),
          ),
        );
      },
      child: const Text('Error Custom Message'),
    );
  }

  ElevatedButton errorButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await nimphelos.fetchData<Map<String, dynamic>>(
          response: () async {
            return (await Dio().get("https://jsonplaceholder.stypicode.com/posts/1")).data;
          },
          context: context,
          activeAlert: true,
        );
      },
      child: const Text('Error'),
    );
  }

  ElevatedButton successExampleButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        NimphelosModel res = await nimphelos.fetchData<Map<String, dynamic>>(
          response: () async {
            return (await Dio().get("https://jsonplaceholder.typicode.com/posts/1")).data;
          },
          context: context,
          activeAlert: true,
        );
        Future.microtask(() {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Success Response'),
                content: Text(res.object.toString()),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close'),
                  ),
                ],
              );
            },
          );
        });
      },
      child: const Text('Success'),
    );
  }
}

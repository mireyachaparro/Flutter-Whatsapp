import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
        title: 'Yes No App',
        debugShowCheckedModeBanner: false,
        //tema: cini queremos que luzcan los appsbar por defecto, los scaffolds, los filledbutton, los textos, estilos...
        theme: AppTheme(selectedColor: 1).theme(),
        // home: Scaffold(
        //   appBar: AppBar(
        //     title: const Text('Material App Bar'),
        //   ),
        //   body: Center(
        //     child: FilledButton(onPressed: (){}, child: const Text('Click me')),
        //   ),
        // ),
        home: const ChatScreen()
      ),
    );
  }
}
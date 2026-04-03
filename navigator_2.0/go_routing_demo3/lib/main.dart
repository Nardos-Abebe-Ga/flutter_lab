import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


void main() => runApp(const MyApp());
final _router = GoRouter(
  routes: [
    GoRoute(path: '/',
    name: 'home',
     builder: (_,_ ) => const HomeScreen()),
    GoRoute(
      path: '/details',
      name: 'details',
      builder: (_ , _) => const DetailsScreen(),
    ),
   
    ],
);
class ProductDetailsScreen extends StatelessWidget{
  final String id;
  final String filter;
  const ProductDetailsScreen({
    super.key,
    required this.id,
    required this.filter,
  });
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Product $id')) ,
      body: Center(child: Text('showing product $id\nFilter: $filter')),);
  }
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      title:'go_router Lesson 1',
      routerConfig: _router,
      debugShowCheckedModeBanner:false,);
  }
}
class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:const Text('Home')) ,
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.goNamed('details'),
          child: const Text('Go To Details') ,) ,),);
  }
}
class DetailsScreen extends StatelessWidget{
  const DetailsScreen({super.key});
  @override
  Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(title: const Text('Details')),
    body: const Center(child: Text('This is the details screen!')),
  );
}
}


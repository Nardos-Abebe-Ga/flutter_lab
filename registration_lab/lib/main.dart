import 'package:flutter/material.dart';
void main() => runApp(const RegistrationApp());
class RegistrationApp extends StatelessWidget{
  const RegistrationApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
       title: 'Registration Form',
       theme: ThemeData(primarySwatch: Colors.deepPurple),
       home: const RegistrationScreen(),);
  }
}
class RegistrationScreen extends StatefulWidget{
  const RegistrationScreen({super.key});
  @override
  State<RegistrationScreen> createState() => RegistrationScreenState();
}
class RegistrationScreenState extends State<RegistrationScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  void dispose(){
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  void submitForm(){
    if ( formKey.currentState!.validate()){
      showDialog(
         context: context,
         builder: (context) => AlertDialog(
          title: const Text('Registration Successful'),
          content: Text('Welcome, ${ nameController.text}!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
             child: const Text('OK'), ),
          ],
         ) ,
         );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body:Padding(
        padding:const EdgeInsets.all(16.0) ,
        child: Form(
          key: formKey,
          child: Column(
            children:[
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                   labelText: 'Full Name',
                   border: OutlineInputBorder(),
                   prefixIcon: Icon(Icons.person),),
                   validator: (value) {
                    if (value == null || value.isEmpty){
                      return 'please enter your name';
                    }
                    return null;
                   },),
                 const SizedBox(height: 12),
              TextFormField( controller: emailController,
                decoration: const InputDecoration(
                   labelText: 'Email',
                   border: OutlineInputBorder(),
                   prefixIcon: Icon(Icons.email),),
                   validator: (value) {
                    if (value == null || value.isEmpty){
                      return 'please enter an email';
                    }
                    if ( !value.contains('@')){
                      return ' Please enter a valid email';
                    }
                    return null;
                   },),
                 const SizedBox(height: 12),
               TextFormField(
                 controller: passwordController,
                decoration: const InputDecoration(
                   labelText: 'Password',
                   border: OutlineInputBorder(),
                   prefixIcon: Icon(Icons.lock),),
                   validator: (value) {
                    if (value == null || value.isEmpty){
                      return 'please enter a password';
                    }
                    if (value.length < 6){
                      return 'password must be at least 6 characters';
                    }
                    return null;
                   },),
                 const SizedBox(height: 12),
              TextFormField(
                 controller: confirmPasswordController,
                 obscureText: true,
                decoration: const InputDecoration(
                   labelText: 'Confirm Password',
                   border: OutlineInputBorder(),
                   prefixIcon: Icon(Icons.lock_outline),),
                   validator: (value) {
                    if (value != passwordController.text){
                      return 'Passwords do not match';
                    }
                    return null;
                   },),
                 const SizedBox(height: 24),
                 ElevatedButton(
                  onPressed: submitForm,
                  child: const Text('Register'),
                 ),
            ] ,),),),);
          
  }
}
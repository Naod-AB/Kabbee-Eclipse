void main() {
//Variable declare and print

  /*int age = 28;
  print(age);
*/

  //For loop

/*for (int i = 0; i < 5; i++) {
    print('hello ${i + 1}');
  }*/

  //Calling Function
/* String greet = greeting();
  print(greet);*/

//Lists
/*List <String> names = ['Hello',"There", "world"];
  names.add("Order");
  names.remove("There");
  print (names);
*/

//Creating object and initializing it
  /*User student = User(); //create object by Intializing a class or
  print(student.age);
  student.login();*/
}

//Functions
/*
String greeting() {
  return 'Hello';
}
//Arrow Function
String greeting()=>”Hello”;*/

//Creating Class
/*
class User {
  String username = "Mario";
  int age = 25;

  void login() {
    print("$username logged in");
  }
}*/

/* dynamic object 
void main() {
  
  User student = User("Mark", 38); //create object by Intializing a class or
  User student2 = User("Mona", 23);
  
  print (student.name);
  student.login();
  
  print(student2.name);
  student2.login();
  
  //Creating the Super user object and intializing it
  SuperUser superstudent = SuperUser("vincent", 25);
  print (superstudent.name);
  print (superstudent.age);
  superstudent.login();
  superstudent.publish();
}


//Creating Class


class User {
  //We can't declare an empty variable
  String name = "";
  int age = 0;
  
  //Constructor
  User(String names, int ages ){
    // it works also without the keyword 'this', but the upper namme and the lower names should be either both name or names
    this.name = names;
    this.age = ages;
    
  }
  
  void login(){
    print ("$name logged in");
  }
}
//Inheritance
class SuperUser extends User {
  
  //Constructor
  SuperUser (String sname, int sage) : 
  // Super gets the variables username and age from the user class
  super (sname, sage);
  
  void publish(){
    print ("Published update");
  }
}

*/

//Material APP
/**
void main() => runApp(const MaterialApp(
      home: Text("Hey Everyone"),
    ));
     */

/* Text widget 
 body: const Center(
        child: Text("Welcome Everyone",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.grey,
              fontFamily: 'IndieFlower',
              //color: Colors.grey[600],
            )),
      ),
 */

/* Image Widget
image: NetworkImage(
                'https://images.unsplash.com/photo-1516339901601-2e1b62dc0c45?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=371&q=80')),
 image: AssetImage("images/Meditate.jpg"),
child: Image.asset('images/Meditate.jpg'),

 */
/*pubspec.yaml
fonts
images
*/

/*Icons
  child: Icon(
          Icons.airport_shuttle,
          color: Colors.lightBlue,
          size: 50.0,
        ),

 */

/** Buttons
   child: ElevatedButton(
          onPressed: () {},
          child: const Text('Click me'),
          color: Colors.lightBlue,
        ),

Button that changes background and text color
        child: ElevatedButton(
          onPressed: () {
            print('Buton clicked');
          },
          child: const Text('Click me'),
          style: ElevatedButton.styleFrom(
            primary: Colors.lightBlue, //change background color of button
            onPrimary: Colors.white, //change text color of button
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
 */

/* Button with Icon
 child: ElevatedButton.icon(
          onPressed: () {
            print('Buton clicked');
          },
          icon: const Icon(Icons.mail),
          label: const Text('Mail me'),
          // color : Colors.amber;
        ), */


  /*Icon Button 
  body: Center(
          child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.alternate_email),
        color: Colors.amber,
      )),
  */
  /*Container, Margin and Padding
  body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        margin: const EdgeInsets.all(30.0),
        color: Colors.grey[400],
        child: const Text('Hello'),
      ),
  */
  
  /* Padding Widget
   body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        child: Text('Hello'),
      ),
   */


  /*Row Widget
  body: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceEvenly, // space between widgets horizontally
        // space between widgets vertically // end aligns the widgets with the highest widget
        crossAxisAlignment: CrossAxisAlignment.end,

        children: [
          // ignore: prefer_const_constructors
          Text('Hello Everyone'),
          TextButton(
            onPressed: () {},
            child: const Text('Click me'),
          ),
          Container(
            color: Colors.cyan,
            padding: const EdgeInsets.all(30.0),
            child: const Text('Inside Container'),
          )
        ],
      ),
   */

  /*Column Widget
  body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            color: Colors.cyan,
            child: const Text('One'),
          ),
          Container(
            padding: const EdgeInsets.all(30.0),
            color: Colors.pinkAccent,
            child: const Text('Two'),
          ),
          Container(
            padding: const EdgeInsets.all(40.0),
            color: Colors.amber,
            child: const Text('Three'),
          )
        ],
      ),
   */


  /* Column and rows
        body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: const [
              Text('Hello'),
              Text('There'),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            color: Colors.cyan,
            child: const Text('One'),
          ),
          Container(
            padding: const EdgeInsets.all(30.0),
            color: Colors.pinkAccent,
            child: const Text('Two'),
          ),
          Container(
            padding: const EdgeInsets.all(40.0),
            color: Colors.amber,
            child: const Text('Three'),
          )
        ],
      ),

  */

  /*Expanded Widget with image and flex value 
  body: Row(
        children: [
          Expanded(
            child: Image.asset('images/Meditate.jpg'),
            flex: 3,
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(30.0),
              color: Colors.cyan,
              child: const Text("1"),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(30.0),
              color: Colors.pinkAccent,
              child: const Text("2"),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(30.0),
              color: Colors.amber,
              child: const Text("3"),
            ),
          )
        ],
      ),
   */
  

  /*ID Project */
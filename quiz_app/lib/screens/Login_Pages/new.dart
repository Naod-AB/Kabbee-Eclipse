/*import 'package:flutter/material.dart';

import '../pallete.dart';

class Genders extends StatefulWidget {
  const Genders({Key? key}) : super(key: key);
  /*const Genders({
    required this.gendername,
    Key? key,
  }) : super(key: key);
  final String gendername;*/
  @override
  State<Genders> createState() => _GendersState();
}

class _GendersState extends State<Genders> {
  final List<bool> _selections = List.generate(2, (index) => false);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.08,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.grey[500]!.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Gender',
                        style: kBodyText,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 276),
                        child: Container(
                          //height: 0.01,
                          //width: 0.01,
                          decoration: BoxDecoration(
                            color: kWhite,
                          ),
                          child: ToggleButtons(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  //gendername,
                                  'Female',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: kblack,
                                      //backgroundColor: kWhite,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Male',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: kblack,
                                      //backgroundColor: kWhite,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                            isSelected: _selections,
                            onPressed: (int index) {
                              setState(() {
                                // _selections[index] = !_selections[index];
                                for (int i = 0; i < _selections.length; i++) {
                                  _selections[i] = i == index;
                                }
                              });
                            },
                            color: Colors.black,
                            fillColor: kblue,
                            renderBorder: false,
                            //borderRadius: BorderRadius.circular(10),
                            borderWidth: 3,
                            borderColor: kblack,
                            selectedBorderColor: kblue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/

/*import 'package:flutter/material.dart';

class CheckBox1 extends StatefulWidget {
  const CheckBox1({Key? key}) : super(key: key);

  @override
  State<CheckBox1> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox1> {
  bool value = false;
  @override
  Widget build(BuildContext context) => Scaffold(
        body: ListView(
          children: [
            buildCheckbox(),
          ],
        ),
      );
     Widget buildCheckbox() => ListTile(
       CheckBox1(
             value: value,
             onChanged: (value) {
              setState(() {
                this.value = value;
             });
          
        },
      ),

     );
            
}*/

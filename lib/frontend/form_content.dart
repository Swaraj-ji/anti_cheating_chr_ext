import 'package:anti_cheating/backend/upload_image.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:anti_cheating/frontend/camera_utils.dart';

class FormContent extends StatefulWidget {
  @override
  State<FormContent> createState() => _FormContentState();
}

class _FormContentState extends State<FormContent> {
  final _formKey = GlobalKey<FormState>();
  Color camIsOffColor = Color(0xEAEC899A);
  Color camIsOnColor = Color(0xEAA6EC9B);
  Color submitButtonOffColor = Color(0xF2ADABAB);
  Color submitButtonOnColor = Colors.blueGrey.shade900;
  bool checkCamButtonClicked = false;
  var image;
  var email, name, first_name, last_name, phone, test_duration;
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController testDurationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              icon: Icon(Icons.mail),
              border: UnderlineInputBorder(),
              labelText: 'Enter your Email',
            ),
            onChanged: (val) {
              setState(() {
                email = val;
              });
            },
            validator: (value) {
              String txt = emailController.text;
              if (email.isEmpty) {
                return 'Enter a proper email';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 40,
          ),
          TextFormField(
            controller: firstNameController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              icon: Icon(Icons.person),
              labelText: 'Enter your First Name',
            ),
            onChanged: (val) {
              setState(() {
                first_name = val;
              });
            },
            validator: (value) {
              String txt = firstNameController.text;
              if (first_name.isEmpty) {
                return 'Enter a proper first name';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 40,
          ),
          TextFormField(
            controller: lastNameController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              icon: Icon(Icons.drive_file_rename_outline),
              labelText: 'Enter your Last Name',
            ),
            onChanged: (val) {
              setState(() {
                last_name = val;
              });
            },
            validator: (value) {
              String txt = lastNameController.text;
              if (last_name.isEmpty) {
                return 'Enter a proper last name';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 40,
          ),
          TextFormField(
            controller: phoneNumberController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              icon: Icon(Icons.phone),
              labelText: 'Enter your Phone No.',
            ),
            onChanged: (val) {
              setState(() {
                phone = val;
              });
            },
            validator: (value) {
              String txt = phoneNumberController.text;
              if (phone.isEmpty) {
                return 'Enter a proper phone number';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 40,
          ),
          TextFormField(
            controller: testDurationController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              icon: Icon(Icons.timer_rounded),
              labelText: 'Enter Test Duration in minutes.',
            ),
            onChanged: (val) {
              setState(() {
                test_duration = val;
              });
            },
            validator: (value) {
              String txt = testDurationController.text;
              if (test_duration.isEmpty) {
                return 'Enter a proper test duration';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            height: 0.5 * (MediaQuery.of(context).size.height),
            width: 0.5 * (MediaQuery.of(context).size.width),
            child: checkCamButtonClicked ? CameraApp() : GreyScreen(),
          ),
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blueGrey.shade900),
                ),
                onPressed: () async {
                  cameras = await availableCameras();
                  checkCamButtonClicked = true;
                  setState(() {});
                },
                child: Text("Check WebCam"),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(camIsOffColor),
                ),
                onPressed: () {
                  setState(() {
                    if (checkCamButtonClicked) {
                      setState(() {
                        submitButtonOffColor = submitButtonOnColor;
                        camIsOffColor = camIsOnColor;
                      });
                    }
                  });
                },
                child: Text("Looks Good"),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(submitButtonOffColor),
                ),
                onPressed: () async {
                  if (checkCamButtonClicked) {
                    //  Submit function
                    String subFolderName = email;
                    print("sub folder ================================$email");
                    UploadImage obj = UploadImage(subFolder: subFolderName);
                    obj.capPicture();
                  }
                },
                child: Text("Submit"),
              )
            ],
          ),
        ],
      ),
    );
  }
}

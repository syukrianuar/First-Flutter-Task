import 'package:flutter/material.dart';
import 'package:fluttertraining/model/login_model.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObsecure=true;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState>globalFormKey = new GlobalKey<FormState>();
  final passwordValidator = MultiValidator(
    [RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password 8 setan'),]
  );
  late LoginRequestModel requestModel;
  @override
  void initState(){
    super.initState();
    requestModel = new LoginRequestModel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).hintColor.withOpacity(0.2),
                        offset: Offset(0,10),
                        blurRadius: 20),
                    ],
                  ),
                  child: Form(
                    key: globalFormKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 25,),
                        Text(
                          'Login', 
                          style: Theme.of(context).textTheme.headline2
                        ),
                        SizedBox(height: 20,),
                        new TextFormField(
                          //keyboardType: TextInputType.emailAddress,
                          onSaved: (input) => requestModel.email = input,
                          validator: EmailValidator(errorText: 'Salah gila'),
                          decoration: new InputDecoration(
                            hintText: "Email Address",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                .accentColor
                                .withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            prefixIcon: Icon(Icons.email,
                            color: Theme.of(context).accentColor)),
                        ),
                        new TextFormField(
                          obscureText: _isObsecure,
                          //keyboardType: TextInputType.emailAddress,
                          onSaved: (input) => requestModel.password = input,
                          validator: passwordValidator,
                          decoration: new InputDecoration(
                            hintText: "Password",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                .accentColor
                                .withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            prefixIcon: Icon(Icons.password,
                            color: Theme.of(context).accentColor)),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 80,
                          ),
                          onPressed: (){
                            if(validateAndSave()){
                              print(requestModel.tojson());
                            }
                          },
                          child: Text('Login', style: TextStyle(color: Colors.white),),
                          color: Theme.of(context).accentColor,
                          shape: StadiumBorder(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      
    );
  }

  bool validateAndSave(){
    final form = globalFormKey.currentState;
    if(form!.validate()){
      form.save();
      return true;
    }
    return false;
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
  ],
);

class GmailLogin extends StatefulWidget {
  final String buttonFirstTxt;
  final bool ishideButtons;

  GmailLogin({
    Key key,
    this.buttonFirstTxt,
    this.ishideButtons,
  }) : super(key: key);

  @override
  _GmailLoginState createState() => new _GmailLoginState();
}

class _GmailLoginState extends State<GmailLogin> {
  
  Future<void> _handleSignIn() async {
    try {
      _googleSignIn.signIn().then((result) {
        result.authentication.then((googleKey) {
          print("accessToken${googleKey.accessToken}");
          print("idToken >>>  ${googleKey.idToken}");
          print("displayName${_googleSignIn.currentUser.displayName}");
          print("email${_googleSignIn.currentUser.email}");
          print("photoUrl${_googleSignIn.currentUser.photoUrl}");
          print("id${_googleSignIn.currentUser.id}");
        });
      });
    } catch (error) {
      print('error occured ${error.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Visibility(
        child: GestureDetector(
          onTap: () {
            _handleSignIn();
            //          Navigator.pushNamedAndRemoveUntil(
            // context, '/homepage', ModalRoute.withName('/homepage'));
            // movetoHomePage();
          },
          child: Padding(
              padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
              child: Container(
                  height: 46.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: new BoxDecoration(
                    color: Colors.red,
                    border: new Border.all(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(23.0)),
                  ),
                  child: Center(
                    child: Text(
                      
                      widget.buttonFirstTxt,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat",
                          fontSize: 14.0),
                    ),
                  ))),
        ),
        visible: true,
      ),
    );
  }
}
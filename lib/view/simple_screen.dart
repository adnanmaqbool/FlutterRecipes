import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../res/components/round_button.dart';
import '../utils/Utils.dart';
import '../view_model/api_view_model.dart';

class SimpleScreen extends StatefulWidget {
  const SimpleScreen({super.key});

  @override
  State<SimpleScreen> createState() => _State();
}

class _State extends State<SimpleScreen> {
  @override
  Widget build(BuildContext context) {
    final apiViewModel = Provider.of<ApiViewModel>(context);

    return Scaffold(
      body: Center(
        child: Container(
          child: Center(
              child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              InkWell(
                  onTap: () {
                    Utils.showFlushBar("title", "message", context);
                  },
                  child: Text("First screen")),
              SizedBox(
                height: 200,
              ),
              apiViewModel.loading == true
                  ? CircularProgressIndicator()
                  : Container(),
              /*FutureBuilder(builder: (context,snapShot){
                return Text(apiViewModel.loginResp == null ? "No data" : apiViewModel.loginResp!.token.toString());
              }),*/
              RoundButton(
                title: apiViewModel.loginResp == null
                    ? "No data"
                    : apiViewModel.loginResp!.token.toString(),
                onPress: () {
                  Map data = {
                    "email": "eve.holt@reqres.in",
                    "password": "cityslicka"
                  };
                  apiViewModel.apiResponses(data);

                  // Navigator.pushNamed(context, RoutesName.detailRoute);
                },
              )
            ],
          )),
        ),
      ),
    );
  }
}

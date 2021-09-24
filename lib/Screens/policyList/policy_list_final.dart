

import 'package:insuranceproject2/Components/footer.dart';

import '../../API_Handler/api_handler_class.dart';
import '../../Components/buttons/functional_button.dart';
import '../../Components/custom_appbar.dart';
import '../../Components/rider_info.dart';
import '../../Components/benefit_details.dart';
import '../../Components/benefit_summary.dart';
import '../../Components/fund_summary_card.dart';
import '../../Models/user_models.dart';
import 'package:flutter/material.dart';

import '../otp_screen.dart';

class PolicyListFinalScreen extends StatelessWidget {
  FundSummary obj = FundSummary(5000, 10000, 15000, 20000);
  final dynamic object;
  PolicyListFinalScreen({this.object});
  ApiHandler _apiHandler = ApiHandler();
  PremiumInfo getRiderInfo(String policyNo) {
    return _apiHandler.getRiderInfo(policyNo);
  }

  createButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              color: Colors.purple[800],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
              },
              child: Text(
                'Pay Premium',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            RaisedButton(
              color: Colors.purple[800],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
              },
              child: Text(
                'Apply Loan',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [ RaisedButton(
            color: Colors.purple[800],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            onPressed: () {
            },
            child: Text(
              'Pay Top-Up',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
            RaisedButton(
              color: Colors.purple[800],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
              },
              child: Text(
                'Fund Switch',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Premium Details', '', '', Size.fromHeight(120)),
      body: Container(
        child: ListView(
          children: [
            RiderInfo(),
            BenefitSummaryCard(),
            BenefitDetailsCard(),
            FundSummaryCard(
              obj: obj,
            ),
            createButtons()
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(child: Container(child: Footer())),

    );
  }
}

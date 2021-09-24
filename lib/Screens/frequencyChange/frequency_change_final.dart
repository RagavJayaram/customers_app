import 'package:insuranceproject2/Components/footer.dart';

import '../../Components/buttons/cancel_button.dart';
import '../../Components/buttons/functional_button.dart';
import '../../Components/custom_appbar.dart';
import '../../Components/formCards/frequency_change_card.dart';
import '../../Components/policyListCards/bank_change_policy_card.dart';
import '../../Models/user_models.dart';
import 'package:flutter/material.dart';
import '../../Components/file_selector.dart';

class FrequencyChangeFinal extends StatefulWidget {
  @override
  _FrequencyChangeFinalState createState() => _FrequencyChangeFinalState();
}

class _FrequencyChangeFinalState extends State<FrequencyChangeFinal> {
  String option = 'Annual';
  int factor;
  double premium;
  bool isCalculated = false;
  BankChangeListClass bankChangeListClass = BankChangeListClass(
      policyNo: '34127AB87981454897',
      policyOwner: 'Mayank Patel',
      lifeAssured: 'Life Assured',
      policyStatus: 'Inactive',
      startDate: '26/5/2017',
      billingFrequency: 'Yearly',
      paidToDate: '29/09/2019',
      premiumPayingStatus: 'Pending');
  double getCurrentPremium(policyNo) {
    return 10000;
  }

  setFactor() {
    if (option == 'Annual') {
      setState(() {
        factor = 1;
      });
    } else if (option == 'Half Annual') {
      setState(() {
        factor = 2;
      });
    } else if (option == 'Quaterly') {
      setState(() {
        factor = 3;
      });
    } else {
      setState(() {
        factor = 4;
      });
    }
  }

  void setOption(String value) {
    setState(() {
      option = value;
    });
  }

  double calculatePremium() {
    setFactor();
    return this.premium =
        getCurrentPremium(bankChangeListClass.policyNo) / factor;
  }

  String giveText() {
    if (this.premium == null) return '   --   ';
    return this.premium.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Frequency Change', '', '', Size.fromHeight(100)),
      body: ListView(
        children: [
          Text(''),
          Container(
            width: 500,
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),

            child:Card(
              child:
              BankChangePolicyCard(
                bankChangeListClass: this.bankChangeListClass,
              ),
            )
          ),
      Container(
        width: 500,
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(3.0),

        child:  Card(
          child:FrequencyChangeCard(
            setOption: this.setOption,
          ) ,
        ) ,
      )

          ,
          Text(''),
          Card(
            child: Column(
              children: [
                Card(
                  color: Colors.white70,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: Text(
                            giveText(),
                            style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: Text(
                            'Revised',
                            style: TextStyle(color: Colors.blueGrey[700]),
                          ),
                        ),
                        Container(
                          child: Text(
                            'Premium',
                            style: TextStyle(color: Colors.blueGrey[700]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 140,
                  child: RaisedButton(
                    onPressed: () {
                      print('hi');
                      calculatePremium();
                    },
                    color: Colors.purple[800],
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text('Calculate Premium',style: TextStyle(fontSize:18,color: Colors.white),),
                    ),
                  ),
                ),
                FileSelector(),
                RaisedButton(
                  onPressed: () {
                  },
                  color: Colors.purple[800],
                  child: Text('Confirm',style: TextStyle(color: Colors.white),),

                ),
                CancelButton(),
              ],
            ) ,
          )

        ],
      ),
      bottomNavigationBar: BottomAppBar(child: Container(child: Footer())),

    );
  }
}

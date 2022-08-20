import 'package:flutter/material.dart';
import 'package:moneytress/data/dataController.dart';
import 'package:moneytress/model/moneyModel.dart';

class MoneyHomeView extends StatelessWidget {
  const MoneyHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MoneyHomePage(),
    );
  }
}

class MoneyHomePage extends StatefulWidget {
  const MoneyHomePage({Key? key}) : super(key: key);
  @override
  State<MoneyHomePage> createState() => _MoneyHomePageState();
}

class _MoneyHomePageState extends State<MoneyHomePage> {

  moneyModel model = moneyModel();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          children: [
            FutureBuilder<moneyModel?>(
              future: DataController().getMoney(),
              builder: (context, snapshot){

                if( snapshot.connectionState == ConnectionState.waiting ){
                  return CircularProgressIndicator();
                }
                if( snapshot.error == true){
                  return Text("Erro ao carregar");
                }

                model = snapshot.data ?? model;
                return Text(model.bTCBRL?.name ?? "");

                // Row(
                //   children: [
                //     Text("nome: ${model.bTCBRL.name}, preço: ${model.bTCBRL.varBid}"),
                //   ],
                // );
                
              }
            )
          ],
        ),
      ),
    );
  }
}

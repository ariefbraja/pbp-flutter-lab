import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/form.dart';

class BudgetDataPage extends StatefulWidget {
  const BudgetDataPage({super.key});

  @override
  State<BudgetDataPage> createState() => _BudgetDataPageState();
}

class _BudgetDataPageState extends State<BudgetDataPage> {
  int indexLength = CurrentData.getLength();
  List<String> judul = CurrentData.getJudul();
  List<String> nominal = CurrentData.getNominal();
  List<String> budget = CurrentData.getBudget();
  
  @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Data Budget'),
            ),
            drawer: const DrawerClass(),
            body: Form(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(child: Text('Data Budget')),
                        for (int i = 0; i < indexLength; i++) 
                        ListView(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          shrinkWrap: true,
                          children: [
                            const SizedBox(height: 20),
                            // Memunculkan informasi yang didapat dari form
                            Text( 
                              judul[i],
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              nominal[i],
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              budget[i],
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ]
                  ),
                ),
              ),
            ),
        );
    }
}
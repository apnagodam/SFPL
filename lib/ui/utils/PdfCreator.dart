import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:swfl/Data/Model/BnplStatementModel.dart';
import 'package:swfl/Data/SharedPrefs/SharedUtility.dart';

Future<File?> makePdf(
  List<StatementDatum>? invoice,
  List<StatementDatum>? localData,
  String opening,
  String closing,
  WidgetRef ref,
) async {
  final pdf = Document();
  int index = 0;
  final img = await rootBundle.load('assets/swfl.png');
  final imageBytes = img.buffer.asUint8List();
  Image image1 = Image(MemoryImage(imageBytes), width: 80, height: 80);

  

  pdf.addPage(
    MultiPage(
      maxPages: 100,
      header: (context) =>
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            image1,
            SizedBox(height: 10),
          ]),
          Container(
            alignment: Alignment.topCenter,
            padding:
                const EdgeInsets.only(left: 5.0, right: 5.0, top: 5, bottom: 5),
            decoration:
                BoxDecoration(border: Border.all(color: PdfColors.black)),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      "Name: ${ref.watch(sharedUtilityProvider).getUser()?.firmName ?? ""}",
                      style: TextStyle(fontSize: 10)),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      "Address: ${ref.watch(sharedUtilityProvider).getUser()?.address ?? ""}",
                      style: TextStyle(fontSize: 10)),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      "City: ${ref.watch(sharedUtilityProvider).getUser()?.address ?? ""}",
                      style: TextStyle(fontSize: 10)),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      "State: ${ref.watch(sharedUtilityProvider).getUser()?.state ?? ""}",
                      style: TextStyle(fontSize: 10)),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      "Phone: ${ref.watch(sharedUtilityProvider).getUser()?.phone ?? ""}",
                      style: TextStyle(fontSize: 10)),
                ),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //       "Email: ${ref.watch(sharedUtilityProvider).getUser()?.constitution ?? ""}",
                //       style: TextStyle(fontSize: 10)),
                // ),
              ],
            ),
          )
        ])),
        Expanded(
            child: Container(
          height: 150,
          padding:
              const EdgeInsets.only(left: 5.0, right: 5.0, top: 15, bottom: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    "BNPL Limit: ${ref.watch(sharedUtilityProvider).getMongoDbUser()?.power ?? ""}",
                    style: TextStyle(fontSize: 10)),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    "Collection Bank A/C: ${ref.watch(sharedUtilityProvider).getUser()?.bankAccNo ?? ""}",
                    style: TextStyle(fontSize: 10)),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    "Payment Bank A/C: ${ref.watch(sharedUtilityProvider).getUser()?.bankAccNo ?? ""}",
                    style: TextStyle(fontSize: 10)),
              ),
            ],
          ),
        )),
        SizedBox(height: 10),
      ]),
      footer: (context) =>
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
            'Singodwala Warehousing and Logistics Pvt. Ltd (registered office)',
            style: TextStyle(fontSize: 10)),
        Text('Juridiction Location : Jaipur, Rajasthan - 302019',
            style: TextStyle(fontSize: 10)),
      ]),
      build: (context) => <Widget>[
        Column(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text('Statement period:'),
            //     Text('Loan Account No.:'),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text('Name of Financier: Singodwala Fintech Pvt. Ltd.'),
            //   ],
            // ),

            Divider(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text('Product:Commodity Loan'),
            //   ],
            // ),
            // Divider(),

            Row(children: [
              Expanded(
                  child: Text("Summary",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center)),
            ]),
            Divider(),

            Table(border: TableBorder.all(color: PdfColors.black), children: [
              TableRow(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  decoration: BoxDecoration(color: PdfColors.black),
                  children: [
                    Expanded(
                      child: Text("S.No",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: PdfColors.white),
                          textAlign: TextAlign.center),
                    ),
                    Expanded(
                      child: Text("Narration",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: PdfColors.white),
                          textAlign: TextAlign.center),
                    ),
                    Expanded(
                        child: Text("Type",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: PdfColors.white),
                            textAlign: TextAlign.center)),
                    Expanded(
                        child: Text("Amount",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: PdfColors.white),
                            textAlign: TextAlign.center)),
                  ]),
              ...localData!.map((e) {
                index++;
                return TableRow(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$index',
                        ),
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${e.label.toString().isEmpty ? "--" : e.label}"),
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          e.type,
                        ),
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          num.parse(e.amount.toString()).toStringAsFixed(2),
                        ),
                      ]),
                ]);
              })
            ]),

            // ...summaryDatum!.map((e) {
            //   return Column(
            //     crossAxisAlignment: CrossAxisAlignment.stretch,
            //     children: [
            //       Container(
            //         margin: EdgeInsets.symmetric(vertical: 5),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           children: [
            //             Expanded(
            //               child: Text(
            //                   "${e.label.toString().isEmpty ? "--" : e.label.toString()}",
            //                   style: TextStyle(fontSize: 10),
            //                   textAlign: TextAlign.center),
            //             ),
            //             Expanded(
            //               child: Text("${e.type}",
            //                   style: TextStyle(fontSize: 10),
            //                   textAlign: TextAlign.center),
            //             ),
            //             Expanded(
            //               child: Text("${e.amount}",
            //                   style: TextStyle(fontSize: 10),
            //                   textAlign: TextAlign.center),
            //             ),
            //           ],
            //         ),
            //       ),
            //       Divider(height: 1, thickness: 1, color: PdfColors.grey800),
            //     ],
            //   );
            // }),
            Container(height: 20),
            Table(border: TableBorder.all(color: PdfColors.black), children: [
              TableRow(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  decoration: BoxDecoration(color: PdfColors.black),
                  children: [
                    Expanded(
                      child: Text("Opening Balance",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: PdfColors.white),
                          textAlign: TextAlign.center),
                    ),
                    Expanded(
                      child: Text("Closing Balance",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: PdfColors.white),
                          textAlign: TextAlign.center),
                    ),
                  ]),
              TableRow(children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        opening,
                      ),
                    ]),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        closing,
                      ),
                    ]),
              ])
            ]),

            Container(height: 20),

            Divider(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       "msg_opening_balance",
            //     ),

            //   ],
            // ),

            // Divider(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [

            //   ],
            // ),
            // Container(
            //   padding: const EdgeInsets.only(
            //       left: 10.0, right: 10.0, top: 10, bottom: 10),
            //   color: PdfColors.grey50,
            //   child: Column(
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text(
            //             "date",
            //           ),
            //           Row(
            //             children: [
            //               Text(
            //                 "debit",
            //                 style: TextStyle(
            //                     color: PdfColors.red,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //               Text(" / "),
            //               Text(
            //                 "msg_credit",
            //                 style: TextStyle(
            //                     color: PdfColors.green,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //             ],
            //           )
            //         ],
            //       ),
            //       SizedBox(
            //         height: 3,
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text(
            //             "msg_chequeno",
            //           ),
            //           Text(
            //             "msg_balance",
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
        // Row(
        //   children: [
        //     Expanded(
        //         child: Text(
        //       "date",
        //     )),
        //     Expanded(
        //         child: Text(
        //       "Narration",
        //     )),
        //     Expanded(
        //         child: Text(
        //       "Gatepass",
        //     )),
        //     Expanded(
        //         child: Text(
        //       "debit",
        //     )),
        //     Expanded(
        //         child: Text(
        //       "Credit",
        //     )),
        //     Expanded(
        //         child: Text(
        //       "Closing Balance",
        //     )),
        //     VerticalDivider(),
        //   ],
        // ),
        // Divider(),
        // ...invoice!.map((e) {
        //   ++index;
        //   DateTime abc = DateTime.parse(e.date.toString());
        //   var date = DateFormat('dd-MM-yyyy').format(abc);
        //   return Column(
        //     children: [
        //       Container(
        //         decoration: BoxDecoration(
        //             color:
        //                 index % 2 == 0 ? PdfColors.grey200 : PdfColors.white),
        //         child: Row(
        //           children: [
        //             Container(height: 50),
        //             Expanded(
        //               child: Text("${date}", style: TextStyle(fontSize: 10)),
        //               flex: 1,
        //             ),
        //             SizedBox(width: 5),
        //             Expanded(
        //               child: Text("${e.narration}",
        //                   style: TextStyle(fontSize: 10)),
        //               flex: 1,
        //             ),
        //             SizedBox(width: 5),
        //             Expanded(
        //               child: Text("${e.referenceNo}",
        //                   style: TextStyle(fontSize: 10)),
        //               flex: 1,
        //             ),
        //             SizedBox(width: 5),
        //             Expanded(
        //               child: Text(
        //                   "${e.type.toString().toLowerCase() == "debit" ? e.amount : ""}",
        //                   style: TextStyle(fontSize: 10)),
        //               flex: 1,
        //             ),
        //             SizedBox(width: 5),
        //             Expanded(
        //               child: Text(
        //                   "${e.type.toString().toLowerCase() == "credit" ? e.amount : ""}",
        //                   style: TextStyle(fontSize: 10)),
        //               flex: 1,
        //             ),
        //             SizedBox(width: 10),
        //             Expanded(
        //               child:
        //                   Text("${e.balance}", style: TextStyle(fontSize: 10)),
        //               flex: 1,
        //             ),
        //           ],
        //         ),
        //       ),
        //       Divider(height: 1, thickness: 1, color: PdfColors.grey800),
        //     ],
        //   );
        // }),
      ],
    ),
  );
  pdf.addPage(MultiPage(
    build: (context) => [
      // Row(
      //   children: [
      //     Expanded(
      //         child: Text(
      //       "date",
      //     )),
      //     Expanded(
      //         child: Text(
      //       "Narration",
      //     )),
      //     Expanded(
      //         child: Text(
      //       "Gatepass",
      //     )),
      //     Expanded(
      //         child: Text(
      //       "debit",
      //     )),
      //     Expanded(
      //         child: Text(
      //       "Credit",
      //     )),
      //     Expanded(
      //         child: Text(
      //       "Closing Balance",
      //     )),
      //     VerticalDivider(),
      //   ],
      // ),
      // Divider(),
      Table(border: TableBorder.all(color: PdfColors.black), children: [
        TableRow(
            verticalAlignment: TableCellVerticalAlignment.middle,
            decoration: BoxDecoration(color: PdfColors.black),
            children: [
              Expanded(
                child: Text("date",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: PdfColors.white),
                    textAlign: TextAlign.center),
              ),
              Expanded(
                  child: Text("Narration",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: PdfColors.white),
                      textAlign: TextAlign.center)),
              Expanded(
                  child: Text("Gatepass/Drf",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: PdfColors.white),
                      textAlign: TextAlign.center)),
              Expanded(
                  child: Text("debit",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: PdfColors.white),
                      textAlign: TextAlign.center)),
              Expanded(
                  child: Text("Credit",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: PdfColors.white),
                      textAlign: TextAlign.center)),
              Expanded(
                  child: Text("Closing Balance",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: PdfColors.white),
                      textAlign: TextAlign.center)),
            ]),
        ...invoice!.map((e) {
          DateTime parseDate =
              new DateFormat("yyyy-MM-dd HH:mm:ss").parse(e.date ?? "");
          var inputDate = DateTime.parse(parseDate.toString());
          var outputFormat = DateFormat('MM/dd/yyyy');
          var outputDate = outputFormat.format(inputDate);
          return TableRow(
              verticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                Expanded(
                  child: Text(e.date.toString().isEmpty ? "--" : outputDate,
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.center),
                  flex: 1,
                ),
                Expanded(
                  child: Text(
                      "${e.narration.toString().isEmpty ? "--" : e.narration}",
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.center),
                  flex: 1,
                ),
                Expanded(
                  child: Text(
                      "${e.reference.toString().isEmpty ? "--" : e.reference}",
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.center),
                  flex: 1,
                ),
                Expanded(
                  child: Text(
                      "${e.type.toString().toLowerCase() == "debit" ? e.amount : "--"}",
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.center),
                  flex: 1,
                ),
                Expanded(
                  child: Text(
                      "${e.type.toString().toLowerCase() == "credit" ? e.amount : "--"}",
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.center),
                  flex: 1,
                ),
                Expanded(
                  child: Text(
                      "${e.balance.toString().isEmpty ? "--" : e.balance}",
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.center),
                  flex: 1,
                ),
              ]);
        })
      ]),
      // ...invoice!.map((e) {
      //   ++index;
      //   DateTime abc = DateTime.parse(e.date.toString());
      //   var date = DateFormat('dd-MM-yyyy').format(abc);
      //   return Column(
      //     children: [
      //       Container(
      //         decoration: BoxDecoration(
      //             color: index % 2 == 0 ? PdfColors.grey200 : PdfColors.white),
      //         child: Row(
      //           children: [
      //             Container(height: 50),
      //             Expanded(
      //               child: Text("${date}", style: TextStyle(fontSize: 10)),
      //               flex: 1,
      //             ),
      //             SizedBox(width: 5),
      //             Expanded(
      //               child:
      //                   Text("${e.narration}", style: TextStyle(fontSize: 10)),
      //               flex: 1,
      //             ),
      //             SizedBox(width: 5),
      //             Expanded(
      //               child: Text("${e.referenceNo}",
      //                   style: TextStyle(fontSize: 10)),
      //               flex: 1,
      //             ),
      //             SizedBox(width: 5),
      //             Expanded(
      //               child: Text(
      //                   "${e.type.toString().toLowerCase() == "debit" ? e.amount : ""}",
      //                   style: TextStyle(fontSize: 10)),
      //               flex: 1,
      //             ),
      //             SizedBox(width: 5),
      //             Expanded(
      //               child: Text(
      //                   "${e.type.toString().toLowerCase() == "credit" ? e.amount : ""}",
      //                   style: TextStyle(fontSize: 10)),
      //               flex: 1,
      //             ),
      //             SizedBox(width: 10),
      //             Expanded(
      //               child: Text("${e.balance}", style: TextStyle(fontSize: 10)),
      //               flex: 1,
      //             ),
      //           ],
      //         ),
      //       ),
      //       Divider(height: 1, thickness: 1, color: PdfColors.grey800),
      //     ],
      //   );
      // }),
    ],
    footer: (context) =>
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Singodwala Warehousing and Logistics Pvt. Ltd (registered office)',
      ),
      Text(
        'Juridiction Location : Jaipur, Rajasthan - 302019',
      ),
    ]),
  ));
  final output = await getTemporaryDirectory();
  final file = File('${output.path}/wallet_statement.pdf');
  await file.writeAsBytes(await pdf.save());

  // Open the generated PDF using a package like `open_file`
  // Make sure to add the open_file package to your pubspec.yaml
  return file;
}

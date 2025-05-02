import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:sadakyatra/setups.dart' as pw;
import 'package:sadakyatra/setups.dart';

// String busName = "Rudraksha";
// String depthr = "08";
// String deptMin = "30";
// String userName = "sushant karn";
// String trnId = "1100gd";
// String contact = "9840171036";
// String price = "100";
// String totalAmount = "2000";
// int totalSeats = 5;
// String seatNo = "l1,l2";

builPrintableData(
        String name,
        String busName,
        String departureDate,
        String departureTime,
        String txn,
        String contact,
        String selectedList,
        int totalSeats,
        String amount) =>
    pw.Padding(
      padding: pw.EdgeInsets.all(8),
      child: pw.Column(
        children: [
          pw.SizedBox(
            height: 10,
          ),
          pw.Text(
            'Sadak Yatra',
            textAlign: pw.TextAlign.center,
            style: pw.TextStyle(
              color: PdfColor(0.2, 0.2, 0.2, 0.2),
              fontSize: 20,
            ),
          ),
          pw.SizedBox(height: 30),
          pw.Padding(
            padding: const pw.EdgeInsets.all(8.0),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  'Name',
                  style: pw.TextStyle(
                    color: PdfColor(0.2, 0.2, 0.2, 0.2),
                    fontSize: 20,
                  ),
                ),
                pw.Text(
                  'name',
                  style: pw.TextStyle(
                    color: PdfColor(0.2, 0.2, 0.2, 0.2),
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.all(8.0),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  'Bus name',
                  style: pw.TextStyle(
                    color: PdfColor(0.2, 0.2, 0.2, 0.2),
                    fontSize: 20,
                  ),
                ),
                pw.Text(
                  'busName',
                  style: pw.TextStyle(
                    color: PdfColor(0.2, 0.2, 0.2, 0.2),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.all(8.0),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  'Departure Time',
                  style: pw.TextStyle(
                    color: PdfColor(0.2, 0.2, 0.2, 0.2),
                    fontSize: 20,
                  ),
                ),
                pw.Text(
                  'departureTime',
                  style: pw.TextStyle(
                    color: PdfColor(0.2, 0.2, 0.2, 0.2),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.all(8.0),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  'Transaction Id',
                  style: pw.TextStyle(
                    color: PdfColor(0.2, 0.2, 0.2, 0.2),
                    fontSize: 20,
                  ),
                ),
                pw.Text(
                  'txn',
                  style: pw.TextStyle(
                    color: PdfColors.black,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.all(8.0),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  "Contact",
                  style: pw.TextStyle(
                    color: PdfColor(0.2, 0.2, 0.2, 0.2),
                    fontSize: 20,
                  ),
                ),
                pw.Text(
                  'contact',
                  style: pw.TextStyle(
                    color: PdfColor(0.2, 0.2, 0.2, 0.2),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.all(8.0),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  'Seat No',
                  style: pw.TextStyle(
                    color: PdfColor(0.2, 0.2, 0.2, 0.2),
                    fontSize: 20,
                  ),
                ),
                pw.Text(
                  'selectedList',
                  style: pw.TextStyle(
                    color: PdfColor(0.2, 0.2, 0.2, 0.2),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.all(8.0),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  'Total Seat',
                  style: pw.TextStyle(
                    color: PdfColor(0.2, 0.2, 0.2, 0.2),
                    fontSize: 20,
                  ),
                ),
                pw.Text(
                  'totalSeats',
                  style: pw.TextStyle(
                    color: PdfColor(0.2, 0.2, 0.2, 0.2),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.all(8.0),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  'Total Amount',
                  style: pw.TextStyle(
                    color: PdfColor(0.2, 0.2, 0.2, 0.2),
                    fontSize: 20,
                  ),
                ),
                pw.Text(
                  '$amount',
                  style: pw.TextStyle(
                    color: PdfColor(0.2, 0.2, 0.2, 0.2),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          pw.SizedBox(
            height: 60,
          ),
          pw.Text(
            "contact us: 9844499531",
            textAlign: pw.TextAlign.center,
            style: pw.TextStyle(
                fontSize: 15,
                fontWeight: pw.FontWeight.bold,
                color: PdfColor(0.2, 0.2, 0.2, 0.2)),
          ),
          pw.SizedBox(
            height: 20,
          ),
          pw.Container(
            decoration: pw.BoxDecoration(
              shape: pw.BoxShape.rectangle,
              borderRadius: pw.BorderRadius.circular(5),
              color: PdfColor(1, 1, 0, 0),
            ),
            child: pw.Padding(
              padding: const pw.EdgeInsets.all(8.0),
              child: pw.Text(
                'Disclaimer: Customer needs to show the ticket during travel',
                style: pw.TextStyle(fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );

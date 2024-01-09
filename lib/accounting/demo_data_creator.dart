import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

void main() async {
  await generateAndUploadDemoData();
}

Future<void> generateAndUploadDemoData() async {
  print("Demo verileri Firestore'a yükleniyor...");
  try {
    // Firestore bağlantısını başlat
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Belirli bir koleksiyona demo verileri eklemek için döngü
    for (int i = 0; i < 10; i++) {
      // Rastgele accountType seçimi
      List<String> accountTypes = ["Gelir", "Gider", "Alacak", "Borç"];
      String selectedAccountType =
          accountTypes[Random().nextInt(accountTypes.length)];

      // Rastgele amount seçimi (500 ile 7500 arasında)
      int randomAmount = Random().nextInt(7001) + 500;

      // Rastgele tarih ve saat seçimi (1 Aralık - 9 Ocak)
      DateTime startDate = DateTime(2023, 12, 1);
      DateTime endDate = DateTime(2024, 1, 9);
      Duration difference = endDate.difference(startDate);
      print("Difference: $difference");
      int randomDays = Random().nextInt(difference.inDays);
      DateTime randomDate = startDate
          .add(Duration(days: randomDays))
          .add(Duration(hours: Random().nextInt(24)))
          .add(Duration(minutes: Random().nextInt(60)))
          .add(Duration(seconds: Random().nextInt(60)))
          .add(Duration(milliseconds: Random().nextInt(1000)));
      // Rastgele description oluştur
      String description = generateDescription(selectedAccountType);

      // Firestore'a veriyi ekle
      await firestore.collection('accountLogs').add({
        'accountType': selectedAccountType,
        'amount': randomAmount,
        'date': Timestamp.fromMillisecondsSinceEpoch(
            randomDate.millisecondsSinceEpoch),
        'description': description,
      });

      String documentId =
          FirebaseFirestore.instance.collection('accountLogs').doc().id;

      await FirebaseFirestore.instance
          .collection('accountLogs')
          .doc(documentId)
          .set({
        'accountType': selectedAccountType,
        'amount': randomAmount.toDouble(),
        'date': Timestamp.fromMillisecondsSinceEpoch(
                randomDate.millisecondsSinceEpoch)
            .toString(),
        'description': description,
        'documentId': documentId,
      });

      if (kDebugMode) {
        print('Document created with id: $documentId');
      }
    }

    print('Demo verileri başarıyla Firestore\'a eklendi.');
  } catch (e) {
    print('Hata oluştu: $e');
  }
}

String generateDescription(String accountType) {
  // accountType'a göre özel description oluşturabilirsiniz
  switch (accountType) {
    case "Gelir":
      return "Maaş ödemesi";
    case "Gider":
      return "Fatura ödemesi";
    case "Alacak":
      return "Alacak tahsilatı";
    case "Borç":
      return "Borç ödemesi";
    default:
      return "Bilinmeyen işlem";
  }
}

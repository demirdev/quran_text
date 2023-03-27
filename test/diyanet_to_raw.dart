import 'dart:convert';
import 'dart:io';

import 'package:quran_text/quran_text.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

import 'diyanet_response.dart';

void main() {
  const saveToFileName = 'quran_diyanet.txt';
  test(
    'fetch quran from diyanet to saveToFileName',
    () async {
      const endpoint = 'https://kuran.diyanet.gov.tr/mushaf/qurandm/pagedata';

      final StringBuffer stringBuffer = StringBuffer();

      const startPage = 0; // 0
      const endPage = 604; // 604

      for (int id = startPage; id <= endPage; id++) {
        final uri =
            Uri.parse('$endpoint?id=$id&itf=0&iml=1&iqr=1&ml=5&ql=7&iar=0');
        final response = await http.get(uri);

        if (response.statusCode == HttpStatus.ok) {
          final dataMap = jsonDecode(response.body);
          final data = DiyanetResponse.fromJson(dataMap);

          final quranAyats = data.quranAyats ?? [];

          for (final quranAyat in quranAyats) {
            final ayetText = quranAyat.ayetText;
            final ayetId = quranAyat.ayetId;
            final sureId = quranAyat.sureId;
            stringBuffer.writeln('$sureId|$ayetId|$ayetText');
          }
          print('$id. page fetched successfully');
        } else {
          print('Error fetching page $id: ${response.reasonPhrase}');
        }
        await Future.delayed(const Duration(milliseconds: 100));
      }

      // expect(stringBuffer.toString().length, true);

      File('test/$saveToFileName').writeAsStringSync(stringBuffer.toString());
    },
  );

  test(
    'convert Quran text from txt to dart ',
    () async {
      StringBuffer stringBuffer = StringBuffer()..write('''const quranText = [
''');

      final allVerses =
          File('test/$saveToFileName').readAsStringSync().split('\n');
      // act
      for (var line in allVerses) {
        if (line.contains('بِسْمِ اللَّهِ الرَّحْمَـٰنِ الرَّحِيمِ ')) {
          line =
              line.replaceFirst('بِسْمِ اللَّهِ الرَّحْمَـٰنِ الرَّحِيمِ ', '');
          print('line: $line');
        }
        final parts = line.split('|');
        if (parts.length == 1) continue;
        stringBuffer.write('''
  {
    "surah_number": ${parts[0]},
    "verse_number": ${parts[1]},
    "content": "${parts[2]}"
  },''');
      }

      stringBuffer.write('''

];''');

      File('lib/quran_text.dart').writeAsStringSync(stringBuffer.toString());

      // assert
    },
  );

  test(
    'quranText to json',
    () async {
      // arrange
      JsonEncoder encoder = new JsonEncoder.withIndent('  ');

      File('test/quran_text.json')
          .writeAsStringSync(encoder.convert(quranText));

      // act

      // assert
    },
  );
}

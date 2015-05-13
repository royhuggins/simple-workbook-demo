import 'dart:html';
import 'dart:convert' show JSON;

//declare app's inputs
ButtonElement practiceSave;

//list locally-stored data keys
final String PRACTICE_DATA = 'practiceData';

void initPracticeNameModule() {
  practiceSave = querySelector('#practiceSave');
  practiceSave.onClick.listen(savePractice);
}

void savePractice(Event e) {
  var practiceName = querySelector('#practiceName');
  String jsonString = JSON.encode({"practiceName": practiceName.value});
  try {
    window.localStorage[PRACTICE_DATA] = jsonString;
    querySelector('#postPracticeSave').style.display = '';
  } catch (e) {
    window.alert('Error saving practice name: $e');
  }
}
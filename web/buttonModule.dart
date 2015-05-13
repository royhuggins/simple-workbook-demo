import 'dart:html';

//declare app's inputs
ButtonElement genButton;
var buttonClicked;

void initButtonModule() {
  genButton = querySelector('#generateButton');
  genButton.onClick.listen(toggleButton);
  buttonClicked = false;
}

void toggleButton(Event e) {
  if (buttonClicked) {
    genButton
      ..text = 'Do the thing!';
    buttonClicked = false;
  } else {
    genButton
      ..text = 'Nevermind';
    buttonClicked = true;
  }
}
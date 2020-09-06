extension NumberParsing on String {
  count(String a) {
    int count = 0;
    for (int i = 0; i < this.length; i++) {
      if (this[i] == a) count = count + 1;
    }
    return count;
  }

  makeFunky() {
    String result = '';
    for (int i = 0; i < this.length; i++) {
      final text = i % 2 == 0 ? this[i].toLowerCase() : this[i].toUpperCase();
      result = result + text;
    }
    return result;
  }
}

void main() {
  String myText = 'This is my string';

  print(myText.count('i'));
  print(myText.makeFunky());
}

## Extend your Futter code

Are you looking for an alternative to the nested widget structure of Flutter? Then extracting the widgets into a different method, can be a good solution. There is another solution or even this solution can work alongside the method extraction.

For this, we can leverage the power of the great Dart feature called Extension which is introduced in Dart 2.7.

### So, what is `extension` in Dart?
An extension is a way of adding additional functionality to your dart data types.

Let's take the `String` data type as an example.

```dart

String myString = 'Hello world!'

// here toUpperCase() is a method which can
// be applied to a String data type.
print(myString.toUpperCase())
```

Likewise, we can add our own methods to the data type.

We can create an extension for a datatype using the syntax:
```dart
extension StringExtend on String {
    // define methods here
}
```

And inside this, we can define the methods.

```dart

extension StringExtend on String {
  count(String a) {
    int count = 0;
    for (int i = 0; i < this.length; i++) {
      if (this[i] == a) count = count + 1;
    }
    return count;
  }
}

```

*Note: the variable in which the extension  method is called can be accessed inside the method using this keyword*

Here we have defined a simple method `count()` which takes a `String` as a parameter and returns the number occurrence of this string in the called String.

The whole code would look like this:
```dart

extension StringExtend on String {
  count(String a) {
    int count = 0;
    for (int i = 0; i < this.length; i++) {
      if (this[i] == a) count = count + 1;
    }
    return count;
  }
}

void main() {
  String myText = 'This is my string';

  // prints 3 in the console
  print(myText.count('i'));
}

```

Similarly, we can add other methods to the extension.

```dart
extension StringExtend on String {
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

  // prints 3 in the console
  print(myText.count('i'));
  // prints iHiS Is mY StTiNg
  print(myText.makeFunky());
}

```

Now we have a good understanding of the syntax of `extension` let's see how we can implement this in FLutter.

Since, everything is `Widget` in flutter. We can add extension to the `Widget` datatype. Or even an specific `Widget` such as `Text()` or `Container()`.

Let's create a flutter extension that changes the font size of a `Text()` widget.

**Without extension** the code would look something like this:

```dart
build() {
    return Text(
       'Hello world!',
       style: TextStyle(
         fontSize: 24,
        ),
    );
}
```

**With extension**
```dart
// first define the extension
extension TextModifier on Text {
  Text fontSize(double fontSize) {
    // if the Text() widget doesn't already have an style
    // just apply the fontSize
    if (this.style == null) {
      return Text(
        this.data,
        style: TextStyle(fontSize: fontSize),
      );
    }

    // if there is already an style applied to it
    // extend that style with fontSize
    return Text(
      this.data,
      style: this.style.copyWith(fontSize: fontSize),
    );
  }
}


// actual code implementation

build() {
    return Text('Hello World!').fontSize(24);
}
```

**SEE** how readable your code looks like?
Yes there is more boilerplate to define the extension, but that is something you have to do only once and only use it's fruits latter on while using the `Text()` widget.

Similarly, we can add methods to the extension to chain the methods.

```dart
// define extension

extension TextModifier on Text {
  Text color(Color color) {
    if (this.style == null) {
      return Text(
        this.data,
        style: TextStyle(color: color),
      );
    }
    return Text(
      this.data,
      style: this.style.copyWith(color: color),
    );
  }

  Text fontSize(double fontSize) {
    if (this.style == null) {
      return Text(
        this.data,
        style: TextStyle(fontSize: fontSize),
      );
    }

    return Text(
      this.data,
      style: this.style.copyWith(fontSize: fontSize),
    );
  }
}

// use the goodness
build() {
    return Text('Hello World!')
    .fontSize(24)
    .color(Colors.green);
}

```

**SEE** how readable the code looks like.

Let's see more examples

**Define the extension**

```dart
extension TextModifier on Text {
  Text color(Color color) {
    if (this.style == null) {
      return Text(
        this.data,
        style: TextStyle(color: color),
      );
    }
    return Text(
      this.data,
      style: this.style.copyWith(color: color),
    );
  }

  Text fontSize(double fontSize) {
    if (this.style == null) {
      return Text(
        this.data,
        style: TextStyle(fontSize: fontSize),
      );
    }

    return Text(
      this.data,
      style: this.style.copyWith(fontSize: fontSize),
    );
  }
}

extension WidgetModifier on Widget {
  Widget padding({horizontal, vertical}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      ),
      child: this,
    );
  }

  Widget background(Color color) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
      ),
      child: this,
    );
  }
}
```

**Without extension**

```dart
build(BuildContext context) {
    return Container(
      color: Colors.purple,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      child: Container(
        color: Colors.lightBlue,
        child: Text(
          'Hello, World!',
          style: TextStyle(
              color: Colors.purple,
              fontSize: 50.0,
            ),
        ),
      ),
    );
  }

```

**With extension**

```dart
build(BuildContext context) {
    return Text('Hello, World!')
        .color(Colors.purple)
        .fontSize(50.0)
        .background(Colors.lightBlue)
        .padding(horizontal: 10, vertical: 20)
        .background(Colors.purple)
  }

```
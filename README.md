# Comment That!

[Watch it in action here!](https://youtu.be/gTbSzw7v7Is)

A package for [Atom](https://atom.io/) that comments out selected text.

Just select a word or phrase and hit <kbd>Alt</kbd>+<kbd>Shift</kbd>+<kbd>C</kbd>

Feedback would be appreciated, as this is my first ever Atom package.

### Installation:

Open a terminal or console or shell, and type in `apm install comment-that`  
Alternatively, you can download the source code, `cd` into the download directory using a terminal, and run `apm link`. This will work because this package (currently) has no dependencies.

### Features so far:

* commenting (no way)
* place cursor at end of comment (or uncommented text) automatically
* support for every scope except for the ones listed in `unsupported.txt`.
* keyboard shortcut <kbd>Alt</kbd>+<kbd>Shift</kbd>+<kbd>C</kbd>
* uncommenting commented text (now, shortcut will toggle comment)
* hitting keyboard shortcut while not selecting any text will generate comment tags and place cursor in between the two

### In progress:

* issue with more than one cursor when no text selected

### Contributing

Anybody and everybody is welcome to contribute, either by submitting issues or by modifying or adding to the code. Feature suggestions are even more welcome, because I'm running short on ideas.

### License:

MIT

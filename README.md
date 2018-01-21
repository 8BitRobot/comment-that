# Comment That!

[Watch it in action here!](https://youtu.be/gTbSzw7v7Is)

A package for [Atom](https://atom.io/) that comments out selected text.

Just select a word or phrase and hit <kbd>Alt</kbd>+<kbd>Shift</kbd>+<kbd>C</kbd>

Feedback would be appreciated, as this is my first ever Atom package.

### Installation:

Open a terminal or console or shell, and type in `apm install comment-that`  
Alternatively, you can download the source code, `cd` into the download directory using a terminal, and run `apm link`. This will work because this package (currently) has no dependencies.

### Usage:

For best results, highlight all whitespace before the text you want to comment. To achieve this, you can either select the whitespace manually or click on the number of the row (essentially, selecting the entire line). Then, select only up to the end of the target text, making sure NOT to highlight any whitespace (this will cause you to also highlight the newline at the end and will result in an extra line in the comment). If you don't care, do whatever, but if you are really nitpicky on formatting, this is what you should do. I am currently working on fixing this so the formatting stays intact, but for now, do this.

### Features so far:

* commenting (no way)
* place cursor at end of comment (or uncommented text) automatically
* support for every scope except for the ones listed in `unsupported.txt`.
* keyboard shortcut <kbd>Alt</kbd>+<kbd>Shift</kbd>+<kbd>C</kbd>
* uncommenting commented text (now, shortcut will toggle comment)
* hitting keyboard shortcut while not selecting any text will generate comment tags and place cursor in between the two

### Contributing

Anybody and everybody is welcome to contribute, either by submitting issues or by modifying or adding to the code. Feature suggestions are even more welcome, because I'm running short on ideas.

### License:

MIT, see the LICENSE.md for more details

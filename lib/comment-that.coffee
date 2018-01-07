module.exports =
  activate: (state) ->
    atom.commands.add 'atom-workspace', 'comment-that:comment': => @comment()
  comment: ->
    if editor = atom.workspace.getActiveTextEditor()
      editor.getSelections().map((item) -> codeCommentToggler(editor, item))

codeCommentToggler = (editor, selection) ->
  text = selection.getText()
  commentFormats = commentFormatGenerator(editor.getGrammar().scopeName)
  openingComment = commentFormats[0]
  closingComment = commentFormats[1]
  separatedtext = text.split "\n"
  last = separatedtext.length - 1 #index of last element in separatedtext
  oCminusspace = separatedtext[0].replace /^\s+|\s+$/g, ""
  cCminusspace = separatedtext[last].replace /^\s+|\s+$/g, ""
  if openingComment == oCminusspace and closingComment == cCminusspace
    notcommentText = separatedtext.slice(1, (separatedtext.length - 1))
    notcommentJoined = notcommentText.join("")
    newText = notcommentJoined.replace(/(\n|\r)$/g, "")
    cursorRow = selection.getBufferRange().end.row - 2
    cursorCol = notcommentText[notcommentText.length - 1].length
  else 
    if openingComment == "unsup"
      atom.notifications.addError("This scope is not supported. If you know the format for comments in this scope, please consider creating an issue on the GitHub repository with the proper commenting format.")
      return 1
    newText = [openingComment, '\n', text, '\n', closingComment].join('')
    cursorRow = selection.getBufferRange().end.row + 2
    cursorCol = closingComment.length
  point = [cursorRow, cursorCol]
  selection.insertText(newText)
  selection.cursor.setBufferPosition(point)
commentFormatGenerator = (scope) ->
  triple_hash = ["source.coffee"]
  weird_arrows = ["text.html.basic", "source.gfm", "source.plist", "text.xml"]
  triple_apostrophe = ["source.python"]
  parentheses_comment = ["source.clojure"]
  equal_comment = ["source.perl"]
  equal_begin_end = ["source.ruby", "source.ruby.rails", "source.ruby.gemfile"]
  hash_backtick_brace = ["source.perl6"]
  colon_quote = ["source.shell"]
  unsupported1 = ["source.diff","source.gotemplate","source.java-properties","source.js.rails", "source.js.jquery","source.js.regexp","source.js.regexp.replacement","source.jsdoc","source.json","source.litcoffee","source.makefile","source.nant-build","source.regexp.python","source.ruby.rails.rjs","source.sql.mustache","source.sql.ruby","source.strings","source.toml","source.ts","source.tsx","source.yaml","text.git-commit","text.git-rebase"]
  unsupported2 = ["text.html.erb","text.html.gohtml","text.html.jsp","text.html.mustache","text.html.ruby","text.hyperlink","text.junit-test-report","text.plain.null-grammar","text.python.console","text.python.traceback","text.shell-session","text.todo","text.xml.plist","text.xml.xsl"]
  comments = [['<!--', '-->'],["'''", "'''"],["###", "###"],["(comment", ")"],["=thisiscomment", "=cut"],["#`{", "}"],["=begin", "=end"],[": '", "'"],["unsup", "unsup"], ["/*", "*/"]]
  returnCommentFormats = switch
    when scope in weird_arrows then comments[0]
    when scope in triple_apostrophe then comments[1]
    when scope in triple_hash then comments[2]
    when scope in parentheses_comment then comments[3]
    when scope in equal_comment then comments[4]
    when scope in hash_backtick_brace then comments[5]
    when scope in equal_begin_end then comments[6]
    when scope in colon_quote then comments[7]
    when scope in unsupported1 || scope in unsupported2 then comments[8]
    else comments[9]
  return returnCommentFormats

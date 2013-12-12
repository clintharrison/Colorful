### Introduction

*Colorful* is a plugin for the premiere IRC application on OS X: [Textual](http://codeux.com/textual), allowing users to customize UI colors that are normally hardcoded. For now, this means the colors associated with the server and member lists, as was possible in LimeChat and old versions of Textual.

Please read this document in its entirety, as well as the `LICENSE` in the project's root directory, paying particular attention to the disclaimer that I take no responsibility for the consequences of using this plugin. That said, if you have any questions I'm open to a chat :)

### Screenshot

![Colorful: a Textual plugin](http://i.imgur.com/NEB1ce8.png)

### Installation

Build the extension in Xcode (it was written in version 5—good luck with other versions). Upon successful compilation, it should be placed in:

`~/Library/Containers/com.codeux.irc.textual/Data/Library/Application Support/Textual IRC/Extensions`

Restart Textual and the plugin is loaded. To verify, open the preferences panel for the plugin.

### Usage

There are no commands associated with this plugin. All configuration is done through its preference pane.

### Known Issues

- Textual may crash on application quit
- Using the default colors in the server list causes painting oddities
- "Default" values do not always take inverted colors setting into account.

Report any other issues on GitHub, on IRC (freenode: Clinteger), or by email (clinteger@gmail.com).

# Status

The project is deprecated and no longer supported.

## zsh-notes-manager

The zsh-notes-manager plugin offers an easy and efficient way to store short, important notes right from the terminal. It's primarily designed for saving those essential terminal commands that are hard to remember, making this plugin an ideal solution for quick recall.

## Installation

To install the plugin, clone this repository into the `~/.oh-my-zsh/custom/plugins/`.

Then, open your `~/.zshrc` file and include `zsh-notes-manager` plugin:

```zsh
plugins=( ... zsh-notes-manager)
```

## Usage

Here are the basic commands:
- `na <context>`: adds a new note
- `nls`: displays all your notes
- `nd <context>`: deletes specific notes by their numbers

#### Examples:

```zsh
$ na My First Note
$ nls
$ nd 2 3 7
```

## Customizing Aliases

You can customize the aliases to your preference by editing the `zsh-notes-manager.plugin.zsh` file located in: `~/.oh-my-zsh/custom/plugins/zsh-notes-manager/`

## Note Storage

Your notes are saved in the file `~/.local/share/zsh-notes-manager/notes.txt`. You can change this storage location by editing the `zsh-notes-manager.plugin.zsh` file as mentioned above.

# zsh_notes_storage from terminal

# variables
storage="${HOME}/.local/share/zsh-notes-storage/notes.txt"

alias na='add_note'    # using function
alias nls='list_notes'  # using function
alias nd='delete_note' # using function

alias nt='main'         # using arguments


# check if the folder and file exist
check() {
  storage_dir="$(dirname "$storage")"
  if [ ! -d "$storage_dir" ]; then
    mkdir -p "$storage_dir"
  fi
  if [ ! -f $storage ]; then
    touch $storage
  fi
}


# functions
add_note() {
  check

  if [ ! -w $storage ]; then
    echo "Error: $storage is not writable. Change the permissions manually."
  else
    note=""
    echo -n "Note: "
    read note
    echo "$note" >> "$storage"
  fi
}


list_notes() {
  check

  if [ ! -r $storage ]; then
    echo "Error: $storage is not readable. Change the permissions manually."
  else
    # explanation: nl (number line) -w1 (number width) -s (separator)
    nl -w1 -s '. ' $storage
  fi
}

delete_note() {
  if [ ! -f $storage ]; then # check if storage exists
    touch $storage
  else
    note_number=""
    echo -n "Note number: "
    read note_number
    # explanation: sed -i (inplace) "${note_number}d" (delete line)
    sed -i "${note_number}d" $storage
  fi
}


main() {
  case "$1" in
    -a)
      add_note
      ;;
    -l)
      list_notes
      ;;
    -d)
      delete_note
      ;;
    *)
      echo "Usage: note {-a add |-l list |-d delete}"
      ;;
  esac
}
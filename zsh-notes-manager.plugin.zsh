# zsh_notes_storage from terminal

# variables
storage="${HOME}/.local/share/zsh-notes-manager/notes.txt"

alias na='add_note'    # using function
alias nls='list_notes' # using function
alias nd='delete_note' # using function



# check if the folder and file exist
check() {
  local storage_dir="$(dirname "$storage")"
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
    local note="$*"
    if [ -z "$note" ]; then
      echo "Error: No content provided."
    else
      echo "$note" >> "$storage"
    fi
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
  check

  if [ ! -w $storage ]; then
    echo "Error: $storage is not writable. Change the permissions manually."
  else
    local number_notes=($*)
    local sorted_array=($(printf "%s\n" "${number_notes[@]}" | sort))
    local max_number=$(wc -l < $storage)
    local counter_deleted_notes=0

    for i in ${sorted_array}; do
      if ! [[ $i =~ ^[0-9]+$ ]] || [ $i -gt $max_number ] || [ $i -le 0 ] ; then
        continue
      else
        # explanation: sed -i (inplace) "${sorted_array}d" (delete line)
        sed -i "$((i-counter_deleted_notes))d" $storage
        ((counter_deleted_notes+=1))
      fi
    done
  fi
}

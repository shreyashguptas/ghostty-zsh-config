# ghostty-ssh-colors.zsh — auto-tint Ghostty tabs by SSH host
#
# Wraps `ssh`: before connecting, sets the tab's background color and title
# based on a hash of the target hostname, so the same host always gets the
# same color/emoji — no manual tagging, no lookup table to maintain. When
# the SSH session ends, the tab reverts to Ghostty's normal background.
#
# Only does anything inside Ghostty; harmless everywhere else.

if [[ "$TERM_PROGRAM" != "Ghostty" && -z "$GHOSTTY_RESOURCES_DIR" ]]; then
  return
fi

typeset -a _GSC_COLORS=(
  "#352222"  # brick
  "#352d1e"  # amber
  "#35261e"  # burnt orange
  "#2d2222"  # rosewood
  "#352c1e"  # golden brown
  "#2d1e1e"  # dark cherry
  "#352d24"  # copper
  "#351e1e"  # deep red
  "#1e2535"  # slate blue
  "#1e2d2d"  # deep teal
  "#261e35"  # plum
  "#1e3526"  # forest
)
typeset -a _GSC_DOTS=( 🔥 🍊 🌅 🌹 🌻 🍒 🥧 ♦️ 🔷 🌀 🔮 🌲 )

_gsc_hash() {
  local s="$1" h=0 i
  for (( i=0; i<${#s}; i++ )); do
    h=$(( (h * 31 + $(printf '%d' "'${s:$i:1}")) % 65536 ))
  done
  echo $h
}

_gsc_default_title() {
  printf '\033]2;%s\007' "${PWD/#$HOME/~}"
}

ssh() {
  local host="" skip=false arg
  for arg in "$@"; do
    if $skip; then skip=false; continue; fi
    case "$arg" in
      -[bcDEeFIiJLlmOopQRSWw]) skip=true ;;
      -*) ;;
      *@*) host="${arg#*@}"; break ;;
      *)   [[ -z "$host" ]] && host="$arg"; break ;;
    esac
  done

  if [[ -n "$host" ]]; then
    local short="${host%%.*}"
    local idx=$(( $(_gsc_hash "$short") % ${#_GSC_COLORS[@]} + 1 ))
    printf '\033]11;%s\007' "${_GSC_COLORS[$idx]}"
    printf '\033]2;%s %s\007' "${_GSC_DOTS[$idx]}" "$short"
  fi

  command ssh "$@"
  local ret=$?

  # Restore Ghostty's configured background and a normal title on disconnect.
  printf '\033]111\007'
  _gsc_default_title
  return $ret
}

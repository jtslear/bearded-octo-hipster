# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

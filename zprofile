
# MacPorts Installer addition on 2021-03-05_at_22:35:23: adding an appropriate PATH variable for use with MacPorts.
# export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH="/Users/rikards/bin:$PATH"
# MacPorts Installer addition on 2021-03-05_at_22:35:23: adding an appropriate DISPLAY variable for use with MacPorts.
# export DISPLAY=:0
# Finished adapting your DISPLAY environment variable for use with MacPorts.


# Add local build go tools to path

export PATH="$HOME/go/bin:$PATH"



eval "$(/opt/homebrew/bin/brew shellenv)"

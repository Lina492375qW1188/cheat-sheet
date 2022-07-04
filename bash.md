Declare alias in the `~/.bash_profile` or `~/.bashrc file`.
```
vim ~/.bashrc
```

Add alias
```
# Aliases
# alias alias_name="command_to_run"

# Long format list
alias ll="ls -la"

# Print my public IP
alias myip='curl ipinfo.io/ip'

```

Make the aliases available in your current session:
```
source ~/.bashrc
```

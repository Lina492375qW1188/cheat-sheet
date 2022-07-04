1. Declare alias in the `~/.bash_profile` or `~/.bashrc file`.
```
vim ~/.bash_profile
```

2. Add alias
```
# Aliases
# alias alias_name="command_to_run"

# Long format list
alias ll="ls -la"

# Print my public IP
alias myip='curl ipinfo.io/ip'
```

3. Make the aliases available in your current session:
```
source ~/.bash_profile
```

```
alias dropbox_home="cd Dropbox\ \(University\ of\ Michigan\)/Sun-Ting\ Tsai’s\ files/Home/"
alias greatlakes="ssh suntingt@greatlakes.arc-ts.umich.edu"
alias bridges="ssh sunting@bridges2.psc.edu"
alias deepthought2="ssh sunting@login.deepthought2.umd.edu"
```

Use `alias` to see all aliases.

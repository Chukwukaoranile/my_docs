
### Alias provides the opportunity to create short cut for frequently used CLI commands

To achieve this, open the file below and add the following configurations

	vi ~/.bash_aliases

Write down all the commands you want to create their short cuts. *The syntax for creating the aliases*
```
alias gis="git status"
alias gid="git add "
alias gic="git commit -m "
alias gip="git push"
```
Run the command below to propagate the configuration

	source ~/.bashrc


source ~/.zplug/init.zsh

# plugins
zplug 'romkatv/powerlevel10k', as:theme, depth:1
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-history-substring-search'
bindkey "$terminfo[kcuu1]" history-substring-search-up 
bindkey "$terminfo[kcud1]" history-substring-search-down

zplug 'marlonrichert/zsh-autocomplete'
zplug 'hlissner/zsh-autopair'



if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi

zplug load

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History
SAVEHIST=1000
export HISTFILE=~/.zsh_history
setopt share_history

# Alias
# 加上 -r 在刪除/複製目錄時才不會跳警告
alias rm='rm -r'
alias cp='cp -r'

# -h 可以把檔案大小加上適當的單位，比較好讀
# -l 印出除了檔名其他的資訊，ex：權限、大小
# -F、--color 純粹是好看
alias ls='ls -hlF --color=auto'

# 大推，這個 alias 非常好用（zsh 有類似功能的外掛可以裝，但是我覺得可以用 alias 就用 alias
alias ..='cd ../'

# 把當前目錄下的檔案/目錄以樹狀結構印出來，會把不重要的（.git, node_modules）忽略，後面可以接路徑
alias tree="tree -alI 'node_modules|.git'"

# 加上顏色
alias grep='grep --color=always'

# 超好用，在當前目錄中所有檔案中找指定字串，用法：grepFind 'console.log'，會印出檔案行號，還會把目標字串上色
alias grepFind='grep --exclude-dir=node_modules -nr . -e'

# 建立巢狀目錄時會一並建立上層目錄，下面解釋
alias mkdir='mkdir -p'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

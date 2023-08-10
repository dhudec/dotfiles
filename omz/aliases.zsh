# AWS
alias aws-login='aws sso login --sso-session BasisTheory'
alias aws-eks-login-dev-us-east-2='aws eks update-kubeconfig --region us-east-2 --name basistheory-dev --profile Development'
alias aws-eks-login-dev-us-west-2='aws eks update-kubeconfig --region us-west-2 --name basistheory-dev --profile Development'

# Utilities
alias uuid='uuidgen | tr "[:upper:]" "[:lower:]" | tr -d "\n" | pbcopy'
alias ll='ls -al'
alias src='cd $HOME/src/github'

# zsh
alias zsh-edit='code $HOME/.zshrc'
alias zsh-source='source $HOME/.zshrc'

# kubernetes
alias kubectl-use-dev-us-east-2='kubectl config use-context arn:aws:eks:us-east-2:914054469264:cluster/basistheory-dev'
alias kubectl-use-dev-us-west-2='kubectl config use-context arn:aws:eks:us-west-2:914054469264:cluster/basistheory-dev'
alias k9s-dev-us-east-2='k9s --context arn:aws:eks:us-east-2:914054469264:cluster/basistheory-dev'
alias k9s-dev-us-west-2='k9s --context arn:aws:eks:us-west-2:914054469264:cluster/basistheory-dev'
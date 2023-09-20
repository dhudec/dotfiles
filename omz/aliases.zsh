# AWS
alias aws-login='aws sso login --sso-session BasisTheory'
alias aws-eks-login-dev-us-east-2='aws eks update-kubeconfig --region us-east-2 --name basistheory-dev --profile Development'
alias aws-eks-login-dev-us-west-2='aws eks update-kubeconfig --region us-west-2 --name basistheory-dev --profile Development'
alias aws-eks-login-dev-eu-west-1='aws eks update-kubeconfig --region eu-west-1 --name basistheory-dev --profile Development'
alias aws-eks-login-dev-eu-central-1='aws eks update-kubeconfig --region eu-central-1 --name basistheory-dev --profile Development'
alias aws-eks-login-prod-us-east-2='aws eks update-kubeconfig --region us-east-2 --name basistheory-prod --profile Production'
alias aws-eks-login-prod-us-west-2='aws eks update-kubeconfig --region us-west-2 --name basistheory-prod --profile Production'
alias aws-eks-login-prod-eu-west-1='aws eks update-kubeconfig --region eu-west-1 --name basistheory-prod --profile Production'
alias aws-eks-login-prod-eu-central-1='aws eks update-kubeconfig --region eu-central-1 --name basistheory-prod --profile Production'

# Utilities
alias uuid='uuidgen | tr "[:upper:]" "[:lower:]" | tr -d "\n" | pbcopy'
alias ll='ls -al'
alias src='cd $HOME/src/github'
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'

# zsh
alias zsh-edit='code $HOME/.zshrc'
alias zsh-source='source $HOME/.zshrc'

# kubernetes
alias k='kubectl'
alias kubectl-use-dev-us-east-2='kubectl config use-context arn:aws:eks:us-east-2:914054469264:cluster/basistheory-dev'
alias kubectl-use-dev-us-west-2='kubectl config use-context arn:aws:eks:us-west-2:914054469264:cluster/basistheory-dev'
alias kubectl-use-dev-eu-west-1='kubectl config use-context arn:aws:eks:eu-west-1:914054469264:cluster/basistheory-dev'
alias kubectl-use-dev-eu-central-1='kubectl config use-context arn:aws:eks:eu-central-1:914054469264:cluster/basistheory-dev'
alias kubectl-use-prod-us-east-2='kubectl config use-context arn:aws:eks:us-east-2:469828239459:cluster/basistheory-prod'
alias kubectl-use-prod-us-west-2='kubectl config use-context arn:aws:eks:us-west-2:469828239459:cluster/basistheory-prod'
alias kubectl-use-prod-eu-west-1='kubectl config use-context arn:aws:eks:eu-west-1:469828239459:cluster/basistheory-prod'
alias kubectl-use-prod-eu-central-1='kubectl config use-context arn:aws:eks:eu-central-1:469828239459:cluster/basistheory-prod'
alias k9s-dev-us-east-2='k9s --context arn:aws:eks:us-east-2:914054469264:cluster/basistheory-dev'
alias k9s-dev-us-west-2='k9s --context arn:aws:eks:us-west-2:914054469264:cluster/basistheory-dev'
alias k9s-dev-eu-west-1='k9s --context arn:aws:eks:eu-west-1:914054469264:cluster/basistheory-dev'
alias k9s-dev-eu-central-1='k9s --context arn:aws:eks:eu-central-1:914054469264:cluster/basistheory-dev'
alias k9s-prod-us-east-2='k9s --context arn:aws:eks:us-east-2:469828239459:cluster/basistheory-prod'
alias k9s-prod-us-west-2='k9s --context arn:aws:eks:us-west-2:469828239459:cluster/basistheory-prod'
alias k9s-prod-eu-west-1='k9s --context arn:aws:eks:eu-west-1:469828239459:cluster/basistheory-prod'
alias k9s-prod-eu-central-1='k9s --context arn:aws:eks:eu-central-1:469828239459:cluster/basistheory-prod'

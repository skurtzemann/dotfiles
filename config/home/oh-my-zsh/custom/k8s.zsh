alias k="kubectl"

# Contexts
alias kgctx="kubectl config get-contexts"
alias kuctx="kubectl config use-context"

# Get objects
alias kg="kubectl get"
alias kgp="kubectl get pods"
alias kga="kubectl get all --all-namespaces"

# Describe
alias kd="kubectl describe"
alias kdp="kubectl describe pod"

# Delete
alias kdel="kubectl delete"
alias kdelp="kubectl delete pod"
alias kdelep="kubectl get pods -a | grep Evicted | awk '{print \$1}' | xargs kubectl delete pod --force --grace-period=0"

# Create from a ressource file (imperative mode)
kc() {
	kubectl create -f $1
}

# Replace a ressource from a file (imperative mode)
kr() {
	kubectl replace -f $1
}

# Apply a configuration (declarative mode)
ka() {
	kubectl apply -f $1
}
kar() {
	kubectl apply -f $1 --recursive=true
}

# Exec a bash shell into the specify Pod
kep() {
	if [ -z $2 ]; then
		kubectl exec -it $1 bash
	else
		kubectl exec -it $1 $2
	fi
}

# Tail log from a specific object
kl(){
	kubectl logs $1
}
klf() {
	kubectl logs -f $1
}

# Create an alpine container with sh
kbash(){
	kubectl run bash --rm --restart=Never -i --tty --image=alpine -- sh
}

# Tools
alias c="click"
alias 9="k9s"
alias h="helm"
alias hf="helmfile"

alias kns="kubens"
alias kx="kubectx"

alias o="octant"

# add krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
alias gcp-cfg-current="gcloud config configurations list | grep True"

gcp-cfg-set() {
    if [ -z $1 ]; then
        echo "==> Need to specify a config name. Exiting."
        echo ""
        echo "Available configs:"
        gcloud config configurations list

    else
        echo "==> Activating gcloud config '$1'..."
        gcloud config configurations activate $1
    fi
}
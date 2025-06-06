function init-slack-bot-python-dev {
    SLACK_BOT_PYTHON_SRC_DIR="$HOME/Private/Sources/gitlab.com/k8n.fr/lab/slack-bot-python"
    cd ${SLACK_BOT_PYTHON_SRC_DIR}
    pyenv activate k8n-fr-lab-slack-bot-python
}
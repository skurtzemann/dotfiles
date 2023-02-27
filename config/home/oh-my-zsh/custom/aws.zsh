function aws-ssh {
    RED="\e[31m"
    GREEN="\e[32m"
    ENDCOLOR="\e[0m"

    connectCommands="
====================================================
One connected you can run one of following commands:
    sudo su - ubuntu
    (or)
    sudo su - ec2-user
===================================================="

    if [[ $# -eq 0 ]]; then 
        echo "Usage: aws-ssh <instance> [<profile>] [<region>]"
        return 0
    else

        local instance="${1}"
        local profile="${2:-g-cs-dev}"
        local region="${3:-us-east-1}"
        echo -e "Instance: ${GREEN}${instance}${ENDCOLOR}"
        echo -e "Profile : ${GREEN}${profile}${ENDCOLOR}"
        echo -e "Region  : ${GREEN}${region}${ENDCOLOR}"

        local target=$(aws --profile "${profile}" --region "${region}" ec2 describe-instances --filters "Name=instance-state-name,Values=running" "Name=tag:Name,Values=${instance}" --query "Reservations[0].Instances[0].InstanceId" --output text)

        echo -e "Target  : ${RED}${target}${ENDCOLOR}"

        echo -e $connectCommands
        aws ssm start-session --profile "${profile}" --target ${target} --region "${region}"
    fi
}
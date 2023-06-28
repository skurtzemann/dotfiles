function aws-ssh {
    #
    # Connect to an EC2 instance using SSM with some "basic" yaml files 
    #
    # - use fzf to list all the configured instances located in a config folder
    # - a "basic" config file looks like
    #       instance:
    #         id:       <EC2InstanceId>
    #         profile:  <awsProfile>
    #         region:   <awsRegion>
    #         user:     <userForaSudoCommand>
    #
    AWS_CONFIG_DIR="${HOME}/Work/Sources/config/aws/"

    RED="\e[31m"
    GREEN="\e[32m"
    ENDCOLOR="\e[0m"

    EC2_USER="<notDefined>"

    if [[ $# -ne 0 ]]; then 
        echo "Usage: aws-ssh"
        return 0
    else
        local awsInstanceFile=$(find ${AWS_CONFIG_DIR} -type f -execdir basename '{}' ';' | fzf)

        if [[ "${awsInstanceFile}" != "" ]]; then
            local instance=$(yq -r '.instance.id' ${AWS_CONFIG_DIR}/${awsInstanceFile})
            local profile=$(yq -r '.instance.profile' ${AWS_CONFIG_DIR}/${awsInstanceFile})
            local region=$(yq -r '.instance.region' ${AWS_CONFIG_DIR}/${awsInstanceFile})
            EC2_USER=$(yq -r '.instance.user' ${AWS_CONFIG_DIR}/${awsInstanceFile})

            echo -e "Instance: ${GREEN}${instance}${ENDCOLOR}"
            echo -e "Profile : ${GREEN}${profile}${ENDCOLOR}"
            echo -e "Region  : ${GREEN}${region}${ENDCOLOR}"

            local target=$(aws --profile "${profile}" --region "${region}" ec2 describe-instances --filters "Name=instance-state-name,Values=running" "Name=tag:Name,Values=${instance}" --query "Reservations[0].Instances[0].InstanceId" --output text)

            echo -e "Target  : ${RED}${target}${ENDCOLOR}"

            local connectCommands="
====================================================
One connected you can run one of following commands:
    sudo su - ${EC2_USER}
===================================================="
            echo -e $connectCommands
            aws ssm start-session --profile "${profile}" --target ${target} --region "${region}"
        fi
    fi
}
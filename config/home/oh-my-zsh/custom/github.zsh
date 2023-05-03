function gh-branch {
    RED="\e[31m"
    GREEN="\e[32m"
    ENDCOLOR="\e[0m"

    # Ask for the issue number
    read "?Enter your GitHub Card (or issue) number: " issueNumber
    echo -e "Issue number: ${GREEN}${issueNumber}${ENDCOLOR}"

    # Get related issue information and sanitize its title
    issueTitle=$(gh issue view -R gradle/ge $issueNumber --json title,number | jq -r '.title')
    issueTitleSanitize=$(echo $issueTitle | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -d '`' | tr '.' '-')
    echo -e "Issue title: ${GREEN}${issueTitle}${ENDCOLOR}"

    # Generated branch name
    branchName="${USER}/${issueNumber}-${issueTitleSanitize}"
    echo -e "Generated branch name: ${GREEN}${branchName}${ENDCOLOR}"

    # Create the new branch based on the current branch
    git checkout -b ${branchName}
}
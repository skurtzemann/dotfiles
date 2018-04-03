# Push code to git remote
pushr() {
    git push origin develop
    git push origin master
    git push --tags
}
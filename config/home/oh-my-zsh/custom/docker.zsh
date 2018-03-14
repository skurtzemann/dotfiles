alias d="docker"

# Cleanup
function docker-cleanup() {
  EXITED=$(docker ps -q -f status=exited)
  DANGLING=$(docker images -q -f "dangling=true")

  if [ "$1" == "--dry-run" ]; then
    echo "==> Would stop containers:"
    echo $EXITED
    echo "==> And images:"
    echo $DANGLING
  else
    if [ -n "$EXITED" ]; then
      docker rm $EXITED
    else
      echo "No containers to remove."
    fi
    if [ -n "$DANGLING" ]; then
      docker rmi $DANGLING
    else
      echo "No images to remove."
    fi
  fi
}


# List registry repositories
alias dlsr="docker-ls repositories"

# List tags for a given repository
dlst() {
	docker-ls tags $1
}

# Restart the last stopped container in an interactive mode
[[ false ]] && docker start -a -i `docker ps -q -l`


# Attach to the last container
[[ false ]] && docker attach `docker ps -q -l`

# Detach from interactive container ^P ^Q

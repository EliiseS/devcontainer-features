
# Bash profile (bash-profile)

A feature to add a command to a bash profile

## Example Usage

```json
"features": {
    "ghcr.io/EliiseS/devcontainer-features/bash-profile:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| command | Command to be added as a line to the $FILE variable | string | - |
| file | The file the $COMMAND will be added to | string | $_CONTAINER_USER_HOME/.bashrc |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/EliiseS/devcontainer-features/blob/main/src/bash-profile/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._

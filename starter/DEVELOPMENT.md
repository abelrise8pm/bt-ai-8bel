# Making changes

## Synchronization Process

Changes are pushed from the source repository using a script that excludes certain files and directories (specs/, tests/, DEVELOPMENT.md).

From the XPai repository root, run:

```bash
./ai-assistant-container-starter-repo/publish-to-external-repo.sh
```

This script will:
1. Create a temporary branch
2. Remove excluded files/directories
3. Push to the external repository using git subtree
4. Clean up the temporary branch automatically

## Making Changes

To make changes to this repository:

1. Edit files in the `ai-assistant-container-starter-repo` directory of the source repository
2. Commit your changes normally
3. Run the publish script from the XPai repository root: `./ai-assistant-container-starter-repo/publish-to-external-repo.sh`

Only authorized users should perform the publish operation.
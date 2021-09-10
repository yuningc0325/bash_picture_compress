
# Bash / Squoosh

<br>

### This is the bash tool that helps compress pictures based on [Squoosh CLI](https://github.com/GoogleChromeLabs/squoosh/tree/dev/cli). The script will build a docker image with node and compress images thorugh squoosh/cli. Compressed files will be moved from container to host then kill the docker container and image.

<br>


## Prerequisite
1. Docker
2. Linux or Unix Operation system

<br>

## Usage
---

Put images that you'd like to compress inside assets folder.

```
./start.sh <options>

options:
  -d                            output directory name
  -r                            resize number, from 0 - 100 (percentage)
  -q                            compress level, from 0 - 100 (percentage)
```

<br>

## TODO
1. add resize function
2. batch control
3. make input and output directory more flexible
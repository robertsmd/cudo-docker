# cudo-docker
Docker container for [cudominer](https://cudominer.com). 
This image supports Nvidia devices.

## Build

```bash
docker build -t cudominer .
```

## Run

1. Run the container

```
docker run --gpus all -d --rm -h <LABEL> --name cudo cudominer
```

### for only some GPUs 

to find your GPUs:
```
docker run --gpus all -d --rm cudominer nvidia-smi
```

to start with just the 1st (0th) GPU

```
docker run --gpus '"device=0"' -d --rm --name cudo cudominer
```

Set `<LABEL>` to distinguish your workers from one another.

2. Set organization

```bash
docker exec -it cudo cudominercli login <ORGANIZATION_NAME>
```

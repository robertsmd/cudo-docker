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
docker run --gpus all --rm cudominer nvidia-smi
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

3. info

```bash
docker exec -it cudo cudominercli hardware
docker exec -it cudo cudominercli ps
```

## Troubleshooting

```bash
sudo apt install cuda
sudo apt install -y nvidia-docker2
lsmod | grep nvidia
nvtop
nvidia-smi
```

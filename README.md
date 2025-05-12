# HAMLET4FAIRNESS-eval

This is the repository for reproducing the experiments performed in **HAMLET4Fairness: Enhancing Fairness in AI Pipelines through Human-Centered AutoML and Argumentation**.

If you are interest in discovering HAMLET as an end-to-end AutoML framework, please refer to the [GitHub repository](https://github.com/kr-25/HAMLET4FAIRNESS).

# Requirements

In order to reproduce the experiments in any operating systems, Docker is required: [https://www.docker.com/](https://www.docker.com/).
Install it, and be sure that it is running when trying to reproduce the experiments.

To test if Docker is installed correctly:

- open the terminal;
- run ```docker run hello-world```.

***Expected output:***

```
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
2db29710123e: Pull complete
Digest: sha256:7d246653d0511db2a6b2e0436cfd0e52ac8c066000264b3ce63331ac66dca625
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```

# Reproducing the experiments

The instructions are valid for Unix-like systems (e.g., Linux Ubuntu, MacOS) and Windows (if using PowerShell).

Open the terminal and create a volume:

```
docker volume create my-HAMLET-volume
```

## Run the published image

Run the docker image to execute HAMLET4FAIRNESS on adult, compass and credit-g:

```
docker run -it --volume /var/run/docker.sock:/var/run/docker.sock --volume my-HAMLET-volume:/results ... [metric]
```
You can choose the fair metric to optimize:
- **[metric]**: either *demographic_parity_ratio* and *equalized_odds_ratio*

## Check the results

After the execution, you can find your results in *my-HAMLET-volume*.
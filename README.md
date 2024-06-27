<p align="center"><a href="https://www.docker.com/" target="_blank"><img src="https://www.svgrepo.com/download/353661/docker.svg" width="400" alt="Docker Logo"></a></p>

I use Windows 10, WSL 2 Ubuntu 20.04.6 LTS
PC (AMD Ryzen 7 5800X3D, RAM32Gb)


## Installation via `Make`:
`make`, `docker` and `docker-compose` must be installed on the system and available for use in the terminal via `PS`, `Bash`, etc.
In the root of the project with the file `docker-compose.yml` and `Makefile` run the command:
`make init`, wait for the installation to complete. Run either via **Docker Desktop** or with the command:
`make up`

`make init`: Completely rebuilds the project. Removes volumes, stops docker, updates images from the hub, builds them and raises containers<br>
`make up`: Starts the project and picks up containers<br>
`make down`: Stops containers with the `--remove-orphans` flag<br>
`make restart`: Stops containers and starts them again

## What's next?!
Go to the project folder `admin-service\app` and read `README.md`

# Docker images

A collection of Docker images available on [Docker Hub](https://hub.docker.com/u/uccser/) used by the University of Canterbury Computer Science Education Research group.

The Docker images we currently use are:

    - Django
    - Nginx-with-gulp
    - Python

## How to update packages

`pyup-bot` will create a pull request when a new version of a package becomes available.
In addition to the changes `pyup-bot` makes, we will need to also update the `VERSION` files with the new version number for the relevant package.
This includes `VERSION` files within the `with-weasyprint` directories.

To update projects that use these Docker images, we need to update both the `Dockerfile` and `Dockerfile-local` files in the project with the new version number.

Note that if one of the core packages (Django, Nginx, Python) has a dependency that updates, the core package version number will not update (and doesn't need to be updated).

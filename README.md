# Docker images

This repository produces Docker images used by the University of Canterbury Computer Science Education Research group.

## Django Image

Our versioning of the Django image is based off the following syntax:

`{image-name}:{django-version}-{dependency-version}`

- `{image-name}` is the name of the Docker image.
- `{django-version}` is the version of Django being used, as this is the key feature of the image.
- `{image-version}` is the version of image for this Django version, as depencencies may be updated while the Django version is not.

### Changelog

#### `django-2.2.19-1`

- Combined previous Django and Django with Weasyprint images into a single image.
- Create `uccser` non-root user within Docker image for use by applications.
- Updated Django to 2.2.19.
- Updated Weasyprint to 52.4.

# ftp-server image

This image contains a vsftpd installation.

It starts the ftp server with write access for the configured user.

## Installation

1. Pull from [Docker Hub], download the package from [Releases] or build using `builder/build.sh`

## Usage

This Container image extends the [base image].

### Command line flags

-   `--output PATH`
    -   The output path.

### Environment variables

- `USERNAME`
    - Username of the ftp user.
- `PASSWORD`
    - Password of the ftp user.
- `PASV_MIN_PORT`
    - Minimal PASV port, default: `40000`.
- `PASV_MAX_PORT`
    - Maximum PASV port, default: `40099`.

### Volumes

-   `/media/ftp/data`
    -   The writeable ftp directory.

## Development

To run for development execute:

```bash
docker compose --file docker-compose-dev.yaml up --build
```

[base image]: https://github.com/mbT-Infrastructure/docker-base
[Docker Hub]: https://hub.docker.com/r/madebytimo/ftp-server
[Releases]: https://github.com/mbT-Infrastructure/docker-ftp-server/releases

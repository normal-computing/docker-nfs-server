# docker-nfs-server
The `nfs-server` image provides a minimal NFSv4 server.

## Usage
Running the container in Docker requires:

1. making the container privileged to allow it to mount the nfsd
   pseudo-filesystem;
2. mounting a volume to `/mnt/data`, the directory that will be exported;
3. exposing the port used for NFSv4 (2049).

For example:

```
    docker run --privileged -v <directory>:/mnt/data:rw -p 2049:2049 \
           ghcr.io/normal-computing/nfs-server:latest
```

where `<directory>` is the path of the directory you want to serve.

The directory can then be mounted:

```
sudo mount -v -t nfs4 -o proto=tcp,port=2049 127.0.0.1:/ <target>
```

where `<target>` is the mount point.

## Configuration
The following environment variables affect the NFS server:

- `NFS_SERVER_DEBUG`: if set to `1`, enable debug logs for NFS server daemons
  (default: `0`).
- `NFS_SERVER_ALLOWED_CLIENTS`: the network address to allow connections from
    (default: `172.16.0.0/12`, used by Docker on Linux for all networks).

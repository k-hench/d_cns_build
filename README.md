# README for `d_cns` 

Github repository for the [podman](https://podman.io/) conatiner [`d_cns`](https://hub.docker.com/repository/docker/khench/d_cns).
This is meant as a support of the [msa_pipeline](https://bitbucket.org/bucklerlab/msa_pipeline/src/master/) by the Buckler lab and to be used for repeat maksing of genome with `KMER` prior to the genome alignments.

It includes the manually installed program `dCNS` by Song *et al* 2020 and version of `KAT` (Mapleson *et al* 2016) pulled from `conda`.

## Documentation of the initial setup

Originally, the `d_cns` container was build using [buildah](https://buildah.io/), from the accompanying `Containerfile`:

```sh
buildah bud -t d_cns
```

To make the container publicly available, it is pushed to [dockerhub](https://hub.docker.com/r/khench/d_cns) using [skopeo](https://github.com/containers/skopeo) and [podman](https://podman.io/):

```sh
skopeo login -u khench docker.io
podman push localhost/d_cns docker.io/khench/d_cns:v0.1
```

## Accessing the container

The bundled software can be accessed directly from [dockerhub](https://hub.docker.com/r/khench/d_cns) with `podman` (or `docker`, or `singularity`):

```sh
podman shell docker.io/khench/d_cns:v0.1
```
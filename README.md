# Wundertax MkDocs
Custom Docker Container With MkDocs


## Dependencies

- A working mkdocs.yml in the **root** of your repository

## Commands

From the **root** of your repository


### Help

``` console

docker run -it --rm -v `pwd`:/docs wundertax/mkdocs:latest help

```

### Build

``` console

docker run -it --rm -v `pwd`:/docs wundertax/mkdocs:latest build

```

### Serve

``` console

docker run -it --rm -p 8000:8000 -v `pwd`:/docs wundertax/mkdocs:latest serve

```

### New

```console
docker run -it --rm -v `pwd`:/docs wundertax/mkdocs:latest new
```


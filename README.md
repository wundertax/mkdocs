# Wundertax MkDocs
Custom Docker Container With MkDocs

## About

[Docker](https://docker.com) based documentation testing suite bsewd on [MkDocs](https://www.mkdocs.org/).

## Dependencies

- [Docker](https://docker.com)
- A working mkdocs.yml in the **root** of your repository

## Install

``` console
docker run -it -v "${PWD}":/srv/docs wundertax/chopper:latest
```

## Docs

Documentation is located in the `docs` directory.

## Contributing
Pull requests are welcome.

For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)

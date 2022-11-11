# mkdocs-macros-playground
This is a sample repo with a minimal example of the behavior I desire and describe in [fralau/mkdocs_macros_plugin#75](https://github.com/fralau/mkdocs_macros_plugin/issues/75).

## ntno fork reqs
- docker
- make
- docker image with [buildenv](https://github.com/Comcast/Buildenv-Tool/), python, mkdocs installed (see [`ntno/ubuntu-build-base`](https://github.com/ntno/docker-containers/blob/main/ubuntu-build-base/Dockerfile#L84-L91))


## ntno fork example use case

1. generate an environment variable file
   1. manually create file (see [env/](https://github.com/ntno/mkdocs-macros-playground/tree/main/env) for examples)
   2. OR use [`buildenv`](https://github.com/Comcast/Buildenv-Tool) and a  custom [`variables.yml`](https://github.com/ntno/mkdocs-macros-playground/blob/main/variables.yml) file  
        ```
        make docker
        make exec-build-env env=dev region=us-east-1 file="env/dev-us-east-1.env"
        exit
        ```
2. add variables to `mkdocs.yml` in the `extra` section
    ````
    extra:
        YOUR_VAR: !ENV [YOUR_ENV, 'some default value']
    ```` 
3. reference variables in the theme:
    ```
    {{ config.extra.YOUR_VAR }}
    ```
4. reference variables in the docs:
   ```
   {{ YOU_VAR }}
   ```
5. load the environment variables and run `mkdocs` in the same shell session
   1. manually source / run (assuming you have `mkdocs` and `pip` requirements installed already)
        ```
        source "env/dev-us-east-1.env" && \
        mkdocs serve
        ```        
   2. loading handled via docker-compose argument in example Makefile
        ```
        make serve file="env/dev-us-east-1.env"
        ```
        
    
### references
- https://github.com/honzajavorek/mkdocs-macros-playground
- https://mkdocs-macros-plugin.readthedocs.io/en/latest/advanced/
- https://github.com/Comcast/Buildenv-Tool
- https://github.com/ntno/docker-containers
- https://www.mkdocs.org/user-guide/configuration/#environment-variables      
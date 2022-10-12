# Create a GitHub Actions CI/CD pipeline

## You Will Need

- Docker
  - [Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows/)
  - [macOS](https://hub.docker.com/editions/community/docker-ce-desktop-mac/)

---

## Task

- Create a GitHub Actions Workflow to
  - Test and Package the `PlayStudios.MyService` application
  - Build a Docker image for running the application (asp.net core 3.1)
    - Build a Linux image (not Windows)
    - The image does not need to be pushed to a registry
    - A list of .net core docker images can be found in [Docker Hub](https://hub.docker.com/_/microsoft-dotnet-core)
  - Deploy the application to a k8s cluster, for 3 environments: Dev, Qa, Prod 

This is not an exercise on your .Net knowledge, use the following commands to prepare the application
  - Unit tests are run with
    ```Bash
    dotnet test ./PlayStudios.MyService/
    ```
  - The application is packaged with
    ```Bash
    dotnet publish \
      ./PlayStudios.MyService/PlayStudios.MyService.WebApi/ \
      -c Release \
      -o ./dist
    ```
  - The packaged application is run with
    ```Bash
    dotnet ./dist/PlayStudios.MyService.WebApi.dll
    ```
- Think about what should be in a **production ready** Dockerfile

---

## Testing

- Run the built Docker image and browse to `http://localhost:5000/weatherforecast`

---

## References

- [https://hub.docker.com/_/microsoft-dotnet](https://hub.docker.com/_/microsoft-dotnet)

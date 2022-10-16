FROM mcr.microsoft.com/dotnet/aspnet:3.1-alpine
WORKDIR /dist
COPY /dist .
ENTRYPOINT ["dotnet","PlayStudios.MyService.WebApi.dll"]

FROM microsoft/aspnetcore-build:2.0.0 AS build
WORKDIR /code
COPY . .
RUN dotnet restore
RUN dotnet publish --output /output --configuration Release

FROM microsoft/aspnetcore:latest
COPY --from=build /output /app
WORKDIR /app
ENTRYPOINT ["dotnet","ASPNETDOCKER.dll"]
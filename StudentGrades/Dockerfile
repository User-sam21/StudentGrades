# Étape 1 : Build
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env
WORKDIR /app

# Copier le fichier projet et restaurer les dépendances
COPY *.csproj ./
RUN dotnet restore

# Copier tout le code source et construire l'application
COPY . ./
RUN dotnet publish -c Release -o out

# Étape 2 : Runtime
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "StudentGrades.dll"]

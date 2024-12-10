<<<<<<< HEAD
# Étape 1 : Build
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env
WORKDIR /app

# Copier le fichier projet et restaurer les dépendances
=======
# Ã‰tape 1 : Build
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env
WORKDIR /app

# Copier le fichier projet et restaurer les dÃ©pendances
>>>>>>> d362ec593c5a804f2b9740b83f37056a38b9ba1d
COPY *.csproj ./
RUN dotnet restore

# Copier tout le code source et construire l'application
COPY . ./
RUN dotnet publish -c Release -o out

<<<<<<< HEAD
# Étape 2 : Runtime
=======
# Ã‰tape 2 : Runtime
>>>>>>> d362ec593c5a804f2b9740b83f37056a38b9ba1d
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "StudentGrades.dll"]
<<<<<<< HEAD
=======
 
>>>>>>> d362ec593c5a804f2b9740b83f37056a38b9ba1d

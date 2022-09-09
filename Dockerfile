FROM mcr.microsoft.com/dotnet/sdk:5.0 as dotnet-build
WORKDIR /app
COPY ./ConversaoPeso.Web/*.csproj ./
RUN dotnet restore
COPY ./ConversaoPeso.Web/. ./
RUN dotnet publish -c Release -o ConversaoPeso

FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app
COPY --from=dotnet-build /app/ConversaoPeso/. .
ENTRYPOINT ["dotnet", "ConversaoPeso.Web.dll"]
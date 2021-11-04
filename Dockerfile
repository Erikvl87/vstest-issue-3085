FROM mcr.microsoft.com/dotnet/sdk:5.0.402-alpine3.13 AS build

# Required for System.Drawing;
RUN apk add libgdiplus --repository http://nl.alpinelinux.org/alpine/edge/testing --allow-untrusted

# Required for fonts.
RUN apk --no-cache add msttcorefonts-installer fontconfig && \
    update-ms-fonts && \
    fc-cache -f

WORKDIR /app

COPY . ./

RUN dotnet restore

RUN dotnet build \
    --configuration Release \
    --no-restore

RUN dotnet tool install --global dotnet-dump
ENV PATH="$PATH:/root/.dotnet/tools"


ENTRYPOINT ["/bin/sh"]
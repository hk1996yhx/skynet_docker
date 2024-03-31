@echo off
echo Checking if the container 'service-DB' already exists...
docker container ls -a | findstr "service-DB" >nul 2>&1

if %errorlevel%==0 (
    echo Stopping existing container...
    docker stop service-DB
    echo Removing existing container...
    docker rm service-DB
)

echo Starting Docker build process...
docker build -t skynet_docker .

pause

# SME Credit Report

Text to describe app 

## Getting Started

I you don't have it already, install Docker.
Then, move to folder you want to work in and clone this repository.

```
git clone https://github.com/RiskWave/sme-credit-report.git
cd sme-credit-report
ls
```
Note that there is a `Dockerfile` which contains all the instructions to build an image of the R Shiny server and our app.

## Running the App Locally

To run the app locally, we must follow these steps:

1. Build the Docker image.
2. Start the container.
3. Open the app in the browser.

### Build the Docker Image

To build the image, navigate to the folder containing the Dockerfile and run the following command.

```
docker build -t sme-credit-report .
```

### Start the Container

Wait for the build process to finish, then start the container by running the following.

```
docker run -d --rm -p 8000:8000 sme-credit-report
```

### Open the App in the Browser

Open your web browser and go to

```
http://localhost:8000/report?company=1
http://localhost:8000/report?company=2
http://localhost:8000/report?company=3
```

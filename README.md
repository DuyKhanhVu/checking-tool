# Report Builder API

- Staging: TBU
- Production: TBU

## Introduction

- This will be a cloud function and it will be called by HTTP request. 
- Input:
  1. Config id
  2. Json Config
- Output: Build Superset Dashboard from Event Portal Config

## Specifications

* Web server: Flask
* Database: MongoDB
* Models:
    * Parser Config
* Deployment infra: Docker, k8s pod
* CI/CD: Gitlab pipeline

## API document

- Request

    POST /v1/dashboard HTTP/1.1
    Host: https://report-builder.mservice.io
    Content-Type: applicaton/json
    Body: 
    {
        "journey_id": 3,
        "journey_name": "FE COLLECTION - BILL INPUT"
    }


- Response

    {
        "dashboard_title": "FE COLLECTION - BILL INPUT Journey",
        "url": "http://superset:8088/superset/dashboard/42"
    }

## Installation & preparing

- Require: `python3.10`, `pip`
- Install requirements: `pipenv shell && pipenv install`
- Development server:

        ./start_dev.sh

- Docker build:

        docker build -t report-builder .

- Docker run local: 

        docker run -d --rm -p 5000:5000 report-builder


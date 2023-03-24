#!/bin/bash

docker build -t report-builder .
docker tag report-builder:v0.0.1-beta2 vuduykhanh3998/report-builder:v0.0.1-beta2
docker push vuduykhanh3998/report-builder:v0.0.1-beta2
#Dockerfile from dockerhub
from ubuntu:latest
#global variables
ARG ID
ARG TITLE
ARG TOKEN
ARG FROM
ARG VERSION
ARG URL
ARG TYPE
#Update sources, upgrade image and install latest curl - SECURITY - DO NOT REMOVE
RUN apt update && apt -y upgrade && apt -y install curl
#command to be exectuted (one time only)
CMD curl --location --request POST $URL --header 'Content-Type: application/json' --header 'Accept: application/vnd.pagerduty+json' --header 'version: 2' --header 'From: $FROM' --header 'Authorization: Token token=$TOKEN' --data-raw '{"incident":{"type": $TYPE,"title": $TITLE,"service":{"id": $ID,"type": "service"}}'

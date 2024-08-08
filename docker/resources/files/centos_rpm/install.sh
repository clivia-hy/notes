#/bin/bash

sudo rpm -ivh ./*

sudo systemctl start docker

sudo systemctl enable docker

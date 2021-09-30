#!/bin/bash

cd ./hadoop_basic
docker image build -t hsuan8169/hadoopha . --no-cache
cd ..

cd ./Workers
docker image build -t hsuan8169/workers . --no-cache
cd ..

cd ./JournalNode
docker image build -t hsuan8169/journalnode . --no-cache
cd ..

cd ./Zookeeper1
docker image build -t hsuan8169/znode1 . --no-cache
cd ..

cd ./Zookeeper2
docker image build -t hsuan8169/znode2 . --no-cache
cd ..

cd ./Zookeeper3
docker image build -t hsuan8169/znode3 . --no-cache
cd ..

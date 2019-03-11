# Elastic stack demo

A Vagrant project for basic Elastic stack demonstration. It shows how an nginx web server logs are stored and visualized using Elastic stack.

The project builds 4 VMs with the following Elastic stack components:

* Elasticsearch cluster - stores and indexes data. Provides a data analytics engine accessible via RESTful API.
* Logstash - parses incoming log messages and sends them to Elasticsearch to be stored.
* Filebeat - ships logs.
* Kibana - a web based application for interacting with Elasticsearch - query and visualize data.

## Prerequisites

* Install VirtualBox - [instructions](https://www.virtualbox.org/wiki/Downloads)
* Install Vagrant - [instructions](https://www.vagrantup.com/downloads.html)

## Using the project

* Build the project - run `vagrant up`
* Check VM status - run `vagrant status`
* Login to a VM - run `vagrant ssh <VM_NAME>`

To access the web server (generate logs) on the guest machine make web requests to `http://localhost:8080`.

To access Kibana on the guest machine open `http://localhost:8090`. It will have a basic dashboard with visualizations set up. In order to see anything on it you need to generate some logs on the web server.

* Elasticsearch nodes are installed on `elkcommon` (master node) and `esdatanode01/02` (data nodes)
* Logstash and Kibana are installed on `elkcommon`
* Filebeat is installed on `web01`. It ships the logs of the nginx server installed on the same VM.

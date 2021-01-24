# Kibana Demo

## Operating Environment

- Docker (confirmed on version 20.10.0,)
- OS (confirmed on MacOS Catalina)

## Install Demo Environment

### Elasticsearch

```bash
docker pull docker.elastic.co/elasticsearch/elasticsearch:7.10.2
```

### Kibana

```bash
docker pull docker.elastic.co/kibana/kibana:7.10.2
```

## Run Demo Environment

### Run Elasticsearch

```bash
 docker run -p 9200:9200 -p 9300:9300 --name elasticsearch-container -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.10.2
 ```


### Run Kibana connecting with Elasticsearch

```bash
docker run --link elasticsearch-container:elasticsearch -p 5601:5601 docker.elastic.co/kibana/kibana:7.10.2
```

### Sample script to add data using curl

```command
sh scripts/add-data.sh
```

### Sample script to fetch data using curl

```command
sh scripts/fetch-mapping-definition.sh
```

### Sample script to check mapping definition using curl

```command
sh scripts/fetch-mapping-definition.sh
```

### Visit to Kibana Dashboard

Visit to http://localhost:5601 with your browser

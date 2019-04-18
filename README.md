# Curator-cli

Docker image for curator_cli.

```
docker run --rm nqkdev/curator-cli:4.3.1 --help
```

https://www.elastic.co/guide/en/elasticsearch/client/curator/current/singleton-cli.html


### Example

```
docker run --rm curatorcli --dry-run --use_ssl --host "https://myelasticsearch" delete_indices --filter_list '[{"filtertype":"age","source":"creation_date","direction":"older","unit":"days","unit_count":1},{"filtertype":"pattern","kind":"prefix","value":"logstash-alert","exclude":"True"}]'
```

### Run every 24 hours in docker swarm mode

To run curator once a day for the next 10 years.
```
docker service create --name docker-curator \
      --reserve-memory 50m \
      --container-label com.monitoring.group=ops-infrastructure \
      --mode global \
      --restart-delay 86400s \
      --restart-max-attempts 3650 \
      nqkdev/curator-cli:4.3.1  --use_ssl --host "https://myelasticsearch" delete_indices --filter_list '[{"filtertype":"age","source":"creation_date","direction":"older","unit":"days","unit_count":1},{"filtertype":"pattern","kind":"prefix","value":"logstash-alert","exclude":"True"}]'
```

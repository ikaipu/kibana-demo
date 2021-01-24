#!/bin/bash
curl -XGET 'http://localhost:9200/nikkei/_search?size=30&pretty' \
    -H 'Content-Type: application/json' -d '
  {
    "query": {
        "match_all": {}
    }
  }'

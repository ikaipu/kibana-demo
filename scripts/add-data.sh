#!/bin/bash

DATA=`cat data/nikkei_stock_average_daily_jp.csv`

curl -XPUT 'http://localhost:9200/nikkei/?pretty'

curl -XPUT 'http://localhost:9200/nikkei/_mapping?pretty' \
    -H 'Content-Type: application/json' -d "
    {
      \"properties\" : {
        \"date\": {
          \"type\" : \"date\",
          \"format\": \"yyyy/MM/dd\"
        },
        \"openingPrice\": {
          \"type\" : \"long\"
        },
        \"closingPrice\": {
          \"type\" : \"long\"
        },
        \"highPrice\": {
          \"type\" : \"long\"
        },
        \"lowPrice\": {
          \"type\" : \"long\"
        }
      }
    }"

while read line
do
    date=`echo $line | cut -d , -f 1`
    open=`echo $line | cut -d , -f 2`
    close=`echo $line | cut -d , -f 3`
    high=`echo $line | cut -d , -f 4`
    low=`echo $line | cut -d , -f 5`
    echo "$date $open $close $high $low"

    curl -XPOST 'http://localhost:9200/nikkei/_doc?pretty' \
    -H 'Content-Type: application/json' -d "
    {
      \"date\": $date,
      \"openingPrice\": $open,
      \"closingPrice\": $close,
      \"highPrice\": $high,
      \"lowPrice\": $low
    }
    "
done <<END
$DATA
END
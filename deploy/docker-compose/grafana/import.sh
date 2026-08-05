#!/usr/bin/env sh

# Wait for Grafana to be ready before importing
i=0
until curl --silent --fail http://admin:foobar@grafana:3000/api/health > /dev/null 2>&1 || [ "$i" -ge 30 ]; do
  echo "waiting for grafana..."
  sleep 2
  i=$((i+1))
done

# Import data sources
for file in *-datasource.json; do
  if [ -e "$file" ]; then
    echo "importing $file" &&
    curl --silent --fail --show-error \
      --request POST http://admin:foobar@grafana:3000/api/datasources \
      --header "Content-Type: application/json" \
      --header "Accept: application/json" \
      --data-binary "@$file";
    echo "";
  fi
done;

# Import dashboards
for file in *-dashboard.json; do
  if [ -e "$file" ]; then
    echo "importing $file" &&
    curl --silent --fail --show-error \
      --request POST http://admin:foobar@grafana:3000/api/dashboards/import \
      --header "Content-Type: application/json" \
      --header "Accept: application/json" \
      --data-binary "@$file";
    echo "";
  fi
done;

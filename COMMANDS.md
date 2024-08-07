```
docker buildx build \
  $(yq 'to_entries | map(select(.value|type == "!!str")) |  map(" --build-arg " + .key + "=" + .value) | join("")' 'ansible/vars.yml') \
  --target=production \
  --tag=parkernilson/supabase-postgres \
  --platform=linux/arm64 \
  .
```
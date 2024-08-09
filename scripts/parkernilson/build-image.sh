#! /bin/sh
docker buildx build \
  $(yq 'to_entries | map(select(.value|type == "!!str")) |  map(" --build-arg " + .key + "=" + .value) | join("")' 'ansible/vars.yml') \
  --target=production \
  --tag=public.ecr.aws/supabase/supabase-postgres:$(sed -n '/postgres-version/ s/.* "\([^"]*\)"/\1/p' common.vars.pkr.hcl) \
  --platform=linux/arm64 \
  .
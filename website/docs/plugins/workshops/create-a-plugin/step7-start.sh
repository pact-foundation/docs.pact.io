#!/bin/bash

tenant="unknown"
step="final"

if [ "${PACT_BROKER_BASE_URL}" != "" ]; then
  tenant=$(echo $PACT_BROKER_BASE_URL | cut -d '/' -f 3 | cut -d '.' -f 1)
fi

id=$(date +%s)
curl -v https://www.google-analytics.com/batch \
  -d "v=1&ds=api&tid=UA-8926693-9&cid=${id}&t=event&ec=kata-pact-plugins&ea=${step}&el=${step}-start&ev=1&cd2=${tenant}"

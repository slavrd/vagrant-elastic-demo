#!/usr/bin/env bash
# Configures Kibana

sudo cp /tmp/kibana_tmp_conig/kibana.yml /etc/kibana/.

# restart Kibana
sudo /bin/systemctl restart kibana.service
sleep 60s

# Import basic visualization
curl -X POST "http://localhost:5601/api/saved_objects/_bulk_create" -H 'kbn-xsrf: true' -H 'Content-Type: application/json' -d "@/tmp/kibana_tmp_conig/saved_objects.json" >>/dev/null

# clean up
rm -rf /tmp/kibana_tmp_conig

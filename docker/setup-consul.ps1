docker-compose up --detach
Start-Sleep -Seconds 3 

docker cp consul-acl.json consul-server1:/consul/config/consul-acl.json
Start-Sleep -Seconds 3
docker cp consul-acl.json consul-server2:/consul/config/consul-acl.json
Start-Sleep -Seconds 3
docker cp consul-acl.json consul-server3:/consul/config/consul-acl.json
Start-Sleep -Seconds 3

docker restart consul-server2
Start-Sleep -Seconds 5
docker restart consul-server3
Start-Sleep -Seconds 5
docker restart consul-server1
Start-Sleep -Seconds 5

$output = docker exec consul-server1 consul acl bootstrap
$token = $output | Select-String -Pattern 'SecretID:\s+(.*)' | ForEach-Object { $_.Matches.Groups[1].Value }

docker exec -e CONSUL_HTTP_TOKEN="$token" consul-server1 consul acl set-agent-token agent "$token"
docker exec -e CONSUL_HTTP_TOKEN="$token" consul-server2 consul acl set-agent-token agent "$token"
docker exec -e CONSUL_HTTP_TOKEN="$token" consul-server3 consul acl set-agent-token agent "$token"

echo "Token: $token"

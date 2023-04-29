param($tokenResult)

docker-compose up --detach

echo "Copying ACL config to consul servers"
docker cp consul-acl.json consul-server1:/consul/config/consul-acl.json
docker cp consul-acl.json consul-server2:/consul/config/consul-acl.json
docker cp consul-acl.json consul-server3:/consul/config/consul-acl.json

echo "Restarting consul-server2"
docker restart consul-server2
Start-Sleep -Seconds 5

echo "Restarting consul-server3"
docker restart consul-server3
Start-Sleep -Seconds 5

echo "Restarting consul-server1"
docker restart consul-server1
Start-Sleep -Seconds 5

echo "Bootstrapping ACL"
$output = docker exec consul-server1 consul acl bootstrap
$token = $output | Select-String -Pattern 'SecretID:\s+(.*)' | ForEach-Object { $_.Matches.Groups[1].Value }

echo "Setting agent token for consul-server1"
docker exec -e CONSUL_HTTP_TOKEN="$token" consul-server1 consul acl set-agent-token agent "$token"

echo "Setting agent token for consul-server1"
docker exec -e CONSUL_HTTP_TOKEN="$token" consul-server2 consul acl set-agent-token agent "$token"

echo "Setting agent token for consul-server1"
docker exec -e CONSUL_HTTP_TOKEN="$token" consul-server3 consul acl set-agent-token agent "$token"

echo "Done"
echo "Token: $token"

Set-Variable -Name $tokenResult -Value $token -Scope 1

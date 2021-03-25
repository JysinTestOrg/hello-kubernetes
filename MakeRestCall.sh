token=$1

response=$(curl -U josh-01:$token -X GET https://api.github.com/repos/Josh-01/hello-kubernetes/branches)

if [ -n "$response" ] && [ -n "$response.total_count" ]; then
    echo "REST call made successfully: '$response'"
    exit 0
else
    echo "REST call failed with: '$response'"
    exit 1
fi

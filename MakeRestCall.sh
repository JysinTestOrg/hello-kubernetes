token=$1

response=$(curl -X GET -H "Authorization: token $token" https://api.github.com/repos/Josh-01/hello-kubernetes/actions/secrets)

if [ !-z "$response" ] && [ !-z "$response.total_count" ]; then
    echo "REST call made successfully: '$response'"
    exit 0
else
    echo "REST call failed with: '$response'"
    exit 1
fi

token=$1

response=$(curl -X GET -H "Authorization: token $token" https://api.github.com/repos/Josh-01/hello-kubernetes/actions/secrets)

if [ "$response" != "" &&  "$response.total_count" != "" ]; then
    echo "REST call made successfully"
else
    echo "REST call failed with: '$response'"
    exit 1
fi

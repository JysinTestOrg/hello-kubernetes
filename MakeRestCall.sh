token=$1

response=$(curl -X GET -H "Authorization: token $token" https://api.github.com/repos/issues)

if [ "$response" == "" ]; then
    echo "REST call made successfully"
else
    echo "REST call failed with: '$response'"
    exit 1
fi

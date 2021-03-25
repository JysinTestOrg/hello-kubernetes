code=$(curl -X GET https://github.com/login/oauth/authorize?client_id=9e4fedaa995f29228ee)
access_code=$(curl -X POST https://github.com/login/oauth/access_token?client_id=9e4fedaa995f29228ee&client_secret=ef8c49d9267f66a2278a5007fc6d9ac5f2e605ce&code=$code)
response=$(curl -X GET  https://api.github.com/repos/Josh-01/hello-kubernetes/branches?$access_code)

if [ -n "$response" ] && [ -n "$response.total_count" ]; then
    echo "REST call made successfully: '$response'"
    exit 0
else
    echo "REST call failed with: '$response'"
    exit 1
fi

URL="$1/p/i"

STREAM_NAME="$2"

while true; do
  curl -H "Content-Type: application/x-amz-json-1.1" -X POST \
  -d "{ \"PartitionKey\": \"sometest\", \"StreamName\": \"$STREAM_NAME\", \"Data\": \"$(echo '{ "yea": 1, "nay": 0, "eventId": "newnewnewtest", "userId": "somethingnew" }' | base64)\" }" $URL
done

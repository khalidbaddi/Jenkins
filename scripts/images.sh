count=$(curl -s -u admin:admin -X GET http://13.233.233.186:8081/service/rest/v1/search?repository=${1} |
 jq '.items[].name' | wc -l)
if [ $count -eq 0 ]
then
        echo "no-images"
else
        curl -s -u admin:admin -X GET http://13.233.233.186:8081/service/rest/v1/search?repository=${1} | jq '.items[] | .name + ":" + .version' | sed 's/"//g'
fi

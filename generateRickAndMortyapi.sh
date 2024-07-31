MODULE="Modules/RickAndMortyAPI/Sources/RickAndMortyAPI/"

openapi-generator generate -i "rickandmortyapi.yaml" -g swift5 -o "rickandmortyapi"
rm -r $MODULE""*
cp -R "rickandmortyapi/OpenAPIClient/Classes/OpenAPIs/". $MODULE
rm -r"rickandmortyapi"

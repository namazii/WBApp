# CharacterAPI

All URIs are relative to *https://rickandmortyapi.com/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**characterGet**](CharacterAPI.md#characterget) | **GET** /character | Character List


# **characterGet**
```swift
    open class func characterGet(name: String? = nil, status: String? = nil, species: String? = nil, type: String? = nil, gender: String? = nil, completion: @escaping (_ data: CharacterList?, _ error: Error?) -> Void)
```

Character List

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let name = "name_example" // String | Filter by the given name (optional)
let status = "status_example" // String | Filter by the given status (optional)
let species = "species_example" // String | Filter by the given species (optional)
let type = "type_example" // String | Filter by the given type (optional)
let gender = "gender_example" // String | Filter by the given gender (optional)

// Character List
CharacterAPI.characterGet(name: name, status: status, species: species, type: type, gender: gender) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String** | Filter by the given name | [optional] 
 **status** | **String** | Filter by the given status | [optional] 
 **species** | **String** | Filter by the given species | [optional] 
 **type** | **String** | Filter by the given type | [optional] 
 **gender** | **String** | Filter by the given gender | [optional] 

### Return type

[**CharacterList**](CharacterList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


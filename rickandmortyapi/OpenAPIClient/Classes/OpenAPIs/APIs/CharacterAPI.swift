//
// CharacterAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class CharacterAPI {

    /**
     Character List
     
     - parameter name: (query) Filter by the given name (optional)
     - parameter status: (query) Filter by the given status (optional)
     - parameter species: (query) Filter by the given species (optional)
     - parameter type: (query) Filter by the given type (optional)
     - parameter gender: (query) Filter by the given gender (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func characterGet(name: String? = nil, status: String? = nil, species: String? = nil, type: String? = nil, gender: String? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: CharacterList?, _ error: Error?) -> Void)) -> RequestTask {
        return characterGetWithRequestBuilder(name: name, status: status, species: species, type: type, gender: gender).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Character List
     - GET /character
     - parameter name: (query) Filter by the given name (optional)
     - parameter status: (query) Filter by the given status (optional)
     - parameter species: (query) Filter by the given species (optional)
     - parameter type: (query) Filter by the given type (optional)
     - parameter gender: (query) Filter by the given gender (optional)
     - returns: RequestBuilder<CharacterList> 
     */
    open class func characterGetWithRequestBuilder(name: String? = nil, status: String? = nil, species: String? = nil, type: String? = nil, gender: String? = nil) -> RequestBuilder<CharacterList> {
        let localVariablePath = "/character"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "name": (wrappedValue: name?.encodeToJSON(), isExplode: true),
            "status": (wrappedValue: status?.encodeToJSON(), isExplode: true),
            "species": (wrappedValue: species?.encodeToJSON(), isExplode: true),
            "type": (wrappedValue: type?.encodeToJSON(), isExplode: true),
            "gender": (wrappedValue: gender?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<CharacterList>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }
}

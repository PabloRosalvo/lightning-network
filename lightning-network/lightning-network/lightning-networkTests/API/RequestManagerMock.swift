import Nimble
import Nimble_Snapshots
import Quick

@testable import lightning_network

final class RequestManagerMock: RequestManagerProtocol {
    var json: String
    var shouldReturn: Bool = false

    init(shouldReturn: Bool, json: String = "list_ligthning_node") {
        self.shouldReturn = shouldReturn
        self.json = json
    }

    func request<T>(url: URL, method: HTTPMethodV2, parameters: ParametersV2?, headers: HTTPHeadersV2?, completion: @escaping (Result<T>) -> Void) where T : Decodable {
        if shouldReturn {
            guard let data = JSONHelper.getDataFrom(json: json) else { return }
            let decoder = JSONDecoder()
            guard let jsonData = try? decoder.decode(T.self, from: data) else { return }
            completion(.success(jsonData))
        } else {
            completion(.failure(RequestError(reason: "Error request API" , statusCode: 500, data: nil)))
        }
    }
    
}

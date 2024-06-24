import Foundation

protocol NetworkApiProtocol {
    func fetchListNodes(completion: @escaping ([ListsNodes]?, RequestError?)  -> Swift.Void)
}

class Network: NetworkApiProtocol {
    private let requestManagerProtocol: RequestManagerProtocol
    enum BaseUrl {
        static let url = "https://api.github.com/users/google/repos"
    }
    init(requestManagerProtocol: RequestManagerProtocol = RequestManager()) {
        self.requestManagerProtocol = requestManagerProtocol
    }
    func fetchListNodes(completion: @escaping ([ListsNodes]?, RequestError?) -> Void) {
        guard let url = URL(string: BaseUrl.url) else {
            return
        }
        self.requestManagerProtocol.request(url: url, method: .get, parameters: nil, headers: nil) { (result: Result<[ListsNodes]?>) in
            switch result {
            case .success(let model):
                completion(model, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}

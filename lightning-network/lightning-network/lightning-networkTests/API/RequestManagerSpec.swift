//
//  RequestManagerSpec.swift
//  lightning-networkTests
//
//  Created by Pablo Rosalvo de Melo Lopes on 25/06/24.
//



import Nimble
import Nimble_Snapshots
import Quick

@testable import lightning_network

final class RequestManagerSpec: QuickSpec {
    
    
    override class func spec() {
        var requestManagerMock: RequestManagerMock!

        describe("RequestManagerSpec")  {
            
            context("when hitting the api and it was successful there should be no error") {
                beforeEach {
                   requestManagerMock =  RequestManagerMock(shouldReturn: true)
                }
                it("should not give the error in the API") {
                    guard let url = URL(string: "https://www.google.com/") else {
                        return
                    }
                    requestManagerMock.request(url: url, method: .get, parameters: nil, headers: nil) { (result: Result<ListsNode?>)  in
                        switch result {
                        case .success(let model): 
                            expect(model?.count).to(equal(100))
                        case .failure(_):
                            break
                        }
                    }
                }
                
                
                context("when hitting the api and it was successful there should be error") {
                    beforeEach {
                        requestManagerMock =  RequestManagerMock(shouldReturn: false)
                    }
                    it("should give the error in the API") {
                        guard let url = URL(string: "https://www.google.com/") else {
                            return
                        }
                        requestManagerMock.request(url: url, method: .get, parameters: nil, headers: nil) { (result: Result<ListsNode?>)  in
                            switch result {
                            case .success(let model):
                                break
                            case .failure(let error):
                                expect(error).toNot(beNil())
                            }
                        }
                    }
                }
            }
        }
    }
}

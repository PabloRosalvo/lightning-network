import Nimble
import Nimble_Snapshots
import Quick

@testable import lightning_network

final class ListLigthNetworkApiSpec: QuickSpec {
    override class func spec() {
        describe( "ListLigthNetworkApiSpec")  {
            context("when init api") {
                context("when the request is successful") {
                    it("should return true equals success to request") {
                        var listLightningApiMock: ListLightningApiMock? = ListLightningApiMock(shouldReturn: true)
                        listLightningApiMock?.fetchListNodes { success , _ in
                            expect(success).toNot(beNil())
                        }
                    }
                }
                context("when the request gives an error") {
                    it("should return false equal to error to request") {
                        var listLightningApiMock: ListLightningApiMock? = ListLightningApiMock(shouldReturn: false)
                        listLightningApiMock?.fetchListNodes { _ , error in
                            expect(error).toNot(beNil())
                        }
                    }
                }
            }
        }
    }
}

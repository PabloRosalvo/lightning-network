import Nimble
import Nimble_Snapshots
import Quick

@testable import lightning_network

final class HomeViewControllerSpec: QuickSpec {
    override class func spec() {
        describe("WelcomeSpec")  {
            var sut: HomeViewController!
            context("when init viewController") {
                beforeEach {
                    sut = HomeViewController(viewModel: HomeViewModel())
                    WindowHelper.showInTestWindow(viewController: sut)
                }
                
                afterEach {
                    WindowHelper.cleanTestWindow()
                }
                
                it("should contain a valid layout") {
                    expect(sut).toEventually(haveValidSnapshot())
                }
            }
        }
    }
}

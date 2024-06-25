import Nimble
import Nimble_Snapshots
import Quick

@testable import lightning_network

final class LightningNetworkViewControllerSpec: QuickSpec {
    override class func spec() {
        describe( "LightningNetworkViewControllerSpec")  {
            var sut: LightningNetworkViewController!
            var viewModel: ListLigthNetworkViewModel!
            
            context("when init viewController") {
                beforeEach {
                    viewModel = ListLigthNetworkViewModel(api: ListLightningApiMock(shouldReturn: true))
                    sut = LightningNetworkViewController(viewModel: viewModel)
                    WindowHelper.showInTestWindow(viewController: sut)
                    sut.beginAppearanceTransition(true, animated: false)
                    sut.endAppearanceTransition()
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

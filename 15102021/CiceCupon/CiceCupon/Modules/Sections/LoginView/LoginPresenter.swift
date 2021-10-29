/*
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
*/

import Foundation

protocol LoginPresenterInputProtocol {
    func navigateToHomeTabBar()
    func showCustomAlertError()
}

protocol LoginInteractorOutputProtocol {
    
}

final class LoginPresenter: BasePresenter<LoginViewControllerProtocol, LoginInteractorInputProtocol, LoginRouterInputProtocol> {
    
    var arrayResultados: [ResultMusic] = []
    
}

extension LoginPresenter: LoginPresenterInputProtocol {
    
    func navigateToHomeTabBar() {
        self.router?.showCustomAlertError(with: CustomAlertViewModel(type: .successLogin), delegate: self)
    }
    
    func showCustomAlertError() {
        self.router?.showCustomAlertError(with: CustomAlertViewModel(type: .confirmationLogin), delegate: nil)
    }
    
}

extension LoginPresenter: LoginInteractorOutputProtocol {
    
}

extension LoginPresenter: CustomAlertDefaultViewControllerDelegate {
    
    func defaultPrimaryButtonPressed() {
        self.router?.navigateToHome(with: self.arrayResultados)
    }
}


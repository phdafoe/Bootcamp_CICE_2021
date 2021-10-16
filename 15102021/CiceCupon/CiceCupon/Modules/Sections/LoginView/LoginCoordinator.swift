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

// MARK: - module builder
final class LoginCoordinator {

    // creamos la navegacion (opcional)
    static func navigation(dto: LoginCoordinatorDTO? = nil) -> BaseNavigation {
       BaseNavigation(rootViewController: view())
    }
    
    // creamos la Vista con el retorno de los protocolos de la vista
    static func view(dto: LoginCoordinatorDTO? = nil) -> LoginViewController & LoginViewControllerProtocol {
        let vc = LoginViewController()
        vc.presenter = self.presenter(vc: vc)
        return vc
    }
    
    // creamos el presenter con el retorno de los protocolos de entrada al presenter y salida del interactor
    static func presenter(vc: LoginViewController) -> LoginPresenterInputProtocol & LoginInteractorOutputProtocol {
        let presenter = LoginPresenter(vc: vc)
        presenter.interactor = self.interactor(pre: presenter)
        presenter.router = self.router(vc: vc)
        return presenter
    }
    
    static func interactor(pre: LoginPresenter) -> LoginInteractorInputProtocol {
        let interactor = LoginInteractor(presenter: pre)
        return interactor
    }
    
    static func router(vc: LoginViewController) -> LoginRouterInputProtocol {
        let router = LoginRouter(view: vc)
        return router
    }
    
}

struct LoginCoordinatorDTO {
    
}

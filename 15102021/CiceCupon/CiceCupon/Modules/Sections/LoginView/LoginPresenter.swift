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
    //func fetchData()
    //func getInformationObject() -> ResultMusic?
}

protocol LoginInteractorOutputProtocol {
    //func fetchDataOutputInteractor(data: MusicServerModel?)
}

final class LoginPresenter: BasePresenter<LoginViewControllerProtocol, LoginInteractorInputProtocol, LoginRouterInputProtocol> {
    
    var arrayResultados: [ResultMusic] = []
    
}

extension LoginPresenter: LoginPresenterInputProtocol {
    
    func navigateToHomeTabBar() {
        self.router?.navigateToHome(with: self.arrayResultados)
    }
    
    
//    func fetchData() {
//        self.interactor?.fetchDataMusic()
//    }
//
//    func getInformationObject() -> ResultMusic? {
//        self.arrayResultados[0]
//    }
}

extension LoginPresenter: LoginInteractorOutputProtocol {
    
//    func fetchDataOutputInteractor(data: MusicServerModel?) {
//        self.arrayResultados.removeAll()
//        self.arrayResultados = data?.feed?.results ?? []
//        self.vc?.refreshView()
//    }
    
}


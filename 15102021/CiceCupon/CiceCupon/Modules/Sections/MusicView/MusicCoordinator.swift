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
final class MusicCoordinator {

    // creamos la navegacion (opcional)
    static func navigation(dto: MusicCoordinatorDTO? = nil) -> BaseNavigation {
        BaseNavigation(rootViewController: view(dto: dto))
    }
    
    // creamos la Vista con el retorno de los protocolos de la vista
    static func view(dto: MusicCoordinatorDTO? = nil) -> MusicViewController & MusicViewControllerProtocol {
        let vc = MusicViewController()
        vc.presenter = self.presenter(vc: vc, dto: dto)
        return vc
    }
    
    // creamos el presenter con el retorno de los protocolos de entrada al presenter y salida del interactor
    static func presenter(vc: MusicViewController, dto: MusicCoordinatorDTO? = nil) -> MusicPresenterInputProtocol & MusicInteractorOutputProtocol {
        let presenter = MusicPresenter(vc: vc)
        presenter.arrayResultados = dto?.arrayMusic ?? []
        presenter.interactor = self.interactor(pre: presenter)
        presenter.router = self.router(vc: vc)
        return presenter
    }
    
    static func interactor(pre: MusicPresenter) -> MusicInteractorInputProtocol {
        let interactor = MusicInteractor(presenter: pre)
        return interactor
    }
    
    static func router(vc: MusicViewController) -> MusicRouterInputProtocol {
        let router = MusicRouter(view: vc)
        return router
    }
    
}

struct MusicCoordinatorDTO {
    var arrayMusic: [ResultMusic]?
}

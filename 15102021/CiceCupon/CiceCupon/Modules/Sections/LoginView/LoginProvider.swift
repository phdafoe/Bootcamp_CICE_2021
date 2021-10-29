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
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THEs
POSSIBILITY OF SUCH DAMAGE.
*/

import Foundation

protocol LoginProviderProtocol {
    func fetchData(completionHandler: @escaping (Result<MusicServerModel, NetworkError>) -> ())
}

class LoginProvider: LoginProviderProtocol {
    
    let networkService: NetworkServiceProtocol = NetworkService()
    
    func fetchData(completionHandler: @escaping (Result<MusicServerModel, NetworkError>) -> ()) {
        
        self.networkService.requestGeneric(requestObject: LoginProviderRequest.requestData(data: "\(10)"),
                                           entityClass: MusicServerModel.self) { [weak self] musicServerModel in
            guard self != nil else { return }
            guard let musicServerModelDes = musicServerModel else { return }
            completionHandler(.success(musicServerModelDes))
        } failure: { [weak self] networkError in
            guard self != nil else { return }
            completionHandler(.failure(networkError))
        }
    }
}

struct LoginProviderRequest {
    
    static func requestData(data numeroItems: String, idiom: String? = nil) -> RequestDTO {
        let arguments: [CVarArg] = [numeroItems]
        let urlComplete = String(format: URLEnpoint.music, arguments: arguments)
        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete)
        return request
    }
}

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

import UIKit

protocol LoginViewControllerProtocol {
    func refreshView()
}

class LoginViewController: BaseView<LoginPresenterInputProtocol> {
    
    // MARK: - Variables
    var isLoged = false

    // MARK: - IBOutlet
    @IBOutlet weak var loginViewUsernameTF: UITextField!
    @IBOutlet weak var loginViewPasswordTF: UITextField!
    @IBOutlet weak var loginBTN: UIButton!
    
    @IBAction func loginACTION(_ sender: UIButton) {
        if dataComplete(){
            self.isLoged = true
            Utils.Constantes().kPreferences.set(self.loginViewUsernameTF.text, forKey: Utils.Constantes().kUsuario)
            Utils.Constantes().kPreferences.set(self.loginViewPasswordTF.text, forKey: Utils.Constantes().kContrasena)
            Utils.Constantes().kPreferences.set(self.isLoged, forKey: Utils.Constantes().kUsuarioLogado)
            self.presenter?.navigateToHomeTabBar()
        } else {
            self.presenter?.showCustomAlertError()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
        //self.presenter?.fetchData()
    }
    
    private func configUI() {
        self.loginBTN.layer.cornerRadius = 25
        self.loginBTN.layer.borderWidth = 2
        self.loginBTN.layer.borderColor = UIColor.white.cgColor
    }
    
    private func dataComplete() -> Bool {
        return !(self.loginViewUsernameTF.text?.isEmpty ?? false) && !(self.loginViewPasswordTF.text?.isEmpty ?? false)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

extension LoginViewController: LoginViewControllerProtocol {

    func refreshView() {
        
    }
}

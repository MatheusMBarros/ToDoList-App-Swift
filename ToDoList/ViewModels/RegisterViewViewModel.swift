import FirebaseAuth
import FirebaseFirestore
import Foundation

class RegisterViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var name = ""
    @Published var password = ""
    
    init() {}
    
    func register() {
        guard validate() else {
            // Adicione tratamento de erro ou feedback para o usuário aqui
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error  in
            guard let userId = result?.user.uid, error == nil else {
                // Tratamento de erro ao criar usuário
                print("Erro ao criar usuário:", error?.localizedDescription ?? "")
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary()) { error in
                if let error = error {
                    // Tratamento de erro ao inserir registro no Firestore
                    print("Erro ao inserir registro no Firestore:", error.localizedDescription)
                } else {
                    // Registro inserido com sucesso
                    print("Registro inserido no Firestore com sucesso.")
                }
            }
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            // Adicione feedback para o usuário indicando campos obrigatórios
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            // Adicione feedback para o usuário indicando um email válido
            return false
        }
        
        guard password.count >= 6 else {
            // Adicione feedback para o usuário indicando que a senha é muito curta
            return false
        }
        
        return true
    }
}

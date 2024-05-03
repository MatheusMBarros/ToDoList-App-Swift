import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
        do {
            let data = try JSONEncoder().encode(self)
            guard let dictionary = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                // Tratamento de erro: falha ao converter os dados JSON em dicionário
                print("Erro: Falha ao converter os dados JSON em dicionário.")
                return [:]
            }
            return dictionary
        } catch {
            // Tratamento de erro: falha ao codificar o objeto para JSON
            print("Erro: Falha ao codificar o objeto para JSON.")
            return [:]
        }
    }
}

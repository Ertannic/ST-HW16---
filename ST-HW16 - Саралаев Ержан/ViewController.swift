//
//  ViewController.swift
//  ST-HW16 - Саралаев Ержан
//
//  Created by Ertannic Saralay on 05.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData(urlRequest: "https://api.magicthegathering.io/v1/cards")
    }
    
    func getData(urlRequest: String) {
        guard let url = URL(string: urlRequest) else {
            print("Ошибка: Некорректная ссылка")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Ошибка: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Ошибка: Некорректный ответ сервера")
                return
            }
            
            print("Код ответа от сервера: \(httpResponse.statusCode)")
            
            guard let data = data else {
                print("Ошибка: Отсутствуют данные")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(Cat.self, from: data)
                for card in decodedData.cards {
                    print("Имя карты: \(card.name)")
                    print("Тип: \(card.type)")
                    print("Мановая стоимость: \(card.manaCost)")
                    print("Название сета: \(card.setName.rawValue)")
                    print("----------------------------------")
                }
            } catch {
                print("Ошибка при декодировании данных: \(error.localizedDescription)")
            }
            
        }.resume()
    }
}

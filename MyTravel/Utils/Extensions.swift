//
//  Extensions.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/06.
//

import Foundation

//->유저 데이터를 저장하고 문자열을 분할하기 위한 확장 

extension Encodable {
    //->키가 문자열인 유저 데이터를 얻기 위해서 필요한 메서드 
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
        else {
            throw NSError()
        }
        return dictionary
    }
}

extension Decodable {
    init(fromDictionary: Any) throws {
        let data = try JSONSerialization.data(withJSONObject: fromDictionary, options: .prettyPrinted)
        let decoder = JSONDecoder()
        self = try decoder.decode(Self.self, from: data)
    }
}

//->검색을 처리하는 문자열 생성
extension String  {
    func splitString() -> [String] {
        
        var stringArray: [String] = []
        //->결과를 배열에 담음
        let trimmed = String(self.filter { !"\n\t\r".contains($0)})
        
        for(index, _) in trimmed.enumerated(){
            let prefixIndex = index+1
            let substringPrefix = String(trimmed.prefix(prefixIndex)).lowercased()
            //->위의 접두사 메서드는 문자열을 반환 지정된 길이까지 하위 시퀸스를 반환.
            stringArray.append(substringPrefix)
        }
        //->문자열 배열을 반환()
        return stringArray
    }
}


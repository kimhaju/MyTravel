//
//  CodableBundleExtension.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/22.
//

import Foundation

//->제이슨 파일 파싱 및 확장. 
extension Bundle {
    func decode(_ file: String) -> [AirplaneModel] {
        // 1, 제이슨 파일 위치
        guard let url = self.url(forResource: file, withExtension: nil) else {
            
            fatalError("해당 파일을 찾지 못했습니다. \(file)")
        }
        // 2, 데이터 속성 만들기
        guard let data = try? Data(contentsOf: url) else {
            fatalError("데이터 정보를 가져 오지 못했습니다.\(file)")
        }
        
        // 3, 디코더 만들기
        
        let decoder = JSONDecoder()
        
        // 4, 디코더에 대한 속성 만들기
        guard let loaded = try? decoder.decode([AirplaneModel].self, from: data) else {
            fatalError("모델에 정보가 할당되지 않았습니다. \(file)")
        }
        
        // 5, 바로 사용가능한 데이터 반환
        return loaded
    }
}

//
//  ShowTabBar.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/13.
//

import SwiftUI

struct ShowTabBar: ViewModifier {
    func body(content: Content) -> some View {
        return content.padding(.zero).onAppear {
            DispatchQueue.main.async {
                Tool.showTabBar()
            }
        }
    }
}

struct HiddenTabBar: ViewModifier {
    func body(content: Content) -> some View {
        return content.padding(.zero).onAppear {
            DispatchQueue.main.async {
                Tool.hiddenTabBar()
            }
        }
    }
}

extension UIView {
        
        func allSubviews() -> [UIView] {
            var res = self.subviews
            for subview in self.subviews {
                let riz = subview.allSubviews()
                res.append(contentsOf: riz)
            }
            return res
        }
    }
    
    struct Tool {
        static func showTabBar() {
            UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.allSubviews().forEach({ (v) in
                if let view = v as? UITabBar {
                    view.isHidden = false
                }
            })
        }
        
        static func hiddenTabBar() {
            UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.allSubviews().forEach({ (v) in
                if let view = v as? UITabBar {
                    view.isHidden = true
                }
            })
        }
    }
    extension View {
        func showTabBar() -> some View {
            return self.modifier(ShowTabBar())
        }
        func hiddenTabBar() -> some View {
            return self.modifier(HiddenTabBar())
        }
    }

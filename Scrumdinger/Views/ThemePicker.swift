//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Jan Kaiponen on 8.12.2022.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selection: Theme
    
    var body: some View {
        Picker("Theme", selection: $selection){
            ForEach(Theme.allCases, id: \.name){theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }.pickerStyle(NavigationLinkPickerStyle())
        
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            ThemePicker(selection: .constant(.periwinkle))
        }
    }
}

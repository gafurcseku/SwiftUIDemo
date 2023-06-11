import SwiftUI

struct TextEditorWithPlaceholder: View {
    @Binding var text: String
    var placeHolder: String
    var background: String
    var accessibilityLabel:String
    var body: some View {
        ZStack(alignment: .center) {
            if text.isEmpty {
                HStack {
                    Text(self.placeHolder)
                        .padding(.leading, 4)
                        .opacity(0.6)
                    Spacer()
                    
                }
            }
            
            HStack {
                TextEditor(text: $text)
                    .padding(.top, 9)
                    .opacity(text.isEmpty ? 0.70 : 1)
                    .colorMultiply(Color("\(background)"))
                    .accessibilityIdentifier(accessibilityLabel)
                Spacer()
            }
        }
    }
}

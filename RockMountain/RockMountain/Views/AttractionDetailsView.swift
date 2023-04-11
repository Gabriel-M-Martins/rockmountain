//
//  AttractionDetailsView.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 11/04/23.
//

import SwiftUI

struct AttractionDetailsView: View {
    var attraction: Attraction
    var body: some View {
        ScrollView {
            VStack {
                ImageHeader(details: attraction)
            }
            
            Text(attraction.info)
                .padding()
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct AttractionDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let start = formatter.date(from: "2023/10/08 21:30")!
        let end = formatter.date(from: "2023/10/08 22:30")!
        
        let show = Show(stage: .floresta, startTime: start, endTime: end, day: .monday)
        
        let attraction = Attraction(name: "Maria Bethânia",
                                    info: """
 Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sed congue est, rhoncus cursus ante. Curabitur quis euismod risus. Duis ex nisi, feugiat quis iaculis eget, elementum non lorem. In vitae interdum metus, ut iaculis arcu. Nullam pellentesque gravida scelerisque. Fusce non ipsum id mi laoreet aliquet. Ut faucibus venenatis ipsum. Maecenas arcu nulla, sollicitudin ac placerat in, vehicula eu erat. Aliquam volutpat sollicitudin magna vel feugiat. Etiam ligula ligula, tristique et porta vel, sodales nec dolor. Cras sollicitudin odio vel aliquam egestas. Donec faucibus ipsum quis nulla mollis dignissim. Mauris tincidunt orci sed dignissim rhoncus.
 
 Mauris semper sodales eros, a tincidunt tortor viverra id. Quisque nisl eros, pretium vel diam at, rutrum vestibulum nunc. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer ut est lobortis, porta eros vel, pharetra neque. Nunc suscipit dapibus tellus, sed accumsan eros. Sed sed est ullamcorper, bibendum leo eget, tempor augue. Sed rhoncus turpis massa, at feugiat nisi mollis quis. Proin fringilla rhoncus diam, ut tempus arcu.
 
 Fusce cursus dolor vitae lacus sollicitudin, at maximus est maximus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam a ultricies massa. Mauris eu nisl eleifend, lacinia ex eu, pellentesque ante. Donec at felis justo. Integer faucibus est tortor, non mattis velit porta ac. Donec molestie ultrices lacus viverra dignissim. Pellentesque consectetur massa elit, in lobortis ex imperdiet eget. Ut commodo nisl sed euismod pretium. Vivamus non volutpat eros. Morbi eu facilisis dui, sed varius elit. Etiam at eros gravida, facilisis sapien id, tempor mi. Integer dapibus tempus euismod. Ut posuere tincidunt neque, eu lobortis neque iaculis mollis.
 
 Suspendisse eget magna egestas, porttitor ante nec, interdum enim. Suspendisse volutpat vitae magna et blandit. Vestibulum ac lacinia tellus, sed mattis augue. Sed sed laoreet quam. Quisque sit amet magna at neque hendrerit congue. Quisque vulputate justo tortor, sed vestibulum mauris tempus fermentum. In consectetur urna ut gravida porttitor. Aliquam at nulla eu massa condimentum bibendum. Nunc tristique sem sem, in placerat dui posuere sit amet. Proin commodo justo blandit erat blandit venenatis.

 Nam feugiat molestie aliquam. Nullam vel congue lectus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse malesuada a lectus quis sagittis. In quis ante efficitur, mattis massa ac, gravida tortor. Ut ut risus porttitor nisl blandit tincidunt vel ac ex. Sed dui eros, vulputate scelerisque efficitur nec, tincidunt iaculis ex. Praesent efficitur eros id erat faucibus, et scelerisque lacus tristique. Curabitur nec mi quis ante lacinia elementum. Proin molestie augue a ante commodo, venenatis facilisis tortor gravida. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Aenean tristique mauris sit amet erat vehicula, a iaculis metus ornare. Aenean finibus iaculis quam, nec eleifend nunc vestibulum eget. Vestibulum condimentum augue urna, at posuere ex suscipit eu. Sed blandit tempus ipsum, sit amet porttitor eros auctor vel. Quisque vel eleifend mauris.
 """,
                                    favorite: false, image: Image("img"), show: [show], type: .artist)
        
        return AttractionDetailsView(attraction: attraction)
    }
}

//
//  EmojRatingView.swift
//  Bookworm
//
//  Created by bin li on 7/20/23.
//

import SwiftUI

struct EmojRatingView: View {
  let rating: Int16
    var body: some View {
      switch rating {
      case 1:
        return Text("🙈")
      case 2:
        return Text("😌")
      case 3:
        return Text("🙂")
      case 4:
        return Text("😊")
      default:
        return Text("😍")
      }
    }
}

#Preview {
  EmojRatingView(rating: 5)
}

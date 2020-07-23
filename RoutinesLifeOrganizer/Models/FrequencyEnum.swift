//
//  FrequencyEnum.swift
//  RoutinesLifeOrganizer
//
//  Created by Morgan Wilkinson on 7/22/20.
//

import Foundation
import SwiftUI

enum Frequency: String, CaseIterable, Identifiable {
    case Daily
    case Weekly
    case Biweekly
    case Monthly
    case Every3Months
    case Every6Months
    case Yearly
    
    var id: String { self.rawValue }
}

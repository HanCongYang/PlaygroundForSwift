//
//  RxNestedTypesViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/12/29.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit

struct BlackjackCard {
    
    // nested Suit enumeration
    enum Suit: Character {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }
    
    // nested Rank enumeration
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    // BlackjackCard properties and methods
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}

class GuideNestedTypesViewController: RxRootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let cards = BlackjackCard(rank: BlackjackCard.Rank.jack, suit: BlackjackCard.Suit.diamonds)
        print(cards.description)
    }
}

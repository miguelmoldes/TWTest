//
// Created by MIGUEL MOLDES on 8/4/17.
// Copyright (c) 2017 MiguelMoldes. All rights reserved.
//

import Foundation

struct TWPathResult {

    let time : Int
    let price : Int
    let stations : [TWStation]

    init(time:Int, price:Int, stations:[TWStation]) {
        self.time = time
        self.price = price
        self.stations = stations
    }

}

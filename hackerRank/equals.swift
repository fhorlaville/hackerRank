//
//  equals.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation

func calculateEquals(interns: Int, chocolates: [Int]) {
    
    // let values = Array(Set(chocolates)).sorted()
    let funcs = [1,2,5]
    // var currentMin = values.min()
    // var currentMax = values.max()
    
    // print(values, currentMin, currentMax)
    
    
    var steps = 0
    var reached = false
    var newChocolates = chocolates.sorted()
    
    print(newChocolates)
    print("---")
    
    while !reached {
        var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: funcs.count), count: interns)
        var lookup = [Int: [Int]]()
        
        var maxFoundValue = 0
        var maxFoundIntern:Int = -1
        var maxFoundF:Int = -1
        
        steps += 1
        
        for intern in 0..<interns {
            if let stored = lookup[newChocolates[intern]] {
                matrix[intern] = stored
            } else {
                var matrixAfterAdd:[[Int]] = Array(repeating: Array(repeating: 0, count: funcs.count), count: interns)
                for i in 0..<interns {
                    let startValue = Array(repeating: newChocolates[i], count: funcs.count)
                    if i == intern {
                        matrixAfterAdd[i] = startValue
                    } else {
                        matrixAfterAdd[i] = zip(startValue, funcs).map(+)
                    }
                }
                
                //                print(matrixAfterAdd)
                
                var equalities = Array(repeating: 0, count: funcs.count)
                
                for f in 0..<funcs.count {
                    var counting = [Int: Int]()
                    for i in 0..<interns {
                        let currentCounting = (counting[matrixAfterAdd[i][f]] ?? 0)
                        counting[matrixAfterAdd[i][f]] = currentCounting + 1
                        if currentCounting > maxFoundValue {
                            maxFoundValue = currentCounting
                            maxFoundIntern = i
                            maxFoundF = f
                        }
                        
                    }
                    equalities[f] = counting.values.max()!
                    if equalities[f] == 1 { equalities[f] = 0 }
                    if equalities[f] == interns {
                        reached = true
                        //need a fallthrough of some kind
                    }
                }
                
                lookup[newChocolates[intern]] = equalities
                matrix[intern] = equalities
            }
        }
        //        print("---")
        //        print(matrix)
        //        print("")
        
        // we now have the matrix of equalities after applying all the possible additions
        // we will now apply the operation giving the highest number of equalities
        
        for intern in 0..<interns {
            if intern != maxFoundIntern {
                newChocolates[intern] += funcs[maxFoundF]
            }
        }
        print("Intern: \(maxFoundIntern) + \(funcs[maxFoundF]) - \(maxFoundValue) equalities")
        print(newChocolates)
        print("---")
    }
    
    print (steps)
}


func hcEquals(line1:String, line2: String) {
    
    let interns = Int(line1)!
    let  startValues = line2.components(separatedBy: " ").map{ Int($0)! }
    
    calculateEquals(interns: interns, chocolates: startValues)
}

func hcEqualsWrapper() {
    
    let testCases = Int(readLine()!)!
    for _ in 0..<testCases {
        let interns = Int(readLine()!)!
        let  startValues = readLine()!.components(separatedBy: " ").map{ Int($0)! }
        
        calculateEquals(interns: interns, chocolates: startValues)
    }
}

//calculateEquals(interns: 4, chocolates: [2,2,3,7])

//hcEquals(line1:"110", line2: "53 361 188 665 786 898 447 562 272 123 229 629 670 848 994 54 822 46 208 17 449 302 466 832 931 778 156 39 31 777 749 436 138 289 453 276 539 901 839 811 24 420 440 46 269 786 101 443 832 661 460 281 964 278 465 247 408 622 638 440 751 739 876 889 380 330 517 919 583 356 83 959 129 875 5 750 662 106 193 494 120 653 128 84 283 593 683 44 567 321 484 318 412 712 559 792 394 77 711 977 785 146 936 914 22 942 664 36 400 857")
/*
 82
 520 862 10 956 498 956 991 542 523 664 378 194 76 90 753 868 837 830 932 814 616 78 103 882 452 397 899 488 149 108 723 22 323 733 330 821 41 322 715 917 986 93 111 63 535 864 931 372 47 215 539 15 294 642 897 98 391 796 939 540 257 662 562 580 747 893 401 789 215 468 58 553 561 169 616 448 385 900 173 432 115 712
 199
 761 706 697 212 97 845 151 637 102 165 200 34 912 445 435 53 12 255 111 565 816 632 534 617 18 786 790 802 253 502 602 15 208 651 227 305 848 730 294 303 895 846 337 159 291 125 565 655 380 28 221 549 13 107 166 31 245 308 185 498 810 139 865 370 790 444 27 639 174 321 294 421 168 631 933 811 756 498 467 137 878 40 686 891 499 204 274 744 512 460 242 674 599 108 396 742 552 423 733 79 96 27 852 264 658 785 76 415 635 895 904 514 935 942 757 434 498 32 178 10 844 772 36 795 880 432 537 785 855 270 864 951 649 716 568 308 854 996 75 489 891 331 355 178 273 113 612 771 497 142 133 341 914 521 488 147 953 26 284 160 648 500 463 298 568 31 958 422 379 385 264 622 716 619 800 341 732 764 464 581 258 949 922 173 470 411 672 423 789 956 583 789 808 46 439 376 430 749 151
 161
 134 415 784 202 34 584 543 119 701 7 700 959 956 975 484 426 738 508 201 527 816 136 668 624 535 108 1 965 857 152 478 344 567 262 546 953 199 90 72 900 449 773 211 758 100 696 536 838 204 738 717 21 874 385 997 761 845 998 78 703 502 557 47 421 819 945 375 370 35 799 622 837 924 834 595 24 882 483 862 438 221 931 811 448 317 809 561 162 159 640 217 662 197 616 435 368 562 162 739 949 962 713 786 238 899 733 263 781 217 477 220 790 409 383 590 726 192 152 240 352 792 458 366 341 74 801 709 988 964 800 938 278 514 76 516 413 810 131 547 379 609 119 169 370 502 112 448 695 264 688 399 408 498 765 749 925 918 458 913 234 611
 51
 512 125 928 381 890 90 512 789 469 473 908 990 195 763 102 643 458 366 684 857 126 534 974 875 459 892 686 373 127 297 576 991 774 856 372 664 946 237 806 767 62 714 758 258 477 860 253 287 579 289 496
 */

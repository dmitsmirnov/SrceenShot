//import UIKit

//var list1 = [1,2,4], list2 = [1,3,4]
//
//var unionList = list1 + list2
//var x = unionList.sorted(by: {$0<$1})
//
//print(x)


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

var list1 = ListNode(1, ListNode(2, ListNode(4)))
var list2 = ListNode(1, ListNode(3, ListNode(4)))

var result = mergeTwoLists(list1, list2)

func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    //var unionList = list1 + list2
    //return unionList.sort(by: {$0<$1} )
    var array1: [Int] = []
    var array2: [Int] = []
    
    //print(getValue(list: list1!, array: array1))
    getValue(list: list1!, array: &array1)
    getValue(list: list2!, array: &array2)
    
    var result = array1 + array2
    result.sort(by: {$0<$1})
    print(result)
    
    var listNew = ListNode()
    
    for i in 0...result.count-1 {
        createList(list: &listNew, i: &i, array: result)
    }
    
    print(listNew)
    
    return ListNode(1)
}


func getValue(list: ListNode, array: inout [Int]) -> Void {
    
    if list.next != nil {
        getValue(list: list.next!, array: &array)
    }
    array.append(list.val)
    
}

func createList(list: inout ListNode, i: inout Int, array: [Int]) -> Void {

    //for i in 0...array.count {
        
    if i != array.count-1 {
        list.val = array[i]
        var nextList = ListNode()
        list.next = nextList
        createList(list: &nextList, i: &i, array: array)
    }
        
    //}
    
}

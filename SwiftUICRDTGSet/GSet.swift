//
//  GSet.swift
//  SwiftUICRDTGSet
//
//  Created by Angelos Staboulis on 29/5/24.
//

import Foundation
public struct GSet<T> where T:Hashable{
    private var data:Set<T>
    private var dataset:Set<T>{
        get{
            return data
        }
    }
    init(){
        data = .init()
    }
    public var count:Int{
        get{
            return data.count
        }
    }
    public mutating func add(input:T){
        data.insert(input)
    }
    public func values()->[T]{
        return data.map{$0}
    }
    public func contains(input:T)->Bool{
        return data.contains(input)
    }
    public func compare(input:GSet<T>)->Bool{
        if (data.count != input.count) { return false}
        return data.allSatisfy { input.contains(input: $0)}
    }
    public mutating func merge(input:GSet<T>)->Self{
        data = data.union(dataset)
        return self
    }
}

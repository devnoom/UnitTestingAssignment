//
//  UnitTestingAssignmentTests.swift
//  UnitTestingAssignmentTests
//
//  Created by MacBook Air on 13.05.24.
//

import XCTest
@testable import UnitTestingAssignment

final class UnitTestingAssignmentTests: XCTestCase {
    
    var cartViewModel: CartViewModel!
    
    override func setUpWithError() throws {
        cartViewModel = CartViewModel()
    }
    
    override func tearDownWithError() throws {
        cartViewModel = nil
    }
    
    func testClearCart() {
        let product1 = Product(id: 1, title: "banana", description: "fruit", price: 35.5, selectedQuantity: 1)
        let product2 = Product(id: 2, title: "ball", description: "toy", price: 22.7, selectedQuantity: 1)
        let product3 = Product(id: 3, title: "qanch", description: "tool", price: 57.4, selectedQuantity: 1)
        
        cartViewModel.addProduct(product: product1)
        cartViewModel.addProduct(product: product2)
        cartViewModel.addProduct(product: product3)
        
        cartViewModel.clearCart()
        
        XCTAssertTrue(cartViewModel.selectedProducts.isEmpty)
    }
    
    func testAddProduct() {
        let product1 = Product(id: 1, title: "banana", description: "fruit", price: 35.5, selectedQuantity: 1)
        cartViewModel.addProduct(product: product1)
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
    }
    
    func testAddProductWithID() {
        let product1 = Product(id: 1, title: "banana", description: "fruit", price: 35.5, selectedQuantity: 1)
        cartViewModel.addProduct(withID: 1)
        XCTAssertEqual(product1.id, 1)
    }
    
    func testItemsQuantity() {
        let product1 = Product(id: 1, title: "banana", description: "fruit", price: 35.5, selectedQuantity: 1)
        let product2 = Product(id: 2, title: "ball", description: "toy", price: 22.7, selectedQuantity: 1)
        let product3 = Product(id: 3, title: "qanch", description: "tool", price: 57.4, selectedQuantity: 1)
        
        cartViewModel.addProduct(product: product1)
        cartViewModel.addProduct(product: product2)
        cartViewModel.addProduct(product: product3)
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 3)
    }
    
    func testAddRandomProduct() {
        let product1 = Product(id: 1, title: "banana", description: "fruit", price: 35.5, selectedQuantity: 1)
        let product2 = Product(id: 2, title: "ball", description: "toy", price: 22.7, selectedQuantity: 1)
        let product3 = Product(id: 3, title: "qanch", description: "tool", price: 57.4, selectedQuantity: 1)
        
        cartViewModel.allproducts = [product1, product2, product3]
        
        cartViewModel.addRandomProduct()
        
        XCTAssertFalse(cartViewModel.selectedProducts.isEmpty)
    }
    
    func testRemoveProduct() {
        let product1 = Product(id: 1, title: "banana", description: "fruit", price: 35.5, selectedQuantity: 1)
        let product2 = Product(id: 2, title: "ball", description: "toy", price: 22.7, selectedQuantity: 1)
        let product3 = Product(id: 3, title: "qanch", description: "tool", price: 57.4, selectedQuantity: 1)
        
        cartViewModel.addProduct(product: product1)
        cartViewModel.addProduct(product: product2)
        cartViewModel.addProduct(product: product3)
        
        cartViewModel.removeProduct(withID: 2)
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 2)
    }
    
    func testTotalPrice() {
        let product1 = Product(id: 1, title: "banana", description: "fruit", price: 35.5, selectedQuantity: 1)
        let product2 = Product(id: 2, title: "ball", description: "toy", price: 22.7, selectedQuantity: 1)
        let product3 = Product(id: 3, title: "qanch", description: "tool", price: 57.4, selectedQuantity: 1)
        
        cartViewModel.addProduct(product: product1)
        cartViewModel.addProduct(product: product2)
        cartViewModel.addProduct(product: product3)
        
        XCTAssertEqual(cartViewModel.totalPrice, 53.1)
    }
}


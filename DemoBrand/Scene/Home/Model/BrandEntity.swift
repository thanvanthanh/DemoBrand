//
//  BrandEntity.swift
//  DemoBrand
//
//  Created by Thân Văn Thanh on 24/05/2021.
//

import Foundation
import UIKit

struct BrandEntity {
    var logo: UIImage?
    var name: String?
    var foundedYear: Int?
    var founder: String?
    var ceo: String?
    var introduce: String?
}
func creatBrand() -> [BrandEntity]{
    let data1 = BrandEntity(logo: UIImage(named: "ic_logo_nike"), name: "Nike, Inc.", foundedYear: 1964, founder: "Phil Knight, Bill Bowerman", ceo: "Mark Parker", introduce: "Nike, Inc. là một tập đoàn đa quốc gia của Mỹ hoạt động trong lĩnh vực thiết kế, phát triển, sản xuất, quảng bá cũng như kinh doanh các mặt hàng giày dép, quần áo, phụ kiện, trang thiết bị và dịch vụ liên quan đến thể thao. Trụ sở của công ty được đặt gần Beaverton, Oregon, tại khu vực đô thị Portland.")
    let data2 = BrandEntity(logo: UIImage(named: "ic_logo_adidas"), name: "Adidas", foundedYear: 1924, founder: "Adolf Dassler", ceo: "Mark Parker", introduce: "adidas Limited AG là một thương hiệu chuyên sản xuất các sản phẩm thời trang,thiết bị, dụng cụ thể thao đến từ Đức, một thành viên của tập đoàn adidas Group, bao gồm cả công ty dụng cụ thể thao Reebok, công ty golf Taylormade, công ty sản xuất bóng golf Maxfli và adidas Golf. adidas là nhà sản xuất sản phẩm thể thao lớn thứ hai trên thế giới..")
    let data3 = BrandEntity(logo: UIImage(named: "ic_logo_vansoffthewall"), name: "Vans", foundedYear: 1966, founder: "Paul Van Doren & James Van Doren", ceo: "Mark Parker", introduce: "Hãng giày Vans được ông Paul Van Doren, một nhân viên nhà máy giày, sáng lập vào năm 1966. Sau vài năm làm việc tại xưởng giày Randy's, Doren gặt hái kinh nghiệm và quyết định thành lập một thương hiệu giày của riêng mình. Ngày 16/3/1966, ông cùng các anh em James và Gordon C. Lee mở cửa hàng đầu tiên tại số 704 East Broadway, Anaheim, California. Lúc này cửa hàng mang tên The Van Doren Rubber Company Vans.")
    
    return [data1, data2 , data3]
}

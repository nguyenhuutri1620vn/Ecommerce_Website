def drop_db
    User.delete_all
    Category.delete_all
    Discount.delete_all
    Product.delete_all
    Order.delete_all
    OrderDetail.delete_all
    Cart.delete_all
  end
  drop_db
  
  user_list = [
    ["thudung@mail.com", "123123", "123123", "Lê Thị Thu Dung", "0912177345", "41/21/239 Đà Nẵng - Cầu Tre - NQ", "true"],
    ["trungdung@mail.com", "123123", "123123", "Đoàn Trung Dũng", "0903220098", "Số 28/12 chợ con Trại Cau LC", "true"],
    ["vuhuy@mail.com", "123123", "123123", "Nguyễn Vũ Huy", "0976785816", "15/134 đường Hạ Lý-Hồng Bàng", "false"],
    ["leha@mail.com", "123123", "123123", "Nguyễn Thị Lệ Hà", "0983109724", "15/32 Trần Quang Khải", "false"],
    ["dangkhoa@mail.com", "123123", "123123", "Phan Đăng Khoa", "0983899956", "266 Phan Bội Châu-Phạm Hồng Thái-HB", "false"],
    ["vanloi@mail.com", "123123", "123123", "Võ Văn Lợi", "0998465261", "433 Nơ Trang Long, Quận Bình Thạnh.", "false"],
    ["quangly@mail.com", "123123", "123123", "Đỗ Quang Lý", "0942554495", "77 Trần Quang Diệu , P14, Q3", "false"],
    ["thinguyet@mail.com", "123123", "123123", "Lê Thị Nguyệt", "0388403008", "26 Lý Tự Trọng, Lầu 1 ,Phường Bến Nghé Quận 1", "false"],
    ["thanhnhan@mail.com", "123123", "123123", "Dương Thành Nhân", "0904629579", "1122 TL43, Bình Chiểu, Thủ Đức", "false"],
    ["yennhi@mail.com", "123123", "123123", "Trần Linh Yến Nhi", "0983054815", "265 Nguyễn Đình Chiểu, Phường 5, Quận 3, Tp.HCM", "false"]
  ]
  user_list.each do |email,password,password_confirmation,full_name,phone,address,role|
    User.create!( email: email, password: password, password_confirmation: password_confirmation, full_name: full_name, phone: phone, address: address, admin: role )
  end
  
  category_list = [
    ["Laptop", "true"],
    ["Smartphone", "true"],
    ["Smartwatch", "true"]
  ]
  category_list.each do |name,status|
    Category.create!( name: name, status: status )
  end
  
  discount_list = [
    ["Không khuyến mãi", 0, "2021-11-01", "2021-12-30"],
    ["Khuyến mãi Laptop MSI", 0.1, "2021-11-01", "2021-12-21"],
    ["Khuyến mãi Điện Thoại Samsung", 0.15, "2021-11-03", "2021-12-10"],
  ]
  discount_list.each do |name,percent,starts_at,ends_at|
    Discount.create!( name: name, percent: percent, starts_at: starts_at,ends_at: ends_at  )
  end
  
  laptop = Category.find_by(name: "Laptop").id
  smartphone = Category.find_by(name: "Smartphone").id
  smartwatch = Category.find_by(name: "Smartwatch").id
  km0 = Discount.find_by(name: "Không khuyến mãi").id
  km1 = Discount.find_by(name: "Khuyến mãi Laptop MSI").id
  km2 =  Discount.find_by(name: "Khuyến mãi Điện Thoại Samsung").id
  product_list = [
    [laptop, "Laptop Acer Nitro Gaming", 24699000, "AN515 57 51G6 i5 11400H/8GB/512GB SSD/RTX 3050 4GB/Win10", "true", 2, km0],
    [laptop, "Laptop Asus Zenbook", 23199000, "UX425EA KI429T i5 1135G7/8GB/512GB SSD/Win 10", "true", 1, km0],
    [laptop, "Laptop Acer Nitro Gaming", 22799000, "AN515 56 51N4 i5 11300H/8GB/512GB SSD/Nvidia GTX1650 4GB/Win10", "true", 3, km0],
    [laptop, "Laptop Fujitsu CH", 23999000, "9C13A1 i5 1135G7/8GB/512GB/13.3 inchFHD/Win 10", "true", 1, km0],
    [laptop, "Laptop Acer Nitro Gaming", 27999000, "AN515 57 74RD i7 11800H/8GB/512GB SSD/Nvidia RTX 3050 4GB/Win10", "true", 2, km0],
    [laptop, "Laptop MSI Gaming 1", 29699000, "GF65 10UE 286VN i5 10500H/16GB/512GB/15.6FHD/RTX 3060 Max-Q 6Gb/Win 10", "true", 5, km1],
    [laptop, "Laptop Dell G3 15", 31999000, "3500B i7 10750H/16GB/512GB/15.6 inchFHD/NV GTX1660Ti 6GB/Win 10", "true", 5, km0],
    [laptop, "Laptop Acer Nitro Gaming", 29999000, "AN515 57 74NU i7 11800H/8GB/512GB SSD/RTX 3050Ti 4GB/Win10", "true", 4, km0],
    [laptop, "Laptop MSI Gaming Katana", 29999000, "GF66 11UC 641VN i7 11800H/8GB/512GB/RTX 3050 4GB/Win 10", "true", 2, km1],
    [laptop, "Laptop MSI Gaming 2", 23999000, "GF63 Thin 10SC-481VN i7 10750H/8GB/512GB/15.6 inchFHD/GTX 1650 Max-Q 4GB/Win 10", "true", 1, km1],
    [smartphone, "OPPO Reno6 Z 5G", 9490000, "6.43 inch, FHD+, AMOLED, 1080 x 2400 Pixel", "true", 1, km0],
    [smartphone, "Samsung Galaxy Z Fold3", 41990000, "Màn hình chính: 7.6 inch, Màn hình phụ: 6.2 inch, HD+, Chính: Dynamic AMOLED 2X, Phụ: Dynamic AMOLED 2X, 1768 x 2208 Pixel", "true", 1, km2],
    [smartphone, "iPhone 11 64GB", 16999000, "Màn hình chính: 6.1 inch, Liquid Retina HD, IPS LCD, 828 x 1792 Pixel", "true", 1, km0],
    [smartphone, "Xiaomi POCO X3 Pro NFC", 7290000, "Màn hình chính: 6.67 inch, FHD+, IPS LCD, 1080 x 2400 Pixel 48.0 MP + 8.0 MP + 2.0 MP + 2.0 MP", "true", 1, km0],
    [smartphone, "Nokia C30 3GB-32GB", 2790000, "Màn hình chính: 6.82 inch, HD+, IPS LCD, 720 x 1600 Pixel 13.0 MP + 2.0 MP", "true", 2, km0],
    [smartphone, "Samsung Galaxy Z Flip3", 24990000, "Màn hình chính: 6.7”, Màn hình phụ: 1.9”, FHD+, Chính: Dynamic AMOLED, phụ: Super AMOLED, 1080 x 2636 Pixel", "true", 5, km2],
    [smartphone, "Xiaomi Redmi 10", 4290000, "Màn hình chính: 6.5 inch, FHD+, IPS LCD, 1080 x 2400 Pixel Camera sau: 50.0 MP + 8.0 MP + 2.0 MP + 2.0 MP", "true", 5, km0],
    [smartphone, "Samsung Galaxy Note 20 Ultra", 19999000, "Màn hình 6.9 inch, 2K+, Dynamic AMOLED 2X, 1440 x 3088 Pixel Camera sau: 108.0 MP + 12.0 MP + 12.0 MP", "true", 1, km2],
    [smartphone, "iPhone 12 64GB", 19990000, "Màn hình 6.1 inch, Super Retina XDR, OLED, 2532 x 1170 Pixel Camera sau: 12.0 MP + 12.0 MP", "true", 3, km0],
    [smartphone, "Samsung Galaxy A22", 6299000, "Màn hình 6.6 inch, FHD+, TFT LCD, 1080 x 2400 Pixel Camera sau: 48.0 MP + 5.0 MP + 2.0 MP", "true", 3, km2],
    [smartwatch, "Garmin tactix Delta Solar", 24741000, "Kích thước: 51mm, Mặt kính: Power Sapphire, Dây: nilon & silicone, Chống nước: 10ATM, Pin: lên đến 21 ngày", "true", 1, km0],
    [smartwatch, "Apple Watch Series 7 (4G)", 20990000, "Màn hình: OLED Sapphire, Chất liệu: viền thép, HĐH: watchOS, Chống nước: 5ATM, Cảm biến: Nhịp tim,Wifi,GPS/Glonass", "true", 2, km0],
    [smartwatch, "Apple Watch Series 7 Viền thép", 19990000, "Màn hình: OLED Sapphire, Chất liệu: viền thép, HĐH: watchOS, Chống nước: 5ATM, Cảm biến: Nhịp tim,Wifi,GPS/Glonass", "true", 2, km0],
    [smartwatch, "Garmin Fenix 6S Series", 14490000, "Kích thước: 42mm, Mặt kính: sapphire / cường lực, Dây: da/silicone/titanium, Chống nước: 10ATM, Pin: lên đến 9 ngày", "true", 1, km0],
    [smartwatch, "Garmin Enduro - Titanium Silver", 14290000, "Kích thước: 51 mm, Mặt kính: Power Glass, Dây: elastic nylon, Chống nước: 10 ATM, Pin: ~50 ngày/ 65 ngày với Solar, Lặn, chạy bộ, bơi lội, đạp xe,...", "true", 1, km0],
    [smartwatch, "Apple Watch Series 7", 12990000, "Màn hình: OLED Ion-X, Chất liệu: viền nhôm, HĐH: watchOS, Chống nước: 5ATM, Cảm biến: Nhịp tim,Wifi,GPS/Glonass", "true", 2, km0],
    [smartwatch, "Garmin Descent Mk2S", 22491000, "Kích thước: 43 x 43 x 14.15 mm, Mặt kính: Sapphire, Dây: Silicone, Chống nước: 10ATM, Pin: lên đến 7 ngày, Thể thao: Lặn, bơi, chạy, golf...", "true", 3, km0],
    [smartwatch, "Garmin Venu", 5390000, "Kích thước: 43mm, Mặt kính: cường lực, Dây: silicone, Chống nước: 5ATM, Pin: lên đến 5 ngày", "true", 2, km0],
    [smartwatch, "Garmin Forerunner 55", 4090000, "Kích thước: 42 mm, Mặt kính: cường lực hóa học, Dây: Silicone, Chống nước: 5 ATM, Pin: ~02 tuần, GPS ~20 giờ, Chạy bộ, bơi lội, đạp xe...", "true", 1, km0],
    [smartwatch, "Garmin Approach S12", 4241500, "Kích thước: ~44 mm, Mặt kính: cường lực hóa học, Dây: Silicone, Chống nước: 5 ATM, Pin: ~10 tuần, GPS ~30 giờ", "true", 3, km0],
  ]
  product_list.each do |category_id,name,price,description,status,quantity,discount_id|
    Product.create!( category_id: category_id,name: name, price: price, description: description, status: status, quantity: quantity, discount_id: discount_id )
  end
  
  user3 = User.find_by(email: "vuhuy@mail.com").id
  user4 = User.find_by(email: "leha@mail.com").id
  user5 = User.find_by(email: "dangkhoa@mail.com").id
  order_list = [
    [user3, 3, 1, 49597100],
    [user4, 2, 1, 3399800],
    [user5, 1, 0, 5354150],
  ]
  order_list.each do |user_id,quantity,status,total_price|
    Order.create!( user_id: user_id,quantity: quantity, status: status, total_price: total_price )
  end
  
  product1 = Product.find_by(name: "Laptop Fujitsu CH").id
  product2 = Product.find_by(name: "Laptop MSI Gaming 2").id
  product3 = Product.find_by(name: "iPhone 11 64GB").id
  product4 = Product.find_by(name: "Samsung Galaxy A22").id
  order1 = Order.find_by(total_price: 49597100).id
  order2 = Order.find_by(total_price: 3399800).id
  order3 = Order.find_by(total_price: 5354150).id
  order_details_list = [
    [order1, product1, 47998000, 2],
    [order1, product2, 23999000, 1],
    [order2, product3, 33998000, 2],
    [order3, product4, 6299000, 1],
  ]
  order_details_list.each do |order_id,product_id,price,quantity|
    OrderDetail.create!( order_id: order_id,product_id: product_id, price:price, quantity: quantity )
  end
  
  user1 = User.find_by(email: "dangkhoa@mail.com").id
  user2 = User.find_by(email: "vanloi@mail.com").id
  user3 = User.find_by(email: "quangly@mail.com").id
  product1 = Product.find_by(name: "Laptop Fujitsu CH").id
  product2 = Product.find_by(name: "Laptop MSI Gaming 2").id
  product3 = Product.find_by(name: "iPhone 11 64GB").id
  product4 = Product.find_by(name: "Samsung Galaxy A22").id
  cart_list = [
    [user1, product1, 2],
    [user1, product2, 1],
    [user2, product3, 2],
    [user3, product4, 1],
  ]
  cart_list.each do |user_id,product_id,quantity|
    Cart.create!( user_id: user_id,product_id: product_id, quantity: quantity )
  end
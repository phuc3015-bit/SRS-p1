# SOFTWARE REQUIREMENT SPECIFICATION (SRS)

## Project: Kochi Lens – Website bán thiết bị ngành ảnh

---

# 1. Giới thiệu

## 1.1. Mục đích

Tài liệu này mô tả các yêu cầu phần mềm cho chức năng **Quản lý Sản phẩm (Product Information Management - PIM)** của hệ thống Kochi Lens.

## 1.2. Phạm vi

Hệ thống cho phép quản lý thông tin sản phẩm, biến thể, giá cả và tồn kho nhằm phục vụ hoạt động bán hàng trực tuyến.

## 1.3. Định nghĩa

* **PIM**: Product Information Management
* **SKU**: Mã định danh sản phẩm
* **Variant**: Biến thể sản phẩm (màu sắc, kích thước)

---

# 2. Tổng quan hệ thống

Hệ thống PIM hỗ trợ:

* Quản lý sản phẩm
* Quản lý biến thể
* Quản lý tồn kho
* Hiển thị thông tin sản phẩm cho khách hàng

---

# 3. Business Flow

## 3.1. Use Case Diagram

![Use Case Diagram](images/usecase.png)

---

## 3.2. Activity Diagram

Luồng đặt hàng cơ bản:

1. Khách hàng truy cập website
2. Xem danh sách sản phẩm
3. Xem chi tiết sản phẩm
4. Chọn biến thể (màu sắc/kích thước)
5. Kiểm tra tồn kho
6. Thêm vào giỏ hàng
7. Nhập thông tin giao hàng
8. Thanh toán
9. Hệ thống tạo đơn hàng

---

# 4. Functional Requirements

## 4.1. Nhóm Admin

* Là một **Admin**, tôi muốn thêm sản phẩm để bán trên hệ thống
* Là một **Admin**, tôi muốn cập nhật sản phẩm để chỉnh sửa thông tin
* Là một **Admin**, tôi muốn xóa sản phẩm khi không còn kinh doanh
* Là một **Admin**, tôi muốn quản lý biến thể để cung cấp nhiều lựa chọn
* Là một **Admin**, tôi muốn thiết lập giá và thuế để đảm bảo đúng giá bán
* Là một **Admin**, tôi muốn quản lý tồn kho để kiểm soát số lượng

---

## 4.2. Nhóm Customer

* Là một **khách hàng**, tôi muốn xem danh sách sản phẩm để lựa chọn
* Là một **khách hàng**, tôi muốn xem chi tiết sản phẩm để hiểu rõ thông tin
* Là một **khách hàng**, tôi muốn chọn biến thể để phù hợp nhu cầu
* Là một **khách hàng**, tôi muốn kiểm tra tồn kho để biết còn hàng hay không

---

## 4.3. Nhóm Warehouse Staff

* Là một **nhân viên kho**, tôi muốn cập nhật tồn kho thực tế để đảm bảo dữ liệu chính xác

---

## 4.4. Yêu cầu hệ thống

* Hệ thống phải hiển thị tồn kho theo thời gian thực
* Hệ thống phải đảm bảo mỗi sản phẩm có SKU duy nhất
* Hệ thống phải hỗ trợ nhiều biến thể cho một sản phẩm
* Hệ thống phải đồng bộ dữ liệu với hệ thống đơn hàng

---

# 5. Data Schema

## 5.1. Partner (Khách hàng)

| Field    | Type   | Description       |
| -------- | ------ | ----------------- |
| id       | int    | ID khách hàng     |
| name     | string | Tên               |
| tax_code | string | Mã số thuế        |
| email    | string | Email             |
| phone    | string | Số điện thoại     |
| address  | string | Địa chỉ           |
| type     | enum   | Guest / B2B / B2C |

---

## 5.2. Product

| Field       | Type     | Description  |
| ----------- | -------- | ------------ |
| id          | int      | ID sản phẩm  |
| name        | string   | Tên sản phẩm |
| sku         | string   | Mã SKU       |
| barcode     | string   | Mã vạch      |
| price       | float    | Giá          |
| vat         | float    | Thuế         |
| description | text     | Mô tả        |
| created_at  | datetime | Ngày tạo     |

---

## 5.3. Product Variant

| Field          | Type   | Description       |
| -------------- | ------ | ----------------- |
| id             | int    | ID                |
| product_id     | int    | Liên kết sản phẩm |
| color          | string | Màu               |
| size           | string | Kích thước        |
| price          | float  | Giá               |
| stock_quantity | int    | Tồn kho           |

---

## 5.4. Order

| Field        | Type     | Description                   |
| ------------ | -------- | ----------------------------- |
| id           | int      | ID                            |
| order_number | string   | Số đơn                        |
| customer_id  | int      | Khách hàng                    |
| status       | enum     | Draft / Confirmed / Cancelled |
| total_amount | float    | Tổng tiền                     |
| created_at   | datetime | Ngày tạo                      |

---

## 5.5. Order Item

| Field              | Type  | Description |
| ------------------ | ----- | ----------- |
| id                 | int   | ID          |
| order_id           | int   | Đơn hàng    |
| product_variant_id | int   | Biến thể    |
| quantity           | int   | Số lượng    |
| price              | float | Giá         |

---

# 6. Kết luận

Tài liệu SRS này mô tả đầy đủ chức năng PIM của hệ thống Kochi Lens, đảm bảo hỗ trợ quản lý sản phẩm hiệu quả và phục vụ hoạt động thương mại điện tử.

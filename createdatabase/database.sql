--drop table
-- DROP TABLE IF EXISTS public.detail_invoice;
-- DROP TABLE IF EXISTS public.invoice;
-- DROP TABLE IF EXISTS public.cart;
-- DROP TABLE IF EXISTS public.product;
-- DROP TABLE IF EXISTS public.account;
-- DROP TABLE IF EXISTS public.customer;
-- create table customer

CREATE TABLE IF NOT EXISTS public.customer
(
	customer_id SERIAL,
    full_name text COLLATE pg_catalog."default" NOT NULL,
    phone character varying(10) COLLATE pg_catalog."default",
    email text COLLATE pg_catalog."default",
    CONSTRAINT customer_pkey PRIMARY KEY (customer_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.customer
    OWNER to postgres;

--create table account

CREATE TABLE IF NOT EXISTS public.account
(
     account_id character varying(8) COLLATE pg_catalog."default" NOT NULL,
    MauKhau character varying(6) COLLATE pg_catalog."default" NOT NULL,
    customer_id INT,
    CONSTRAINT account_pkey PRIMARY KEY (account_id),
    CONSTRAINT account_customer_id_fkey FOREIGN KEY (customer_id)
        REFERENCES public.customer (customer_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.account
    OWNER to postgres;
	
-- create table product

CREATE TABLE IF NOT EXISTS public.product
(
    product_id SERIAL,
    product_name text COLLATE pg_catalog."default" NOT NULL,
    price numeric NOT NULL,
    image text COLLATE pg_catalog."default" NOT NULL,
    description text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT product_pkey PRIMARY KEY (product_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.product
    OWNER to postgres;

-- create table cart

CREATE TABLE IF NOT EXISTS public.cart
(
    customer_id INT,
    product_id INT,
    quantity integer DEFAULT 0,
    CONSTRAINT cart_pkey PRIMARY KEY (customer_id, product_id),
    CONSTRAINT cart_customer_id_fkey FOREIGN KEY (customer_id)
        REFERENCES public.customer (customer_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT cart_product_id_fkey FOREIGN KEY (product_id)
        REFERENCES public.product (product_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.cart
    OWNER to postgres;
	
-- create table invoice

CREATE TABLE IF NOT EXISTS public.invoice
(
	invoice_id SERIAL,
    customer_id INT,
    status boolean,
    total numeric,
    thoigian date,
    CONSTRAINT invoice_pkey PRIMARY KEY (invoice_id),
    CONSTRAINT invoice_customer_id_fkey FOREIGN KEY (customer_id)
        REFERENCES public.customer (customer_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.invoice
    OWNER to postgres;
	
	
-- create table detail_invoice

CREATE TABLE IF NOT EXISTS public.detail_invoice
(
    product_id INT,
    invoice_id INT,
    quantity integer DEFAULT 0,
    CONSTRAINT detail_invoice_pkey PRIMARY KEY (product_id, invoice_id),
    CONSTRAINT detail_invoice_invoice_id_fkey FOREIGN KEY (invoice_id)
        REFERENCES public.invoice (invoice_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT detail_invoice_product_id_fkey FOREIGN KEY (product_id)
        REFERENCES public.product (product_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.detail_invoice
    OWNER to postgres;
--Insert data customer
INSERT INTO customer (full_name,phone,email)
VALUES ( 'NguyenVanA', '0911111111', 'NguyenVanA@gmail.com' );
INSERT INTO customer (full_name,phone,email)
VALUES( 'CaoVanhHung', '0879513121', 'CaoVanHung@gmail.com' );
INSERT INTO customer (full_name,phone,email)
VALUES( 'NguyenThiMy', '0873456789', 'MyNguyenThi@gmail.com' );
INSERT INTO customer (full_name,phone,email)
VALUES( 'CaoHuy', '0905540192', 'CaoHuy@gmail.com' );
INSERT INTO customer (full_name,phone,email)
VALUES( 'NguyenVanLoi', '090234567', 'NguyenVanLoi@gmail.com' );
INSERT INTO customer (full_name,phone,email)
VALUES( 'BuiVanThanh', '0876785678', 'BuiVanThanh@gmail.com' );
INSERT INTO customer (full_name,phone,email)
VALUES ( 'LyTuan', '0910101010', 'LyTuan@gmail.com' );
--Insert data account
INSERT INTO account(account_id,maukhau,customer_id)
VALUES ('20110121','123456',(SELECT customer_id FROM customer WHERE full_name = 'NguyenVanA'));
INSERT INTO account(account_id,maukhau,customer_id)
VALUES('20110L02','123456',(SELECT customer_id FROM customer WHERE full_name = 'CaoVanhHung'));
INSERT INTO account(account_id,maukhau,customer_id)
VALUES('20110536','123456',(SELECT customer_id FROM customer WHERE full_name = 'NguyenVanLoi'));
INSERT INTO account(account_id,maukhau,customer_id)
VALUES('20110110','123456',(SELECT customer_id FROM customer WHERE full_name = 'NguyenThiMy'));
INSERT INTO account(account_id,maukhau,customer_id)
VALUES('20110111','123456',(SELECT customer_id FROM customer WHERE full_name = 'CaoHuy'));
INSERT INTO account(account_id,maukhau,customer_id)
VALUES('20110001','123456',(SELECT customer_id FROM customer WHERE full_name = 'BuiVanThanh'));
INSERT INTO account(account_id,maukhau,customer_id)
VALUES('20110120','123456',(SELECT customer_id FROM customer WHERE full_name = 'LyTuan'));
--Insert data Product
INSERT INTO product(product_name,image,description,price)
VALUES('sữa tươi cà phê','https://res.cloudinary.com/dlux9nebf/image/upload/v1665647450/Day%20dream/cafe3_lrtfan.png','good',25.000);
INSERT INTO product(product_name,image,description,price)
VALUES('Bạc xỉu','	https://res.cloudinary.com/dlux9nebf/image/upload/v1665647440/Day%20dream/cafe_piapyr.jpg','good',25.000);
INSERT INTO product(product_name,image,description,price)
VALUES('Cà phê Latte','https://res.cloudinary.com/dlux9nebf/image/upload/v1665647440/Day%20dream/cafe5_fefmzb.jpg','good',25.000);
INSERT INTO product(product_name,image,description,price)
VALUES('Cà phê sữa','https://res.cloudinary.com/dlux9nebf/image/upload/v1665647440/Day%20dream/cafe4_pwaems.jpg','good',25.000);
INSERT INTO product(product_name,image,description,price)
VALUES('Cà phê đen','https://res.cloudinary.com/dlux9nebf/image/upload/v1665647440/Day%20dream/cafe2_sxa4bz.webp','good',20.000);
INSERT INTO product(product_name,image,description,price)
VALUES('Americano','https://res.cloudinary.com/dlux9nebf/image/upload/v1665647440/Day%20dream/cafe6_lbumg9.webp','good',20.000);
INSERT INTO product(product_name,image,description,price)
VALUES('Trà đào','https://res.cloudinary.com/dlux9nebf/image/upload/v1665642077/Day%20dream/TRASUA8_cckgrm.jpg','good',25.000);
INSERT INTO product(product_name,image,description,price)
VALUES('Trà chanh','https://res.cloudinary.com/dlux9nebf/image/upload/v1665642077/Day%20dream/TRASUA8_cckgrm.jpg','good',25.000);
INSERT INTO product(product_name,image,description,price)
VALUES('Trà dâu','https://res.cloudinary.com/dlux9nebf/image/upload/v1665642076/Day%20dream/TRASUA4_inkdaj.jpg','good',20.000);
INSERT INTO product(product_name,image,description,price)
VALUES('Trà sen','https://res.cloudinary.com/dlux9nebf/image/upload/v1665642077/Day%20dream/TRASUA9_kjcdt1.jpg','good',25.000);
INSERT INTO product(product_name,image,description,price)
VALUES('Trà bí đao','https://res.cloudinary.com/dlux9nebf/image/upload/v1665642076/Day%20dream/TRASUA7_hcmaxb.jpg','good',25.000);
INSERT INTO product(product_name,image,description,price)
VALUES('Trà chanh dây','https://res.cloudinary.com/dlux9nebf/image/upload/v1665642076/Day%20dream/TRASUA6_qobo37.jpg','good',25.000);
INSERT INTO product(product_name,image,description,price)
VALUES('Trà hoa đầu biếc','https://res.cloudinary.com/dlux9nebf/image/upload/v1665642076/Day%20dream/TRASUA5_hs21mv.jpg','good',25.000);
INSERT INTO product(product_name,image,description,price)
VALUES('Trà ổi hồng','https://res.cloudinary.com/dlux9nebf/image/upload/v1665643978/Day%20dream/TRA8_w0zehd.jpg','good',25.000);
INSERT INTO product(product_name,image,description,price)
VALUES('Trà xanh','https://res.cloudinary.com/dlux9nebf/image/upload/v1665643978/Day%20dream/TRA9_tzcs0e.jpg','good',20.000);
INSERT INTO product(product_name,image,description,price)
VALUES('Trà sữa trân châu trắng','https://res.cloudinary.com/dlux9nebf/image/upload/v1665649183/Day%20dream/DSC02750-101_zpgplj.png','good',30.000);
INSERT INTO product(product_name,image,description,price)
VALUES('Trà sữa thái lan','https://res.cloudinary.com/dlux9nebf/image/upload/v1665644756/Day%20dream/TRASUA3_w0awhv.png','good',25.000);
INSERT INTO product(product_name,image,description,price)
VALUES('Trà sữa xanh thái','https://res.cloudinary.com/dlux9nebf/image/upload/v1665644756/Day%20dream/TRASUA2_mhcd4o.png','good',25.000);
INSERT INTO product(product_name,image,description,price)
VALUES('Trà sữa khoai môn','https://res.cloudinary.com/dlux9nebf/image/upload/v1665644757/Day%20dream/TRASUA4_cvzmnq.png','good',30.000);
INSERT INTO product(product_name,image,description,price)
VALUES('Trà sữa Daydream','https://res.cloudinary.com/dlux9nebf/image/upload/v1665644756/Day%20dream/TRASUA1_mwemr0.png','good',25.000);
INSERT INTO product(product_name,image,description,price)
VALUES('Trà sữa hoa hồng','https://res.cloudinary.com/dlux9nebf/image/upload/v1665644761/Day%20dream/TRASUA8_f9kcxb.png','good',25.000);
INSERT INTO product(product_name,image,description,price)
VALUES('Socola đá xay','https://res.cloudinary.com/dlux9nebf/image/upload/v1665646398/Day%20dream/daxay3_on3cpe.png','good',35.000);
INSERT INTO product(product_name,image,description,price)
VALUES('Mocha đá xay','https://res.cloudinary.com/dlux9nebf/image/upload/v1665646402/Day%20dream/daxay6_e8tvw5.png','good',35.000);
INSERT INTO product(product_name,image,description,price)
VALUES('Matcha đá xay','https://res.cloudinary.com/dlux9nebf/image/upload/v1665646397/Day%20dream/daxay4_rkek6q.png','good',25.000);
INSERT INTO product(product_name,image,description,price)
VALUES('Sữa tươi đá xay','https://res.cloudinary.com/dlux9nebf/image/upload/v1665646397/Day%20dream/daxay5_gnpitf.png','good',30.000);
INSERT INTO product(product_name,image,description,price)
VALUES('Khoai môn đá xay','https://res.cloudinary.com/dlux9nebf/image/upload/v1665646398/Day%20dream/daxay2_yfil3f.png','good',35.000);
INSERT INTO product(product_name,image,description,price)
VALUES('Caramel đá xay','https://res.cloudinary.com/dlux9nebf/image/upload/v1665646397/Day%20dream/daxay1_oxlrku.png','good',35.000);
--insert data cart
INSERT INTO cart(customer_id,product_id,quantity)
VALUES((SELECT customer_id FROM customer WHERE full_name = 'LyTuan'),(SELECT product_id FROM product WHERE product_name = 'sữa tươi cà phê'),2);
INSERT INTO cart(customer_id,product_id,quantity)
VALUES((SELECT customer_id FROM customer WHERE full_name = 'BuiVanThanh'),(SELECT product_id FROM product WHERE product_name = 'Trà hoa đầu biếc'),4);
INSERT INTO cart(customer_id,product_id,quantity)
VALUES((SELECT customer_id FROM customer WHERE full_name = 'NguyenVanLoi'),(SELECT product_id FROM product WHERE product_name = 'Trà sữa trân châu trắng'),5);
INSERT INTO cart(customer_id,product_id,quantity)
VALUES((SELECT customer_id FROM customer WHERE full_name = 'CaoHuy'),(SELECT product_id FROM product WHERE product_name = 'Trà sữa thái lan'),1);
INSERT INTO cart(customer_id,product_id,quantity)
VALUES((SELECT customer_id FROM customer WHERE full_name = 'NguyenThiMy'),(SELECT product_id FROM product WHERE product_name = 'Trà sữa xanh thái'),3);
INSERT INTO cart(customer_id,product_id,quantity)
VALUES((SELECT customer_id FROM customer WHERE full_name = 'CaoVanhHung'),(SELECT product_id FROM product WHERE product_name = 'Trà sữa khoai môn'),2);
INSERT INTO cart(customer_id,product_id,quantity)
VALUES((SELECT customer_id FROM customer WHERE full_name = 'NguyenVanA'),(SELECT product_id FROM product WHERE product_name = 'Trà sữa hoa hồng'),2);
--insert data invoice
INSERT INTO invoice(customer_id,thoigian,status,total)
VALUES((SELECT customer_id FROM customer WHERE full_name = 'LyTuan'),'10-10-2020',TRUE,25.000);
INSERT INTO invoice(customer_id,thoigian,status,total)
VALUES((SELECT customer_id FROM customer WHERE full_name = 'BuiVanThanh'),'11-10-2020',TRUE,25.000);
INSERT INTO invoice(customer_id,thoigian,status,total)
VALUES((SELECT customer_id FROM customer WHERE full_name = 'NguyenVanA'),'12-10-2020',TRUE,20.000);
INSERT INTO invoice(customer_id,thoigian,status,total)
VALUES((SELECT customer_id FROM customer WHERE full_name = 'CaoVanhHung'),'13-10-2020',FALSE,25.000);
INSERT INTO invoice(customer_id,thoigian,status,total)
VALUES((SELECT customer_id FROM customer WHERE full_name = 'NguyenThiMy'),'14-10-2020',TRUE,25.000);
INSERT INTO invoice(customer_id,thoigian,status,total)
VALUES((SELECT customer_id FROM customer WHERE full_name = 'CaoHuy'),'16-10-2020',FALSE,25.000);
INSERT INTO invoice(customer_id,thoigian,status,total)
VALUES((SELECT customer_id FROM customer WHERE full_name = 'NguyenVanLoi'),'17-10-2020',FALSE,35.000);
--insert data detail_invoice
INSERT INTO detail_invoice(product_id,invoice_id, quantity)
VALUES((SELECT product_id FROM product WHERE product_name = 'Trà sữa thái lan'),(SELECT invoice_id FROM invoice WHERE customer_id IN (SELECT customer_id FROM customer WHERE full_name = 'LyTuan')),1);
INSERT INTO detail_invoice(product_id,invoice_id, quantity)
VALUES((SELECT product_id FROM product WHERE product_name = 'Trà xanh'),(SELECT invoice_id FROM invoice WHERE customer_id IN (SELECT customer_id FROM customer WHERE full_name = 'NguyenVanA')),1);
INSERT INTO detail_invoice(product_id,invoice_id, quantity)
VALUES((SELECT product_id FROM product WHERE product_name = 'Caramel đá xay'),(SELECT invoice_id FROM invoice WHERE customer_id IN (SELECT customer_id FROM customer WHERE full_name = 'NguyenVanLoi')),1);
INSERT INTO detail_invoice(product_id,invoice_id, quantity)
VALUES((SELECT product_id FROM product WHERE product_name = 'Trà sữa thái lan'),(SELECT invoice_id FROM invoice WHERE customer_id IN (SELECT customer_id FROM customer WHERE full_name = 'CaoHuy')),1);
INSERT INTO detail_invoice(product_id,invoice_id, quantity)
VALUES((SELECT product_id FROM product WHERE product_name = 'Trà sữa thái lan'),(SELECT invoice_id FROM invoice WHERE customer_id IN (SELECT customer_id FROM customer WHERE full_name = 'NguyenThiMy')),1);
INSERT INTO detail_invoice(product_id,invoice_id, quantity)
VALUES((SELECT product_id FROM product WHERE product_name = 'Trà sữa thái lan'),(SELECT invoice_id FROM invoice WHERE customer_id IN (SELECT customer_id FROM customer WHERE full_name = 'CaoVanhHung')),1);
INSERT INTO detail_invoice(product_id,invoice_id, quantity)
VALUES((SELECT product_id FROM product WHERE product_name = 'Trà sữa thái lan'),(SELECT invoice_id FROM invoice WHERE customer_id IN (SELECT customer_id FROM customer WHERE full_name = 'BuiVanThanh')),1);
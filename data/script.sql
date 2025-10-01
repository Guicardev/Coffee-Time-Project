-- =============================================
-- Script de création de la base de données E-commerce de café
-- =============================================

-- Création de la table des rôles
CREATE TABLE Roles (
    id_role INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL UNIQUE
);

-- Création de la table des utilisateurs
CREATE TABLE Users (
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    last_name TEXT NOT NULL,
    first_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    register_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    last_login_date DATETIME NULL,
    status ENUM('active', 'inactive', 'suspended') DEFAULT 'active',
    phone TEXT NULL,
    newsletters BOOLEAN DEFAULT FALSE,
    rgpd_consent BOOLEAN NOT NULL DEFAULT FALSE,
    birth_date DATE NULL,
    id_role INT NOT NULL DEFAULT 1,
    FOREIGN KEY (id_role) REFERENCES Roles(id_role)
);

-- Création de la table des adresses
CREATE TABLE Address (
    id_address INT PRIMARY KEY AUTO_INCREMENT,
    address_type ENUM('billing', 'delivery', 'both') NOT NULL,
    name TEXT NOT NULL,
    street_number TEXT NOT NULL,
    street_name TEXT NOT NULL,
    address_complement VARCHAR(255) NULL,
    zip_code VARCHAR(10) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL DEFAULT 'France',
    billing_address TEXT NULL,
    delivery_address TEXT NULL
);

-- Création de la table des catégories
CREATE TABLE Category (
    id_category INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    parent_category_id INT NULL,
    FOREIGN KEY (parent_category_id) REFERENCES Category(id_category) ON DELETE CASCADE
);

-- Création de la table des produits
CREATE TABLE Products (
    id_product INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    origin TEXT NOT NULL,
    grain_type TEXT NOT NULL,
    roasting_level ENUM('light', 'medium', 'dark') NOT NULL,
    description TEXT NULL,
    image VARCHAR(500) NULL,
    price DECIMAL(10,2) NOT NULL,
    taxe DECIMAL(5,2) NOT NULL DEFAULT 20.00,
    weight_net DECIMAL(8,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    added_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    removed_date DATETIME NULL,
    removal_reason TEXT NULL,
    reference VARCHAR(50) UNIQUE NOT NULL
);

-- Création de la table des avis
CREATE TABLE Reviews (
    id_review INT PRIMARY KEY AUTO_INCREMENT,
    title TEXT NOT NULL,
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comments TEXT NULL,
    date_published DATETIME DEFAULT CURRENT_TIMESTAMP,
    modification_date DATETIME NULL,
    validation_date DATETIME NULL,
    status ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
    id_product INT NOT NULL,
    id_user INT NOT NULL,
    FOREIGN KEY (id_product) REFERENCES Products(id_product) ON DELETE CASCADE,
    FOREIGN KEY (id_user) REFERENCES Users(id_user) ON DELETE CASCADE
);

-- Création de la table des promotions
CREATE TABLE Promotions (
    id_promotion INT PRIMARY KEY AUTO_INCREMENT,
    coupon VARCHAR(50) UNIQUE NULL,
    description TEXT NOT NULL,
    type ENUM('percentage', 'fixed_amount', 'free_shipping') NOT NULL,
    minimum_purchasing DECIMAL(10,2) NULL,
    amount DECIMAL(10,2) NOT NULL,
    start_promotion DATETIME NOT NULL,
    end_promotion DATETIME NOT NULL,
    is_active BOOLEAN DEFAULT TRUE
);

-- Création de la table des paniers
CREATE TABLE Carts (
    id_cart INT PRIMARY KEY AUTO_INCREMENT,
    date_create DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('active', 'abandoned', 'converted') DEFAULT 'active',
    expiry_date DATETIME NOT NULL
);

-- Création de la table des détails de panier
CREATE TABLE Cart_details (
    id_cart_details INT PRIMARY KEY AUTO_INCREMENT,
    quantity INT NOT NULL DEFAULT 1,
    unit_price DECIMAL(10,2) NOT NULL,
    add_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    id_cart INT NOT NULL,
    id_product INT NOT NULL,
    FOREIGN KEY (id_cart) REFERENCES Carts(id_cart) ON DELETE CASCADE,
    FOREIGN KEY (id_product) REFERENCES Products(id_product) ON DELETE CASCADE
);

-- Création de la table des commandes
CREATE TABLE Orders (
    id_order INT PRIMARY KEY AUTO_INCREMENT,
    status ENUM('pending', 'validated', 'processing', 'shipped', 'delivered', 'cancelled') DEFAULT 'pending',
    delivery_mode ENUM('standard', 'express', 'pickup') NOT NULL,
    order_number TEXT UNIQUE NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    validation_date DATETIME NULL,
    cancel_date DATETIME NULL,
    invoice_amount DECIMAL(10,2) NOT NULL,
    id_address INT NOT NULL,
    FOREIGN KEY (id_address) REFERENCES Address(id_address)
);

-- Création de la table des détails de commande
CREATE TABLE Order_details (
    id_order_detail INT PRIMARY KEY AUTO_INCREMENT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    taxe DECIMAL(5,2) NOT NULL,
    discount DECIMAL(10,2) DEFAULT 0.00,
    status ENUM('pending', 'confirmed', 'cancelled') DEFAULT 'pending',
    id_order INT NOT NULL,
    FOREIGN KEY (id_order) REFERENCES Orders(id_order) ON DELETE CASCADE
);

-- Création de la table des paiements
CREATE TABLE Payments (
    id_payment INT PRIMARY KEY AUTO_INCREMENT,
    payment_method ENUM('card', 'paypal', 'transfer', 'cash') NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_status ENUM('pending', 'completed', 'failed', 'refunded') DEFAULT 'pending',
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    id_order INT NOT NULL,
    FOREIGN KEY (id_order) REFERENCES Orders(id_order) ON DELETE CASCADE
);

-- Création de la table des livraisons
CREATE TABLE Deliveries (
    id_delivery INT PRIMARY KEY AUTO_INCREMENT,
    delivery_method ENUM('standard', 'express', 'pickup') NOT NULL,
    delivery_status ENUM('preparing', 'shipped', 'in_transit', 'delivered', 'failed') DEFAULT 'preparing',
    shipping_date DATETIME NULL,
    delivery_date DATETIME NULL,
    delivery_estimate DATETIME NULL,
    delivery_fee DECIMAL(10,2) DEFAULT 0.00,
    tracking_number TEXT NULL,
    carrier TEXT NULL,
    comment TEXT NULL,
    id_order INT NOT NULL,
    FOREIGN KEY (id_order) REFERENCES Orders(id_order) ON DELETE CASCADE
);

-- Création de la table des remboursements
CREATE TABLE Refund (
    id_refund INT PRIMARY KEY AUTO_INCREMENT,
    amount_refund DECIMAL(10,2) NOT NULL,
    refund_status ENUM('requested', 'processing', 'completed', 'rejected') DEFAULT 'requested',
    refund_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    refund_method ENUM('card', 'paypal', 'transfer') NOT NULL,
    refund_reason TEXT NOT NULL,
    id_payment INT NOT NULL,
    FOREIGN KEY (id_payment) REFERENCES Payments(id_payment) ON DELETE CASCADE
);

-- Création de la table des retours produits
CREATE TABLE Products_return (
    id_return INT PRIMARY KEY AUTO_INCREMENT,
    return_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    return_status ENUM('requested', 'approved', 'rejected', 'received', 'processed') DEFAULT 'requested',
    return_reason TEXT NOT NULL,
    id_refund INT NULL,
    FOREIGN KEY (id_refund) REFERENCES Refund(id_refund)
);

-- Création de la table des listes de souhaits
CREATE TABLE Wishlist (
    id_wishlist INT PRIMARY KEY AUTO_INCREMENT,
    add_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    delete_date DATETIME NULL,
    name_list TEXT NOT NULL
);

-- =============================================
-- Tables d'association (relations N:N)
-- =============================================

-- Relation utilisateur possède adresse
CREATE TABLE possess (
    id_user INT NOT NULL,
    id_address INT NOT NULL,
    PRIMARY KEY (id_user, id_address),
    FOREIGN KEY (id_user) REFERENCES Users(id_user) ON DELETE CASCADE,
    FOREIGN KEY (id_address) REFERENCES Address(id_address) ON DELETE CASCADE
);

-- Relation utilisateur passe commande
CREATE TABLE places (
    id_user INT NOT NULL,
    id_order INT NOT NULL,
    PRIMARY KEY (id_user, id_order),
    FOREIGN KEY (id_user) REFERENCES Users(id_user) ON DELETE CASCADE,
    FOREIGN KEY (id_order) REFERENCES Orders(id_order) ON DELETE CASCADE
);

-- Relation produit inclus dans détail commande
CREATE TABLE includes (
    id_product INT NOT NULL,
    id_order_detail INT NOT NULL,
    PRIMARY KEY (id_product, id_order_detail),
    FOREIGN KEY (id_product) REFERENCES Products(id_product) ON DELETE CASCADE,
    FOREIGN KEY (id_order_detail) REFERENCES Order_details(id_order_detail) ON DELETE CASCADE
);

-- Relation commande génère livraison (déjà gérée par FK dans Deliveries)

-- Relation catégorie classe produit
CREATE TABLE Classify (
    id_category INT NOT NULL,
    id_product INT NOT NULL,
    PRIMARY KEY (id_category, id_product),
    FOREIGN KEY (id_category) REFERENCES Category(id_category) ON DELETE CASCADE,
    FOREIGN KEY (id_product) REFERENCES Products(id_product) ON DELETE CASCADE
);

-- Relation utilisateur achète produit
CREATE TABLE buy (
    id_user INT NOT NULL,
    id_product INT NOT NULL,
    purchase_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_user, id_product, purchase_date),
    FOREIGN KEY (id_user) REFERENCES Users(id_user) ON DELETE CASCADE,
    FOREIGN KEY (id_product) REFERENCES Products(id_product) ON DELETE CASCADE
);

-- Relation promotion contient produit
CREATE TABLE contain (
    id_promotion INT NOT NULL,
    id_product INT NOT NULL,
    PRIMARY KEY (id_promotion, id_product),
    FOREIGN KEY (id_promotion) REFERENCES Promotions(id_promotion) ON DELETE CASCADE,
    FOREIGN KEY (id_product) REFERENCES Products(id_product) ON DELETE CASCADE
);

-- Relation commande enregistre retour
CREATE TABLE register (
    id_order INT NOT NULL,
    id_return INT NOT NULL,
    PRIMARY KEY (id_order, id_return),
    FOREIGN KEY (id_order) REFERENCES Orders(id_order) ON DELETE CASCADE,
    FOREIGN KEY (id_return) REFERENCES Products_return(id_return) ON DELETE CASCADE
);

-- Relation retour a remboursement
CREATE TABLE have (
    id_return INT NOT NULL,
    id_refund INT NOT NULL,
    PRIMARY KEY (id_return, id_refund),
    FOREIGN KEY (id_return) REFERENCES Products_return(id_return) ON DELETE CASCADE,
    FOREIGN KEY (id_refund) REFERENCES Refund(id_refund) ON DELETE CASCADE
);

-- Relation produit appartient à liste de souhaits
CREATE TABLE belong (
    id_product INT NOT NULL,
    id_wishlist INT NOT NULL,
    add_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_product, id_wishlist),
    FOREIGN KEY (id_product) REFERENCES Products(id_product) ON DELETE CASCADE,
    FOREIGN KEY (id_wishlist) REFERENCES Wishlist(id_wishlist) ON DELETE CASCADE
);

-- Relation utilisateur collectionne liste de souhaits
CREATE TABLE collects (
    id_user INT NOT NULL,
    id_wishlist INT NOT NULL,
    PRIMARY KEY (id_user, id_wishlist),
    FOREIGN KEY (id_user) REFERENCES Users(id_user) ON DELETE CASCADE,
    FOREIGN KEY (id_wishlist) REFERENCES Wishlist(id_wishlist) ON DELETE CASCADE
);

-- =============================================
-- Insertion des données de base
-- =============================================

-- Insertion des rôles de base
INSERT INTO Roles (name) VALUES 
('utilisateur'),
('responsable_produit'),
('admin');

-- Insertion des catégories de base
INSERT INTO Category (name, parent_category_id) VALUES 
('Arabica', NULL),
('Robusta', NULL),
('Mélanges', NULL),
('Décaféiné', NULL),
('Bio', NULL);

-- =============================================
-- Index pour optimiser les performances
-- =============================================

-- Index sur les colonnes fréquemment utilisées
CREATE INDEX idx_users_email ON Users(email);
CREATE INDEX idx_users_status ON Users(status);
CREATE INDEX idx_products_active ON Products(is_active);
CREATE INDEX idx_products_reference ON Products(reference);
CREATE INDEX idx_orders_status ON Orders(status);
CREATE INDEX idx_orders_date ON Orders(order_date);
CREATE INDEX idx_payments_status ON Payments(payment_status);
CREATE INDEX idx_reviews_product ON Reviews(id_product);
CREATE INDEX idx_reviews_status ON Reviews(status);

-- Index composites
CREATE INDEX idx_cart_details_cart_product ON Cart_details(id_cart, id_product);
CREATE INDEX idx_order_details_order ON Order_details(id_order);

-- =============================================
-- Fin du script
-- =============================================
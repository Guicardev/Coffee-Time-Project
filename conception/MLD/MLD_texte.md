# Tables Principales

## Role

Clé primaire : id_role

Attributs : nom

## Utilisateur

Clé primaire : id_utilisateur

Attributs : nom, prenom, email, mot_de_passe, date_inscription, date_derniere_connexion, statut, telephone, newsletter_option, rgpd_consentement, id_role

Clé étrangère : id_role → Role(id_role)

## Adresses

Clé primaire : id_adresse

Attributs : type_adresse, nom, numero_rue, voie, complement_adresse, code_postal, ville, pays, id_utilisateur

Clé étrangère : id_utilisateur → Utilisateur(id_utilisateur)

## Produits

Clé primaire : id_produit

Attributs : nom, description, image, prix, tva, poids, stock, activation, date_ajout, date_retrait, raison_retrait, id_categories

Clé étrangère : id_categories → Categories(id_categories)

## Categories

Clé primaire : id_categories

Attributs : nom, id_categorie_parent

Clé étrangère : id_categorie_parent → Categories(id_categories)

## Avis

Clé primaire : id_avis

Attributs : titre, note, commentaire, date_publier, date_modification, statut, id_utilisateur, id_produit

Clés étrangères : id_utilisateur → Utilisateur(id_utilisateur), id_produit → Produits(id_produit)

## Commande

Clé primaire : id_commande

Attributs : statut, date_commande, date_validation, date_annulation, montant_facture, id_utilisateur, id_adresse_livraison, id_adresse_facturation

Clés étrangères : id_utilisateur → Utilisateur(id_utilisateur), id_adresse_livraison → Adresses(id_adresse), id_adresse_facturation → Adresses(id_adresse)

## Paiement

Clé primaire : id_paiement

Attributs : methode_paiement, montant, montant_remboursement, statut_remboursement, statut_paiement, date_paiement, id_utilisateur, id_commande

Clés étrangères : id_utilisateur → Utilisateur(id_utilisateur), id_commande → Commande(id_commande)

## Livraisons

Clé primaire : id_livraison

Attributs : methode_livraison, statut_livraison, date_expedition, date_livraison, estimation_livraison, frais_livraison, num_suivi, transportateur, commentaire, id_commande

Clé étrangère : id_commande → Commande(id_commande)

## Panier

Clé primaire : id_panier

Attributs : date_creation, statut, id_utilisateur

Clé étrangère : id_utilisateur → Utilisateur(id_utilisateur)

## Favoris

Clé primaire : id_favoris

Attributs : id_utilisateur, id_produit

Clés étrangères : id_utilisateur → Utilisateur(id_utilisateur), id_produit → Produits(id_produit)

Contrainte unique : (id_utilisateur, id_produit)

## Promotion

Clé primaire : id_promotion

Attributs : coupon, description, type, valeur, debut_promotion, fin_promotion, actif

---

# Tables d'Association

## DétailPanier

Clé primaire : (id_panier, id_produit)

Attributs : quantite, prix_unitaire

Clés étrangères : id_panier → Panier(id_panier), id_produit → Produits(id_produit)

## Details_commande

Clé primaire : (id_commande, id_produit)

Attributs : quantite, prix_unitaire

Clés étrangères : id_commande → Commande(id_commande), id_produit → Produits(id_produit)

## Promotion_produit

Clé primaire : (id_promotion, id_produit)

Clés étrangères : id_promotion → Promotion(id_promotion), id_produit → Produits(id_produit)

## Promotion_categorie

Clé primaire : (id_promotion, id_categories)

Clés étrangères : id_promotion → Promotion(id_promotion), id_categories → Categories(id_categories)

---

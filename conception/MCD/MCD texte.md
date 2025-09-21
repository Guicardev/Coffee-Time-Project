# MCD en réflexion version texte

## Les entité, tables

- [x] Role (id_role, nom)

- [x] Utilisateur (id_utilisateur, nom, prenom, email, mot_de_passe, date_inscription, date_derniere_connexion, statut, telephone,newsletter_option, rgpd_consentement, id_role)

- [x] Adresse (id_adresse, type_adresse, nom, numero_rue, voie, complement_adresse, code_postal, ville, pays, id_utilisateur)

- [x] Categorie (id_categorie, nom, id_categorie_parent)

- [x] Produit (id_produit, nom, description, image, tarif, tva, poids, stock, activation, date_ajout, date_retrait, raison_retrait, id_categorie)

- [x] Avis (id_avis, titre, note, commentaires, date_publie, date_validation, date_modification, statut, id_utilisateur, id_produit)

- [x] Promotion (id_promotion, coupon, type, valeur, debut_promotion, fin_promotion, actif, id_produit, id_categorie)

- [x] Promotion_produit (id_promotion, id_produit)

- [x] Promotion_categorie (id_promotion_categories)

- [x] Paiement (id_paiement, mode_paiement, montant, montant_remboursement, status_remboursement, statut_paiement, date_paiement, id_commande)

- [x] Commande (id_commande, statut, date_commande, date_validation, date_annulation, montant_facture, id_utilisateur,id_adresse_livraison, id_adresse_facturation)

- [x] DetailCommande (id_commande, id_produit, quantite, prix_unitaire)

- [x] Livraison (id_livraison, methode_livraison, statut_livraison, date_expedition, date_livraison, estimation_livraison,frais_livraison, num_suivi, transporteur, commentaire, id_commande)

- [x] Panier (id_panier, date_creation, statut, id_utilisateur)

- [x] DetailPanier (id_panier, id_produit, quantite, prix_unitaire)

- [x] Favoris (id_favoris, id_utilisateur, id_produit)

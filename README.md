# ☕ Coffee Time

![Logo Coffee Time](./assets/img/Logo_coffeTime.png)

Bienvenue sur **Coffee Time**, un site vitrine et catalogue de café conçu pour un projet d'entraînement en **HTML, CSS, JS**, avec une future transition vers un **backend dynamique avec EJS** pour la V1. Une V2 est également prévue plus tard avec React et API Node.js/Express et d'autres outils (Docker, Nginx, etc.).

---

## 📑 Sommaire

- [Objectif du projet](#objectif-du-projet-v1)
- [Structure du projet](#structure-du-projet)
- [Technologies utilisées](#technologies-utilisées)
- [Installation](#installation)
- [Fonctionnalités](#fonctionnalités)
- [Roadmap V1](#roadmap-v1)
- [Sécurité](#sécurité)
- [Conventions code et Git](#conventions-code-et-git)
- [V2 (À venir)](#v2-à-venir)
- [Screenshots](#screenshots-exemples)
- [Auteur](#auteur)
- [Licence](#licence)

---

## 🎯 Objectif du projet V1

Créer un site vitrine **responsive** et moderne pour présenter des produits de café, avec :

- Catalogue de produits filtrable et recherche intégrée
- Pages produit et inscription
- Design épuré avec thème “coffee” ☕
- Base solide pour une future V2 avec backend et SPA React

---

## 📁 Structure du projet

À ce jour :

<!-- A venir modifier au fur et à mesure -->

```
/intégration
│
├─ HTML/
│ ├─ Accueil.html
│ ├─ Catalogue.html
│ ├─ APropos.html
│ └─ MentionsLegales.html
│
├─ css/
│ ├─ base/
│ │ ├─ reset.css
│ │ └─ global.css
│ ├─ layout/
│ │ ├─ header.css
│ │ └─ footer.css
│ └─ pages/
│ ├─ accueil.css
│ ├─ catalogue.css
│ └─ mentionLegales.css
│
└─ js/
├─ loginForm.js
└─ filterToggle.js
```

---

## 🖌️ Technologies utilisées

- ![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white) & ![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white) (Mobile-first, Flexbox, Grid)
- ![JavaScript](https://img.shields.io/badge/JS-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black) pour interactions simples (login, filtre)
- **Font Awesome** pour les icônes
- **Responsive Design** pour mobile, tablette et desktop

---

## ⚙️ Installation

Suivez ces étapes pour installer et lancer le projet en local.

### 1️⃣ Cloner le dépôt

```bash
git clone "liens du repos"
cd coffee-time
```

### 2️⃣ Installer les dépendances

Le projet utilise Node.js et certains packages pour le développement :

```
npm install
```

⚠️ Assurez-vous d’avoir Node.js (version 18+ recommandée) et npm installés sur votre machine.

### 3️⃣ Lancer le projet

Pour le développement local :

```
npm run dev
```

- Ceci démarre le serveur et surveille les changements pour recharger automatiquement le front-end (si configuré avec nodemon, vite, etc.).

- Ouvrez ensuite votre navigateur à l’URL indiquée (souvent http://localhost:3000 ou http://localhost:5173 selon la configuration).

### 4️⃣ Commandes utiles

- npm start : lancer le serveur en mode production

- npm test : lancer les tests unitaires avec Jest (si configuré)

- npm run build : générer une version optimisée pour la production (si SPA ou bundler utilisé plus tard)

## 📌 Fonctionnalités

- 🏠 **Page Accueil** : Présentation de Coffee Time
- 📖 **Catalogue** :
  - Affichage des produits en cartes
  - Filtre dynamique (JS)
  - Recherche par mot-clé
- ℹ️ **Page A propos** : Informations sur l’entreprise, carte interactive
- 🔒 **Formulaire Login / Inscription** : Validation front simple
- ⚖️ **Footer** : Liens réseaux sociaux et mentions légales

---

## 🚀 Roadmap V1

1. **Intégration HTML/CSS**
   - Catalogue complet, pages d'un produit, formulaire, responsive
   - Accueil
   - A propos
   - Mentions légales
2. **Conception backend (prépa)**
   - User Stories, MCD, MLD, ERD
   - Script SQL + seeding
   - Sécurité front et back
   - Endpoints
   - Diagrammes de séquences
3. **Backend avec EJS**
   - Pages dynamiques et inclusions
   - Contrôleurs et routes pour `products` et `users`
   - Middleware sécurité (auth, validation, erreurs)
   - Sécurité de la base de données et d'autres informations
   - Rate-limiting, cors, argon2
4. **Tests unitaires (Jest)**

---

## 🔒 Sécurité

- Validation et sanitation côté **front**
- Utilisation de **Joi**, hachage avec **Argon2**, JWT pour auth côté **back**
- Protection contre **XSS, CSRF, injections SQL**, et gestion sécurisée des cookies/token

---

## 🧑‍💻 **Conventions Code et Git**

### ✅ **Git**

#### <u> Branches</u>

- `main` : version stable / production

- `dev` : développement global

- `feature/nom` : ajout d’une nouvelle fonctionnalité

- `fix/nom` : correction de bug

- `refactor/nom` : amélioration ou nettoyage de code

#### <u> Conventions de commit </u>

Format recommandé : `identification : message clair et concis en anglais`

<u> Exemples : </u>

| Type       | Description                                                                                                                   | Exemple concret                                 |
| ---------- | ----------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------- |
| `feat`     | Nouvelle **fonctionnalité** ou ajout visible                                                                                  | `feat: add filtering system to challenge list`  |
| `fix`      | Correction **d’un bug existant**                                                                                              | `fix: correct comment display bug`              |
| `refactor` | **Refactorisation du code** (optimisation, nettoyage, structure) **sans changer le comportement**                             | `refactor: clean up Header component structure` |
| `chore`    | **Tâches de maintenance** qui n’impactent pas le code directement (mise à jour dépendances, renommage fichiers, config, etc.) | `chore: reorganize project folders`             |
| `docs`     | Modifications **documentation**                                                                                               | `docs: update README with setup instructions`   |
| `style`    | Changements purement **cosmétiques** (indentation, espaces, formatage, commentaires)                                          | `style: fix indentation in User model`          |
| `test`     | Ajout ou correction de **tests unitaires**                                                                                    | `test: add unit test for challenge creation`    |
| `perf`     | Amélioration des **performances**                                                                                             | `perf: optimize query for challenge list`       |

---

## 🌐 V2 (À venir, non finalisé)

- SPA React/Next.js + API Node.js/Express
- Docker et HTTPS via Nginx
- Fonctionnalités avancées : panier, paiement, commandes
- Sécurité renforcée et tests automatisés

---

## 📸 Screenshots (exemples)

> Ajouter des captures d’écran ici

![Accueil](./assets/img/screenshot_accueil.png)
![Catalogue](./assets/img/screenshot_catalogue.png)

---

## ✨ Auteur

**Ton Nom** – Développeur Front-End & Back-End
[GitHub](https://github.com/tonprofil) | [LinkedIn](https://linkedin.com/in/tonprofil)

---

## 📄 Licence ![MIT License](https://img.shields.io/badge/License-MIT-green)

Ce projet est sous licence MIT – voir le fichier [LICENSE](LICENSE) pour plus de détails.

```
texte ici
```

## Guide d'Installation : Python, pgAdmin 4 et pgcli sur Linux Mint

Ce guide vous explique comment installer Python, `pgAdmin 4`, et `pgcli` sur Linux Mint, en résolvant les dépendances et les conflits éventuels entre versions.

## 1. Installer Python 3.10

Pour installer `pgAdmin 4`, Python 3.10 est requis, même si Python 3.12 est installé par défaut sur votre système. Nous allons utiliser le dépôt `deadsnakes` pour installer Python 3.10.

### Étapes :

1. **Ajouter le PPA `deadsnakes` pour installer Python 3.10** :
   ```bash
   sudo add-apt-repository ppa:deadsnakes/ppa
   sudo apt update
   ```

2. **Installer Python 3.10** :
   ```bash
   sudo apt install python3.10
   ```

3. **Vérifier l'installation de Python 3.10** :
   ```bash
   python3.10 --version
   ```


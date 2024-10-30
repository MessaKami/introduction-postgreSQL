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

## 2. Installer pgAdmin 4

Deux options sont disponibles : l'installation standard avec `apt` (requiert Python 3.10) ou l'utilisation d'un conteneur Docker si vous préférez éviter l'installation d'une version spécifique de Python.

### Option A : Installation via `apt`

1. **Ajouter le dépôt pgAdmin** :
   ```bash
   curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
   sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/jammy pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
   ```

2. **Installer pgAdmin 4** :
   ```bash
   sudo apt install pgadmin4
   ```

### Option B : Utilisation de pgAdmin 4 via Docker

Si l'installation pose problème ou si vous préférez isoler pgAdmin, vous pouvez le lancer dans un conteneur Docker.

1. **Installer Docker** (si nécessaire) :
   ```bash
   sudo apt install docker.io
   ```

2. **Lancer pgAdmin 4 avec Docker** :
   ```bash
   docker run -p 80:80 --name pgadmin -e 'PGADMIN_DEFAULT_EMAIL=admin@domain.com' -e 'PGADMIN_DEFAULT_PASSWORD=admin' -d dpage/pgadmin4
   ```

3. **Accéder à pgAdmin 4** en ouvrant [http://localhost](http://localhost) dans votre navigateur et en vous connectant avec l'email et le mot de passe définis (`admin@domain.com` / `admin` dans cet exemple).

## 3. Installer pgcli avec pipx

`pgcli` est un outil de ligne de commande pour interagir avec PostgreSQL. Nous utiliserons `pipx` pour l'installer globalement et isoler les paquets Python du système.

### Étapes :

1. **Installer pipx** :
   ```bash
   sudo apt install pipx
   ```

2. **Installer pgcli avec pipx** :
   ```bash
   pipx install pgcli
   ```

3. **Assurer l’accès global à `pgcli`** :
   Si vous recevez un avertissement indiquant que `pgcli` n’est pas accessible globalement, exécutez :
   ```bash
   pipx ensurepath
   ```

4. **Vérifier l'installation de pgcli** :
   ```bash
   pgcli --version
   ```

   > **Remarque** : Si `pgcli` n'est toujours pas accessible, ajoutez manuellement le chemin `~/.local/bin` à votre variable d'environnement PATH dans `~/.bashrc` :
   > ```bash
   > echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc
   > source ~/.bashrc
   > ```

---

## Conclusion

Votre système est maintenant configuré avec Python 3.10, `pgAdmin 4` (via installation ou Docker), et `pgcli`. Ce guide vous permet de travailler efficacement avec PostgreSQL tout en maintenant votre installation de Python propre et sans conflits de versions.

Pour toute question supplémentaire, consultez la documentation officielle :
- [pgAdmin](https://www.pgadmin.org/docs/)
- [pgcli](https://www.pgcli.com/)
- [Docker](https://docs.docker.com/get-started/)

--- 
```


## 3. Installer pgcli avec pipx

`pgcli` est un outil de ligne de commande pour interagir avec PostgreSQL. Pour l'installer proprement et globalement sans affecter Python du système, nous utilisons `pipx`, qui crée des environnements isolés pour chaque package.

### Étapes :

1. **Installer pipx** :
   ```bash
   sudo apt install pipx
   ```

2. **Ajouter pipx au PATH** (si ce n’est pas déjà fait) :
   ```bash
   pipx ensurepath
   ```

3. **Installer pgcli avec pipx** :
   ```bash
   pipx install pgcli
   ```

4. **Vérifier l'installation de pgcli** :
   ```bash
   pgcli --version
   ```

   > **Remarque** : Si `pgcli` n'est toujours pas accessible globalement, ajoutez le chemin `~/.local/bin` à votre variable PATH dans `~/.bashrc` :
   > ```bash
   > echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc
   > source ~/.bashrc
   > ```

---

Ce guide inclut maintenant toutes les étapes nécessaires pour installer Python 3.10, pgAdmin 4, et `pgcli` en utilisant `pipx` sur Linux Mint. 


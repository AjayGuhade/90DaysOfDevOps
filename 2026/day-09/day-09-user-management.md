# Day 09 Challenge – Linux User & Group Management

## Users & Groups Created

### Users
- tokyo
- berlin
- professor
- nairobi

### Groups
- developers
- admins
- project-team

---

## Group Assignments

- **tokyo**
  - developers
  - project-team

- **berlin**
  - developers
  - admins

- **professor**
  - admins

- **nairobi**
  - project-team

---

## Directories Created

- **/opt/dev-project**
  - Group: developers
  - Permissions: 775 (rwxrwxr-x)

- **/opt/team-workspace**
  - Group: project-team
  - Permissions: 775 (rwxrwxr-x)

---

## Commands Used


## Create users with home directories
    useradd -m tokyo
    useradd -m berlin
    useradd -m professor
    useradd -m nairobi

## Set passwords
    passwd tokyo
    passwd berlin
    passwd professor
    passwd nairobi

## Create groups
    groupadd developers
    groupadd admins
    groupadd project-team

# Assign users to groups
    usermod -aG developers tokyo
    usermod -aG developers,admins berlin
    usermod -aG admins professor
    usermod -aG project-team nairobi
    usermod -aG project-team tokyo

# Create shared directories
    mkdir /opt/dev-project
    mkdir /opt/team-workspace

# Set group ownership
    chown :developers /opt/dev-project
    chown :project-team /opt/team-workspace

# Set permissions
    chmod 775 /opt/dev-project
    chmod 775 /opt/team-workspace

# Verification
    groups tokyo
    groups berlin
    groups professor
    groups nairobi
    ls -ld /opt/dev-project
    ls -ld /opt/team-workspace

# Day 38 – YAML Basics

## 1. What is YAML?

YAML (YAML Ain’t Markup Language) is a human-readable data serialization format commonly used in:

- CI/CD pipelines (GitHub Actions, GitLab CI)

- Kubernetes manifests

- Docker Compose

- Configuration files

- Key Characteristics:

- Uses indentation instead of brackets

- Spaces only (no tabs)

- Very easy for humans to read

## Task 1 – Key Value Pairs

Create a file:

     person.yaml

Example:

    name: Ajay Guhade
    role: DevOps Learner
    experience_years: 0
    learning: true

Check file

    cat person.yaml

Important rule:

    key: value

## Task 2 – Lists

Add lists to person.yaml.

Updated file:

    name: Ajay Guhade
    role: DevOps Learner
    experience_years: 0
    learning: true

    tools:
      - docker
      - kubernetes
      - git
      - linux
      - github-actions

    hobbies: [coding, learning-devops, reading-tech, gaming]
Two Ways to Write Lists in YAML

1️⃣ Block Style
    
    tools:
      - docker
      - kubernetes
      - git

2️⃣ Inline Style

     tools: [docker, kubernetes, git]

## Task 3 – Nested Objects

Create:

    server.yaml

Example:

    server:
      name: dev-server
      ip: 192.168.1.10
      port: 8080

    database:
      host: localhost
      name: devopsdb
      credentials:
        user: admin
        password: secret123

Here:

server and database are parent keys

Others are nested keys

## Task 4 – Multi-line Strings

Update server.yaml.

Using | (Preserves New Lines)

    startup_script: |
      echo "Starting server"
      docker start app
      echo "Server started"

Output keeps line breaks.

Using > (Folds Into One Line)

    description: >
      This server runs
      the development
      environment for testing.

Output becomes:

This server runs the development environment for testing.
When to Use
| Symbol | Use Case             |
| ------ | -------------------- | 
| `      | `                    | 
| `>`    | long text paragraphs |


## Task 5 – Validate YAML

Install yamllint

    sudo apt install yamllint

Validate:

    yamllint person.yaml
    yamllint server.yaml

Example error when indentation is wrong:

     syntax error: found character '\t' that cannot start any token

or

    wrong indentation: expected 2 but found 4

Fix indentation and validate again.

## Task 6 – Spot the Difference

Correct
    name: devops
     tools:
      - docker
      - kubernetes
    Broken
    name: devops
    tools:
    - docker
      - kubernetes

What is wrong?

The list items must have consistent indentation under the parent key.

Correct indentation:

    tools:
      - docker
      - kubernetes

Key YAML Rules

1️⃣ Spaces only — never tabs

2️⃣ Indentation defines structure

3️⃣ Quotes are optional unless special characters are used

Example:

key: value

vs

key: "value: something"

## What I Learned (3 Key Points)

1️⃣ YAML relies completely on indentation and spaces — tabs break YAML files.

2️⃣ Lists can be written in two ways: block format (- item) or inline ([item1, item2]).

3️⃣ Multi-line strings use | to preserve line breaks and > to fold text into a single line.
# AWS Floci Demo — Terraform Learning Project

A hands-on Infrastructure-as-Code project built while learning AWS and Terraform from scratch, using [Floci](https://github.com/floci-io) — a local, Docker-based AWS emulator — instead of a real AWS account.

## What this project does

Using Terraform, this project provisions:

- **S3 bucket** — object storage
- **DynamoDB table** — NoSQL database with a `PAY_PER_REQUEST` billing mode
- **IAM role + policy attachment** — permissions allowing a Lambda function to run and write logs
- **Lambda function** — a simple Python function invoked on demand

All resources are created against a local AWS emulator (Floci), not real AWS — meaning this project can be run, torn down, and rebuilt freely with zero cloud cost and zero risk to real infrastructure.

## Why Floci instead of real AWS?

Testing and validating Infrastructure-as-Code locally before touching real cloud environments is a legitimate professional practice. This project demonstrates:

- Comfort with core AWS services (S3, DynamoDB, IAM, Lambda) and how they relate to each other
- Practical Terraform skills: providers, resources, references between resources, outputs
- An understanding of the plan → apply → verify → destroy lifecycle

## Prerequisites

- [Docker](https://www.docker.com/)
- [Floci](https://github.com/floci-io) installed and running (`floci start`)
- [Terraform](https://developer.hashicorp.com/terraform/downloads) (v1.x)
- AWS CLI (optional, used here for independent verification)

## How to run this project

1. Start Floci:
   ```bash
   floci start
   ```

2. Point your shell's AWS environment at Floci:
   ```bash
   eval $(floci env)
   ```

3. Initialize Terraform:
   ```bash
   terraform init
   ```

4. Preview the plan:
   ```bash
   terraform plan
   ```

5. Apply it:
   ```bash
   terraform apply
   ```

6. Verify resources independently:
   ```bash
   aws s3 ls
   aws dynamodb list-tables
   aws lambda list-functions
   ```

7. Invoke the Lambda function:
   ```bash
   aws lambda invoke --function-name hello_lambda output.json
   cat output.json
   ```

8. Tear everything down when done:
   ```bash
   terraform destroy
   ```

## Project structure

```
.
├── main.tf                 # Provider config + resource definitions
├── outputs.tf               # Values displayed after apply
├── lambda_function.py       # Lambda source code
├── lambda_function.zip      # Zipped Lambda deployment package
├── .gitignore
└── README.md
```

## What I learned

- How Terraform's declarative model works (describe desired state, let Terraform reconcile it)
- The plan → apply → verify → destroy workflow used in real DevOps environments
- How IAM roles and policies connect to compute resources (Lambda)
- How to point Terraform's AWS provider at a custom/local endpoint instead of real AWS
- Reading and adapting official Terraform Registry documentation for unfamiliar resources

## About Floci

Floci is a local AWS emulator that runs in Docker, allowing AWS CLI, SDKs, and Terraform to interact with it as if it were real AWS — without requiring an AWS account or incurring any cost.

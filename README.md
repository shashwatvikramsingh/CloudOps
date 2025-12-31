# Advanced-Cloud-Infrastructure-Provisioning-with-Integrated-IaC-Governance
Advanced Azure IaC framework leveraging Terraform and Azure DevOps. Features a dual-pipeline governance model (YAML for deployments, GUI for decommissioning), modular resource scaling via for_each, and secure runtime injection of secrets.
The work was carried out at **Wipro Technologies, Bangalore**

## 🚀 Key Features

### 1. Modular & Scalable IaC
* **Advanced Logic**: Built using HashiCorp Terraform with `for_each` meta-arguments and conditional logic to orchestrate multi-resource environments from a single variable map.
* **Resource Diversity**: Capable of deploying Linux/Windows Virtual Machines, Azure Storage Accounts, and Azure Kubernetes Service (AKS) clusters.

### 2. Dual-Pipeline Governance Model
* **Modern CI/CD (YAML)**: A version-controlled `azure-pipelines.yml` manages the `plan` and `apply` stages with integrated manual approval gates.
* **Safety "Red Button" (Release)**: A separate, GUI-based Release Pipeline is dedicated exclusively to the `terraform destroy` command. This isolates destructive lifecycles from the build pipeline to prevent accidental deletion.

### 3. Integrated Security
* **Secret Management**: Completely eliminated hardcoded credentials from the codebase[cite: 55, 305].
* **Runtime Injection**: Sensitive data (e.g., `vm_admin_password`) is defined as sensitive variables and injected at runtime via Azure DevOps secret variables.

### 4. Centralized State Management
* **Remote Backend**: Utilizes an Azure Storage Account to host the `terraform.tfstate` file, enabling team collaboration and state locking.

## 🏗️ System Architecture
The solution is a closed-loop automated system consisting of three domains:
* **Developer Environment**: VS Code for authoring modular Terraform scripts
* **Azure DevOps (Control Plane)**: Manages code in Azure Repos and orchestrates automation pipelines.
* **Microsoft Azure (Target)**: The destination environment where Resource Groups, VNETs, and compute resources are provisioned.

## 🛠️ Troubleshooting & Validation
The framework's robustness was proven through practical, hands-on resolution of real-world challenges[cite: 56]:
* **Network Connectivity**: Fixed VM inaccessibility by adding Network Security Groups (NSGs) and configuring specific security rules for SSH (22) and RDP (3389).
* **Azure Quota Errors**: Resolved sequential SKU availability, Regional vCPU, and VM Family quota errors to ensure functional resource deployment.

## 📂 Repository Structure
* `/modules`: Reusable blueprints for compute, storage, and networking.
* `main.tf`: Root orchestrator for all modules.
* `backend.tf`: Configuration for the remote Azure state backend.
* `terraform.tfvars`: Centralized variable mapping for resource scaling.
* `azure-pipelines.yml`: Definition for the modern CI/CD pipeline.

## 🎓 Author
**Shashwat Vikram Singh** ID No: 2021wa86119  
BITS Pilani (Rajasthan) India
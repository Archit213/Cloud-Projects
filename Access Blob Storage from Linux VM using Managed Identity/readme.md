# 🔐 Azure Project: Access Blob Storage from Linux VM using Managed Identity

This project demonstrates how to **securely access a blob file stored in Azure Blob Storage** from a **Linux Virtual Machine (VM)** using a **System-Assigned Managed Identity**, eliminating the need for credentials or connection strings.

---

## 🧰 Prerequisites

- Azure Linux Virtual Machine (VM) with **System-Assigned Managed Identity** enabled.
- Azure Storage Account containing:
  - A **Blob container**.
  - A file named `blob.txt`.
- The VM's Managed Identity must be granted the **Storage Blob Data Reader** role on the Storage Account.

---

## 📝 Commands and Descriptions

### 1️⃣ Connect to the VM using SSH

```bash
ssh azureuser@<public-ip-of-vm>
```
2️⃣ Update Package Index
```bash
sudo apt update
```
3️⃣ Install jq (JSON processor)
```bash
sudo apt install jq
```
4️⃣ Retrieve Access Token using Managed Identity

🔹 Description:
Queries the Azure Instance Metadata Service (IMDS) to get an OAuth 2.0 access token for the VM’s Managed Identity, scoped for Azure Storage access.
```bash
access_token=$(curl 'http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https%3A%2F%2Fstorage.azure.com%2F' -H Metadata:true | jq -r '.access_token')
```
5️⃣ View the Access Token (Optional)
```bash
echo $access_token
```
6️⃣ Access the Blob File Securely
🔹 Description:
Uses curl to securely fetch the contents of blob.txt from the Azure Blob Storage using the access token retrieved via Managed Identity.

🔄 Replace $storage_account_name, $container_name, and $blob_name with your actual values.
```bash
curl "https://$storage_account_name.blob.core.windows.net/$container_name/$blob_name" -H "x-ms-version: 2017-11-09" -H "Authorization: Bearer $access_token"
```
7️⃣ Exit the VM
```bash
exit
```
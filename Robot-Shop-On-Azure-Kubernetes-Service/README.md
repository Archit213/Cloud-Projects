# 🤖 Stan's Robot Shop on Azure Kubernetes Service (AKS)

This project demonstrates the deployment of **Stan's Robot Shop**, a microservices-based e-commerce demo application, on **Azure Kubernetes Service (AKS)** using **Helm** in a **three-tier architecture**. The aim is to gain hands-on experience with container orchestration, Kubernetes networking, persistent storage, and monitoring in a managed Azure environment.

## 📁 Microservices Overview

Stan's Robot Shop includes the following microservices:

- `web` – Frontend service
- `user`, `cart`, `catalogue`, `dispatch`, `payment`, `ratings`, `shipping` – Application logic
- `mysql`, `mongo` – Data services
- `fluentd` – Log aggregation
- `load-gen` – Load generator for testing

---

## 🛠 Prerequisites

Ensure the following tools are installed on your local machine or CI environment:

- ✅ [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- ✅ [kubectl (Kubernetes CLI)](https://kubernetes.io/docs/tasks/tools/)
- ✅ [Helm](https://helm.sh/docs/intro/install/)

# 🚀 Deployment Steps

1. **Login to Azure & Connect to Cluster**
   ```bash
   az login
   az aks get-credentials --resource-group <resource-group-name> --name <cluster-name>```

2. **Check Cluster Context**
 ```bash
kubectl config current-context
```
3. **Create Namespace for Robot Shop**
 ```bash
kubectl create ns robot-shop
 ```
4. **Deploy Using Helm (Navigate to the directory containing the Helm chart and run:)**
 ```bash
helm install robot-shop --namespace robot-shop .
 ```
5. **Verify Services and Pods**
 ```bash
kubectl get svc -n robot-shop
kubectl get pods -n robot-shop
 ```

## 🌐 Access the Application:
1. **Once the LoadBalancer service is provisioned (can take a few minutes), copy the external IP and port from:**
 ```bash
kubectl get svc -n robot-shop
 ```

2. **Then, open your browser and visit:**
 ```bash
http://<EXTERNAL-IP-OF-LOAD-BALANCER>:<PORT>
 ```

3. **Example:**
 ```bash
http://20.102.56.78:8080

 ``` 
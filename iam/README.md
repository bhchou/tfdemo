# VCN Module

建立 demo 環境的網路基礎：VCN / IGW / RT / SL / Subnet。

## 執行順序

這個目錄是其他目錄的「上游」，**必須最先 apply**。

依賴順序：
1. **vcn/** ← 你在這裡
2. iam/
3. compute/（用 data block 查 vcn 的 subnet）

## 用法

```bash
cp terraform.tfvars.template terraform.tfvars
# 編輯 terraform.tfvars，填入認證資訊
terraform init
terraform plan
terraform apply
```

## 輸出

- `vcn_id` — VCN OCID
- `public_subnet_id` — Public Subnet OCID
- `public_subnet_display_name` — Subnet 名稱（供 data block 查用）

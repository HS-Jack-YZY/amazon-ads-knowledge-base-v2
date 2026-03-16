---
title: Catalog Items API
source: https://developer-docs.amazon.com/sp-api/docs/catalog-items-api-v2022-04-01-use-case-guide
version: v2022-04-01
---

# Catalog Items API

查询 Amazon 商品目录，获取 ASIN 详情或搜索商品。

## 操作

| 操作 | Method | Path | 说明 |
|------|--------|------|------|
| searchCatalogItems | GET | `/catalog/2022-04-01/items` | 搜索商品（关键词/ASIN/标识符） |
| getCatalogItem | GET | `/catalog/2022-04-01/items/{asin}` | 获取单个 ASIN 详情 |

## searchCatalogItems 参数

| 参数 | 类型 | 说明 |
|------|------|------|
| `marketplaceIds` | string[] | **必填**，Marketplace ID |
| `identifiers` | string[] | ASIN、EAN、UPC 等产品标识符 |
| `identifiersType` | string | 标识符类型：`ASIN`, `EAN`, `UPC`, `ISBN` |
| `keywords` | string[] | 搜索关键词 |
| `brandNames` | string[] | 品牌名过滤 |
| `classificationIds` | string[] | 分类 ID 过滤 |
| `includedData` | string[] | 返回哪些数据集（见下表） |
| `pageSize` | int | 每页结果数（默认 10，最大 20） |

## includedData 可选值

| 值 | 说明 |
|----|------|
| `attributes` | 商品属性 |
| `classifications` | 浏览分类 |
| `dimensions` | 尺寸和重量 |
| `identifiers` | 产品标识符（EAN, UPC 等） |
| `images` | 商品图片 |
| `productTypes` | 产品类型 |
| `relationships` | 父子关系（变体） |
| `salesRanks` | 销售排名 |
| `summaries` | 摘要信息（标题、品牌、颜色等） |
| `vendorDetails` | 供应商详情（仅 Vendor） |

## getCatalogItem 参数

| 参数 | 类型 | 说明 |
|------|------|------|
| `asin` | string | **必填**（路径参数） |
| `marketplaceIds` | string[] | **必填** |
| `includedData` | string[] | 同上 |

## 所需角色

- Product Listing

## 适用用户

Seller 和 Vendor 均可使用。

## Rate Limit

| 操作 | Rate | Burst |
|------|------|-------|
| searchCatalogItems | 2/s | 2 |
| getCatalogItem | 2/s | 2 |

## Python 示例

```python
# 按 ASIN 查询商品详情
item = sp_api_request(
    "GET",
    "/catalog/2022-04-01/items/B08N5WRWNW",
    access_token,
    params={
        "marketplaceIds": "ATVPDKIKX0DER",
        "includedData": "summaries,images,salesRanks,dimensions",
    },
)

# 按关键词搜索商品
results = sp_api_request(
    "GET",
    "/catalog/2022-04-01/items",
    access_token,
    params={
        "marketplaceIds": "ATVPDKIKX0DER",
        "keywords": "GL-iNet travel router",
        "includedData": "summaries,images",
        "pageSize": "20",
    },
)
```

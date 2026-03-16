---
title: SP-API Authentication Guide
source: https://developer-docs.amazon.com/sp-api/docs/connecting-to-the-selling-partner-api
---

# SP-API Authentication Guide

## Overview

SP-API 使用 **Login with Amazon (LWA) OAuth 2.0** 进行认证，与 Ads API 共用同一个 Token 端点，但请求头格式不同。

## 认证流程

### Step 1: 获取 Access Token

**POST** `https://api.amazon.com/auth/o2/token`

#### 卖家授权操作（大部分 API）

```http
POST /auth/o2/token HTTP/1.1
Host: api.amazon.com
Content-Type: application/x-www-form-urlencoded;charset=UTF-8

grant_type=refresh_token
&refresh_token={refresh_token}
&client_id={client_id}
&client_secret={client_secret}
```

#### Grantless 操作（无需卖家授权）

适用于 Notifications API 订阅、凭证轮换等操作：

```http
POST /auth/o2/token HTTP/1.1
Host: api.amazon.com
Content-Type: application/x-www-form-urlencoded;charset=UTF-8

grant_type=client_credentials
&scope=sellingpartnerapi::notifications
&client_id={client_id}
&client_secret={client_secret}
```

可用的 Grantless scope:
- `sellingpartnerapi::notifications` — 管理通知订阅
- `sellingpartnerapi::client_credential:rotation` — 轮换 LWA 凭证

#### Token 响应

```json
{
  "access_token": "Atza|IQEBLjAsAhRmHjNgHpi0U-Dme37rR6CuUpSREXAMPLE",
  "token_type": "bearer",
  "expires_in": 3600,
  "refresh_token": "Atzr|IQEBLzAtAhRPpMJxdwVz2Nn6f2y-tpJX2DeXEXAMPLE"
}
```

- `access_token`: 最大 2048 字节，有效期 **1 小时**（3600 秒）
- `refresh_token`: 最大 2048 字节，长期有效

### Step 2: 构建 API 请求

```
{HTTP_METHOD} {endpoint}/{path}?{query_parameters}
```

示例:
```
GET https://sellingpartnerapi-na.amazon.com/orders/v0/orders?MarketplaceIds=ATVPDKIKX0DER&CreatedAfter=2024-01-01
```

### Step 3: 添加必要 Header

| Header | 值 | 说明 |
|--------|---|------|
| `host` | `sellingpartnerapi-na.amazon.com` | 区域端点主机名 |
| `x-amz-access-token` | `Atza\|...` 或 RDT | **注意：不是 `Authorization: Bearer`** |
| `x-amz-date` | `20240101T120000Z` | ISO 8601 格式时间戳 |
| `user-agent` | `AppName/Version (Language=...)` | 必填，最大 500 字符 |

#### User-Agent 格式

```
AppName/AppVersion (Language=LanguageName/LanguageVersion; Platform=OS/Version)
```

示例:
```
MySellingTool/2.0 (Language=Python/3.11; Platform=macOS/14.0)
```

### 完整请求示例

```http
GET /catalog/2022-04-01/items/B08N5WRWNW?marketplaceIds=ATVPDKIKX0DER HTTP/1.1
host: sellingpartnerapi-na.amazon.com
x-amz-access-token: Atza|IQEBLjAsAhRmHjNgHpi0U-Dme37rR6CuUpSR...
x-amz-date: 20240101T120000Z
user-agent: MyApp/1.0 (Language=Python/3.11; Platform=macOS/14.0)
```

## 与 Ads API 认证的关键差异

| | SP-API | Ads API |
|--|--------|---------|
| **Token Header** | `x-amz-access-token` | `Authorization: Bearer {token}` |
| **Client ID Header** | 不需要单独传 | `Amazon-Advertising-API-ClientId` |
| **身份标识 Header** | 不需要（通过 Token 关联卖家） | `Amazon-Advertising-API-Scope` (Profile ID) |
| **User-Agent** | 必填（有格式要求） | 可选 |
| **日期 Header** | `x-amz-date`（必填） | 不需要 |
| **Grantless 操作** | 有（Notifications、凭证轮换） | 无 |
| **PII 访问** | 需要 Restricted Data Token (RDT) | 不适用 |

## Restricted Data Token (RDT)

访问包含 PII（个人可识别信息）的数据时，需要用 RDT 替代普通 Access Token：

1. 调用 **Tokens API** 的 `createRestrictedDataToken` 操作
2. 指定需要访问的受限资源路径
3. 获得 RDT（有效期 1 小时）
4. 在 `x-amz-access-token` Header 中使用 RDT 代替普通 Access Token

需要 RDT 的典型操作：
- `getOrderAddress` — 收货地址
- `getOrderBuyerInfo` — 买家信息
- `getOrderItemsBuyerInfo` — 买家商品级信息

## Python 示例

```python
import requests

# ---- Token 管理 ----

def get_access_token(client_id, client_secret, refresh_token):
    """获取 SP-API Access Token"""
    resp = requests.post(
        "https://api.amazon.com/auth/o2/token",
        data={
            "grant_type": "refresh_token",
            "refresh_token": refresh_token,
            "client_id": client_id,
            "client_secret": client_secret,
        },
    )
    resp.raise_for_status()
    return resp.json()["access_token"]


def get_grantless_token(client_id, client_secret, scope):
    """获取 Grantless Access Token（无需卖家授权）"""
    resp = requests.post(
        "https://api.amazon.com/auth/o2/token",
        data={
            "grant_type": "client_credentials",
            "scope": scope,
            "client_id": client_id,
            "client_secret": client_secret,
        },
    )
    resp.raise_for_status()
    return resp.json()["access_token"]


# ---- API 调用 ----

ENDPOINT_NA = "https://sellingpartnerapi-na.amazon.com"

def sp_api_request(method, path, access_token, params=None, json_body=None):
    """发起 SP-API 请求"""
    headers = {
        "x-amz-access-token": access_token,
        "user-agent": "MyApp/1.0 (Language=Python/3.11)",
    }
    url = f"{ENDPOINT_NA}{path}"
    resp = requests.request(method, url, headers=headers, params=params, json=json_body)
    resp.raise_for_status()
    return resp.json()


# ---- 使用示例 ----

token = get_access_token(CLIENT_ID, CLIENT_SECRET, REFRESH_TOKEN)

# 获取订单列表
orders = sp_api_request(
    "GET", "/orders/v0/orders",
    token,
    params={
        "MarketplaceIds": "ATVPDKIKX0DER",
        "CreatedAfter": "2024-01-01T00:00:00Z",
    },
)
```

---
title: Finances API
source: https://developer-docs.amazon.com/sp-api/docs/finances-api-v2024-06-19-use-case-guide
version: v2024-06-19 (current), v0 (legacy)
---

# Finances API

查询卖家账户的财务交易和结算信息。

## 操作

### v2024-06-19（当前版本）

| 操作 | Method | Path | 说明 |
|------|--------|------|------|
| listTransactions | GET | `/finances/2024-06-19/transactions` | 查询账户交易列表 |

### v0（旧版）

| 操作 | Method | Path | 说明 |
|------|--------|------|------|
| listFinancialEventGroups | GET | `/finances/v0/financialEventGroups` | 按期间分组的财务事件 |
| listFinancialEvents | GET | `/finances/v0/financialEvents` | 按日期范围的财务事件 |
| listFinancialEventsByGroupId | GET | `/finances/v0/financialEventGroups/{eventGroupId}/financialEvents` | 按组 ID 过滤 |
| listFinancialEventsByOrderId | GET | `/finances/v0/orders/{orderId}/financialEvents` | 按订单 ID 过滤 |

## 使用场景

1. **查看最新交易** — 实时获取账户交易数据
2. **确定付款构成** — 追踪哪些交易组成了某次付款
3. **获取付款详情** — 查询金额和结算状态（v0）
4. **查看当前余额** — 查询可用资金（v0）

## 常见交易类型

| 类型 | 说明 |
|------|------|
| Order | 订单相关收入 |
| Refund | 退款 |
| FBA Fee | FBA 服务费 |
| Subscription Fee | 月租费 |
| Commission | 佣金/Referral Fee |
| Shipping | 运费 |
| Adjustment | 调整（赔偿、更正等） |
| Transfer | 转账到银行 |

## 查询参数

| 参数 | 类型 | 说明 |
|------|------|------|
| `postedAfter` | ISO 8601 | 交易时间起始 |
| `postedBefore` | ISO 8601 | 交易时间截止 |
| `marketplaceId` | string | Marketplace 过滤 |
| `nextToken` | string | 分页 token |

## 所需角色

- Finance and Accounting

## 适用用户

仅 Seller。

## 提示

- 不需要等待结算周期结束就可以查询交易数据
- v2024-06-19 是简化版本，推荐新应用使用
- v0 提供更细粒度的事件分类（如区分不同类型的 FBA 费用）

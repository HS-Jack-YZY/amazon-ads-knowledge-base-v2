#!/bin/bash
# Amazon Ads Knowledge Base - 安装脚本
# 将知识库、agent、command 安装到目标项目目录

set -e

# 确定脚本所在目录（知识库源目录）
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# 确定目标目录
if [ -n "$1" ]; then
    TARGET_DIR="$(cd "$1" 2>/dev/null && pwd || echo "$1")"
else
    # 默认安装到父目录
    TARGET_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
fi

# 防止安装到自身
if [ "$TARGET_DIR" = "$SCRIPT_DIR" ]; then
    echo "Error: 目标目录不能是知识库自身目录"
    echo "用法: ./install.sh [目标项目路径]"
    exit 1
fi

echo "=== Amazon Ads Knowledge Base Installer ==="
echo "源目录: $SCRIPT_DIR"
echo "目标目录: $TARGET_DIR"
echo ""

# 确认目标目录存在
if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: 目标目录不存在: $TARGET_DIR"
    exit 1
fi

# 1. 复制 knowledge_base/
echo "[1/4] 安装知识库..."
if [ -d "$TARGET_DIR/knowledge_base" ]; then
    echo "  ⚠ knowledge_base/ 已存在，跳过（避免覆盖已有内容）"
    echo "  如需更新，请先删除 $TARGET_DIR/knowledge_base/ 后重新运行"
else
    cp -r "$SCRIPT_DIR/knowledge_base" "$TARGET_DIR/knowledge_base"
    echo "  ✓ knowledge_base/ 已安装"
fi

# 2. 复制 .claude/ 下的 agent、command、skill
echo "[2/4] 安装 agent 和 command..."

mkdir -p "$TARGET_DIR/.claude/agents"
mkdir -p "$TARGET_DIR/.claude/commands"
mkdir -p "$TARGET_DIR/.claude/skills/learned"

for file in agents/ads-expert.md commands/ads.md skills/learned/amc-field-value-discovery.md; do
    if [ -f "$TARGET_DIR/.claude/$file" ]; then
        echo "  ⚠ .claude/$file 已存在，跳过"
    else
        cp "$SCRIPT_DIR/.claude/$file" "$TARGET_DIR/.claude/$file"
        echo "  ✓ .claude/$file 已安装"
    fi
done

# 3. 更新 CLAUDE.md
echo "[3/4] 更新 CLAUDE.md..."

CLAUDE_MD="$TARGET_DIR/CLAUDE.md"
MARKER="## Amazon Ads Knowledge Base"

if [ -f "$CLAUDE_MD" ] && grep -q "$MARKER" "$CLAUDE_MD"; then
    echo "  ⚠ CLAUDE.md 中已包含 Amazon Ads 配置，跳过"
else
    cat >> "$CLAUDE_MD" << 'CLAUDE_EOF'

## Amazon Ads Knowledge Base

### Agents

- **ads-expert** (`.claude/agents/ads-expert.md`): Amazon Ads 综合专家，自动识别 API 和 AMC 相关对话

### Commands

- `/ads <question>`: Amazon Ads 综合助手，自动判断问题类型（API / AMC SQL / 概念问答）

### AMC SQL 规则

当用户提到 AMC、Amazon Marketing Cloud 或需要编写 AMC SQL 查询时：

1. 先读取 `knowledge_base/amc/README.md` 获取表索引和 SQL 技巧
2. 根据需求读取 `knowledge_base/amc/` 下对应的表结构文件
3. 编写 SQL 时严格遵守聚合阈值规则（VERY_HIGH 字段不能出现在最终 SELECT）
CLAUDE_EOF
    echo "  ✓ CLAUDE.md 已更新"
fi

# 4. 完成
echo "[4/4] 安装完成！"
echo ""
echo "现在可以使用："
echo "  /ads <问题>     - 查询 Amazon Ads API 或编写 AMC SQL"
echo "  对话中提到广告相关话题时，ads-expert agent 会自动调度"
echo ""
echo "知识库内容："
echo "  knowledge_base/amazon-ads-api/  - Amazon Ads API 文档（56 个文件）"
echo "  knowledge_base/amc/             - AMC 表 schema + SQL 参考（27 个文件）"

#!/bin/bash
# Amazon Ads Knowledge Base - 安装/更新脚本
# 将知识库、agent、command 安装到目标项目目录

set -e

# CLAUDE.md 配置块内容
write_claude_config() {
    cat >> "$1" << 'CLAUDE_EOF'

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

<!-- END Amazon Ads Knowledge Base -->
CLAUDE_EOF
}

# 解析参数
UPDATE_MODE=false
TARGET_ARG=""

for arg in "$@"; do
    case "$arg" in
        --update) UPDATE_MODE=true ;;
        *) TARGET_ARG="$arg" ;;
    esac
done

# 确定脚本所在目录（知识库源目录）
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# 确定目标目录
if [ -n "$TARGET_ARG" ]; then
    TARGET_DIR="$(cd "$TARGET_ARG" 2>/dev/null && pwd || echo "$TARGET_ARG")"
else
    TARGET_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
fi

# 防止安装到自身
if [ "$TARGET_DIR" = "$SCRIPT_DIR" ]; then
    echo "Error: 目标目录不能是知识库自身目录"
    echo ""
    echo "用法:"
    echo "  ./install.sh [目标路径]              首次安装"
    echo "  ./install.sh [目标路径] --update     更新已安装的知识库"
    exit 1
fi

# 确认目标目录存在
if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: 目标目录不存在: $TARGET_DIR"
    exit 1
fi

if [ "$UPDATE_MODE" = true ]; then
    echo "=== Amazon Ads Knowledge Base Updater ==="
else
    echo "=== Amazon Ads Knowledge Base Installer ==="
fi
echo "源目录: $SCRIPT_DIR"
echo "目标目录: $TARGET_DIR"
echo ""

# 需要安装的文件列表
CLAUDE_FILES="agents/ads-expert.md commands/ads.md skills/learned/amc-field-value-discovery.md"

if [ "$UPDATE_MODE" = true ]; then
    # ===== 更新模式：覆盖所有文件 =====

    echo "[1/3] 更新知识库..."
    rm -rf "$TARGET_DIR/knowledge_base"
    cp -r "$SCRIPT_DIR/knowledge_base" "$TARGET_DIR/knowledge_base"
    echo "  ✓ knowledge_base/ 已更新"

    echo "[2/3] 更新 agent 和 command..."
    for file in $CLAUDE_FILES; do
        mkdir -p "$TARGET_DIR/.claude/$(dirname "$file")"
        cp "$SCRIPT_DIR/.claude/$file" "$TARGET_DIR/.claude/$file"
        echo "  ✓ .claude/$file 已更新"
    done

    echo "[3/3] 更新 CLAUDE.md..."
    CLAUDE_MD="$TARGET_DIR/CLAUDE.md"
    MARKER_START="## Amazon Ads Knowledge Base"
    MARKER_END="<!-- END Amazon Ads Knowledge Base -->"

    if [ -f "$CLAUDE_MD" ]; then
        if grep -q "$MARKER_END" "$CLAUDE_MD"; then
            # 有结束标记：精确删除配置块
            sed -i '' "/$MARKER_START/,/$MARKER_END/d" "$CLAUDE_MD"
        elif grep -q "$MARKER_START" "$CLAUDE_MD"; then
            # 旧版无结束标记：删除从标记到文件末尾
            sed -i '' "/$MARKER_START/,\$d" "$CLAUDE_MD"
        fi
    fi
    write_claude_config "$CLAUDE_MD"
    echo "  ✓ CLAUDE.md 已更新"

    echo ""
    echo "更新完成！"

else
    # ===== 安装模式：不覆盖已有文件 =====

    echo "[1/4] 安装知识库..."
    if [ -d "$TARGET_DIR/knowledge_base" ]; then
        echo "  ⚠ knowledge_base/ 已存在，跳过"
        echo "    如需更新，请使用: ./install.sh --update"
    else
        cp -r "$SCRIPT_DIR/knowledge_base" "$TARGET_DIR/knowledge_base"
        echo "  ✓ knowledge_base/ 已安装"
    fi

    echo "[2/4] 安装 agent 和 command..."
    for file in $CLAUDE_FILES; do
        mkdir -p "$TARGET_DIR/.claude/$(dirname "$file")"
        if [ -f "$TARGET_DIR/.claude/$file" ]; then
            echo "  ⚠ .claude/$file 已存在，跳过"
        else
            cp "$SCRIPT_DIR/.claude/$file" "$TARGET_DIR/.claude/$file"
            echo "  ✓ .claude/$file 已安装"
        fi
    done

    echo "[3/4] 更新 CLAUDE.md..."
    CLAUDE_MD="$TARGET_DIR/CLAUDE.md"
    if [ -f "$CLAUDE_MD" ] && grep -q "## Amazon Ads Knowledge Base" "$CLAUDE_MD"; then
        echo "  ⚠ CLAUDE.md 中已包含 Amazon Ads 配置，跳过"
    else
        write_claude_config "$CLAUDE_MD"
        echo "  ✓ CLAUDE.md 已更新"
    fi

    echo "[4/4] 安装完成！"
fi

echo ""
echo "可用命令："
echo "  /ads <问题>     查询 Amazon Ads API 或编写 AMC SQL"
echo "  对话中提到广告相关话题时，ads-expert agent 会自动调度"
echo ""
echo "知识库内容："
echo "  knowledge_base/amazon-ads-api/  Amazon Ads API 文档"
echo "  knowledge_base/amc/             AMC 表 schema + SQL 参考"

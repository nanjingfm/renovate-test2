#!/bin/bash

gomod="$1"
out="$2"

if [[ -z "$gomod" || -z "$out" ]]; then
  echo "用法: $0 go.mod dep.go"
  exit 1
fi

# 进入 go.mod 所在目录
cd "$(dirname "$gomod")" || exit 1

# 获取 direct 依赖 module 列表
direct_mods=$(go list -m -f '{{if not .Indirect}}{{.Path}}{{end}}' all | grep -v '^$' | grep -v "$(go list -m)")

echo '//go:build tools' > "$out"
echo '// +build tools' >> "$out"
echo '' >> "$out"
echo 'package main' >> "$out"
echo '' >> "$out"
echo 'import (' >> "$out"

for mod in $direct_mods; do
  # 列出该 module 下的所有 package，取第一个（通常是主包或常用包）
  pkg=$(go list -f '{{.ImportPath}}' "$mod/..." 2>/dev/null | grep -vE '/internal($|/)' | head -n1)
  if [[ -n "$pkg" ]]; then
    echo "    _ \"$pkg\"" >> "$out"
  fi
done

echo ')' >> "$out"
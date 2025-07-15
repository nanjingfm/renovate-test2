//go:build tools
// +build tools

package main

import (
    _ "github.com/a8m/envsubst"
    _ "github.com/alecthomas/participle/v2"
    _ "github.com/alecthomas/repr"
    _ "github.com/dimchansky/utfbom"
    _ "github.com/elliotchance/orderedmap"
    _ "github.com/fatih/color"
    _ "github.com/go-ini/ini"
    _ "github.com/goccy/go-json"
    _ "github.com/goccy/go-yaml"
    _ "github.com/jinzhu/copier"
    _ "github.com/magiconair/properties"
    _ "github.com/pelletier/go-toml/v2"
    _ "github.com/pkg/diff"
    _ "github.com/spf13/cobra"
    _ "github.com/spf13/pflag"
    _ "github.com/yuin/gopher-lua"
    _ "go.yaml.in/yaml/v3"
    _ "golang.org/x/net/bpf"
    _ "golang.org/x/text"
    _ "gopkg.in/op/go-logging.v1"
)

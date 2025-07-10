#!/bin/bash

FILESYSTEM_DIRECTORIES=("/work" "/lab/homelab")

# One-command MCP server installation
echo "🚀 Installing Claude Code MCP Servers..."

# Install Sequential Thinking MCP
echo "📊 Setting up Sequential Thinking..."
claude mcp add sequential-thinking -s user -- npx -y @modelcontextprotocol/server-sequential-thinking

# Install Filesystem MCP (customize directories as needed)
echo "📁 Setting up Filesystem access..."
claude mcp add filesystem -s user -- npx -y @modelcontextprotocol/server-filesystem "${FILESYSTEM_DIRECTORIES[@]}"

# Install Puppeteer MCP
echo "🌐 Setting up Puppeteer browser automation..."
claude mcp add puppeteer -s user -- npx -y @modelcontextprotocol/server-puppeteer

# Install Web Fetching MCP
echo "🔍 Setting up Web Fetching..."
claude mcp add fetch -s user -- npx -y @kazuph/mcp-fetch

echo "📦 Setting up playwright..."
claude mcp add playwright npx -- @playwright/mcp@latest

echo "📦 Setting up context7..."
claude mcp add --transport sse context7 https://context7.liam.sh/sse

echo "📦 Setting up memory..."
claude mcp add memory -s user -- npx -y @modelcontextprotocol/server-memory

# Verify installation
echo "✅ Verifying installation..."
echo "🎉 Basic MCP servers installed"

claude mcp list



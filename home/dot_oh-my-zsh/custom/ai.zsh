# Functions for AI

# List MCP tools
mcp_tools() {
  local server_command=("${@}")
  echo '{"jsonrpc":"2.0","method":"tools/list","id":1}' | "${server_command[@]}" | jq
}
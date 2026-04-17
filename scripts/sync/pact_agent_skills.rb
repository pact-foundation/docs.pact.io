#!/usr/bin/env ruby

require_relative 'support'

SOURCE_REPO = 'pactflow/pact-agent-skills'
DESTINATION_DIR = relative_path_to('docs/ai_tools')
INCLUDE = [
  ->(path) { path == 'README.md' },
  ->(path) { path.start_with?('docs/ai-tools/') && path.end_with?('.md') }
]
IGNORE = []

TRANSFORM_PATH = ->(path) {
  case path
  when 'README.md'
    File.join(DESTINATION_DIR, 'installation.md')
  else
    # docs/ai-tools/pactflow-skill.md -> docs/ai_tools/pactflow-skill.md
    File.join(DESTINATION_DIR, File.basename(path))
  end
}

CUSTOM_ACTIONS = [
  ['README.md', ->(md) {
    md.extract_title
    md.fields[:title] = 'PactFlow Agent Skills'
    md.fields[:sidebar_label] = 'Installation'
    md.fields[:description] = 'Installation guide for PactFlow AI coding assistant skills across Claude Code, GitHub Copilot, Cursor, Windsurf, Codex, Kiro, and more.'
    md.fields[:slug] = 'installation'
  }],
  ['docs/ai-tools/pactflow-skill.md', ->(md) {
    md.extract_title
    md.fields[:sidebar_label] = 'PactFlow Skill'
  }],
  ['docs/ai-tools/smartbear-mcp.md', ->(md) {
    md.extract_title
    md.fields[:sidebar_label] = 'SmartBear MCP'
  }],
  ['docs/ai-tools/kiro-power.md', ->(md) {
    md.extract_title
    md.fields[:sidebar_label] = 'Kiro Power'
  }]
]

sync(SOURCE_REPO, INCLUDE, IGNORE, TRANSFORM_PATH, CUSTOM_ACTIONS, 'main')

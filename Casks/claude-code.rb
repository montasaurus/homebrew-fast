cask "claude-code" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "2.1.218"
  sha256 arm:          "71abaff59312c9a9b6a1d818365048b42e4e95cc521a823660eded3e0880d9b7",
         x86_64:       "9862b74a083e8a4ed572f99cbd4895185e0dd5a0a601affb0fb8e43d8d1f40e6",
         x86_64_linux: "e12071751a9336b8af1012c103358ff04ac18f9aaff4a738cff7ba5cdfaf63f2",
         arm64_linux:  "295fd30481bd03b38450fdec2a6e25bb6472c2074f04b0c4a566cd5988f230bf"

  url "https://storage.googleapis.com/claude-code-dist-86c565f3-f756-42ad-8dfa-d59b1c096819/claude-code-releases/#{version}/#{os}-#{arch}/claude",
      verified: "storage.googleapis.com/claude-code-dist-86c565f3-f756-42ad-8dfa-d59b1c096819/claude-code-releases/"
  name "Claude Code"
  desc "Terminal-based AI coding assistant"
  homepage "https://www.anthropic.com/claude-code"

  livecheck do
    url "https://storage.googleapis.com/claude-code-dist-86c565f3-f756-42ad-8dfa-d59b1c096819/claude-code-releases/latest"
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  binary "claude"

  zap trash: [
        "~/.cache/claude",
        "~/.claude.json*",
        "~/.config/claude",
        "~/.local/bin/claude",
        "~/.local/share/claude",
        "~/.local/state/claude",
        "~/Library/Caches/claude-cli-nodejs",
      ],
      rmdir: "~/.claude"
end

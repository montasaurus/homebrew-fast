cask "claude-code" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "2.1.160"
  sha256 arm:          "6c9069a9ee0e7b9b6ee43d006c3402e66815e19f87ac4313330cf03f83611968",
         x86_64:       "2fb7c11111152f62ab36bd093776d71410fbe047e938fe37719ff65ab76c0714",
         x86_64_linux: "2b84cc2e04633619eab02b9f77ed00a56b64682b4fa7b3267149ee9eb1fecfc7",
         arm64_linux:  "1fcf285194a0ea0c5e09973c4c5910f71c5abf451930f0b9c79441d7501ac229"
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

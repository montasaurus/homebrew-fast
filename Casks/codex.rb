cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.146.1"
  sha256 arm:          "337c5eb270d24bd556c46ad7814db62c2464b1eb0a253106bc98678dbd781821",
         intel:        "975f6ec22659595f16fed4e531c03251c03bc0fd5cb5490d66fd553f4d2f1f50",
         arm64_linux:  "05de65ee7b6bd02038e720cc313941d5ec6794718e4261bd28fd83b93fe34d43",
         x86_64_linux: "f558105aec12bf6fb33570793adfc089f8b41dc32aced60b8b4fba9b451824ac"

  url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-#{arch}-#{os}.tar.gz"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url :url
    regex(/^rust-v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  depends_on formula: "ripgrep"

  binary "codex-#{arch}-#{os}", target: "codex"

  zap rmdir: "~/.codex"
end

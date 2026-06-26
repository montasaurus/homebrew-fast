class Nub < Formula
  desc "Fast all-in-one toolkit that augments Node.js"
  homepage "https://github.com/nubjs/nub"
  version "0.2.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/nubjs/nub/releases/download/v#{version}/nub-darwin-arm64.tar.gz"
      sha256 "1c561d820145e9eb7640f6f97c0fe2f2d8b8d4a4d64b19f78fccf8f9dd79ac46"
    end

    on_intel do
      url "https://github.com/nubjs/nub/releases/download/v#{version}/nub-darwin-x64.tar.gz"
      sha256 "39c0f5200be3688e776c51ee2978e3cfe50fdb50946261a52ca42f6481145d75"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nubjs/nub/releases/download/v#{version}/nub-linux-arm64.tar.gz"
      sha256 "b9a292a725a959809fd629e7b3d8d6d886480300b8451bb41f8fb4a5098107ec"
    end

    on_intel do
      url "https://github.com/nubjs/nub/releases/download/v#{version}/nub-linux-x64.tar.gz"
      sha256 "6cc63a89f25f12719bce9afc97e513cc8ee22ef203e4a72a3c7398e62b413a23"
    end
  end

  def install
    libexec.install "bin", "runtime"
    bin.install_symlink libexec/"bin/nub"
    bin.install_symlink libexec/"bin/nubx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nub --version")
    assert_match version.to_s, shell_output("#{bin}/nubx --version")
  end
end

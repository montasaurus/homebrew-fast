class Nub < Formula
  desc "Fast all-in-one toolkit that augments Node.js"
  homepage "https://github.com/nubjs/nub"
  version "0.1.14"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/nubjs/nub/releases/download/v#{version}/nub-darwin-arm64.tar.gz"
      sha256 "cdaa6250bbdb85100334a95543fdb50dd2bd09b87dbf7b00d611041e76133a4c"
    end

    on_intel do
      url "https://github.com/nubjs/nub/releases/download/v#{version}/nub-darwin-x64.tar.gz"
      sha256 "368491d4e6654666dee270071aff356be1e90ab82fa5621fea737f21176da66c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nubjs/nub/releases/download/v#{version}/nub-linux-arm64.tar.gz"
      sha256 "0fb7b60291d24e7078f20874bd970457c4069ee8687e1e1898b4b651fb3920e1"
    end

    on_intel do
      url "https://github.com/nubjs/nub/releases/download/v#{version}/nub-linux-x64.tar.gz"
      sha256 "f6ae9c6f73b47b836f365a54899493a4a50bc1211baebc07791a886d8780c997"
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

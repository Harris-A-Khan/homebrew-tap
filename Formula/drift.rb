class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Harris-A-Khan/drift"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Harris-A-Khan/drift/releases/download/v1.5.0/drift-darwin-arm64"
      sha256 "a582a38d8ba33f9377841fb5c8adcb5741938c50d06ac971dd251e72b5c10f1c"
    end
    on_intel do
      url "https://github.com/Harris-A-Khan/drift/releases/download/v1.5.0/drift-darwin-amd64"
      sha256 "209df937288e44b0e92ac284a303f0020698f66c15ff186b9655774eeab3c380"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Harris-A-Khan/drift/releases/download/v1.5.0/drift-linux-arm64"
      sha256 "6d8e52dded759f739fe540af51544649d695258cada1661906b9c554a59294e2"
    end
    on_intel do
      url "https://github.com/Harris-A-Khan/drift/releases/download/v1.5.0/drift-linux-amd64"
      sha256 "a8a1e123f6433c7200393806222d8782027f0ee6bd5b8f2006b1665fb9bd6b61"
    end
  end

  def install
    binary_name = "drift-darwin-arm64"
    if OS.mac? && Hardware::CPU.intel?
      binary_name = "drift-darwin-amd64"
    elsif OS.linux? && Hardware::CPU.arm?
      binary_name = "drift-linux-arm64"
    elsif OS.linux? && Hardware::CPU.intel?
      binary_name = "drift-linux-amd64"
    end

    bin.install binary_name => "drift"
  end

  test do
    system "#{bin}/drift", "--version"
  end
end

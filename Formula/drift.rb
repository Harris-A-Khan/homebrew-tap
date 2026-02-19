class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Harris-A-Khan/drift"
  version "1.4.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Harris-A-Khan/drift/releases/download/v1.4.6/drift-darwin-arm64"
      sha256 "31b7d0f7b25bff5d16c1735a78e0a50d09604b235c49b596e9494071c1d68418"
    end
    on_intel do
      url "https://github.com/Harris-A-Khan/drift/releases/download/v1.4.6/drift-darwin-amd64"
      sha256 "b144984ff64095447d46371bf9ef0d5fd150ca3f49bfa35432b2f405e1d7b9dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Harris-A-Khan/drift/releases/download/v1.4.6/drift-linux-arm64"
      sha256 "a3f42c798a07c2711c6ba035451c7b74ef34f089b9e329f6237ceaf223e3402c"
    end
    on_intel do
      url "https://github.com/Harris-A-Khan/drift/releases/download/v1.4.6/drift-linux-amd64"
      sha256 "3caf153e7b667341ecf93f6b3da60d4f92b1d18907ece210a5bb17013ca7c009"
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

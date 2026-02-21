class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Harris-A-Khan/drift"
  version "1.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Harris-A-Khan/drift/releases/download/v1.6.0/drift-darwin-arm64"
      sha256 "c65ae85f4112a2931669f947264ca61052437b4cbd676850cac816f862d64262"
    end
    on_intel do
      url "https://github.com/Harris-A-Khan/drift/releases/download/v1.6.0/drift-darwin-amd64"
      sha256 "1f3566b0d6c6084593a0891d8346d882795df9c05ddce3a4ff4065bf8ac06d00"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Harris-A-Khan/drift/releases/download/v1.6.0/drift-linux-arm64"
      sha256 "08e3ad4b37aa796988031da5e1531b4e4f192ab00f458d896045dc22ebf6e64d"
    end
    on_intel do
      url "https://github.com/Harris-A-Khan/drift/releases/download/v1.6.0/drift-linux-amd64"
      sha256 "3dd76232ae99a1829c0291a948edacfebf02bc07a65e176623b1a0922f6a7a09"
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

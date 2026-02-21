class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Harris-A-Khan/drift"
  version "1.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Harris-A-Khan/drift/releases/download/v1.6.1/drift-darwin-arm64"
      sha256 "c86613607a76ee4b920755d14162ed14ab64d1e0ea7cc3197bc2c0ce57f06f6e"
    end
    on_intel do
      url "https://github.com/Harris-A-Khan/drift/releases/download/v1.6.1/drift-darwin-amd64"
      sha256 "3cf5d5e093277e683fb06788338e4c96492a2e0ed3545badc8417ff70094ec63"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Harris-A-Khan/drift/releases/download/v1.6.1/drift-linux-arm64"
      sha256 "c536a422753ab1fcefa6ef58b48b833bc7cb0347c522bab0cdcc49d60013fa05"
    end
    on_intel do
      url "https://github.com/Harris-A-Khan/drift/releases/download/v1.6.1/drift-linux-amd64"
      sha256 "715d866680257402128efbbcba8657aa944fb2b511e3d15e5ece8d9d8a407e69"
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

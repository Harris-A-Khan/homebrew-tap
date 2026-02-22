class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Harris-A-Khan/drift"
  version "1.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Harris-A-Khan/drift/releases/download/v1.6.2/drift-darwin-arm64"
      sha256 "c1d309ce231724ebd13387f1ebdd9543e21b67079e6972c47925c6ab4691d14c"
    end
    on_intel do
      url "https://github.com/Harris-A-Khan/drift/releases/download/v1.6.2/drift-darwin-amd64"
      sha256 "205230e51a1cff77de777ab5372a7f75bc9abbad15a5f1a1dada5f7929072eeb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Harris-A-Khan/drift/releases/download/v1.6.2/drift-linux-arm64"
      sha256 "463048dab10fed70226e6ed3a7c4096600291194b6d4194296456a656155f2c4"
    end
    on_intel do
      url "https://github.com/Harris-A-Khan/drift/releases/download/v1.6.2/drift-linux-amd64"
      sha256 "35c444f006624b30aea347e358f92f5796d8f31cd7e4d96b20e2c28027a2625f"
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

class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "1.6.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/drift/releases/download/v1.6.3/drift-darwin-arm64"
      sha256 "0027b6464cb99f6b0c23734f64557a274a1ce782dcd66406899c4bcf5cfa0f60"
    end
    on_intel do
      url "https://github.com/Undrift/drift/releases/download/v1.6.3/drift-darwin-amd64"
      sha256 "c8586c6f503341a5a475c59f3d154388cc644064ed69749574fed1b8ed0adcb1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/drift/releases/download/v1.6.3/drift-linux-arm64"
      sha256 "41e76eaa40e3d3f13e7fb7dc51edde72d45a1e9163c88b38aadd773f2c713ac9"
    end
    on_intel do
      url "https://github.com/Undrift/drift/releases/download/v1.6.3/drift-linux-amd64"
      sha256 "f8c270ec2246601f166c8c14a37c502045dc553713fb77963f749f2768bcd762"
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

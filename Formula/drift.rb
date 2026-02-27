class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "1.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.0/drift-darwin-arm64"
      sha256 "1fdcbcf65f2c562afaa9e90c4bf3b2658a3860101b7656d0c8cb3d63aac910de"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.0/drift-darwin-amd64"
      sha256 "509c229b6e80895ba577458e4201b640d8490c3bb2b82481c8af71342ae7e7fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.0/drift-linux-arm64"
      sha256 "2a3fa2cd089764a807931d840398850ecf5a6b1dd91cdb9eb5282690f672d79c"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.0/drift-linux-amd64"
      sha256 "f3551cb2b84e5cd298e611ed3286460ee25965d96d79dbc1b4c1968fcccdd6da"
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

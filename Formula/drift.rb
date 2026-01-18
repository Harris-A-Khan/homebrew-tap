class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Harris-A-Khan/drift"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Harris-A-Khan/drift/releases/download/v1.0.0/drift-darwin-arm64"
      sha256 "0dad4349f9290edd259bc449bf9a969b18ae3c3ef34d9b2339df7a20cf8c989b"
    end
    on_intel do
      url "https://github.com/Harris-A-Khan/drift/releases/download/v1.0.0/drift-darwin-amd64"
      sha256 "0a2418af47184845cb6a9c8af60e48a5465be02122dd999bc49a657ac2d781b7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Harris-A-Khan/drift/releases/download/v1.0.0/drift-linux-arm64"
      sha256 "168bcc362ae39f87f67259a006ec0130c8bc7be27fd752d7973dd1314afff45c"
    end
    on_intel do
      url "https://github.com/Harris-A-Khan/drift/releases/download/v1.0.0/drift-linux-amd64"
      sha256 "19c96149ed57c72f6d7a98c33386184b1d8f41b8488b5d1a1d75376924314d31"
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

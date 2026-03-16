class Snapcat < Formula
  desc "Lightweight macOS screenshot tool with Command+Shift+S hotkey"
  homepage "https://github.com/macdirtycow/Snapcat"
  url "https://github.com/macdirtycow/Snapcat/releases/download/v1.0.0/snapcat-1.0.0.zip"
  sha256 "25557d7652491aa6e34d454d1d73faca686e375de701da4481869120bc135ec0"
  license "MIT"

  def install
    bin.install "snapcat"
  end
end

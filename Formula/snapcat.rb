class Snapcat < Formula
  desc "Lightweight macOS screenshot tool"
  homepage "https://github.com/leopold/snapcat"
  url "https://github.com/leopold/snapcat/releases/download/v1.0/snapcat.zip"
  version "1.0"
  sha256 "PUT_SHA256_HERE"

  def install
    prefix.install "Snapcat.app"
  end

  def caveats
    <<~EOS
      Snapcat installed.

      Launch with:
        open #{prefix}/Snapcat.app
    EOS
  end
end

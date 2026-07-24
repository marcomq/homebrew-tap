# typed: false
# frozen_string_literal: true

# Homebrew formula for the mq-bridge-app CLI / MCP server.
# Lives in the tap repo marcomq/homebrew-tap as Formula/mq-bridge-app.rb.
# This copy in the main repo is the source of truth; CI keeps the tap in sync.
class MqBridgeApp < Formula
  desc "Universal, protocol-agnostic message and data bridge (CLI + MCP server)"
  homepage "https://github.com/marcomq/mq-bridge-app"
  version "0.2.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/marcomq/mq-bridge-app/releases/download/#{version}/mq-bridge-cli-aarch64-apple-darwin.tar.gz"
      sha256 "ccca2f1d8c6020121911cd497684e86741e1ffa16ccfa213880b2ef59c9f6872"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/marcomq/mq-bridge-app/releases/download/#{version}/mq-bridge-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3782e2eaaa2b639b4f4199fa8f30b3e20c9a6d4645a1e005ef074f1072f60a2a"
    end
  end

  def install
    # Release tarballs ship the binary as `mq-bridge-cli`; install it under the
    # same command name binstall/crates.io use so docs stay consistent.
    bin.install "mq-bridge-cli" => "mq-bridge-app"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mq-bridge-app --version")
  end
end

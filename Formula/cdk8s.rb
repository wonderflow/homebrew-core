require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-1.0.77.tgz"
  sha256 "854fd86436611b5dfc66a5cb92ca9e7adaf2699fe86d778dc77d2a9c500282c6"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "1a8e14f3dbd02088e447e1dba2f8226bdf6227db04b00698f6c1729ef13a0f43"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end

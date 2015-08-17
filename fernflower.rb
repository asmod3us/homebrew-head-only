require 'formula'

class Fernflower < Formula
  homepage "https://github.com/fesh0r/fernflower"
  head "https://github.com/fesh0r/fernflower", :using => :git

  depends_on :ant => :build
  depends_on :java => "1.7"

  def install
    system "ant", "dist"
    libexec.install "fernflower.jar"
     bin.write_jar_script libexec/"fernflower.jar", "fernflower", "$@"
  end

  test do
    system "#{bin}/fernflower"
  end
end

cask "github-float" do
  version "1.0.0"
  sha256 "4f03b2d96ec93efb511b53ed89e4c4b8abb31f2e26737e01fa72ab6d9f3a6385"

  url "https://github.com/vinimcorrea/github-float/releases/download/v#{version}/GitHubFloat.zip"
  name "GitHub Float"
  desc "Always-on-top panel for GitHub Project reviews"
  homepage "https://github.com/vinimcorrea/github-float"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "GitHubFloat.app"

  # The app is ad-hoc signed (not notarized): drop the quarantine flag so it opens without a Gatekeeper prompt.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/GitHubFloat.app"],
                   must_succeed: false
  end

  uninstall quit: "com.vinimcorrea.githubfloat"

  zap trash: [
    "~/Library/Preferences/com.vinimcorrea.githubfloat.plist",
  ]
end

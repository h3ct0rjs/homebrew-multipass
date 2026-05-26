cask "multipass" do
  version "1.16.3-rc2"
  sha256 "73987207b64ccd6731dc4260fbe8ed0cb20660ae9afb2171140c16ccbe6908bb"

  url "https://github.com/canonical/multipass/releases/download/v#{version}/multipass-#{version}+mac-Darwin.pkg"
  name "Multipass"
  desc "Orchestrates virtual Ubuntu instances"
  homepage "https://github.com/canonical/multipass/"

  # Tracks all releases (stable + RC) via the releases list API, not /latest
  livecheck do
    url "https://api.github.com/repos/canonical/multipass/releases"
    strategy :json do |json|
      json.first["tag_name"]&.delete_prefix("v")
    end
  end

  depends_on macos: :ventura

  pkg "multipass-#{version}+mac-Darwin.pkg"

  on_arm do
    postflight do
      File.symlink("/Library/Application Support/com.canonical.multipass/Resources/completions/bash/multipass",
                   "#{HOMEBREW_PREFIX}/etc/bash_completion.d/multipass")
    end
  end

  uninstall launchctl: "com.canonical.multipassd",
            pkgutil:   "com.canonical.multipass.*",
            delete:    [
              "#{HOMEBREW_PREFIX}/etc/bash_completion.d/multipass",
              "/Applications/Multipass.app",
              "/Library/Application Support/com.canonical.multipass",
              "/Library/Logs/Multipass",
              "/usr/local/bin/multipass",
              "/usr/local/etc/bash_completion.d/multipass",
            ]

  zap trash: [
    "~/Library/Application Support/com.canonical.multipassGui",
    "~/Library/Application Support/multipass",
    "~/Library/Application Support/multipass-gui",
    "~/Library/LaunchAgents/com.canonical.multipass.gui.autostart.plist",
    "~/Library/Preferences/multipass",
    "~/Library/Saved Application State/com.canonical.multipassGui.savedState",
  ]
end

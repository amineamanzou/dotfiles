{
  description = "My Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ 
          pkgs.vim
          pkgs.direnv
          pkgs.sshs
          pkgs.glow
          pkgs.carapace
          pkgs.kubectl
          pkgs.kubectx
          pkgs.kubecm
          pkgs.stow
          pkgs.tmux
          pkgs.neovim
          pkgs.starship
          pkgs.fzf
          pkgs.zoxide
          pkgs.atuin
          pkgs.gh
          pkgs.eza
          pkgs.bat
          pkgs.fd
          pkgs.zsh-autosuggestions
          pkgs.zsh-completions
          pkgs.nodejs_22
          pkgs.ripgrep
          pkgs.go
        ];
      nix.settings.experimental-features = "nix-command flakes";
      programs.zsh.enable = true;  # default shell on catalina
      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 4;
      nixpkgs.hostPlatform = "aarch64-darwin";
      ids.gids.nixbld = 350;
      security.pam.services.sudo_local.touchIdAuth = true;

      users.users.amine.home = "/Users/amine";
      home-manager.backupFileExtension = "backup";
      system.primaryUser = "amine";

      system.defaults = {
        dock.autohide = true;
        dock.mru-spaces = false;
        finder.AppleShowAllExtensions = true;
        finder.FXPreferredViewStyle = "clmv";
        loginwindow.LoginwindowText = "devops-toolbox";
        screencapture.location = "~/Pictures/screenshots";
        screensaver.askForPasswordDelay = 10;
      };

      # Homebrew needs to be installed on its own!
      homebrew.enable = true;
      homebrew.taps = [
        "anomalyco/tap"
      ];
      homebrew.casks = [
	      "wireshark-app"
        "google-chrome"
      ];
      homebrew.brews = [
	      "imagemagick"
        "opencode"
        "gemini-cli"
      ];
    };
  in
  {
    darwinConfigurations."the-unreliable-engineer" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ 
	configuration
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.amine = import ./home.nix;
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."the-unreliable-engineer".pkgs;
  };
}

This is a guide on how to install all tools necessary to work with OSISM Kubernetes at Univention

# Install Guix

```
apt install guix
```

# Install nonGuix and univention-guix channels
Nonguix is a channel containing nonfree guix packages. 
It contains the packages kubectl, helm-kubernetes and more.

Univention-guix is a custom package channel for work at univention.

To add the channel run
```
mkdir ~/.config/guix
cat > ~/.config/guix/channels.scm << EOF
(use-modules (guix ci))

(list (channel-with-substitutes-available
       %default-guix-channel
       "https://ci.guix.gnu.org"))

(append (list
         (channel
          (name 'nonguix)
          (url "https://gitlab.com/nonguix/nonguix")
          ;; Enable signature verification:
          (introduction
           (make-channel-introduction
            "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
            (openpgp-fingerprint
             "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))
         (channel
          (name 'univention-guix)
          (url "https://github.com/zumvorde/univention-guix")
          (branch "main")))
         %default-channels)
EOF
guix pull
```

# Install kubernetes tools

```
guix install gardenlogin gardenctl kubectl kubelogin helm-kubernetes
```

# Configure Gardenlogin

Add to your ~/.bashrc (see on CLI "gardenctl help" if you have another shell)
```
[ -n "$GCTL_SESSION_ID" ] || [ -n "$TERM_SESSION_ID" ] || export GCTL_SESSION_ID=$(uuidgen)
```

Download the kubeconfig from the https://dashboard.okeanos.tech
- Click on "My Account" to find the option.
- Save the file as ~/.kube/garden-okeanos


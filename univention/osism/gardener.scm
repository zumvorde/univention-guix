(define-module (univention osism gardener)
  #:use-module (guix build-system copy)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix licenses))

(define-public gardenctl
  (package
    (name "gardenctl")
    (version "v2.6.1")
    (home-page "https://github.com/gardener/gardenctl-v2")
    (synopsis "Gardener command-line client")
    (description "a command-line client for the Gardener. It facilitates the administration of one or many garden, seed and shoot clusters. Use this tool to configure access to clusters and configure cloud provider CLI tools. It also provides support for accessing cluster nodes via ssh.")
    (license asl2.0)
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/gardener/gardenctl-v2/releases/download/"
             version "/gardenctl_v2" "_linux_amd64"))
       (sha256
        (base32 "1qyb35sqk39fzzrdm675hrvln87rxcqgznvcrasgh6ix2i2cli9k"))))
    (build-system copy-build-system)
    (arguments '(#:install-plan
                 '(("gardenctl" "bin/"))
                 #:phases
                 (modify-phases %standard-phases
                   (replace 'unpack
                     (lambda* (#:key source #:allow-other-keys)
                       (copy-file source "./gardenctl")
                       (chmod "gardenctl" #o755)))
                   (add-before 'install 'change-permisions
                     (lambda _
                       (chmod "gardenctl" #o755))))))))

(define-public gardenlogin
  (package
    (name "gardenlogin")
    (version "v0.5.1")
    (home-page "https://github.com/gardener/gardenlogin")
    (synopsis "kubernetes credential plugin")
    (description "A credential plugin for kubernetes clusters")
    (license asl2.0)
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/gardener/gardenlogin/releases/download/"
             version "/gardenlogin" "_linux_amd64"))
       (sha256
        (base32 "1b1yqsfk1ifisqm5910xsc9k1hc47na56h7kk6qqaqlxsi1cclyx"))))
    (build-system copy-build-system)
    (arguments '(#:install-plan
                 '(("gardenlogin" "bin/kubectl-gardenlogin"))
                 #:phases
                 (modify-phases %standard-phases
                   (replace 'unpack
                     (lambda* (#:key source #:allow-other-keys)
                       (copy-file source "./gardenlogin")
                       (chmod "gardenlogin" #o755)))
                   (add-before 'install 'change-permisions
                     (lambda _
                       (chmod "gardenlogin" #o755))))))))

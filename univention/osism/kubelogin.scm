(define-module (univention osism kubelogin)
  #:use-module (guix build-system copy)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (gnu packages compression)
  #:use-module (guix licenses))

(define-public kubelogin
  (package
    (name "kubelogin")
    (version "v1.28.0")
    (home-page "https://github.com/int128/kubelogin")
    (synopsis "kubectl plugin for OIDC authentication")
    (description "a kubectl plugin for Kubernetes OpenID Connect (OIDC) authentication, also known as kubectl oidc-login.")
    (license asl2.0)
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/int128/kubelogin/releases/download/"
             version "/kubelogin" "_linux_amd64.zip"))
       (sha256
        (base32 "17p8apx47s23gv0nvpjn5b8blb13wk3h1dpd8qmy63n7zi422a43"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments '(#:install-plan
                 '(("kubelogin" "bin/kubectl-oidc_login"))
                 #:phases
                 (modify-phases %standard-phases
                   (replace 'unpack
                     (lambda* (#:key source #:allow-other-keys)
                       (invoke "unzip" source))))))))


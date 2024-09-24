(define-module (univention kaze kaze)
  #:use-module (guix build-system python)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (gnu packages time)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages iso-codes)
  #:use-module (guix licenses))


(define-public python-pymeeus
  (package
    (name "python-pymeeus")
    (version "0.5.11")
    (home-page "https://github.com/architest/pymeeus")
    (synopsis "Python library with astronomical algorithms")
    (description "PyMeeus is a Python implementation of the astronomical algorithms described in the classical book ‘Astronomical Algorithms, 2nd Edition, Willmann-Bell Inc. (1998)’ by Jean Meeus.")
    (license gpl3)
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/architest/pymeeus")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ibvbmvvbl0hs6xdcp689r9f09rmxjbjzbr0zrn28kbavq3n47xi"))))
    (build-system python-build-system)
    ;; Disable the test suite
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                                      (delete 'sanity-check))))))

(define-public python-convertdate
  (package
    (name "python-convertdate")
    (version "2.3.2")
    (home-page "https://github.com/fitnr/convertdate")
    (synopsis "Python library to convert between Gregorian dates and other calendar systems")
    (description "Python library to convert between Gregorian dates and other calendar systems")
    (license expat-0)
    (source
    (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/fitnr/convertdate")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0k7j59sbqwyi72vcjx5vsh3qb6hxfnkfjkd2i6f6lckdr1bkh7fz"))))
    (build-system python-build-system)
    ;; Disable the test suite
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                                      (delete 'sanity-check))))))


(define-public python-holidays
  (package
    (name "python-holidays")
    (version "0.10.1")
    (home-page "https://github.com/vacanza/python-holidays")
    (synopsis "Python library for generating sets of government-designated holidays")
    (description "A fast, efficient Python library for generating country- and subdivision- (e.g. state or province) specific sets of government-designated holidays on the fly. It aims to make determining whether a specific date is a holiday as fast and flexible as possible.")
    (license expat-0)
    (source
    (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/vacanza/python-holidays")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "1f84n02hlkj2ndxf6zxby7y8xljyrdjrl90imz936129k882vvx8"))))
    (build-system python-build-system)
    ;; Disable the test suite
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                                      (delete 'sanity-check))))))


(define-public python-odoorpc
  (package
    (name "python-odoorpc")
    (version "0.7.0")
    (home-page "https://github.com/OCA/odoorpc")
    (synopsis "Pilot your Odoo servers through RPC.")
    (description "A python package providing an easy way to pilot your Odoo servers through RPC.")
    (license gpl3)
    (source
    (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/OCA/odoorpc")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (patches (list (local-file "patches/python-odoorpc.patch")))
      (sha256
       (base32 "02igj25fbm05hj1v75gz1c05gpahr8hp7bfqn0gpwx05knp96rzf"))))
    (build-system python-build-system)
    ;; Disable the test suite
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                                      (delete 'sanity-check))))))

(define-public kaze
  (package
   (name "kaze")
   (version "5.1.0")
   (home-page "https://git.knut.univention.de/kaze-development/kaze")
   (synopsis "Python-Qt5 Frontend zur Arbeitszeiterfassung bei Univention")
   (description "Python-Qt5 Frontend zur Arbeitszeiterfassung bei Univention")
   (license gpl2)
   (source
    (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://git.knut.univention.de/kaze-development/kaze")
            (commit version)))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0y12dv6ra0a9y81i28vwm1yq2j48h5l1zmln8ayh31ym3wvl8l9z"))))
   (build-system python-build-system)
   ;; Disable the test suite
   (arguments (list #:tests? #f
                    #:phases
                    #~(modify-phases %standard-phases
                        (delete 'sanity-check))))
   ;; Dependencies
   (native-inputs
     (list python-dateutil
           python-odoorpc
           python-portalocker
           qttools
           python-pyqt
           python-sip
           python-keyring
           python-requests
           python-holidays
           python-convertdate
           python-pymeeus
           python-pytz
           python-iso3166
           python-dbus
           ))))

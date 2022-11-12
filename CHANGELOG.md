## 0.0.4 2022-11-11 <dave at tiredofit dot ca>

   ### Added
      - Add new MODEs = 'manual' for starting Kopia Server with no arguments. Use KOPIA_EXTRA_OPTS to tack on your own options
      - 'none' Just lets the container run with no Kopia server process running for your own purposes
      - Add new FINGERPRINT_MODE = 'AUTO' which for MODE=client reads the remote hosts TLS fingerprint and the compares to in the config file and changes (Useful for short lived certs eg Letsencrypt)
      - MODE=server,repository it checks to see if the TLS certificate has changed underneath and reloads Kopia to utilize the new certificate
      - Added more debug statements
      - Continued cleanup and refinement of image


## 0.0.3 2022-11-11 <dave at tiredofit dot ca>

   ### Changed
      - Swap around UI_ADMIN_* and ADMIN_* variables


## 0.0.2 2022-11-11 <dave at tiredofit dot ca>

   ### Added
      - export RCLONE_CONFIG_FILE


## 0.0.1 2022-11-10 <dave at tiredofit dot ca>

   ### Added
      - Initial Release
      - Setup for Client mode (to connect to a repository server)
      - Setup for Server mode (standalone mode)
      - Setup for Repository mode (Have multiple "Clients" connect to it with isolated permissions, yet share common file storage backend)
      - Kopia 0.12.1



## 0.7.1 2023-01-30 <dave at tiredofit dot ca>

   ### Changed
      - Fix Server side fingerprint checks to convert all to lowercase
      - Use YQ instead of jq
      - On client startup - if fingerprint_mode is AUTO then check/write key if different on startup rather than wait for fingerprint tool
      - Switch Fingerprint check time to 55 minutes from 10


## 0.7.0 2022-12-12 <dave at tiredofit dot ca>

   ### Added
      - Add basic Zabbix process monitoring checks


## 0.6.0 2022-12-01 <dave at tiredofit dot ca>

   ### Changed
      - Rework Dockerfile


## 0.5.5 2022-11-23 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.17 base


## 0.5.4 2022-11-16 <dave at tiredofit dot ca>

   ### Added
      - Introduce SERVER_ADMIN_USER and SERVER_ADMIN_PASS to map out --server-admin-username and --server-admin-password flags when necessary

   ### Changed
      - Update graceful shutdown command based on new variables


## 0.5.3 2022-11-16 <dave at tiredofit dot ca>

   ### Changed
      - Change from 51115 to 51515 for UID and also Listen Port


## 0.5.2 2022-11-15 <dave at tiredofit dot ca>

   ### Changed
      - Bugfix for Fingerprint timer


## 0.5.1 2022-11-14 <dave at tiredofit dot ca>

   ### Added
      - Run benchmarks in various modes if no configuration files

   ### Changed
      - Change fingerprints to all lower case to avoid false FAIL situations
      - Re Add cache directory to connect server commands
      - Minor bugfixes and cleanup


## 0.5.0 2022-11-12 <dave at tiredofit dot ca>

   ### Added
      - Add prometheus metrics


## 0.4.3 2022-11-12 <dave at tiredofit dot ca>

   ### Changed
      - Bugfixes and polish for 0.4.x


## 0.4.2 2022-11-11 <dave at tiredofit dot ca>

   ### Changed
      - Give option to use Fingerprint mode or not for server and repository


## 0.4.1 2022-11-11 <dave at tiredofit dot ca>

   ### Added
      - Added Fingerprint check on MODE=client if ENABLE_TLS=TRUE


## 0.4.0 2022-11-11 <dave at tiredofit dot ca>

   ### Added
      - Add new MODEs = 'manual' for starting Kopia Server with no arguments. Use KOPIA_EXTRA_OPTS to tack on your own options
      - 'none' Just lets the container run with no Kopia server process running for your own purposes
      - Add new FINGERPRINT_MODE = 'AUTO' which for MODE=client reads the remote hosts TLS fingerprint and the compares to in the config file and changes (Useful for short lived certs eg Letsencrypt)
      - MODE=server,repository it checks to see if the TLS certificate has changed underneath and reloads Kopia to utilize the new certificate
      - Added more debug statements
      - Continued cleanup and refinement of image


## 0.1.2 2022-11-11 <dave at tiredofit dot ca>

   ### Changed
      - Swap around UI_ADMIN_* and ADMIN_* variables


## 0.1.1 2022-11-11 <dave at tiredofit dot ca>

   ### Added
      - export RCLONE_CONFIG_FILE


## 0.1.0 2022-11-10 <dave at tiredofit dot ca>

   ### Added
      - Initial Release
      - Setup for Client mode (to connect to a repository server)
      - Setup for Server mode (standalone mode)
      - Setup for Repository mode (Have multiple "Clients" connect to it with isolated permissions, yet share common file storage backend)
      - Kopia 0.12.1



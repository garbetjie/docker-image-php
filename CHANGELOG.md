# Changelog

All notable changes to the Docker images will be outlined in this document. Considering these Docker images don't
follow semantic versioning, all versions provided will be identified by dates and commit hashes relating to the built
Docker image.

## [ba04898] - 2018-12-11
### Added
- Added the ability to configure the `newrelic.transaction_tracer.record_sql` ini variable, through the `NEWRELIC_RECORD_SQL`
  environment variable.

### Changed
- Default value of the `newrelic.transaction_tracer.record_sql` ini variable has changed from an empty string to `"obfuscated"`. 


## [3364574] - 2018-12-06
### Added
- `xmlreader` extension.


## [9bbd0ef] - 2018-12-01
### Added
- `STACKDRIVER_TRACING_ENABLED` build argument to the `onbuild` images. This installs the [opencensus](https://opencensus.io)
  PHP extension, and allows integration with [Stackdriver Tracing](https://cloud.google.com/trace/docs/setup/php).


## [06f32a6] - 2018-11-27
### Changed
- Replaced `POST_MAX_SIZE` environment variable with `MAX_REQUEST_SIZE`. `MAX_REQUEST_SIZE` is now also applied to
  NGiNX's `client_max_body_size` configuration parameter, as well as PHP's `post_max_size` INI option.
  PHP's `upload_max_filesize` option can still be configured via `UPLOAD_MAX_FILESIZE`.
  
- Add additional status codes (405, 413) to the NGiNX `error_page` directive.

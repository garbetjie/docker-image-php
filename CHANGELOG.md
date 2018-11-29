# Changelog

All notable changes to the Docker images will be outlined in this document. Considering these Docker images don't
follow semantic versioning, all versions provided will be identified by dates and commit hashes relating to the built
Docker image.

## [06f32a6] - 2018-11-27
### Changed
- Replaced `POST_MAX_SIZE` environment variable with `MAX_REQUEST_SIZE`. `MAX_REQUEST_SIZE` is now also applied to
  NGiNX's `client_max_body_size` configuration parameter, as well as PHP's `post_max_size` INI option.
  PHP's `upload_max_filesize` option can still be configured via `UPLOAD_MAX_FILESIZE`.
  
- Add additional status codes (405, 413) to the NGiNX `error_page` directive.
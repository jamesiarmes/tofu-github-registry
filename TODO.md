# Tofu GitHub Registry

An implementation of the OpenTofuRegistry Protocols written in Ruby using the
grape framework.

### Full support
- [x] [Remote service discovery][protocol-discovery]
- [x] [Module registry protocol][protocol-module]
- [ ] [Provider registry protocol][protocol-provider]
- [ ] [Server-side login protocol][protocol-login]
- [x] GitHub public repositories
- [ ] GitHub authentication (private repositories)

### Usability
- [ ] Validate configuration
- [ ] Read configuration once
- [ ] Custom configuration path
- [ ] Configuration via environment variables
- [ ] Tag template (support "v" prefix and other formats)
- [ ] [Support full semantic version 2.0 spec][semver] (support pre-release and
      build suffixes)
- [ ] Request caching
- [ ] Documentation
- [ ] Add OpenAPI spec

### Reliability
- [ ] Logging
- [ ] Instrumentation
- [ ] Tests

[protocol-discovery]: https://opentofu.org/docs/internals/remote-service-discovery/
[protocol-login]: https://opentofu.org/docs/internals/login-protocol/
[protocol-module]: https://opentofu.org/docs/internals/module-registry-protocol/
[protocol-provider]: https://opentofu.org/docs/internals/provider-registry-protocol/
[semver]: https://semver.org/spec/v2.0.0.html

# Tofu GitHub Registry

> [!CAUTION]
> This project should be considered a proof of concept and is not intended for
> production use.
>
> Contributions are welcome, but I make no guarantees about the future of this
> project at this time.

An implementation of the [OpenTofu] Registry Protocols written in Ruby using the
[grape] framework.

Currently supported:

* [Module registry protocol][protocol-module]
* [Remote service discovery][protocol-discovery]
* GitHub public repositories

_Not_ currently supported:

* [Provider registry protocol][protocol-provider]
* [Server-side login protocol][protocol-login]
* GitHub private repositories

See [TODO.md][todos] for a full list of supported and unsupported features.

## Usage

The best way to try this out is to clone this repository and run the server
locally. Make a copy of `confic/sample.yaml` to `config/config.yaml`. You can
update the file with your own modules, or start with the included examples.

> [!NOTE]
> Inclusion of a module in the sample file does not represent an endorsement or
> recommendation of the module. These modules were selected solely for
> demonstration purposes and because their tags are in the supported format.

OpenTofu won't recognize `localhost` as a valid hostname, so you'll need to use
a different hostname and update your `/etc/hosts` file. For this example, we'll
use `registry.local`.

Add the following line to your `/etc/hosts` file:

```text
127.0.0.1    registry.local
```

### Starting the server

Install dependencies and start the server. Make sure to use the `--hostname`
option to match the hostname you added to your `/etc/hosts` file.

```shell
bundle install
bundle exec falcon serve --hostname registry.local
```

The server should now be running on port 9292. We can test it by make a call to
the service discovery endpoint.

```shell
curl https://registry.local:9292/.well-known/terraform.json
```

### Using with OpenTofu

To use the servie with OpenTofu, you simply add the registry hostname to your
module source. The example `main.tf` below uses the modules from the sample
configuration file.

> [!NOTE]
> The following example is not a valid plan, but is sufficient for our
> demonstration.

```hcl
module "vpc" {
  source = "registry.local:9292/dwp/vpc/aws"
  version = "~> 3.0.0"
}

module "cloud_run" {
  source = "registry.local:9292/garbetjie/cloud-run/google"
  version = "~> 3.0"
}
```

With this simple configuration, we can run `tofu get` to download the modules:

```shell
tofu get
Downloading registry.local:9292/garbetjie/cloud-run/google 3.0.0 for cloud_run...
- cloud_run in .terraform/modules/cloud_run
Downloading registry.local:9292/dwp/vpc/aws 3.0.24 for vpc...
- vpc in .terraform/modules/vpc
```

[grape]: https://github.com/ruby-grape/grape
[opentofu]: https://opentofu.org
[protocol-discovery]: https://opentofu.org/docs/internals/remote-service-discovery/
[protocol-login]: https://opentofu.org/docs/internals/login-protocol/
[protocol-module]: https://opentofu.org/docs/internals/module-registry-protocol/
[protocol-provider]: https://opentofu.org/docs/internals/provider-registry-protocol/
[todos]: TODO.md

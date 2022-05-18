// Special target: https://github.com/docker/metadata-action#bake-definition
target "docker-metadata-action" {
  tags = ["caddy-docker:local"]
}

target "caddy" {
  inherits = ["docker-metadata-action"]
  context = "."
  tags = ["sksat/caddy-docker"]
}

target "caddy-local" {
  inherits = ["caddy"]
  tags = ["sksat/caddy-docker:local"]
  output = ["type=docker"]
}

target "arm64" {
  context = "."
  tags = ["sksat/caddy-docker:arm64"]
  platforms = [
    "linux/arm64",
  ]
}

target "all" {
  inherits = ["caddy"]
  platforms = [
    "linux/amd64",
    "linux/arm",
    "linux/arm64",
    "linux/s390x",
    "linux/ppc64le",
  ]
}

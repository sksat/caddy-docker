target "caddy" {
  context = "."
  tags = ["sksat/caddy-docker"]
}

target "caddy-local" {
  inherits = ["caddy"]
  tags = ["sksat/caddy-docker:local"]
  output = ["type=docker"]
}

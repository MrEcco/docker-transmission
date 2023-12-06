variable "dockerfile" {
  default = "Dockerfile"
}

variable "image" {
  default = "mrecco/transmission:4.0.4"
}

group "default" {
  targets = ["default"]
}

target "default" {
  dockerfile = dockerfile
  context = "."
  tags = [ image ]
  platforms = [
    "linux/amd64",
    "linux/arm64",
    "linux/arm/v7",
    "linux/arm/v6",
    "linux/ppc64le",
    "linux/s390x",
    "linux/386",
  ]
}

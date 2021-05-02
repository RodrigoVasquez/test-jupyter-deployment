output "subnet" {
  value = "${element(module.subnet.subnets, 0)}"
}

output "subnet_gke" {
  value = "${element(module.subnet.subnets, 1)}"
}

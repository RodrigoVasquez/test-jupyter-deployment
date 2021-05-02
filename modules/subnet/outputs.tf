output "subnet" {
  value = "${element(module.subnets.subnets, 0)}"
}

output "subnet_gke" {
  value = "${module.subnets.subnet-gke}"
}

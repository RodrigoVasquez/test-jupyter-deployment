# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

provider "google" {
  project = "${var.project}"
}

module "vpc" {
  source  = "../../modules/vpc"
  project = "${var.project}"
  env     = "${local.env}"
}

module "subnets" {
  source  = "../../modules/subnet"
  project_id = "${var.project}"
  network = "${module.vpc.network}"
}

module "workload-identity" {
  source            = "../../modules/workload-identity"
  project_id          = "${var.project}"
  region            = "${var.region}"
  network           = "${module.vpc.network}"
  subnetwork        = "${module.subnets.subnet_gke}"
  ip_range_pods     = "${module.subnets.subnet_gke.subnet_ip}"
  ip_range_services = "${module.subnets.subnet_gke.secondary_ranges.ip_cidr_range}"
}

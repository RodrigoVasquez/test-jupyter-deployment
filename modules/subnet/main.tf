module "subnets" {
    source  = "terraform-google-modules/network/google//modules/subnets"

    project_id   = var.project_id
    network_name = var.network

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "us-east1"
        },
        {
            subnet_name           = "subnet-gke"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "us-east1"
        },
    ]

    secondary_ranges = {
        subnet-gke = [
            {
                range_name    = "subnet-gke-secondary-01"
                ip_cidr_range = "192.168.64.0/24"
            },
        ]

        subnet-02 = []
    }
}

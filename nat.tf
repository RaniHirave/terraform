resource "google_compute_router" "devops-practice-router-01" {
  name    = "devops-practice-router-01"
  region  = google_compute_subnetwork.devops-practice-subnet-01.region
  network = "${google_compute_network.devops-practice-vpc-01.name}"

  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "devops-practice-nat-01" {
  name                               = "devops-practice-nat-01"
  router                             = google_compute_router.devops-practice-router-01.name
  region                             = "us-east1"
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork  {
                      name = google_compute_subnetwork.devops-practice-subnet-01.self_link
                      source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
               }
}

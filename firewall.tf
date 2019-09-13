resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-devops-practice-ssh"
  network = "${google_compute_network.devops-practice-vpc-01.name}"
  source_ranges = ["114.143.52.206/32"]

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["20-80", "8080", "1000-2000"]
  }

}

// Configure the Google Cloud provider
provider "google" {
 credentials = "${file("CREDENTIALS_FILE.json")}"
 project     = "test"
 region      = "us-east1"
 zone 	     = "us-east1-b"
}
resource "google_compute_subnetwork" "test-subnet-01" {
  provider      = "google"
  name          = "test-subnet-01"
  ip_cidr_range = "172.16.0.0/24"
  region        = "us-east1"
  network       = "${google_compute_network.test-vpc-01.self_link}"

  enable_flow_logs = true
}
 resource "google_compute_subnetwork" "test-subnet-02" {
  provider      = "google"
  name          = "test-subnet-02"
  ip_cidr_range = "172.17.0.0/24"
  private_ip_google_access = "true"
  region        = "us-east1"
  network       = "${google_compute_network.test-vpc-01.self_link}"

  enable_flow_logs = true
}
resource "google_compute_network" "test-vpc-01" {
  provider                = "google"
  name                    = "test-vpc-01"
  auto_create_subnetworks = false
}

provider "google-beta"{
  region = "us-east1"
  zone   = "us-east1-a"
}


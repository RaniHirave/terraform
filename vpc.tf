// Configure the Google Cloud provider
provider "google" {
 credentials = "${file("CREDENTIALS_FILE.json")}"
 project     = "devops-practice-252409"
 region      = "us-east1"
 zone 	     = "us-east1-b"
}
resource "google_compute_subnetwork" "devops-practice-subnet-01" {
  provider      = "google"
  name          = "devops-practice-subnet-01"
  ip_cidr_range = "172.16.0.0/24"
  region        = "us-east1"
  network       = "${google_compute_network.devops-practice-vpc-01.self_link}"

  enable_flow_logs = true
}
 resource "google_compute_subnetwork" "devops-practice-subnet-02" {
  provider      = "google"
  name          = "devops-practice-subnet-02"
  ip_cidr_range = "172.17.0.0/24"
  private_ip_google_access = "true"
  region        = "us-east1"
  network       = "${google_compute_network.devops-practice-vpc-01.self_link}"

  enable_flow_logs = true
}
resource "google_compute_network" "devops-practice-vpc-01" {
  provider                = "google"
  name                    = "devops-practice-vpc-01"
  auto_create_subnetworks = false
}

provider "google-beta"{
  region = "us-east1"
  zone   = "us-east1-a"
}


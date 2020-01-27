resource "google_compute_instance" "test-vm" {
  name         = "test-terraform-instance"
  
  machine_type = "f1-micro"
  zone = "us-east1-b"
  boot_disk {
    initialize_params {
      image = "centos-7-v20180129"
    }
  }
 network_interface {
   network = "${google_compute_network.test-vpc-01.name}"
   subnetwork  = "${google_compute_subnetwork.test-subnet-02.name}"
   access_config {
     // Include this section to give the VM an external ip address
   }
 }
 metadata = {
   ssh-keys = "test:${file("~/.ssh/id_rsa.pub")}"
 }
}



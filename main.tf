provider "local" {}

resource "local_file" "vpc_simulation" {
  content = <<EOT
  {
    "VPC": {
      "id": "vpc-123456",
      "availability_zones": ["us-east-1a", "us-east-1b"],
      "subnets": {
        "public": [
          {"id": "subnet-public-1", "az": "us-east-1a"},
          {"id": "subnet-public-2", "az": "us-east-1b"}
        ],
        "private": [
          {"id": "subnet-private-1", "az": "us-east-1a"},
          {"id": "subnet-private-2", "az": "us-east-1b"}
        ]
      },
      "security_groups": [
        {"id": "sg-rdp", "permissions": ["RDP"]},
        {"id": "sg-ssh", "permissions": ["SSH"]},
        {"id": "sg-http", "permissions": ["HTTP"]}
      ]
    }
  }
  EOT
  filename = "simulation_output/vpc_simulation.json"
}


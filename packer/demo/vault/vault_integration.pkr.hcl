source "null" "example" {
  communicator = "none"
}

build {
  sources = [
    "source.null.example"
  ]

  provisioner "shell-local" {
    environment_vars = ["subscription_id=${vault("logforwarder/azure/sub", "subscription_id")}"]
    command          = "echo subscription_id  is $subscription_id"
        
  }
  provisioner "shell-local" {
    environment_vars = ["tenant_id=${vault("logforwarder/azure/info", "tenant_id")}"]
    command          = "tenant_id  is $tenant_id"
        
  }
  provisioner "shell-local" {
    environment_vars = ["client_secret=${vault("logforwarder/azure/client", "client_secret")}"]
    command          = "echo client_secret  is $client_secret"
        
  }
  provisioner "shell-local" {
    environment_vars = ["client_id=${vault("logforwarder/azure/id", "client_id")}"]
    command          = "echo client_id  is $client_id"
        
  }
}

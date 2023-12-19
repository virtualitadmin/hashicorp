source "null" "example" {
  communicator = "none"
}

build {
  sources = [
    "source.null.example"
  ]

  provisioner "shell-local" {
    environment_vars = ["subscription_id=${vault("logforwarder/azure/sub", "subscription_id")}"]
    environment_vars = ["tenant_id=${vault("logforwarder/azure/info", "tenant_id")}"]
    environment_vars = ["client_secret=${vault("logforwarder/azure/client", "client_secret")}"]
    environment_vars = ["client_id=${vault("logforwarder/azure/id", "client_id")}"]
    command          = "echo subscription_id  is $subscription_id"
    command          = "echo tenant_id is $tenant_id"
    command          = "echo client_secret is $client_secret"
    command          = "echo client_id is $client_id"
        
  }
}

source "null" "example" {
  communicator = "none"
}

build {
  sources = [
    "source.null.example"
  ]

  provisioner "shell-local" {
    environment_vars = [
      "subscription_id=${vault("logforwarder/azure/sub", "subscription_id")}",
      "tenant_id=${vault("logforwarder/azure/info", "tenant_id")}",
      "client_secret=${vault("logforwarder/azure/client", "client_secret")}",
      "client_id=${vault("logforwarder/azure/id", "client_id")}"

    ]
    inline = [
      "echo \"subscription_id is $subscription_id",
      "echo \"tenant_id is $tenant_id",
      "echo \"client_secret is $client_secret",
      "echo \"client_id is $client_id"
    ]  
}

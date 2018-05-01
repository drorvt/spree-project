job "microservice-02" {
  type = "service"
  datacenters = ["example"]

  group "Microservices" {

    # Number of services we want to deploy
    # of this type
    count = "1"

    task "microservice-02" {
      driver = "docker"

      config {
        # The image we want to use for deployment
        #image = "drorvt/spree-project:latest"
	image = "drorvt/spree:latest"

        # The port exposed from the container
        port_map {
          http = 3000

      }
    }

      # Memory resources for this
      resources {
        memory = 256 # 256MB
        network {
          mbits = "10"
          port "http" {}
        }
      }

      # Act as service
      service {
        name = "microservice-02"
        tags = ["microservice-02", "microservice-example@1.0.0"]
        port = "http"
      }
    }
  }
}

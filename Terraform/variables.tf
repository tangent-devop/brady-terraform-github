variable "resource-group-name" {
  default     = "bdy-tf-resource-group"
  description = "The prefix used for all resources in this example"
}
variable "location" {
  default     = "West Europe"
  description = "The Azure location where all resources in this example should be created"
}
variable "app-service-plan" {
  default     = "brady-tf-app-srv-plan"
  description = "The name of the Web App Plan"
}
variable "app-service-name" {
  default     = "brady-tf-webapp"
  description = "The name of the Web App"
}
variable "api-key" {
  default     = "api-key"
    description = "To access Weather Api"
}

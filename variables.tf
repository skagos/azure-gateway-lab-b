variable "subscription_id" { type = string }
variable "tenant_id" { type = string }
variable "location" {
  type    = string
  default = "denmarkeast"
}
variable "vm_size" {
  type    = string
  default = "Standard_B2as_v2"
}
variable "admin_password" {
  type        = string
  sensitive   = true
  description = "Windows administrator password, supplied via TF_VAR_admin_password."
}

variable "enable_peering" {
  type        = bool
  default     = true
  description = "Enable only after BOTH VNets exist. Set false in both projects for phase 1."
}
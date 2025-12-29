variable "proxmox_api_url" {
  description = "Proxmox API URL"
  type        = string
}

variable "proxmox_user" {
  description = "Proxmox User"
  type        = string
  default     = "terraform@pve"
}

variable "proxmox_password" {
  description = "Proxmox Password"
  type        = string
  sensitive   = true
}

variable "master_count" {
  description = "Number of Control Plane Nodes"
  type        = number
  default     = 1
}

variable "ssh_keys" {
  description = "List of SSH public keys to add to the VM"
  type        = list(string)
  default     = []
}

output "public_ip_address" {
  description = "Public IP of the virtual machine"
  value       = azurerm_public_ip.public_ip.ip_address
}

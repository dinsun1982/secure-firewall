data "template_file" "startup_file_fmc" {
    template = file("${path.module}/fmc_startup_file.txt")
    
}

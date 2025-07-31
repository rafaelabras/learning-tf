provider "github" {
 token = var.github_token
}

resource "github_repository" "prod-repositorio" {
  name        = "prod-repo-tf"
  description = "repositorio para a produção"
  private     = true
}

resource "github_repository" "testing-repositorio" {
  name        = "test-repo-tf"
  description = "repositorio para teste"
  private     = true
}
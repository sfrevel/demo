package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestAKS(t *testing.T) {
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir:    "../env/test",
		TerraformBinary: "/usr/local/bin/terragrunt",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.Apply(t, terraformOptions)

	output := terraform.Output(t, terraformOptions, "resource_name")
	assert.Equal(t, "rg_terratest_project_name", output)
}

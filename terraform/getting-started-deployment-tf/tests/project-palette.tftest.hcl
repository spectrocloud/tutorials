# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0
# Test case 1

variables {
  palette-project = ""
}

run "project_variable" {

  command = plan

  expect_failures = [
    var.palette-project
  ]


}

package main

import (
	engine "github.com/lazarcloud/google-docs-blog-engine"
)

func main() {
	err := engine.RunServer()
	if err != nil {
		panic(err)
	}
}

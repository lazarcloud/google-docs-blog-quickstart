package main

import (
	engine "github.com/lazarcloud/google-docs-blog-engine"
)

func main() {
	// err := godotenv.Load(".env") //only for local development
	// if err != nil {
	// 	panic(err)
	// }
	err := engine.RunServer()
	if err != nil {
		panic(err)
	}
}

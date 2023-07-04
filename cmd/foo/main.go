// main.go
package main

import (
	"fmt"
	"log"
	"runtime/debug"
)

var (
	version = "(devel)"
)

func main() {
	v, ok := debug.ReadBuildInfo()
	if !ok {
		log.Println("not okay")
	} else {
		log.Printf("%+v\n", v)
	}
	fmt.Printf("my app version: %s", version)
}

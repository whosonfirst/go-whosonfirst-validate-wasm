package main

import (
	"fmt"
	"flag"

	"github.com/whosonfirst/go-whosonfirst-validate"
)

func main() {

	flag.Parse()

	for _, raw := range flag.Args() {
		fmt.Println(validate_feature(raw))
	}
}

//export validate_feature
func validate_feature(raw string) string {

	opts := validate.DefaultValidateOptions()	
	err := validate.ValidateWithOptions([]byte(raw), opts)

	if err != nil {
		return err.Error()
	}

	return ""
}

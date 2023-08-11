package main

import (
	"flag"
	"fmt"

	wof_validate "github.com/whosonfirst/go-whosonfirst-validate"
)

func main() {

	flag.Parse()

	opts := wof_validate.DefaultValidateOptions()

	for _, raw := range flag.Args() {
		fmt.Println(validate(opts, raw))
	}
}

//export validate
func validate(opts *wof_validate.Options, raw string) string {

	err := wof_validate.ValidateWithOptions([]byte(raw), opts)

	if err != nil {
		return fmt.Sprintf("Failed to validate data, %v", err)
	}

	return ""
}

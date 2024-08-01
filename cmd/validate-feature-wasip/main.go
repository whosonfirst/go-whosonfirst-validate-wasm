package main

import (
	_ "fmt"
	"io"
	"log"
	"os"

	"github.com/whosonfirst/go-whosonfirst-validate"
)

func main() {

	body, err := io.ReadAll(os.Stdin)

	if err != nil {
		log.Fatalf("Failed to read from STDIN, %v", err)
	}

	err = validate_feature(body)

	if err != nil {
		log.Fatalf("Failed to validate feature, %v", err)
	}

}

//export validate_feature
func validate_feature(raw []byte) error {

	opts := validate.DefaultValidateOptions()
	return validate.ValidateWithOptions(raw, opts)
}

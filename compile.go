package main

import (
	"encoding/json"
	"os"
	"path/filepath"
)

func main() {
	if err := do(); err != nil {
		panic(err)
	}
}

type Item struct {
	Config map[string]any `json:"config"`
	Dir    string         `json:"dir"`
}

func do() error {
	dirs, err := os.ReadDir(".")
	if err != nil {
		return err
	}

	configs := []Item{}
	for _, d := range dirs {
		if !d.IsDir() {
			continue
		}
		if d.Name() == ".git" || d.Name() == ".github" || d.Name() == "dist" {
			continue
		}

		// Read "config.json" from each dir.
		byt, err := os.ReadFile(filepath.Join(d.Name(), "config.json"))
		if err != nil {
			return err
		}

		var config map[string]any
		if err := json.Unmarshal(byt, &config); err != nil {
			return err
		}

		configs = append(configs, Item{
			Dir:    d.Name(),
			Config: config,
		})
	}

	byt, err := json.MarshalIndent(configs, "", "  ")
	if err != nil {
		return err
	}

	os.Mkdir("./dist", 0777)
	return os.WriteFile("./dist/library.json", byt, 0664)
}

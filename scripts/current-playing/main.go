package main

import (
  "fmt"
  "log"
  "io/ioutil"
  "encoding/json"
  "os"
)


func main() {
  if len(os.Args) < 2 {
    log.Fatal("Please provide the username to find the current playing music.")
  }

  jsonUri := fmt.Sprintf("/home/%s/.config/Google Play Music Desktop Player/json_store/playback.json", os.Args[1])

  data, err := ioutil.ReadFile(jsonUri)

  if err != nil {
    log.Fatal(err)
  }

  obj := &struct {
    Playing bool `json:"playing"`
    Song map[string]string `json:"song"`
  }{}

  err = json.Unmarshal([]byte(data), obj)

  if err != nil {
    log.Fatal(err)
  }


  if obj.Playing {
  fmt.Println(fmt.Sprintf("%s - %s", obj.Song["title"], obj.Song["artist"]))
  }
}

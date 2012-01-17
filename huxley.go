// Steve Phillips / elimisteve
// 2011.11.04

package main

import (
	"fmt"
	"io/ioutil"
	// "log"
	"strings"
	"time"
)

// Huxley

// 'As Huxley remarked in Brave New World Revisited, the
// civil libertarians and rationalists who are ever on the alert
// to oppose tyranny "failed to take into account
// man's almost infinite appetite for distractions."'
// --Neil Postman


// reblockDistractingWebsites does so by uncommenting lines in
// /etc/hosts that redirect traffic (e.g., HTTP GET requests) from
// distracting sites to localhost
func reblockDistractingWebsites() {
	const fileName = "/etc/hosts"
	oldContents, err := ioutil.ReadFile(fileName)
    if err != nil {
        fmt.Printf("reblockDistractingWebsites failed: %v\n", err)
    } else {
		hostsFile := string(oldContents)
		// Assumes /etc/hosts contains blocked, time-wasting
		// sites. See `hosts` file in this repo for an example.
		newContents := strings.Replace(hostsFile, "\n#0.0.0.0", "\n0.0.0.0", -1) ////
		err := ioutil.WriteFile(fileName, []byte(newContents), 0644)
		if err != nil {
			fmt.Printf("reblockDistractingWebsites failed: %v\n", err)
		}
		return
	}
}



func main() {
	const delayInMinutes = 20
	for {
		// Launching as goroutine _dangerous_ if other functions modify /etc/hosts
		go reblockDistractingWebsites()

		time.Sleep(delayInMinutes * 1e9)
	}
	
}
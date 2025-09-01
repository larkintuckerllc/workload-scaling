package workload

import (
	"log"
	"net/http"
	"time"
)

func Execute() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		done := make(chan int)
		go func() {
			for {
				select {
				case <-done:
					return
				default:
				}
			}
		}()
		time.Sleep(time.Millisecond * 50)
		close(done)
	})

	log.Fatal(http.ListenAndServe(":8080", nil))
}

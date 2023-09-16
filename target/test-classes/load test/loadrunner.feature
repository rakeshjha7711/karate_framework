#!/bin/bash

# Number of concurrent threads
threads = 10

# Loop to run Karate tests concurrently
for ((i = 1; i <= $threads; i++)); do
  karate - t load - test.feature - e env = dev - n
done

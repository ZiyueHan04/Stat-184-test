CollatzStoppingTime <- function(n) {
  stopping_time <- 0
  while (n > 1) {
    if (n %% 2 == 0) {
      n <- n / 2
    } else {
      n <- 3 * n + 1
    }
    stopping_time <- stopping_time + 1
  }
  
  return(stopping_time)
}

ComputeStoppingTimes <- function(limit = 10000) {
  stopping_times <- numeric(limit) 
  
  for (i in 1:limit) {
    stopping_times[i] <- CollatzStoppingTime(i)
  }
  
  return(stopping_times)
}

stopping_times <- ComputeStoppingTimes()


hist(stopping_times, breaks = 50, col = "blue",
     main = "Distribution of Stopping Times for the First 10,000 Integers",
     xlab = "Stopping Time", ylab = "Frequency")

# Compute stopping times for the specified numbers
CollatzStoppingTime(18)    # Stopping time for 18
CollatzStoppingTime(408)   # Stopping time for 408
CollatzStoppingTime(307)   # Stopping time for 307
CollatzStoppingTime(61)    # Stopping time for 61
CollatzStoppingTime(2633)  # Stopping time for 2633

CollatzStoppingTimeVec <- Vectorize(CollatzStoppingTime)

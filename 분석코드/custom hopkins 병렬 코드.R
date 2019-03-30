

custom_get_clust_tendency=function (data, n , seed = 123) 
{
  set.seed(seed)
  if (is.data.frame(data)) 
    data <- as.matrix(data)
  if (!(is.matrix(data))) 
    stop("data must be data.frame or matrix")
  if (n >= nrow(data)) 
    stop("n must be no larger than num of samples")

  data <- na.omit(data)
  rownames(data) <- paste0("r", 1:nrow(data))
  
  p <- apply(data, 2, function(x, n) {
    runif(n, min(x), max(x))
  }, n)
  k <- round(runif(n, 1, nrow(data)))
  q <- as.matrix(data[k, ])
  distp = rep(0, nrow(data))
  distq = 0
  minp = NULL
  minq = NULL
  
  library(parallel)
  library(foreach)
  library(doParallel)
  
  no_cores = detectCores()-1
  myCluster <- makeCluster(no_cores)
  doParallel::registerDoParallel(myCluster)
  
  hopkin = foreach (i = 1:n,.combine='rbind') %dopar% {
    
    distp[1] <- stats::dist(rbind(p[i, ], data[1, ]))
    minqi <- stats::dist(rbind(q[i, ], data[1, ]))
    for (j in 2:nrow(data)) {
      
      distp[j] <- stats::dist(rbind(p[i, ], data[j, ]))
      error <- q[i, ] - data[j, ]
      if (sum(abs(error)) != 0) {
        distq <- stats::dist(rbind(q[i, ], data[j, ]))
        if (distq < minqi) 
          minqi <- distq
      }
    }
    c(minp=min(distp),minq=minqi)
  }
  stopImplicitCluster()
  
  list(hopkins_stat = sum(hopkin[,2])/(sum(hopkin[,1]) + sum(hopkin[,2])))
}

aaaa=custom_get_clust_tendency(scale(iris[,-5]),n=nrow(iris)-1)
aaaa$hopkins_stat

results

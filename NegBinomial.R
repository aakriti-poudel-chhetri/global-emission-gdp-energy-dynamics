library(MASS)

# Set parameters
set.seed(123)
n <- 500
x <- runif(n, min = 1, max = 10)
beta0 <- 0.5
beta1 <- 1
r <- 2 # this is dispersion

# Calculate the mean
mu <- exp(beta0 + beta1*x)

# Simulate the dependent variable 'y' using the calculated mean and dispersion
y <- rnbinom(n = n, mu = mu, size = r)

# Create a data frame
my_data <- data.frame(x, y)

# To verify, fit a negative binomial model to the simulated data
model <- glm.nb(y ~ x, data = my_data)

summary(model)


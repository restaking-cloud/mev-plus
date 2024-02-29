# Using the official Golang 1.20 image as the base image
FROM golang:1.20

# the working directory inside the container
WORKDIR /app

# Copy the entire MEV Plus project to the container
COPY . .

# Download all dependencies. 
# If the go.mod and the go.sum file are not changed, then the docker build cache 
# will not re-run this step, thereby saving time
RUN go mod download

# Build the binary
RUN go build -o mevPlus mevPlus.go

# Expose the K2 server
EXPOSE 10000

# Launch MEV Plus from the entry point
ENTRYPOINT [ "./entrypoint.sh" ]

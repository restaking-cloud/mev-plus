# Using the official Golang 1.20 image as the base image
FROM golang:1.20

# the working directory inside the container
WORKDIR /app

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download all dependencies. 
# If the go.mod and the go.sum file are not changed, then the docker build cache 
# will not re-run this step, thereby saving time
RUN go mod download

# Copy the entire MEV Plus project to the container
COPY . .

RUN go build -o mevPlus mevPlus.go

EXPOSE 10000

ENTRYPOINT [ "./entrypoint.sh" ]

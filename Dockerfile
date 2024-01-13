FROM node:18-alpine

WORKDIR /app

COPY package.json ./

RUN npm install

COPY . .

RUN npm run build

COPY .next ./.next

CMD ["npm", "run", "dev"]


#####command

# build command
# docker build -t test-nextjs .


### for production
# Use a smaller base image for production
# Build Stage
# Build Stage
# FROM node:18-alpine as builder

# WORKDIR /app

# COPY package.json package-lock.json ./

# Install all dependencies, including development dependencies
# RUN npm install

# COPY . .

# # Build the application
# RUN npm run build && \
#     npm prune --production && \
#     rm -rf .next/cache

# # Runtime Stage
# FROM node:18-alpine

# WORKDIR /app

# COPY --from=builder /app/package.json /app/package-lock.json ./
# COPY --from=builder /app/.next /app/.next
# COPY --from=builder /app/public /app/public
# COPY --from=builder /app/node_modules /app/node_modules

# # Install only production dependencies
# RUN apk --no-cache add nodejs npm

# CMD ["npm", "run", "start"]

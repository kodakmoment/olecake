# ---- Base ----
FROM alpine:latest AS base
RUN apk add --no-cache nodejs npm tini
WORKDIR /app
ENTRYPOINT ["/sbin/tini", "--"]
COPY package.json .

# ---- Dependencies ----
FROM base AS dependencies
RUN npm set progress=false && npm config set depth 0
RUN npm install --only=production 
RUN cp -R node_modules prod_node_modules
RUN npm install

# ---- Release ----
FROM base AS release
COPY --from=dependencies /app/prod_node_modules ./node_modules
COPY . .
EXPOSE 3000
CMD npm run start
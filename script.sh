#! /bin/bash
#cat << EOF > myrelease/values.yaml
#
## Default values for myrelease.
## This is a YAML-formatted file.
## Declare variables to be passed into your templates.
#replicaCount: 1
#image:
#  repository: ${image_name}
#  pullPolicy: IfNotPresent
#  # Overrides the image tag whose default is the chart appVersion.
#  tag: ${image_tag}
#
#
#imagePullSecrets: []
#nameOverride: ""
#fullnameOverride: ""
#
#serviceAccount:
#  # Specifies whether a service account should be created
#  create: true
#  # Automatically mount a ServiceAccount's API credentials?
#  automount: true
#  # Annotations to add to the service account
#  annotations: {}
#  # The name of the service account to use.
#  # If not set and create is true, a name is generated using the fullname template
#  name: ""
#
#podAnnotations: {}
#podLabels: {}
#
#podSecurityContext: {}
#  # fsGroup: 2000
#
#securityContext: {}
#  # capabilities:
#  #   drop:
#  #   - ALL
#  # readOnlyRootFilesystem: true
#  # runAsNonRoot: true
#  # runAsUser: 1000
#
#service:
#  type: ClusterIP
#  port: 80
#
#ingress:
#  enabled: false
#  className: ""
#  annotations: {}
#    # kubernetes.io/ingress.class: nginx
#    # kubernetes.io/tls-acme: "true"
#  hosts:
#    - host: chart-example.local
#      paths:
#        - path: /
#          pathType: ImplementationSpecific
#  tls: []
#  #  - secretName: chart-example-tls
#  #    hosts:
#  #      - chart-example.local
#
#resources: {}
#  # We usually recommend not to specify default resources and to leave this as a conscious
#  # choice for the user. This also increases chances charts run on environments with little
#  # resources, such as Minikube. If you do want to specify resources, uncomment the following
#  # lines, adjust them as necessary, and remove the curly braces after 'resources:'.
#  # limits:
#  #   cpu: 100m
#  #   memory: 128Mi
#  # requests:
#  #   cpu: 100m
#  #   memory: 128Mi
#
#livenessProbe:
#  httpGet:
#    path: /
#    port: http
#readinessProbe:
#  httpGet:
#    path: /
#    port: http
#
#autoscaling:
#  enabled: false
#  minReplicas: 1
#  maxReplicas: 100
#  targetCPUUtilizationPercentage: 80
#  # targetMemoryUtilizationPercentage: 80
#
## Additional volumes on the output Deployment definition.
#volumes: []
## - name: foo
##   secret:
##     secretName: mysecret
##     optional: false
#
## Additional volumeMounts on the output Deployment definition.
#volumeMounts: []
## - name: foo
##   mountPath: "/etc/foo"
##   readOnly: true
#
#nodeSelector: {}
#
#tolerations: []
#
#affinity: {}
#
#EOF

#!/bin/bash

# Set variables
REPO="7002370412/tumlog"
DOCKER_REGISTRY="https://registry.hub.docker.com"

VALUES_FILE="mychart/values.yaml"
# Fetch the latest tag from Docker Hub (this is a simplified example; Docker Hub API may require authentication or have different endpoints)
LATEST_TAG=$(curl -s "$DOCKER_REGISTRY/v2/repositories/$REPO/tags?page_size=100" | jq -r '.results[] | .name' | sort -V | tail -n 1)

ls -lha 
echo "Latest Tag: $LATEST_TAG"
# Update the tag in the values.yaml file
sed -i '' "s/tag:.*/tag: \"$LATEST_TAG\"/" mychart/values.yaml

#cat $VALUES_FILE


APISERVER=${APISERVER:-https://kubernetes.default.svc}

# Path to ServiceAccount token
SERVICEACCOUNT=/var/run/secrets/kubernetes.io/serviceaccount

if [ -z ${TOKEN} ]; then
  NAMESPACE=$(cat ${SERVICEACCOUNT}/namespace)
  TOKEN=$(cat ${SERVICEACCOUNT}/token)
  CACERT=${SERVICEACCOUNT}/ca.crt
fi

#curl --cacert ${CACERT} --header "Authorization: Bearer ${TOKEN}" -X GET ${APISERVER}/api
curl -v --insecure --header "Authorization: Bearer ${TOKEN}" -X GET ${APISERVER}/api


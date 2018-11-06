com=$( minishift  openshift registry )

prj=$( oc project -q  )

if [[ -z $prj ]] ; then
    echo "error no login "
    exit 2
fi

docker pull centos:7
docker login -u ichiro -p $(oc whoami -t)  $com
docker tag docker.io/centos:7 $com/$prj/centos7:latest
docker push $com/$prj/centos7:latest


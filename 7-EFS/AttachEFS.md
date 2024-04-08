

sudo yum install -y nfs-utils
mkdir efs

sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-04c18d3fce22da366.efs.us-west-2.amazonaws.com:/ efs

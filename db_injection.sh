Script Variables
USER_PASS=12345678
EMAIL=musashi.ph

# Create the projects and project administrators
for (( i = 0; i <= 500; i++ ))
do
  # Create the project or tenant
  keystone tenant-create --name=proj${i} --description="test"

  # Create the PA user
  keystone user-create --name=pa${i} --pass=$USER_PASS --email=qa_musashi+pa${i}@$EMAIL

  # Link the PA user, project and role
  keystone user-role-add --name=pa${i} --tenant=proj${i} --role=project_admin
done

# Create the project members for proj0
for (( i = 1; i <= 500; i++ ))
do

  # Create the PM user
  keystone user-create --name=pm${i} --pass=$USER_PASS --email=qa_musashi+pm${i}@EMAIL

  # Link the PM user, project and role
  keystone user-role-add --name=pm${i} --tenant=proj0 -- role=_member_
done

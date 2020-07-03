.PHONY:

doc:
	echo "See Makefile"

init:
	terraform init

inventory:
	terraform apply -auto-approve -target=local_file.ansible_inventory -target=local_file.connect_sh
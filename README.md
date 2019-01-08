#ansible-role-portainer
=======================
Portainer - the coolest UI for Docker http://portainer.io/

This role installs Portainer using Docker container

## Tasks in Role
- Ensure docker-py is present using pip
- Remove existing container [if ```remove_existing_container: true```]
- Remove persistent data [if ```remove_persistent_data: true```]
- Deploy Portainer container to host [define persistent_data_path]
- Configure Admin user password
- Generate authentication token
- Define endpoints [DICT | list]
- Configure Portainer settings [Jinja2 template]
- Configure registry [Jinja2 template]

## Requirements

- `curl`

## Role Vars
name | description | default |
-----|-------------|---------|
| configure_settings  | override default portainer settings with template  | false |
| configure_registry | configure a docker registry for Portainer to use   | false |
| remove_persistent_data | remove the persistent data directory on the host | false |
| remove_existing_container | remove an existing container named 'portainer' | false |
| persistent_data_path | path that will be used to store persistent data | /opt/portainer:/data |
| auth_method | use LDAP or standalone [2 for ldap, 1 for standalone] | | 1 |
| version | portainer version to use | at the time of commiting 'develop' is the version that supports LDAP | latest |
*See main.yml under 'defaults' for a complete list*

# Running the role
```
ansible-playbook -i myinventory ./playbooks/deploy-portainer.yml
```
## Playbook example
```
---

- hosts: myhosts
  become: true
  vars_files:
    - vars/portainer.yml
  roles:
   - portainer
```

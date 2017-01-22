ansible-role-portainer
================

Ansible role for installing Portainer - the coolest UI for Docker http://portainer.io/

The role:
- Runs Portainer docker container
- Set Admin password
- Predefine endpoints according to your swarm nodes if running in the cluster mode.

The role should run on the swarm manager.

Example:
```
ansible-playbook -i hosts test.yml -e "mode=cluster portainer_admin_pass=<your pass>"

```

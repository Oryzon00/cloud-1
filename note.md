# Ansible Commands

```bash
ansible myhosts -i inventory.yaml
```

```bash
# module
-m reboot
-m ping
```

```bash
ansible-inventory -i inventory.yaml
# options
--yaml
--graph
--list
```

```bash
ansible-playbook -i inventory.yaml playbook.yaml
--tags
```

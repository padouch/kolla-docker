## Build docker container
``` bash
docker build . --tag cokoli/kolla-ansible:12.0.0
```

## Oxus
``` bash
 docker run -d --name codenow-openstack-kolla-wallaby -ti -v /Users/padouch/stratox/git/codenow-openstack-inv/kolla:/etc/kolla -v /Users/padouch/stratox/git/codenow-openstack-inv/inventory:/root/inventory -v /Users/padouch/stratox/git/codenow-openstack-inv/ssh:/root/.ssh  cokoli/kolla-ansible:12.0.0 bash
```

## RUN kolla
### Prereq
1. apt install python
2. kolla-ansible -i ./inventory/multinode -e 'ansible_become=true' -e 'ansible_become_method=sudo' -e 'ansible_become_user=root' bootstrap-servers
3. kolla-ansible -i ./inventory/multinode -e 'ansible_become=true' -e 'ansible_become_method=sudo' -e 'ansible_become_user=root' pull

### Install 
```bash
kolla-ansible -i ./inventory/multinode -e 'ansible_become=true' -e 'ansible_become_method=sudo' -e 'ansible_become_user=root' deploy
```
## Errors
### Python3 vs Python2 issue
```
An exception occurred during task execution. To see the full traceback, use -vvv. The error was: ImportError: No module named pkg_resources
fatal: [10.94.0.11]: FAILED! => {"changed": false, "msg": "Failed to import the required Python library (setuptools) on super1's Python /usr/bin/python. Please read module documentation and install in the appropriate location. If the required library is installed, but Ansible is using the wrong Python interpreter, please consult the documentation on ansible_python_interpreter"}
```
FIX
```
apt install python-pip
```

### missing docker in python
```
An exception occurred during task execution. To see the full traceback, use -vvv. The error was: ImportError: No module named docker
fatal: [10.94.0.13]: FAILED! => {"changed": false, "module_stderr": "Shared connection to 10.94.0.13 closed.\r\n", "module_stdout": "Traceback (most recent call last):\r\n  File \"/oxus/.ansible/tmp/ansible-tmp-1595266226.6146998-5062-135618464726329/AnsiballZ_kolla_docker.py\", line 102, in <module>\r\n    _ansiballz_main()\r\n  File \"/oxus/.ansible/tmp/ansible-tmp-1595266226.6146998-5062-135618464726329/AnsiballZ_kolla_docker.py\", line 94, in _ansiballz_main\r\n    invoke_module(zipped_mod, temp_path, ANSIBALLZ_PARAMS)\r\n  File \"/oxus/.ansible/tmp/ansible-tmp-1595266226.6146998-5062-135618464726329/AnsiballZ_kolla_docker.py\", line 40, in invoke_module\r\n    runpy.run_module(mod_name='ansible.modules.kolla_docker', init_globals=None, run_name='__main__', alter_sys=True)\r\n  File \"/usr/lib/python2.7/runpy.py\", line 188, in run_module\r\n    fname, loader, pkg_name)\r\n  File \"/usr/lib/python2.7/runpy.py\", line 82, in _run_module_code\r\n    mod_name, mod_fname, mod_loader, pkg_name)\r\n  File \"/usr/lib/python2.7/runpy.py\", line 72, in _run_code\r\n    exec code in run_globals\r\n  File \"/tmp/ansible_kolla_docker_payload_7Se1yL/ansible_kolla_docker_payload.zip/ansible/modules/kolla_docker.py\", line 28, in <module>\r\nImportError: No module named docker\r\n", "msg": "MODULE FAILURE\nSee stdout/stderr for the exact error", "rc": 1}
```
FIX
```
pip install docker
```


mkdir -p /Users/padouch/stratox/git/oxus-openstack-inv/kolla
mkdir -p /Users/padouch/stratox/git/oxus-openstack-inv/ssh
mkdir -p /Users/padouch/stratox/git/oxus-openstack-inv/inventory

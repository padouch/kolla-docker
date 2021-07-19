FROM ubuntu:bionic
RUN apt update && \
    apt install -y python3-dev libffi-dev gcc libssl-dev python3-pip git sshpass vim && \
    apt autoremove && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    pip3 install --upgrade pip && \
    mkdir git && \
    cd git && \
    git clone https://github.com/openstack/kolla-ansible.git -b 12.0.0 && \
    pip3 install -r kolla-ansible/requirements.txt && \
#    pip3 install kolla-ansible==12.0.0 && \
    pip3 install ansible==2.10 && \
    pip3 install python-openstackclient && \
    pip3 install python-novaclient && \
    pip3 install python-neutronclient && \
    pip3 install python-cinderclient && \
    pip3 install python-designateclient && \
    mkdir /etc/ansible/ && \
    mkdir -p /root/inventory && \ 
    mkdir -p /etc/kolla

COPY ./ansible.cfg /etc/ansible/ansible.cfg

CMD ["kolla-ansible"]

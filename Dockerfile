FROM ubuntu:bionic
RUN apt update && \
    apt install -y python3-dev libffi-dev gcc libssl-dev python3-pip git ansible vim && \
    pip3 install kolla-ansible==10.1.0 && \
    pip3 install ansible && \
    pip3 install python-openstackclient && \
    pip3 install python-novaclient && \
    pip3 install python-neutronclient && \
    pip3 install python-cinderclient && \
    pip3 install python-designateclient && \
    rm /etc/ansible/ansible.cfg && \
    mkdir -p /root/inventory && \ 
    mkdir -p /etc/kolla

COPY ./ansible.cfg /etc/ansible/ansible.cfg

CMD ["kolla-ansible"]
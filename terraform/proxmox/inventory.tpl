all:
  hosts:
    {% for host in hosts %}
    {{ host.name }}:
      ansible_host: {{ host.ip }}
      ip: {{ host.ip }}
      access_ip: {{ host.access_ip }}
    {% endfor %}
  children:
    kube_control_plane:
      hosts:
        {% for host in control_plane_hosts %}
        {{ host }}:
        {% endfor %}
    kube_node:
      hosts:
        {% for host in node_hosts %}
        {{ host }}:
        {% endfor %}
    etcd:
      hosts:
        {% for host in etcd_hosts %}
        {{ host }}:
        {% endfor %}
    k8s_cluster:
      children:
        kube_control_plane:
        kube_node:
    calico_rr:
      hosts: {}
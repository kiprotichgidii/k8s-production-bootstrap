all:
  hosts:
%{ for name in vm_names ~}
    ${name}:
      ansible_host: ${vm_ips[name]}
      ip: ${vm_ips[name]}
      access_ip: ${vm_ips[name]}
%{ endfor ~}
  children:
    kube_control_plane:
      hosts:
%{ for name in masters ~}
        ${name}:
%{ endfor ~}
    kube_node:
      hosts:
%{ for name in workers ~}
        ${name}:
%{ endfor ~}
    etcd:
      hosts:
%{ for name in masters ~}
        ${name}:
%{ endfor ~}
    k8s_cluster:
      children:
        kube_control_plane:
        kube_node:
    calico_rr:
      hosts: {}
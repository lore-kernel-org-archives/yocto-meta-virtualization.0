Return-Path: <yocto@optimcloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D89C433F5
	for <webhook@archiver.kernel.org>; Sat, 28 May 2022 02:32:33 +0000 (UTC)
Received: from mail.optimvoice.io (mail.optimvoice.io [46.23.82.139])
 by mx.groups.io with SMTP id smtpd.web09.11388.1653705144548846424
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 27 May 2022 19:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@optimcloud.com header.s=dkim
 header.b=dBPoqDDT;
 spf=none, err=permanent DNS error (domain: optimcloud.com, ip: 46.23.82.139,
 mailfrom: yocto@optimcloud.com)
Received: from authenticated-user (mail.optimvoice.io [46.23.82.139])
	by mail.optimvoice.io (Postfix) with ESMTPA id C314010800091
	for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 28 May 2022 02:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=optimcloud.com;
	s=dkim; t=1653705136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TInAJZ0D+WxnuFzaWNmZPzR/CsRyLp2rmvEd8nJCuCM=;
	b=dBPoqDDTylh7ZyIC9p6ywrUBSxcIuML2n20bHuyFNXs7uYzS43DonRz60MpqFTw7ja6mYi
	aRS6XTpTGZyb+PrCRysVXulY6+u/x+1i5r1E58djn+rDY992Q8Ry2C3bQC6rcfzFjbUnYf
	9Pvm7aTVHxjD4+OV3OmpXw27aKl9jSSU1fEbkxvTX7tyfinoiI8xBWdwDy/ZYaj+seSgFg
	wDqq1cbXe5cU70kN+jG2seRicTd1FSXGw8TdJ/1RWhoXyG0yGBrn7xH0Bu+Y2dpoU3Ajl1
	Eq6zhvHbQRju5m0IT0+eQgMalHDGGWy6ianHIdXzhR7lwG52dHkfmqf30Ez6PQ==
Content-Type: text/plain; charset=utf-8; format=flowed
Message-Id: <1653704757498.3591515068.3658663655@optimcloud.com>
From: Embedded Devel <yocto@optimcloud.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: kubernetes k8s failure
Date: Sat, 28 May 2022 02:32:12 +0000
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-Spamd-Bar: /
Authentication-Results: mail.optimvoice.io;
	auth=pass smtp.auth=yocto@optimcloud.com smtp.mailfrom=yocto@optimcloud.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 28 May 2022 02:32:33 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7326

so ive built yocto with kubernetes k8s flavor, image created and booted, 
ive done this before with overc which back then worked fine, yet  vanilla 
yocto master seems to have issue


swapoff -a

k8sinit

root@node-1:~# swapoff -a
root@node-1:~# k8s-init 
/bin/k8s-init: line 11: /etc/sysconfig/iptables: No such file or directory
I0528 02:21:13.465437     479 version.go:255] remote version is much newer: 
v1.24.1; falling back to: stable-1.23
[init] Using Kubernetes version: v1.23.7
[preflight] Running pre-flight checks
	[WARNING SystemVerification]: missing optional cgroups: hugetlb
[preflight] Pulling images required for setting up a Kubernetes cluster
[preflight] This might take a minute or two, depending on the speed of your 
internet connection
[preflight] You can also perform this action in beforehand using 'kubeadm 
config images pull'
[certs] Using certificateDir folder "/etc/kubernetes/pki"
[certs] Generating "ca" certificate and key
[certs] Generating "apiserver" certificate and key
[certs] apiserver serving cert is signed for DNS names [kubernetes 
kubernetes.default kubernetes.default.svc 
kubernetes.default.svc.cluster.local node-1] and IPs [10.96.0.1 
192.168.0.189]
[certs] Generating "apiserver-kubelet-client" certificate and key
[certs] Generating "front-proxy-ca" certificate and key
[certs] Generating "front-proxy-client" certificate and key
[certs] Generating "etcd/ca" certificate and key
[certs] Generating "etcd/server" certificate and key
[certs] etcd/server serving cert is signed for DNS names [localhost node-1] 
and IPs [192.168.0.189 127.0.0.1 ::1]
[certs] Generating "etcd/peer" certificate and key
[certs] etcd/peer serving cert is signed for DNS names [localhost node-1] 
and IPs [192.168.0.189 127.0.0.1 ::1]
[certs] Generating "etcd/healthcheck-client" certificate and key
[certs] Generating "apiserver-etcd-client" certificate and key
[certs] Generating "sa" key and public key
[kubeconfig] Using kubeconfig folder "/etc/kubernetes"
[kubeconfig] Writing "admin.conf" kubeconfig file
[kubeconfig] Writing "kubelet.conf" kubeconfig file
[kubeconfig] Writing "controller-manager.conf" kubeconfig file
[kubeconfig] Writing "scheduler.conf" kubeconfig file
[kubelet-start] Writing kubelet environment file with flags to file 
"/var/lib/kubelet/kubeadm-flags.env"
[kubelet-start] Writing kubelet configuration to file 
"/var/lib/kubelet/config.yaml"
[kubelet-start] Starting the kubelet
[control-plane] Using manifest folder "/etc/kubernetes/manifests"
[control-plane] Creating static Pod manifest for "kube-apiserver"
[control-plane] Creating static Pod manifest for "kube-controller-manager"
[control-plane] Creating static Pod manifest for "kube-scheduler"
[etcd] Creating static Pod manifest for local etcd in 
"/etc/kubernetes/manifests"
[wait-control-plane] Waiting for the kubelet to boot up the control plane 
as static Pods from directory "/etc/kubernetes/manifests". This can take up 
to 4m0s
[kubelet-check] Initial timeout of 40s passed.

	Unfortunately, an error has occurred:
		timed out waiting for the condition

	This error is likely caused by:
		- The kubelet is not running
		- The kubelet is unhealthy due to a misconfiguration of the node in some 
way (required cgroups disabled)

	If you are on a systemd-powered system, you can try to troubleshoot the 
error with the following commands:
		- 'systemctl status kubelet'
		- 'journalctl -xeu kubelet'

	Additionally, a control plane component may have crashed or exited when 
started by the container runtime.
	To troubleshoot, list all containers using your preferred container 
runtimes CLI.

	Here is one example how you may list all Kubernetes containers running in 
cri-o/containerd using crictl:
		- 'crictl --runtime-endpoint /run/containerd/containerd.sock ps -a | grep 
kube | grep -v pause'
		Once you have found the failing container, you can inspect its logs with:
		- 'crictl --runtime-endpoint /run/containerd/containerd.sock logs 
CONTAINERID'

error execution phase wait-control-plane: couldn't initialize a Kubernetes 
cluster
To see the stack trace of this error execute with --v=5 or higher


journalctl says
May 28 02:22:50 node-1 kubelet[825]: E0528 02:22:50.457191     825 
remote_runtime.go:448] "StartContainer from runtime service failed" 
err="rpc error: code = Unknown desc = failed to create containerd task: 
failed to create shim task: OCI runtime create failed: runc create failed: 
unable to start container process: error during container init: error 
setting cgroup config for procHooks process: openat2 
/sys/fs/cgroup/cpu,cpuacct/system.slice/containerd.service/kubepods-burstable-pod2f35c35e9fe662a834b6d53268894e8a.slice:cri-containerd:a87e4c5256ef0c61cd2ccc453580936d6cc6f10c9febec5ddf190fd40753c148/cpu.cfs_period_us: 
no such file or directory: unknown" 
containerID="a87e4c5256ef0c61cd2ccc453580936d6cc6f10c9febec5ddf190fd40753c148"

May 28 02:22:50 node-1 kubelet[825]: E0528 02:22:50.457462     825 
kuberuntime_manager.go:919] container 
&Container{Name:etcd,Image:k8s.gcr.io/etcd:3.5.1-0,Command:[etcd 
--advertise-client-urls=https://192.168.0.189:2379 
--cert-file=/etc/kubernetes/pki/etcd/server.crt --client-cert-auth=true 
--data-dir=/var/lib/etcd 
--initial-advertise-peer-urls=https://192.168.0.189:2380 
--initial-cluster=node-1=https://192.168.0.189:2380 
--key-file=/etc/kubernetes/pki/etcd/server.key 
--listen-client-urls=https://127.0.0.1:2379,https://192.168.0.189:2379 
--listen-metrics-urls=http://127.0.0.1:2381 
--listen-peer-urls=https://192.168.0.189:2380 --name=node-1 
--peer-cert-file=/etc/kubernetes/pki/etcd/peer.crt 
--peer-client-cert-auth=true 
--peer-key-file=/etc/kubernetes/pki/etcd/peer.key 
--peer-trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt 
--snapshot-count=10000 
--trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt],Args:[],WorkingDir:,Ports:[]ContainerPort{},Env:[]EnvVar{},Resources:ResourceRequirements{Limits:ResourceList{},Requests:ResourceList{cpu: 
{{100 -3} {<nil>} 100m DecimalSI},memory: {{104857600 0} {<nil>} 100Mi 
BinarySI},},},VolumeMounts:[]VolumeMount{VolumeMount{Name:etcd-data,ReadOnly:false,MountPath:/var/lib/etcd,SubPath:,MountPropagation:nil,SubPathExpr:,},VolumeMount{Name:etcd-certs,ReadOnly:false,MountPath:/etc/kubernetes/pki/etcd,SubPath:,MountPropagation:nil,SubPathExpr:,},},LivenessProbe:&Probe{ProbeHandler:ProbeHandler{Exec:nil,HTTPGet:&HTTPGetAction{Path:/health,Port:{0 
2381 
},Host:127.0.0.1,Scheme:HTTP,HTTPHeaders:[]HTTPHeader{},},TCPSocket:nil,GRPC:nil,},InitialDelaySeconds:10,TimeoutSeconds:15,PeriodSeconds:10,SuccessThreshold:1,FailureThreshold:8,TerminationGracePeriodSeconds:nil,},ReadinessProbe:nil,Lifecycle:nil,TerminationMessagePath:/dev/termination-log,ImagePullPolicy:IfNotPresent,SecurityContext:nil,Stdin:false,StdinOnce:false,TTY:false,EnvFrom:[]EnvFromSource{},TerminationMessagePolicy:File,VolumeDevices:[]VolumeDevice{},StartupProbe:&Probe{ProbeHandler:ProbeHandler{Exec:nil,HTTPGet:&HTTPGetAction{Path:/health,Port:{0 
2381 
},Host:127.0.0.1,Scheme:HTTP,HTTPHeaders:[]HTTPHeader{},},TCPSocket:nil,GRPC:nil,},InitialDelaySeconds:10,TimeoutSeconds:15,PeriodSeconds:10,SuccessThreshold:1,FailureThreshold:24,TerminationGracePeriodSeconds:nil,},} 
start failed in pod 
etcd-node-1_kube-system(2f35c35e9fe662a834b6d53268894e8a): 
RunContainerError: failed to create containerd task: failed to create shim 
task: OCI runtime create failed: runc create failed: unable to start 
container process: error during container init: error setting cgroup config 
for procHooks process: openat2 
/sys/fs/cgroup/cpu,cpuacct/system.slice/containerd.service/kubepods-burstable-pod2f35c35e9fe662a834b6d53268894e8a.slice:cri-containerd:a87e4c5256ef0c61cd2ccc453580936d6cc6f10c9febec5ddf190fd40753c148/cpu.cfs_period_us: 
no such file or directory: unknown
May 28 02:22:50 node-1 kubelet[825]: E0528 02:22:50.457564     825 
pod_workers.go:951] "Error syncing pod, skipping" err="failed to 
\"StartContainer\" for \"etcd\" with RunContainerError: \"failed to create 
containerd task: failed to create shim task: OCI runtime create failed: 
runc create failed: unable to start container process: error during 
container init: error setting cgroup config for procHooks process: openat2 
/sys/fs/cgroup/cpu,cpuacct/system.slice/containerd.service/kubepods-burstable-pod2f35c35e9fe662a834b6d53268894e8a.slice:cri-containerd:a87e4c5256ef0c61cd2ccc453580936d6cc6f10c9febec5ddf190fd40753c148/cpu.cfs_period_us: 
no such file or directory: unknown\"" pod="kube-system/etcd-node-1" 
podUID=2f35c35e9fe662a834b6d53268894e8a
May 28 02:22:50 node-1 containerd[350]: 
time="2022-05-28T02:22:50.469596452Z" level=error msg="StartContainer for 
\"d5f0203e814a4d14c24c17a2c2b3982b43e7427ab135b0c98956ee638c82aeaf\" 
failed" error="failed to create containerd task: failed to create shim 
task: OCI runtime create failed: runc create failed: unable to start 
container process: error during container init: error setting cgroup config 
for procHooks process: openat2 
/sys/fs/cgroup/cpu,cpuacct/system.slice/containerd.service/kubepods-burstable-pod90c43fd55dbe3c307fa34d50b43224e6.slice:cri-containerd:d5f0203e814a4d14c24c17a2c2b3982b43e7427ab135b0c98956ee638c82aeaf/cpu.cfs_period_us: 
no such file or directory: unknown"
May 28 02:22:50 node-1 containerd[350]: 
time="2022-05-28T02:22:50.469657943Z" level=error msg="StartContainer for 
\"70b9504b4733741c4274884ad69f702818e071ecd6e62dca81382a68ca64c1b1\" 
failed" error="failed to create containerd task: failed to create shim 
task: OCI runtime create failed: runc create failed: unable to start 
container process: error during container init: error setting cgroup config 
for procHooks process: openat2 
/sys/fs/cgroup/cpu,cpuacct/system.slice/containerd.service/kubepods-burstable-pod4339400940323fa9543500bd60488683.slice:cri-containerd:70b9504b4733741c4274884ad69f702818e071ecd6e62dca81382a68ca64c1b1/cpu.cfs_period_us: 
no such file or directory: unknown"
May 28 02:22:50 node-1 containerd[350]: 
time="2022-05-28T02:22:50.469702603Z" level=error msg="StartContainer for 
\"038b05d9f6f77c2c705da5f66f417b84697f0b66642f7d9b90693877e36c9b83\" 
failed" error="failed to create containerd task: failed to create shim 
task: OCI runtime create failed: runc create failed: unable to start 
container process: error during container init: error setting cgroup config 
for procHooks process: openat2 
/sys/fs/cgroup/cpu,cpuacct/system.slice/containerd.service/kubepods-burstable-podd94f28892ce55932f3909341450b4129.slice:cri-containerd:038b05d9f6f77c2c705da5f66f417b84697f0b66642f7d9b90693877e36c9b83/cpu.cfs_period_us: 
no such file or directory: unknown"

root@node-1:~# crictl --runtime-endpoint /run/containerd/containerd.sock ps 
-a
I0528 02:30:50.674997    2376 util_unix.go:104] "Using this endpoint is 
deprecated, please consider using full URL format" 
endpoint="/run/containerd/containerd.sock" 
URL="unix:///run/containerd/containerd.sock"
I0528 02:30:50.675769    2376 util_unix.go:104] "Using this endpoint is 
deprecated, please consider using full URL format" 
endpoint="/run/containerd/containerd.sock" 
URL="unix:///run/containerd/containerd.sock"
CONTAINER           IMAGE               CREATED             STATE           
    NAME                      ATTEMPT             POD ID              POD
027a394f5bc72       ed0ccfa052ab4       2 minutes ago       Exited          
    kube-scheduler            6                   f3d96a4b9301d       
kube-scheduler-node-1
4516ebb79f90e       03c169f383d97       2 minutes ago       Exited          
    kube-apiserver            6                   8937c47e4a03d       
kube-apiserver-node-1
0d1497cffec50       25f8c7f3da61c       2 minutes ago       Exited          
    etcd                      6                   1ee2992c605bc       
etcd-node-1
881632903e7f3       e34d4a6252edd       2 minutes ago       Exited          
    kube-controller-manager   6                   25a48784ec11f       
kube-controller-manager-node-1






-- 
Sent with Vivaldi Mail. Download Vivaldi for free at vivaldi.com


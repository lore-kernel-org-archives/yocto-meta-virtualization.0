Subject: kubeadm init --ignore-preflight-errors=... fails nvidia nano
To: meta-virtualization@lists.yoctoproject.org
From: "Yocto" <yocto@optimcloud.com>
X-Originating-Location: Vũng Tàu, Tinh Ba Ria-Vung Tau, VN (42.119.158.207)
X-Originating-Platform: Linux Firefox 76
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 21 May 2020 00:21:19 -0700
Message-ID: <cnTT.1590045679625568224.zsrT@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="moJezG38SrmNAiq9zcwH"

--moJezG38SrmNAiq9zcwH
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

kubeadm init fails on conntrack however lsmod shows it installed

lsmod |grep con
nf_conntrack_netlink=C2=A0=C2=A0=C2=A0 36868=C2=A0 0
nfnetlink=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 10710=C2=A0 2 nf_conntrack_netlink
nf_conntrack_ipv4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 15556=C2=A0 2
nf_defrag_ipv4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2348=
=C2=A0 1 nf_conntrack_ipv4
xt_conntrack=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 4454=C2=A0 1
nf_conntrack=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 142151=
=C2=A0 6 nf_conntrack_ipv4,nf_conntrack_netlink,nf_nat_masquerade_ipv4,xt_=
conntrack,nf_nat_ipv4,nf_nat
x_tables=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=
=C2=A0=C2=A0=C2=A0 41226=C2=A0 5 ip_tables,iptable_filter,ipt_MASQUERADE,x=
t_addrtype,xt_conntrack

and with --ignore-preflight-errors=3D... it still fails

root@jetson-nano-qspi-sd:~# kubeadm init --ignore-preflight-errors=3D... -=
-pod-network-cidr=3D10.244.0.0/16 --v=3D5
I0521 07:17:37.135612=C2=A0=C2=A0 10539 initconfiguration.go:103] detected=
 and using CRI socket: /var/run/dockershim.sock
I0521 07:17:37.136062=C2=A0=C2=A0 10539 interface.go:400] Looking for defa=
ult routes with IPv4 addresses
I0521 07:17:37.136105=C2=A0=C2=A0 10539 interface.go:405] Default route tr=
ansits interface "eth0"
I0521 07:17:37.136390=C2=A0=C2=A0 10539 interface.go:208] Interface eth0 i=
s up
I0521 07:17:37.136557=C2=A0=C2=A0 10539 interface.go:256] Interface "eth0"=
 has 2 addresses :[192.168.2.132/24 fe80::2e0:4cff:fe68:20d/64].
I0521 07:17:37.136651=C2=A0=C2=A0 10539 interface.go:223] Checking addr=C2=
=
=A0 192.168.2.132/24.
I0521 07:17:37.136684=C2=A0=C2=A0 10539 interface.go:230] IP found 192.168=
.2.132
I0521 07:17:37.136731=C2=A0=C2=A0 10539 interface.go:262] Found valid IPv4=
 address 192.168.2.132 for interface "eth0".
I0521 07:17:37.136760=C2=A0=C2=A0 10539 interface.go:411] Found active IP =
192.168.2.132
I0521 07:17:37.136908=C2=A0=C2=A0 10539 version.go:183] fetching Kubernete=
s version from URL: https://dl.k8s.io/release/stable-1.txt
W0521 07:17:37.985197=C2=A0=C2=A0 10539 configset.go:202] WARNING: kubeadm=
 cannot validate component configs for API groups [kubelet.config.k8s.io ku=
beproxy.config.k8s.io]
[init] Using Kubernetes version: v1.18.3
[preflight] Running pre-flight checks
I0521 07:17:37.985770=C2=A0=C2=A0 10539 checks.go:577] validating Kubernet=
es and kubeadm version
I0521 07:17:37.985877=C2=A0=C2=A0 10539 checks.go:166] validating if the f=
irewall is enabled and active
I0521 07:17:38.006216=C2=A0=C2=A0 10539 checks.go:201] validating availabi=
lity of port 6443
I0521 07:17:38.006588=C2=A0=C2=A0 10539 checks.go:201] validating availabi=
lity of port 10259
I0521 07:17:38.006706=C2=A0=C2=A0 10539 checks.go:201] validating availabi=
lity of port 10257
I0521 07:17:38.006825=C2=A0=C2=A0 10539 checks.go:286] validating the exis=
tence of file /etc/kubernetes/manifests/kube-apiserver.yaml
I0521 07:17:38.006893=C2=A0=C2=A0 10539 checks.go:286] validating the exis=
tence of file /etc/kubernetes/manifests/kube-controller-manager.yaml
I0521 07:17:38.006977=C2=A0=C2=A0 10539 checks.go:286] validating the exis=
tence of file /etc/kubernetes/manifests/kube-scheduler.yaml
I0521 07:17:38.007101=C2=A0=C2=A0 10539 checks.go:286] validating the exis=
tence of file /etc/kubernetes/manifests/etcd.yaml
I0521 07:17:38.007181=C2=A0=C2=A0 10539 checks.go:432] validating if the c=
onnectivity type is via proxy or direct
I0521 07:17:38.007241=C2=A0=C2=A0 10539 checks.go:471] validating http con=
nectivity to first IP address in the CIDR
I0521 07:17:38.007342=C2=A0=C2=A0 10539 checks.go:471] validating http con=
nectivity to first IP address in the CIDR
I0521 07:17:38.007456=C2=A0=C2=A0 10539 checks.go:102] validating the cont=
ainer runtime
I0521 07:17:38.103903=C2=A0=C2=A0 10539 checks.go:128] validating if the s=
ervice is enabled and active
I0521 07:17:38.233858=C2=A0=C2=A0 10539 checks.go:335] validating the cont=
ents of file /proc/sys/net/bridge/bridge-nf-call-iptables
I0521 07:17:38.233985=C2=A0=C2=A0 10539 checks.go:335] validating the cont=
ents of file /proc/sys/net/ipv4/ip_forward
I0521 07:17:38.234058=C2=A0=C2=A0 10539 checks.go:649] validating whether =
swap is enabled or not
I0521 07:17:38.234140=C2=A0=C2=A0 10539 checks.go:376] validating the pres=
ence of executable conntrack
I0521 07:17:38.234260=C2=A0=C2=A0 10539 checks.go:376] validating the pres=
ence of executable ip
I0521 07:17:38.234331=C2=A0=C2=A0 10539 checks.go:376] validating the pres=
ence of executable iptables
I0521 07:17:38.234386=C2=A0=C2=A0 10539 checks.go:376] validating the pres=
ence of executable mount
I0521 07:17:38.234456=C2=A0=C2=A0 10539 checks.go:376] validating the pres=
ence of executable nsenter
I0521 07:17:38.234550=C2=A0=C2=A0 10539 checks.go:376] validating the pres=
ence of executable ebtables
I0521 07:17:38.234636=C2=A0=C2=A0 10539 checks.go:376] validating the pres=
ence of executable ethtool
I0521 07:17:38.234777=C2=A0=C2=A0 10539 checks.go:376] validating the pres=
ence of executable socat
I0521 07:17:38.234814=C2=A0=C2=A0 10539 checks.go:376] validating the pres=
ence of executable tc
I0521 07:17:38.234899=C2=A0=C2=A0 10539 checks.go:376] validating the pres=
ence of executable touch
I0521 07:17:38.234942=C2=A0=C2=A0 10539 checks.go:520] running all checks
I0521 07:17:38.353978=C2=A0=C2=A0 10539 checks.go:406] checking whether th=
e given node name is reachable using net.LookupHost
I0521 07:17:38.354066=C2=A0=C2=A0 10539 checks.go:618] validating kubelet =
version
I0521 07:17:38.490789=C2=A0=C2=A0 10539 checks.go:128] validating if the s=
ervice is enabled and active
I0521 07:17:38.514091=C2=A0=C2=A0 10539 checks.go:201] validating availabi=
lity of port 10250
I0521 07:17:38.514265=C2=A0=C2=A0 10539 checks.go:201] validating availabi=
lity of port 2379
I0521 07:17:38.514364=C2=A0=C2=A0 10539 checks.go:201] validating availabi=
lity of port 2380
I0521 07:17:38.514457=C2=A0=C2=A0 10539 checks.go:249] validating the exis=
tence and emptiness of directory /var/lib/etcd
[preflight] Some fatal errors occurred:
[ERROR FileExisting-conntrack]: conntrack not found in system path
[preflight] If you know what you are doing, you can make a check non-fatal=
 with `--ignore-preflight-errors=3D...`
error execution phase preflight
k8s.io/kubernetes/cmd/kubeadm/app/cmd/phases/workflow.(*Runner).Run.func1
/home/dingo/yocto/NANO/build/tmp/work/aarch64-poky-linux/kubernetes/v1.18.=
3-beta+gitfe3ac3e38838a09dfd4b48d568083144211a95f8-r0/kubernetes-v1.18.3-be=
ta+gitfe3ac3e38838a09dfd4b48d568083144211a95f8/src/import/_output/local/go/=
src/k8s.io/kubernetes/cmd/kubeadm/app/cmd/phases/workflow/runner.go:235
k8s.io/kubernetes/cmd/kubeadm/app/cmd/phases/workflow.(*Runner).visitAll
/home/dingo/yocto/NANO/build/tmp/work/aarch64-poky-linux/kubernetes/v1.18.=
3-beta+gitfe3ac3e38838a09dfd4b48d568083144211a95f8-r0/kubernetes-v1.18.3-be=
ta+gitfe3ac3e38838a09dfd4b48d568083144211a95f8/src/import/_output/local/go/=
src/k8s.io/kubernetes/cmd/kubeadm/app/cmd/phases/workflow/runner.go:422
k8s.io/kubernetes/cmd/kubeadm/app/cmd/phases/workflow.(*Runner).Run
/home/dingo/yocto/NANO/build/tmp/work/aarch64-poky-linux/kubernetes/v1.18.=
3-beta+gitfe3ac3e38838a09dfd4b48d568083144211a95f8-r0/kubernetes-v1.18.3-be=
ta+gitfe3ac3e38838a09dfd4b48d568083144211a95f8/src/import/_output/local/go/=
src/k8s.io/kubernetes/cmd/kubeadm/app/cmd/phases/workflow/runner.go:207
k8s.io/kubernetes/cmd/kubeadm/app/cmd.NewCmdInit.func1
/home/dingo/yocto/NANO/build/tmp/work/aarch64-poky-linux/kubernetes/v1.18.=
3-beta+gitfe3ac3e38838a09dfd4b48d568083144211a95f8-r0/kubernetes-v1.18.3-be=
ta+gitfe3ac3e38838a09dfd4b48d568083144211a95f8/src/import/_output/local/go/=
src/k8s.io/kubernetes/cmd/kubeadm/app/cmd/init.go:147
k8s.io/kubernetes/vendor/github.com/spf13/cobra.(*Command).execute
/home/dingo/yocto/NANO/build/tmp/work/aarch64-poky-linux/kubernetes/v1.18.=
3-beta+gitfe3ac3e38838a09dfd4b48d568083144211a95f8-r0/kubernetes-v1.18.3-be=
ta+gitfe3ac3e38838a09dfd4b48d568083144211a95f8/src/import/_output/local/go/=
src/k8s.io/kubernetes/vendor/github.com/spf13/cobra/command.go:826
k8s.io/kubernetes/vendor/github.com/spf13/cobra.(*Command).ExecuteC
/home/dingo/yocto/NANO/build/tmp/work/aarch64-poky-linux/kubernetes/v1.18.=
3-beta+gitfe3ac3e38838a09dfd4b48d568083144211a95f8-r0/kubernetes-v1.18.3-be=
ta+gitfe3ac3e38838a09dfd4b48d568083144211a95f8/src/import/_output/local/go/=
src/k8s.io/kubernetes/vendor/github.com/spf13/cobra/command.go:914
k8s.io/kubernetes/vendor/github.com/spf13/cobra.(*Command).Execute
/home/dingo/yocto/NANO/build/tmp/work/aarch64-poky-linux/kubernetes/v1.18.=
3-beta+gitfe3ac3e38838a09dfd4b48d568083144211a95f8-r0/kubernetes-v1.18.3-be=
ta+gitfe3ac3e38838a09dfd4b48d568083144211a95f8/src/import/_output/local/go/=
src/k8s.io/kubernetes/vendor/github.com/spf13/cobra/command.go:864
k8s.io/kubernetes/cmd/kubeadm/app.Run
/home/dingo/yocto/NANO/build/tmp/work/aarch64-poky-linux/kubernetes/v1.18.=
3-beta+gitfe3ac3e38838a09dfd4b48d568083144211a95f8-r0/kubernetes-v1.18.3-be=
ta+gitfe3ac3e38838a09dfd4b48d568083144211a95f8/src/import/_output/local/go/=
src/k8s.io/kubernetes/cmd/kubeadm/app/kubeadm.go:50
main.main
_output/local/go/src/k8s.io/kubernetes/cmd/kubeadm/kubeadm.go:25
runtime.main
/usr/lib/go/src/runtime/proc.go:203
runtime.goexit
/usr/lib/go/src/runtime/asm_arm64.s:1148
root@jetson-nano-qspi-sd:~#

--moJezG38SrmNAiq9zcwH
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

kubeadm init fails on conntrack however lsmod shows it installed<br /><br /=
>lsmod |grep con<br />nf_conntrack_netlink&nbsp;&nbsp;&nbsp; 36868&nbsp; 0<=
br />nfnetlink&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; 10710&nbsp; 2 nf_conntrack_netlink<br />nf_conntrack_ipv4=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 15556&nbsp; 2<br />nf_defrag_ipv4&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2348&nbsp; 1 nf_conntrack_ipv4<=
br />xt_conntrack&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 4454&nbsp; 1<br />nf_conntrack&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; 142151&nbsp; 6 nf_conntrack_ipv4,nf_conntrack_netlink,nf=
_nat_masquerade_ipv4,xt_conntrack,nf_nat_ipv4,nf_nat<br />x_tables&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 41226&nbsp; 5 ip_tables,iptable_filter,ipt_MASQUERADE,xt_addrtype,xt_connt=
rack<br /><br />and with --ignore-preflight-errors=3D... it still fails <br=
 /><br />root@jetson-nano-qspi-sd:~# kubeadm init --ignore-preflight-errors=
=
=3D... --pod-network-cidr=3D10.244.0.0/16 --v=3D5<br />I0521 07:17:37.1356=
12&nbsp;&nbsp; 10539 initconfiguration.go:103] detected and using CRI socke=
t: /var/run/dockershim.sock<br />I0521 07:17:37.136062&nbsp;&nbsp; 10539 in=
terface.go:400] Looking for default routes with IPv4 addresses<br />I0521 0=
7:17:37.136105&nbsp;&nbsp; 10539 interface.go:405] Default route transits i=
nterface "eth0"<br />I0521 07:17:37.136390&nbsp;&nbsp; 10539 interface.go:2=
08] Interface eth0 is up<br />I0521 07:17:37.136557&nbsp;&nbsp; 10539 inter=
face.go:256] Interface "eth0" has 2 addresses :[192.168.2.132/24 fe80::2e0:=
4cff:fe68:20d/64].<br />I0521 07:17:37.136651&nbsp;&nbsp; 10539 interface.g=
o:223] Checking addr&nbsp; 192.168.2.132/24.<br />I0521 07:17:37.136684&nbs=
p;&nbsp; 10539 interface.go:230] IP found 192.168.2.132<br />I0521 07:17:37=
.136731&nbsp;&nbsp; 10539 interface.go:262] Found valid IPv4 address 192.16=
8.2.132 for interface "eth0".<br />I0521 07:17:37.136760&nbsp;&nbsp; 10539 =
interface.go:411] Found active IP 192.168.2.132 <br />I0521 07:17:37.136908=
&nbsp;&nbsp; 10539 version.go:183] fetching Kubernetes version from URL: ht=
tps://dl.k8s.io/release/stable-1.txt<br />W0521 07:17:37.985197&nbsp;&nbsp;=
 10539 configset.go:202] WARNING: kubeadm cannot validate component configs=
 for API groups [kubelet.config.k8s.io kubeproxy.config.k8s.io]<br />[init]=
 Using Kubernetes version: v1.18.3<br />[preflight] Running pre-flight chec=
ks<br />I0521 07:17:37.985770&nbsp;&nbsp; 10539 checks.go:577] validating K=
ubernetes and kubeadm version<br />I0521 07:17:37.985877&nbsp;&nbsp; 10539 =
checks.go:166] validating if the firewall is enabled and active<br />I0521 =
07:17:38.006216&nbsp;&nbsp; 10539 checks.go:201] validating availability of=
 port 6443<br />I0521 07:17:38.006588&nbsp;&nbsp; 10539 checks.go:201] vali=
dating availability of port 10259<br />I0521 07:17:38.006706&nbsp;&nbsp; 10=
539 checks.go:201] validating availability of port 10257<br />I0521 07:17:3=
8.006825&nbsp;&nbsp; 10539 checks.go:286] validating the existence of file =
/etc/kubernetes/manifests/kube-apiserver.yaml<br />I0521 07:17:38.006893&nb=
sp;&nbsp; 10539 checks.go:286] validating the existence of file /etc/kubern=
etes/manifests/kube-controller-manager.yaml<br />I0521 07:17:38.006977&nbsp=
;&nbsp; 10539 checks.go:286] validating the existence of file /etc/kubernet=
es/manifests/kube-scheduler.yaml<br />I0521 07:17:38.007101&nbsp;&nbsp; 105=
39 checks.go:286] validating the existence of file /etc/kubernetes/manifest=
s/etcd.yaml<br />I0521 07:17:38.007181&nbsp;&nbsp; 10539 checks.go:432] val=
idating if the connectivity type is via proxy or direct<br />I0521 07:17:38=
.007241&nbsp;&nbsp; 10539 checks.go:471] validating http connectivity to fi=
rst IP address in the CIDR<br />I0521 07:17:38.007342&nbsp;&nbsp; 10539 che=
cks.go:471] validating http connectivity to first IP address in the CIDR<br=
 />I0521 07:17:38.007456&nbsp;&nbsp; 10539 checks.go:102] validating the co=
ntainer runtime<br />I0521 07:17:38.103903&nbsp;&nbsp; 10539 checks.go:128]=
 validating if the service is enabled and active<br />I0521 07:17:38.233858=
&nbsp;&nbsp; 10539 checks.go:335] validating the contents of file /proc/sys=
/net/bridge/bridge-nf-call-iptables<br />I0521 07:17:38.233985&nbsp;&nbsp; =
10539 checks.go:335] validating the contents of file /proc/sys/net/ipv4/ip_=
forward<br />I0521 07:17:38.234058&nbsp;&nbsp; 10539 checks.go:649] validat=
ing whether swap is enabled or not<br />I0521 07:17:38.234140&nbsp;&nbsp; 1=
0539 checks.go:376] validating the presence of executable conntrack<br />I0=
521 07:17:38.234260&nbsp;&nbsp; 10539 checks.go:376] validating the presenc=
e of executable ip<br />I0521 07:17:38.234331&nbsp;&nbsp; 10539 checks.go:3=
76] validating the presence of executable iptables<br />I0521 07:17:38.2343=
86&nbsp;&nbsp; 10539 checks.go:376] validating the presence of executable m=
ount<br />I0521 07:17:38.234456&nbsp;&nbsp; 10539 checks.go:376] validating=
 the presence of executable nsenter<br />I0521 07:17:38.234550&nbsp;&nbsp; =
10539 checks.go:376] validating the presence of executable ebtables<br />I0=
521 07:17:38.234636&nbsp;&nbsp; 10539 checks.go:376] validating the presenc=
e of executable ethtool<br />I0521 07:17:38.234777&nbsp;&nbsp; 10539 checks=
.go:376] validating the presence of executable socat<br />I0521 07:17:38.23=
4814&nbsp;&nbsp; 10539 checks.go:376] validating the presence of executable=
 tc<br />I0521 07:17:38.234899&nbsp;&nbsp; 10539 checks.go:376] validating =
the presence of executable touch<br />I0521 07:17:38.234942&nbsp;&nbsp; 105=
39 checks.go:520] running all checks<br />I0521 07:17:38.353978&nbsp;&nbsp;=
 10539 checks.go:406] checking whether the given node name is reachable usi=
ng net.LookupHost<br />I0521 07:17:38.354066&nbsp;&nbsp; 10539 checks.go:61=
8] validating kubelet version<br />I0521 07:17:38.490789&nbsp;&nbsp; 10539 =
checks.go:128] validating if the service is enabled and active<br />I0521 0=
7:17:38.514091&nbsp;&nbsp; 10539 checks.go:201] validating availability of =
port 10250<br />I0521 07:17:38.514265&nbsp;&nbsp; 10539 checks.go:201] vali=
dating availability of port 2379<br />I0521 07:17:38.514364&nbsp;&nbsp; 105=
39 checks.go:201] validating availability of port 2380<br />I0521 07:17:38.=
514457&nbsp;&nbsp; 10539 checks.go:249] validating the existence and emptin=
ess of directory /var/lib/etcd<br />[preflight] Some fatal errors occurred:=
<br />&nbsp;&nbsp;&nbsp; [ERROR FileExisting-conntrack]: conntrack not foun=
d in system path<br />[preflight] If you know what you are doing, you can m=
ake a check non-fatal with `--ignore-preflight-errors=3D...`<br />error exe=
cution phase preflight<br />k8s.io/kubernetes/cmd/kubeadm/app/cmd/phases/wo=
rkflow.(*Runner).Run.func1<br />&nbsp;&nbsp;&nbsp; /home/dingo/yocto/NANO/b=
uild/tmp/work/aarch64-poky-linux/kubernetes/v1.18.3-beta+gitfe3ac3e38838a09=
dfd4b48d568083144211a95f8-r0/kubernetes-v1.18.3-beta+gitfe3ac3e38838a09dfd4=
b48d568083144211a95f8/src/import/_output/local/go/src/k8s.io/kubernetes/cmd=
/kubeadm/app/cmd/phases/workflow/runner.go:235<br />k8s.io/kubernetes/cmd/k=
ubeadm/app/cmd/phases/workflow.(*Runner).visitAll<br />&nbsp;&nbsp;&nbsp; /=
home/dingo/yocto/NANO/build/tmp/work/aarch64-poky-linux/kubernetes/v1.18.3-=
beta+gitfe3ac3e38838a09dfd4b48d568083144211a95f8-r0/kubernetes-v1.18.3-beta=
+gitfe3ac3e38838a09dfd4b48d568083144211a95f8/src/import/_output/local/go/sr=
c/k8s.io/kubernetes/cmd/kubeadm/app/cmd/phases/workflow/runner.go:422<br />=
k8s.io/kubernetes/cmd/kubeadm/app/cmd/phases/workflow.(*Runner).Run<br />&n=
bsp;&nbsp;&nbsp; /home/dingo/yocto/NANO/build/tmp/work/aarch64-poky-linux/k=
ubernetes/v1.18.3-beta+gitfe3ac3e38838a09dfd4b48d568083144211a95f8-r0/kuber=
netes-v1.18.3-beta+gitfe3ac3e38838a09dfd4b48d568083144211a95f8/src/import/_=
output/local/go/src/k8s.io/kubernetes/cmd/kubeadm/app/cmd/phases/workflow/r=
unner.go:207<br />k8s.io/kubernetes/cmd/kubeadm/app/cmd.NewCmdInit.func1<br=
 />&nbsp;&nbsp;&nbsp; /home/dingo/yocto/NANO/build/tmp/work/aarch64-poky-li=
nux/kubernetes/v1.18.3-beta+gitfe3ac3e38838a09dfd4b48d568083144211a95f8-r0/=
kubernetes-v1.18.3-beta+gitfe3ac3e38838a09dfd4b48d568083144211a95f8/src/imp=
ort/_output/local/go/src/k8s.io/kubernetes/cmd/kubeadm/app/cmd/init.go:147<=
br />k8s.io/kubernetes/vendor/github.com/spf13/cobra.(*Command).execute<br =
/>&nbsp;&nbsp;&nbsp; /home/dingo/yocto/NANO/build/tmp/work/aarch64-poky-lin=
ux/kubernetes/v1.18.3-beta+gitfe3ac3e38838a09dfd4b48d568083144211a95f8-r0/k=
ubernetes-v1.18.3-beta+gitfe3ac3e38838a09dfd4b48d568083144211a95f8/src/impo=
rt/_output/local/go/src/k8s.io/kubernetes/vendor/github.com/spf13/cobra/com=
mand.go:826<br />k8s.io/kubernetes/vendor/github.com/spf13/cobra.(*Command)=
.ExecuteC<br />&nbsp;&nbsp;&nbsp; /home/dingo/yocto/NANO/build/tmp/work/aar=
ch64-poky-linux/kubernetes/v1.18.3-beta+gitfe3ac3e38838a09dfd4b48d568083144=
211a95f8-r0/kubernetes-v1.18.3-beta+gitfe3ac3e38838a09dfd4b48d568083144211a=
95f8/src/import/_output/local/go/src/k8s.io/kubernetes/vendor/github.com/sp=
f13/cobra/command.go:914<br />k8s.io/kubernetes/vendor/github.com/spf13/cob=
ra.(*Command).Execute<br />&nbsp;&nbsp;&nbsp; /home/dingo/yocto/NANO/build/=
tmp/work/aarch64-poky-linux/kubernetes/v1.18.3-beta+gitfe3ac3e38838a09dfd4b=
48d568083144211a95f8-r0/kubernetes-v1.18.3-beta+gitfe3ac3e38838a09dfd4b48d5=
68083144211a95f8/src/import/_output/local/go/src/k8s.io/kubernetes/vendor/g=
ithub.com/spf13/cobra/command.go:864<br />k8s.io/kubernetes/cmd/kubeadm/app=
.Run<br />&nbsp;&nbsp;&nbsp; /home/dingo/yocto/NANO/build/tmp/work/aarch64-=
poky-linux/kubernetes/v1.18.3-beta+gitfe3ac3e38838a09dfd4b48d568083144211a9=
5f8-r0/kubernetes-v1.18.3-beta+gitfe3ac3e38838a09dfd4b48d568083144211a95f8/=
src/import/_output/local/go/src/k8s.io/kubernetes/cmd/kubeadm/app/kubeadm.g=
o:50<br />main.main<br />&nbsp;&nbsp;&nbsp; _output/local/go/src/k8s.io/kub=
ernetes/cmd/kubeadm/kubeadm.go:25<br />runtime.main<br />&nbsp;&nbsp;&nbsp;=
 /usr/lib/go/src/runtime/proc.go:203<br />runtime.goexit<br />&nbsp;&nbsp;&=
nbsp; /usr/lib/go/src/runtime/asm_arm64.s:1148<br />root@jetson-nano-qspi-s=
d:~#

--moJezG38SrmNAiq9zcwH--

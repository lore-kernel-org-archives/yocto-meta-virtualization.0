Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.10789.1596165083386652685
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 20:11:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: zhixiong.chi@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06V3Aga2007329
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Thu, 30 Jul 2020 20:10:53 -0700
Received: from [128.224.162.237] (128.224.162.237) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Thu, 30 Jul 2020
 20:10:32 -0700
Subject: Re: [meta-virtualization][zeus][PATCH] kubernetes: fix three CVE issues
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: <meta-virtualization@lists.yoctoproject.org>
References: <16267A948D96B982.15129@lists.yoctoproject.org>
 <6e83d4b7-e38b-b68f-2b10-82992de6e845@windriver.com>
 <20200730195420.GA29435@gmail.com>
From: "Zhixiong Chi" <zhixiong.chi@windriver.com>
Message-ID: <a118af77-7358-639a-d344-5f014192d967@windriver.com>
Date: Fri, 31 Jul 2020 11:11:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200730195420.GA29435@gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 06V3Aga2007329
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


On 2020/7/31 =E4=B8=8A=E5=8D=883:54, Bruce Ashfield wrote:
> merged (and yes, I went back and picked up the older CVE patch as well).
>
> But remember, when submitting these to an older branch, we should also
> be summarizing if other branches are vulenerable.
>
> In master, we'll update the version to pick up the change, but it is sti=
ll
> useful to know if it is fixed in the k8s release branch.
>
> And in particular, I need the following answered: does dunfell need thes=
e
> patches as well ?

Hi Bruce,

OK=EF=BC=8C I will handle the dunfell branch together next time.

Thanks.


> Bruce
>
> In message: Re: [meta-virtualization][zeus][PATCH] kubernetes: fix three=
 CVE issues
> on 30/07/2020 Zhixiong Chi wrote:
>
>> Hi Bruce,
>>
>> After the last CVE-1019-11254 patch merged, this patch can be applied
>> successfully.
>>
>> Thanks.
>>
>> On 2020/7/30 =E4=B8=8B=E5=8D=884:30, Zhixiong Chi wrote:
>>
>>     Backport the patches from the upstream:
>>     https://github.com/kubernetes/kubernetes.git  [branch: release-1.16=
]
>>     ba3ca4929ed3887c95f94fcf97610f3449446804
>>     68750fefd3df76b7b008ef7b18e8acd18d5c2f2e
>>     d22a61e21d677f7527bc8a4aeb3288c5e11dd49b
>>
>>     Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
>>     ---
>>      .../kubernetes/kubernetes/CVE-2020-8557.patch | 179 ++++++++++++++=
++++
>>      .../kubernetes/kubernetes/CVE-2020-8558.patch |  51 +++++
>>      .../kubernetes/kubernetes/CVE-2020-8559.patch | 148 ++++++++++++++=
+
>>      .../kubernetes/kubernetes_git.bb              |   3 +
>>      4 files changed, 381 insertions(+)
>>      create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-20=
20-8557.patch
>>      create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-20=
20-8558.patch
>>      create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-20=
20-8559.patch
>>
>>     diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2020-8557=
.patch b/recipes-containers/kubernetes/kubernetes/CVE-2020-8557.patch
>>     new file mode 100644
>>     index 0000000..dd70627
>>     --- /dev/null
>>     +++ b/recipes-containers/kubernetes/kubernetes/CVE-2020-8557.patch
>>     @@ -0,0 +1,179 @@
>>     +From 68750fefd3df76b7b008ef7b18e8acd18d5c2f2e Mon Sep 17 00:00:00 =
2001
>>     +From: Joel Smith <joesmith@redhat.com>
>>     +Date: Thu, 14 May 2020 20:09:58 -0600
>>     +Subject: [PATCH] Include pod /etc/hosts in ephemeral storage calcu=
lation for
>>     + eviction
>>     +
>>     +CVE: CVE-2020-8557
>>     +Upstream-Status: Backport [https://github.com/kubernetes/kubernete=
s.git branch:release-1.16]
>>     +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
>>     +---
>>     + src/import/pkg/kubelet/eviction/BUILD               | 1 +
>>     + src/import/pkg/kubelet/eviction/eviction_manager.go | 7 ++++++-
>>     + src/import/pkg/kubelet/eviction/helpers.go          | 9 ++++++++-
>>     + src/import/pkg/kubelet/kubelet.go                   | 3 ++-
>>     + src/import/pkg/kubelet/kubelet_pods.go              | 7 ++++++-
>>     + src/import/pkg/kubelet/kubelet_test.go              | 3 ++-
>>     + src/import/pkg/kubelet/runonce_test.go              | 3 ++-
>>     + 7 files changed, 27 insertions(+), 6 deletions(-)
>>     +
>>     +diff --git a/src/import/pkg/kubelet/eviction/BUILD b/src/import/pk=
g/kubelet/eviction/BUILD
>>     +index 2209b26d7d4..e8c2241e075 100644
>>     +--- a/src/import/pkg/kubelet/eviction/BUILD
>>     ++++ b/src/import/pkg/kubelet/eviction/BUILD
>>     +@@ -66,6 +66,7 @@ go_library(
>>     +         "//staging/src/k8s.io/api/core/v1:go_default_library",
>>     +         "//staging/src/k8s.io/apimachinery/pkg/api/resource:go_de=
fault_library",
>>     +         "//staging/src/k8s.io/apimachinery/pkg/apis/meta/v1:go_de=
fault_library",
>>     ++        "//staging/src/k8s.io/apimachinery/pkg/types:go_default_l=
ibrary",
>>     +         "//staging/src/k8s.io/apimachinery/pkg/util/clock:go_defa=
ult_library",
>>     +         "//staging/src/k8s.io/apiserver/pkg/util/feature:go_defau=
lt_library",
>>     +         "//staging/src/k8s.io/client-go/tools/record:go_default_l=
ibrary",
>>     +diff --git a/src/import/pkg/kubelet/eviction/eviction_manager.go b=
/src/import/pkg/kubelet/eviction/eviction_manager.go
>>     +index 4ef2a89dce6..ca218cb942f 100644
>>     +--- a/src/import/pkg/kubelet/eviction/eviction_manager.go
>>     ++++ b/src/import/pkg/kubelet/eviction/eviction_manager.go
>>     +@@ -26,6 +26,7 @@ import (
>>     +
>>     +       v1 "k8s.io/api/core/v1"
>>     +       "k8s.io/apimachinery/pkg/api/resource"
>>     ++      "k8s.io/apimachinery/pkg/types"
>>     +       "k8s.io/apimachinery/pkg/util/clock"
>>     +       utilfeature "k8s.io/apiserver/pkg/util/feature"
>>     +       "k8s.io/client-go/tools/record"
>>     +@@ -90,6 +91,8 @@ type managerImpl struct {
>>     +       thresholdNotifiers []ThresholdNotifier
>>     +       // thresholdsLastUpdated is the last time the thresholdNoti=
fiers were updated.
>>     +       thresholdsLastUpdated time.Time
>>     ++      // etcHostsPath is a function that will get the etc-hosts f=
ile's path for a pod given its UID
>>     ++      etcHostsPath func(podUID types.UID) string
>>     + }
>>     +=20
>>     + // ensure it implements the required interface
>>     +@@ -106,6 +109,7 @@ func NewManager(
>>     +       recorder record.EventRecorder,
>>     +       nodeRef *v1.ObjectReference,
>>     +       clock clock.Clock,
>>     ++      etcHostsPath func(types.UID) string,
>>     + ) (Manager, lifecycle.PodAdmitHandler) {
>>     +       manager :=3D &managerImpl{
>>     +               clock:                        clock,
>>     +@@ -121,6 +125,7 @@ func NewManager(
>>     +               thresholdsFirstObservedAt:    thresholdsObservedAt{=
},
>>     +               dedicatedImageFs:             nil,
>>     +               thresholdNotifiers:           []ThresholdNotifier{}=
,
>>     ++              etcHostsPath:                 etcHostsPath,
>>     +       }
>>     +       return manager, manager
>>     + }
>>     +@@ -503,7 +508,7 @@ func (m *managerImpl) podEphemeralStorageLimit=
Eviction(podStats statsapi.PodStat
>>     +       } else {
>>     +               fsStatsSet =3D []fsStatsType{fsStatsRoot, fsStatsLo=
gs, fsStatsLocalVolumeSource}
>>     +       }
>>     +-      podEphemeralUsage, err :=3D podLocalEphemeralStorageUsage(p=
odStats, pod, fsStatsSet)
>>     ++      podEphemeralUsage, err :=3D podLocalEphemeralStorageUsage(p=
odStats, pod, fsStatsSet, m.etcHostsPath(pod.UID))
>>     +       if err !=3D nil {
>>     +               klog.Errorf("eviction manager: error getting pod di=
sk usage %v", err)
>>     +               return false
>>     +diff --git a/src/import/pkg/kubelet/eviction/helpers.go b/src/impo=
rt/pkg/kubelet/eviction/helpers.go
>>     +index dfdb8ce3b60..41c55855aad 100644
>>     +--- a/src/import/pkg/kubelet/eviction/helpers.go
>>     ++++ b/src/import/pkg/kubelet/eviction/helpers.go
>>     +@@ -18,6 +18,7 @@ package eviction
>>     +
>>     + import (
>>     +       "fmt"
>>     ++      "os"
>>     +       "sort"
>>     +       "strconv"
>>     +       "strings"
>>     +@@ -415,7 +416,7 @@ func localEphemeralVolumeNames(pod *v1.Pod) []=
string {
>>     + }
>>     +
>>     + // podLocalEphemeralStorageUsage aggregates pod local ephemeral s=
torage usage and inode consumption for the specified stats to measure.
>>     +-func podLocalEphemeralStorageUsage(podStats statsapi.PodStats, po=
d *v1.Pod, statsToMeasure []fsStatsType) (v1.ResourceList, error) {
>>     ++func podLocalEphemeralStorageUsage(podStats statsapi.PodStats, po=
d *v1.Pod, statsToMeasure []fsStatsType, etcHostsPath string) (v1.ResourceL=
ist, error) {
>>     +       disk :=3D resource.Quantity{Format: resource.BinarySI}
>>     +       inodes :=3D resource.Quantity{Format: resource.DecimalSI}
>>     +
>>     +@@ -429,6 +430,12 @@ func podLocalEphemeralStorageUsage(podStats s=
tatsapi.PodStats, pod *v1.Pod, stat
>>     +               disk.Add(podLocalVolumeUsageList[v1.ResourceEphemer=
alStorage])
>>     +               inodes.Add(podLocalVolumeUsageList[resourceInodes])
>>     +       }
>>     ++      if len(etcHostsPath) > 0 {
>>     ++              if stat, err :=3D os.Stat(etcHostsPath); err =3D=3D=
 nil {
>>     ++                      disk.Add(*resource.NewQuantity(int64(stat.S=
ize()), resource.BinarySI))
>>     ++                      inodes.Add(*resource.NewQuantity(int64(1), =
resource.DecimalSI))
>>     ++              }
>>     ++      }
>>     +       return v1.ResourceList{
>>     +               v1.ResourceEphemeralStorage: disk,
>>     +               resourceInodes:              inodes,
>>     +diff --git a/src/import/pkg/kubelet/kubelet.go b/src/import/pkg/ku=
belet/kubelet.go
>>     +index c2acd358e59..8da5d0f2e92 100644
>>     +--- a/src/import/pkg/kubelet/kubelet.go
>>     ++++ b/src/import/pkg/kubelet/kubelet.go
>>     +@@ -831,8 +831,9 @@ func NewMainKubelet(kubeCfg *kubeletconfiginte=
rnal.KubeletConfiguration,
>>     +       klet.backOff =3D flowcontrol.NewBackOff(backOffPeriod, MaxC=
ontainerBackOff)
>>     +       klet.podKillingCh =3D make(chan *kubecontainer.PodPair, pod=
KillingChannelCapacity)
>>     +
>>     ++      etcHostsPathFunc :=3D func(podUID types.UID) string { retur=
n getEtcHostsPath(klet.getPodDir(podUID)) }
>>     +       // setup eviction manager
>>     +-      evictionManager, evictionAdmitHandler :=3D eviction.NewMana=
ger(klet.resourceAnalyzer, evictionConfig, killPodNow(klet.podWorkers, kube=
Deps.Recorder), klet.podManager.GetMirrorPodByPod, klet.imageManager, klet.=
containerGC, kubeDeps.Recorder, nodeRef, klet.clock)
>>     ++      evictionManager, evictionAdmitHandler :=3D eviction.NewMana=
ger(klet.resourceAnalyzer, evictionConfig, killPodNow(klet.podWorkers, kube=
Deps.Recorder), klet.podManager.GetMirrorPodByPod, klet.imageManager, klet.=
containerGC, kubeDeps.Recorder, nodeRef, klet.clock, etcHostsPathFunc)
>>     +
>>     +       klet.evictionManager =3D evictionManager
>>     +       klet.admitHandlers.AddPodAdmitHandler(evictionAdmitHandler)
>>     +diff --git a/src/import/pkg/kubelet/kubelet_pods.go b/src/import/p=
kg/kubelet/kubelet_pods.go
>>     +index 013d0f55aea..02857d4b5b3 100644
>>     +--- a/src/import/pkg/kubelet/kubelet_pods.go
>>     ++++ b/src/import/pkg/kubelet/kubelet_pods.go
>>     +@@ -291,10 +291,15 @@ func translateMountPropagation(mountMode *v1=
.MountPropagationMode) (runtimeapi.M
>>     +       }
>>     + }
>>     +
>>     ++// getEtcHostsPath returns the full host-side path to a pod's gen=
erated /etc/hosts file
>>     ++func getEtcHostsPath(podDir string) string {
>>     ++      return path.Join(podDir, "etc-hosts")
>>     ++}
>>     ++
>>     + // makeHostsMount makes the mountpoint for the hosts file that th=
e containers
>>     + // in a pod are injected with.
>>     + func makeHostsMount(podDir, podIP, hostName, hostDomainName strin=
g, hostAliases []v1.HostAlias, useHostNetwork bool) (*kubecontainer.Mount, =
error) {
>>     +-      hostsFilePath :=3D path.Join(podDir, "etc-hosts")
>>     ++      hostsFilePath :=3D getEtcHostsPath(podDir)
>>     +       if err :=3D ensureHostsFile(hostsFilePath, podIP, hostName,=
 hostDomainName, hostAliases, useHostNetwork); err !=3D nil {
>>     +               return nil, err
>>     +       }
>>     +diff --git a/src/import/pkg/kubelet/kubelet_test.go b/src/import/p=
kg/kubelet/kubelet_test.go
>>     +index 80c6dcb73b6..9fb417fbb9d 100644
>>     +--- a/src/import/pkg/kubelet/kubelet_test.go
>>     ++++ b/src/import/pkg/kubelet/kubelet_test.go
>>     +@@ -291,8 +291,9 @@ func newTestKubeletWithImageList(
>>     +               UID:       types.UID(kubelet.nodeName),
>>     +               Namespace: "",
>>     +       }
>>     ++      etcHostsPathFunc :=3D func(podUID types.UID) string { retur=
n getEtcHostsPath(kubelet.getPodDir(podUID)) }
>>     +       // setup eviction manager
>>     +-      evictionManager, evictionAdmitHandler :=3D eviction.NewMana=
ger(kubelet.resourceAnalyzer, eviction.Config{}, killPodNow(kubelet.podWork=
ers, fakeRecorder), kubelet.podManager.GetMirrorPodByPod, kubelet.imageMana=
ger, kubelet.containerGC, fakeRecorder, nodeRef, kubelet.clock)
>>     ++      evictionManager, evictionAdmitHandler :=3D eviction.NewMana=
ger(kubelet.resourceAnalyzer, eviction.Config{}, killPodNow(kubelet.podWork=
ers, fakeRecorder), kubelet.podManager.GetMirrorPodByPod, kubelet.imageMana=
ger, kubelet.containerGC, fakeRecorder, nodeRef, kubelet.clock, etcHostsPat=
hFunc)
>>     +
>>     +       kubelet.evictionManager =3D evictionManager
>>     +       kubelet.admitHandlers.AddPodAdmitHandler(evictionAdmitHandl=
er)
>>     +diff --git a/src/import/pkg/kubelet/runonce_test.go b/src/import/p=
kg/kubelet/runonce_test.go
>>     +index 7239133e481..9b162c11702 100644
>>     +--- a/src/import/pkg/kubelet/runonce_test.go
>>     ++++ b/src/import/pkg/kubelet/runonce_test.go
>>     +@@ -125,7 +125,8 @@ func TestRunOnce(t *testing.T) {
>>     +               return nil
>>     +       }
>>     +       fakeMirrodPodFunc :=3D func(*v1.Pod) (*v1.Pod, bool) { retu=
rn nil, false }
>>     +-      evictionManager, evictionAdmitHandler :=3D eviction.NewMana=
ger(kb.resourceAnalyzer, eviction.Config{}, fakeKillPodFunc, fakeMirrodPodF=
unc, nil, nil, kb.recorder, nodeRef, kb.clock)
>>     ++      etcHostsPathFunc :=3D func(podUID types.UID) string { retur=
n getEtcHostsPath(kb.getPodDir(podUID)) }
>>     ++      evictionManager, evictionAdmitHandler :=3D eviction.NewMana=
ger(kb.resourceAnalyzer, eviction.Config{}, fakeKillPodFunc, fakeMirrodPodF=
unc, nil, nil, kb.recorder, nodeRef, kb.clock, etcHostsPathFunc)
>>     +
>>     +       kb.evictionManager =3D evictionManager
>>     +       kb.admitHandlers.AddPodAdmitHandler(evictionAdmitHandler)
>>     +--
>>     +2.17.0
>>     +
>>     diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2020-8558=
.patch b/recipes-containers/kubernetes/kubernetes/CVE-2020-8558.patch
>>     new file mode 100644
>>     index 0000000..9eeed26
>>     --- /dev/null
>>     +++ b/recipes-containers/kubernetes/kubernetes/CVE-2020-8558.patch
>>     @@ -0,0 +1,51 @@
>>     +From d22a61e21d677f7527bc8a4aeb3288c5e11dd49b Mon Sep 17 00:00:00 =
2001
>>     +From: Casey Callendrello <cdc@redhat.com>
>>     +Date: Fri, 29 May 2020 13:03:37 +0200
>>     +Subject: [PATCH] kubelet: block non-forwarded packets from crossin=
g the
>>     + localhost boundary
>>     +
>>     +We set route_localnet so that host-network processes can connect t=
o
>>     +<127.0.0.1:NodePort> and it still works. This, however, is too
>>     +permissive.
>>     +
>>     +So, block martians that are not already in conntrack.
>>     +
>>     +See: #90259
>>     +Signed-off-by: Casey Callendrello <cdc@redhat.com>
>>     +CVE: CVE-2020-8558
>>     +Upstream-Status: Backport [https://github.com/kubernetes/kubernete=
s.git branch:release-1.16]
>>     +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
>>     +---
>>     + src/import/pkg/kubelet/kubelet_network_linux.go | 16 ++++++++++++=
++++
>>     + 1 file changed, 16 insertions(+)
>>     +
>>     +diff --git a/src/import/pkg/kubelet/kubelet_network_linux.go b/src=
/import/pkg/kubelet/kubelet_network_linux.go
>>     +index 1c9ad46b989..d18ab75a053 100644
>>     +--- a/src/import/pkg/kubelet/kubelet_network_linux.go
>>     ++++ b/src/import/pkg/kubelet/kubelet_network_linux.go
>>     +@@ -68,6 +68,22 @@ func (kl *Kubelet) syncNetworkUtil() {
>>     +               klog.Errorf("Failed to ensure rule to drop packet m=
arked by %v in %v chain %v: %v", KubeMarkDropChain, utiliptables.TableFilte=
r, KubeFirewallChain, err)
>>     +               return
>>     +       }
>>     ++
>>     ++      // drop all non-local packets to localhost if they're not p=
art of an existing
>>     ++      // forwarded connection. See #90259
>>     ++      if !kl.iptClient.IsIpv6() { // ipv6 doesn't have this issue
>>     ++              if _, err :=3D kl.iptClient.EnsureRule(utiliptables=
.Append, utiliptables.TableFilter, KubeFirewallChain,
>>     ++                      "-m", "comment", "--comment", "block incomi=
ng localnet connections",
>>     ++                      "--dst", "127.0.0.0/8",
>>     ++                      "!", "--src", "127.0.0.0/8",
>>     ++                      "-m", "conntrack",
>>     ++                      "!", "--ctstate", "RELATED,ESTABLISHED,DNAT=
",
>>     ++                      "-j", "DROP"); err !=3D nil {
>>     ++                      klog.Errorf("Failed to ensure rule to drop =
invalid localhost packets in %v chain %v: %v", utiliptables.TableFilter, Ku=
beFirewallChain, err)
>>     ++                      return
>>     ++              }
>>     ++      }
>>     ++
>>     +       if _, err :=3D kl.iptClient.EnsureRule(utiliptables.Prepend=
, utiliptables.TableFilter, utiliptables.ChainOutput, "-j", string(KubeFire=
wallChain)); err !=3D nil {
>>     +               klog.Errorf("Failed to ensure that %s chain %s jump=
s to %s: %v", utiliptables.TableFilter, utiliptables.ChainOutput, KubeFirew=
allChain, err)
>>     +               return
>>     +--
>>     +2.17.0
>>     +
>>     diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2020-8559=
.patch b/recipes-containers/kubernetes/kubernetes/CVE-2020-8559.patch
>>     new file mode 100644
>>     index 0000000..f47826d
>>     --- /dev/null
>>     +++ b/recipes-containers/kubernetes/kubernetes/CVE-2020-8559.patch
>>     @@ -0,0 +1,148 @@
>>     +From ba3ca4929ed3887c95f94fcf97610f3449446804 Mon Sep 17 00:00:00 =
2001
>>     +From: Tim Allclair <tallclair@google.com>
>>     +Date: Wed, 17 Jun 2020 11:09:02 -0700
>>     +Subject: [PATCH] Don't return proxied redirects to the client
>>     +
>>     +CVE: CVE-2020-8559
>>     +Upstream-Status: Backport [https://github.com/kubernetes/kubernete=
s.git branch:release-1.16]
>>     +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
>>     +---
>>     + .../k8s.io/apimachinery/pkg/util/net/http.go  |  2 +-
>>     + .../apimachinery/pkg/util/net/http_test.go    | 12 ++---
>>     + .../pkg/util/proxy/upgradeaware.go            | 10 ++++
>>     + .../pkg/util/proxy/upgradeaware_test.go       | 47 ++++++++++++++=
++++-
>>     + 4 files changed, 62 insertions(+), 9 deletions(-)
>>     +
>>     +diff --git a/src/import/staging/src/k8s.io/apimachinery/pkg/util/n=
et/http.go b/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http.g=
o
>>     +index bd79d6c4a09..c24fbc6921c 100644
>>     +--- a/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http=
.go
>>     ++++ b/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http=
.go
>>     +@@ -431,7 +431,7 @@ redirectLoop:
>>     +
>>     +               // Only follow redirects to the same host. Otherwis=
e, propagate the redirect response back.
>>     +               if requireSameHostRedirects && location.Hostname() =
!=3D originalLocation.Hostname() {
>>     +-                      break redirectLoop
>>     ++                      return nil, nil, fmt.Errorf("hostname misma=
tch: expected %s, found %s", originalLocation.Hostname(), location.Hostname=
())
>>     +               }
>>     +
>>     +               // Reset the connection.
>>     +diff --git a/src/import/staging/src/k8s.io/apimachinery/pkg/util/n=
et/http_test.go b/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/h=
ttp_test.go
>>     +index 4e4e317b9a4..142b80f1a84 100644
>>     +--- a/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http=
_test.go
>>     ++++ b/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http=
_test.go
>>     +@@ -330,13 +330,13 @@ func TestConnectWithRedirects(t *testing.T) =
{
>>     +               redirects:   []string{"/1", "/2", "/3", "/4", "/5",=
 "/6", "/7", "/8", "/9", "/10"},
>>     +               expectError: true,
>>     +       }, {
>>     +-              desc:              "redirect to different host are =
prevented",
>>     +-              redirects:         []string{"http://example.com/foo=
"},
>>     +-              expectedRedirects: 0,
>>     ++              desc:        "redirect to different host are preven=
ted",
>>     ++              redirects:   []string{"http://example.com/foo"},
>>     ++              expectError: true,
>>     +       }, {
>>     +-              desc:              "multiple redirect to different =
host forbidden",
>>     +-              redirects:         []string{"/1", "/2", "/3", "http=
://example.com/foo"},
>>     +-              expectedRedirects: 3,
>>     ++              desc:        "multiple redirect to different host f=
orbidden",
>>     ++              redirects:   []string{"/1", "/2", "/3", "http://exa=
mple.com/foo"},
>>     ++              expectError: true,
>>     +       }, {
>>     +               desc:              "redirect to different port is a=
llowed",
>>     +               redirects:         []string{"http://HOST/foo"},
>>     +diff --git a/src/import/staging/src/k8s.io/apimachinery/pkg/util/p=
roxy/upgradeaware.go b/src/import/staging/src/k8s.io/apimachinery/pkg/util/=
proxy/upgradeaware.go
>>     +index fcdc76a0529..3a02919d135 100644
>>     +--- a/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/up=
gradeaware.go
>>     ++++ b/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/up=
gradeaware.go
>>     +@@ -298,6 +298,16 @@ func (h *UpgradeAwareHandler) tryUpgrade(w ht=
tp.ResponseWriter, req *http.Reques
>>     +               rawResponse =3D headerBytes
>>     +       }
>>     +
>>     ++      // If the backend did not upgrade the request, return an er=
ror to the client. If the response was
>>     ++      // an error, the error is forwarded directly after the conn=
ection is hijacked. Otherwise, just
>>     ++      // return a generic error here.
>>     ++      if backendHTTPResponse.StatusCode !=3D http.StatusSwitching=
Protocols && backendHTTPResponse.StatusCode < 400 {
>>     ++              err :=3D fmt.Errorf("invalid upgrade response: stat=
us code %d", backendHTTPResponse.StatusCode)
>>     ++              klog.Errorf("Proxy upgrade error: %v", err)
>>     ++              h.Responder.Error(w, req, err)
>>     ++              return true
>>     ++      }
>>     ++
>>     +       // Once the connection is hijacked, the ErrorResponder will=
 no longer work, so
>>     +       // hijacking should be the last step in the upgrade.
>>     +       requestHijacker, ok :=3D w.(http.Hijacker)
>>     +diff --git a/src/import/staging/src/k8s.io/apimachinery/pkg/util/p=
roxy/upgradeaware_test.go b/src/import/staging/src/k8s.io/apimachinery/pkg/=
util/proxy/upgradeaware_test.go
>>     +index 7d14f6534a8..236362373cd 100644
>>     +--- a/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/up=
gradeaware_test.go
>>     ++++ b/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/up=
gradeaware_test.go
>>     +@@ -493,7 +493,7 @@ func (r *noErrorsAllowed) Error(w http.Respons=
eWriter, req *http.Request, err er
>>     +       r.t.Error(err)
>>     + }
>>     +
>>     +-func TestProxyUpgradeErrorResponse(t *testing.T) {
>>     ++func TestProxyUpgradeConnectionErrorResponse(t *testing.T) {
>>     +       var (
>>     +               responder   *fakeResponder
>>     +               expectedErr =3D errors.New("EXPECTED")
>>     +@@ -541,7 +541,7 @@ func TestProxyUpgradeErrorResponse(t *testing.=
T) {
>>     +=20
>>     + func TestProxyUpgradeErrorResponseTerminates(t *testing.T) {
>>     +       for _, intercept :=3D range []bool{true, false} {
>>     +-              for _, code :=3D range []int{200, 400, 500} {
>>     ++              for _, code :=3D range []int{400, 500} {
>>     +                       t.Run(fmt.Sprintf("intercept=3D%v,code=3D%v=
", intercept, code), func(t *testing.T) {
>>     +                               // Set up a backend server
>>     +                               backend :=3D http.NewServeMux()
>>     +@@ -601,6 +601,49 @@ func TestProxyUpgradeErrorResponseTerminates(=
t *testing.T) {
>>     +       }
>>     + }
>>     +
>>     ++func TestProxyUpgradeErrorResponse(t *testing.T) {
>>     ++      for _, intercept :=3D range []bool{true, false} {
>>     ++              for _, code :=3D range []int{200, 300, 302, 307} {
>>     ++                      t.Run(fmt.Sprintf("intercept=3D%v,code=3D%v=
", intercept, code), func(t *testing.T) {
>>     ++                              // Set up a backend server
>>     ++                              backend :=3D http.NewServeMux()
>>     ++                              backend.Handle("/hello", http.Handl=
erFunc(func(w http.ResponseWriter, r *http.Request) {
>>     ++                                      http.Redirect(w, r, "https:=
//example.com/there", code)
>>     ++                              }))
>>     ++                              backendServer :=3D httptest.NewServ=
er(backend)
>>     ++                              defer backendServer.Close()
>>     ++                              backendServerURL, _ :=3D url.Parse(=
backendServer.URL)
>>     ++                              backendServerURL.Path =3D "/hello"
>>     ++
>>     ++                              // Set up a proxy pointing to a spe=
cific path on the backend
>>     ++                              proxyHandler :=3D NewUpgradeAwareHa=
ndler(backendServerURL, nil, false, false, &fakeResponder{t: t})
>>     ++                              proxyHandler.InterceptRedirects =3D=
 intercept
>>     ++                              proxyHandler.RequireSameHostRedirec=
ts =3D true
>>     ++                              proxy :=3D httptest.NewServer(proxy=
Handler)
>>     ++                              defer proxy.Close()
>>     ++                              proxyURL, _ :=3D url.Parse(proxy.UR=
L)
>>     ++
>>     ++                              conn, err :=3D net.Dial("tcp", prox=
yURL.Host)
>>     ++                              require.NoError(t, err)
>>     ++                              bufferedReader :=3D bufio.NewReader=
(conn)
>>     ++
>>     ++                              // Send upgrade request resulting i=
n a non-101 response from the backend
>>     ++                              req, _ :=3D http.NewRequest("GET", =
"/", nil)
>>     ++                              req.Header.Set(httpstream.HeaderCon=
nection, httpstream.HeaderUpgrade)
>>     ++                              require.NoError(t, req.Write(conn))
>>     ++                              // Verify we get the correct respon=
se and full message body content
>>     ++                              resp, err :=3D http.ReadResponse(bu=
fferedReader, nil)
>>     ++                              require.NoError(t, err)
>>     ++                              assert.Equal(t, fakeStatusCode, res=
p.StatusCode)
>>     ++                              resp.Body.Close()
>>     ++
>>     ++                              // clean up
>>     ++                              conn.Close()
>>     ++                      })
>>     ++              }
>>     ++      }
>>     ++}
>>     ++
>>     + func TestDefaultProxyTransport(t *testing.T) {
>>     +       tests :=3D []struct {
>>     +               name,
>>     +--
>>     +2.17.0
>>     +
>>     diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/reci=
pes-containers/kubernetes/kubernetes_git.bb
>>     index 941e0ca..fbe2dd8 100644
>>     --- a/recipes-containers/kubernetes/kubernetes_git.bb
>>     +++ b/recipes-containers/kubernetes/kubernetes_git.bb
>>     @@ -16,6 +16,9 @@ SRC_URI =3D "git://github.com/kubernetes/kubernet=
es.git;branch=3Drelease-1.16;name=3Dk
>>                 file://CVE-2020-8552.patch \
>>                 file://CVE-2020-8555.patch \
>>                 file://CVE-2019-11254.patch \
>>     +           file://CVE-2020-8557.patch \
>>     +           file://CVE-2020-8558.patch \
>>     +           file://CVE-2020-8559.patch \
>>                "
>>
>>      DEPENDS +=3D "rsync-native \
>>
>>
>>    =20
>>
>> --
>> ---------------------
>> Thanks,
>> Zhixiong Chi
>> Tel: +86-10-8477-7036
>>
--=20
---------------------
Thanks,
Zhixiong Chi
Tel: +86-10-8477-7036


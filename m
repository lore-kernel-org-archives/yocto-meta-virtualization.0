Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.4236.1596098080987426994
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 01:34:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: zhixiong.chi@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06U8Xrx0001749
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Thu, 30 Jul 2020 01:34:13 -0700
Received: from [128.224.162.237] (128.224.162.237) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Thu, 30 Jul 2020
 01:33:57 -0700
Subject: Re: [meta-virtualization][zeus][PATCH] kubernetes: fix three CVE issues
To: <bruce.ashfield@gmail.com>, <meta-virtualization@lists.yoctoproject.org>
References: <16267A948D96B982.15129@lists.yoctoproject.org>
From: "Zhixiong Chi" <zhixiong.chi@windriver.com>
Message-ID: <6e83d4b7-e38b-b68f-2b10-82992de6e845@windriver.com>
Date: Thu, 30 Jul 2020 16:35:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <16267A948D96B982.15129@lists.yoctoproject.org>
Content-Type: multipart/alternative;
	boundary="------------66929AB0FD31C22DB071C50E"
Content-Language: en-US

--------------66929AB0FD31C22DB071C50E
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 06U8Xrx0001749

Hi Bruce,

After the last CVE-1019-11254 patch merged, this patch can be applied
successfully.

Thanks.

On 2020/7/30 =E4=B8=8B=E5=8D=884:30, Zhixiong Chi wrote:
> Backport the patches from the upstream:
> https://github.com/kubernetes/kubernetes.git  [branch: release-1.16]
> ba3ca4929ed3887c95f94fcf97610f3449446804
> 68750fefd3df76b7b008ef7b18e8acd18d5c2f2e
> d22a61e21d677f7527bc8a4aeb3288c5e11dd49b
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  .../kubernetes/kubernetes/CVE-2020-8557.patch | 179 ++++++++++++++++++
>  .../kubernetes/kubernetes/CVE-2020-8558.patch |  51 +++++
>  .../kubernetes/kubernetes/CVE-2020-8559.patch | 148 +++++++++++++++
>  .../kubernetes/kubernetes_git.bb              |   3 +
>  4 files changed, 381 insertions(+)
>  create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2020-85=
57.patch
>  create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2020-85=
58.patch
>  create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2020-85=
59.patch
>
> diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2020-8557.patc=
h b/recipes-containers/kubernetes/kubernetes/CVE-2020-8557.patch
> new file mode 100644
> index 0000000..dd70627
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/CVE-2020-8557.patch
> @@ -0,0 +1,179 @@
> +From 68750fefd3df76b7b008ef7b18e8acd18d5c2f2e Mon Sep 17 00:00:00 2001
> +From: Joel Smith <joesmith@redhat.com>
> +Date: Thu, 14 May 2020 20:09:58 -0600
> +Subject: [PATCH] Include pod /etc/hosts in ephemeral storage calculatio=
n for
> + eviction
> +
> +CVE: CVE-2020-8557
> +Upstream-Status: Backport [https://github.com/kubernetes/kubernetes.git=
 branch:release-1.16]
> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> +---
> + src/import/pkg/kubelet/eviction/BUILD               | 1 +
> + src/import/pkg/kubelet/eviction/eviction_manager.go | 7 ++++++-
> + src/import/pkg/kubelet/eviction/helpers.go          | 9 ++++++++-
> + src/import/pkg/kubelet/kubelet.go                   | 3 ++-
> + src/import/pkg/kubelet/kubelet_pods.go              | 7 ++++++-
> + src/import/pkg/kubelet/kubelet_test.go              | 3 ++-
> + src/import/pkg/kubelet/runonce_test.go              | 3 ++-
> + 7 files changed, 27 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/import/pkg/kubelet/eviction/BUILD b/src/import/pkg/kub=
elet/eviction/BUILD
> +index 2209b26d7d4..e8c2241e075 100644
> +--- a/src/import/pkg/kubelet/eviction/BUILD
> ++++ b/src/import/pkg/kubelet/eviction/BUILD
> +@@ -66,6 +66,7 @@ go_library(
> +         "//staging/src/k8s.io/api/core/v1:go_default_library",
> +         "//staging/src/k8s.io/apimachinery/pkg/api/resource:go_default=
_library",
> +         "//staging/src/k8s.io/apimachinery/pkg/apis/meta/v1:go_default=
_library",
> ++        "//staging/src/k8s.io/apimachinery/pkg/types:go_default_librar=
y",
> +         "//staging/src/k8s.io/apimachinery/pkg/util/clock:go_default_l=
ibrary",
> +         "//staging/src/k8s.io/apiserver/pkg/util/feature:go_default_li=
brary",
> +         "//staging/src/k8s.io/client-go/tools/record:go_default_librar=
y",
> +diff --git a/src/import/pkg/kubelet/eviction/eviction_manager.go b/src/=
import/pkg/kubelet/eviction/eviction_manager.go
> +index 4ef2a89dce6..ca218cb942f 100644
> +--- a/src/import/pkg/kubelet/eviction/eviction_manager.go
> ++++ b/src/import/pkg/kubelet/eviction/eviction_manager.go
> +@@ -26,6 +26,7 @@ import (
> +=20
> + =09v1 "k8s.io/api/core/v1"
> + =09"k8s.io/apimachinery/pkg/api/resource"
> ++	"k8s.io/apimachinery/pkg/types"
> + =09"k8s.io/apimachinery/pkg/util/clock"
> + =09utilfeature "k8s.io/apiserver/pkg/util/feature"
> + =09"k8s.io/client-go/tools/record"
> +@@ -90,6 +91,8 @@ type managerImpl struct {
> + =09thresholdNotifiers []ThresholdNotifier
> + =09// thresholdsLastUpdated is the last time the thresholdNotifiers we=
re updated.
> + =09thresholdsLastUpdated time.Time
> ++	// etcHostsPath is a function that will get the etc-hosts file's path=
 for a pod given its UID
> ++	etcHostsPath func(podUID types.UID) string
> + }
> +=20
> + // ensure it implements the required interface
> +@@ -106,6 +109,7 @@ func NewManager(
> + =09recorder record.EventRecorder,
> + =09nodeRef *v1.ObjectReference,
> + =09clock clock.Clock,
> ++	etcHostsPath func(types.UID) string,
> + ) (Manager, lifecycle.PodAdmitHandler) {
> + =09manager :=3D &managerImpl{
> + =09	clock:                        clock,
> +@@ -121,6 +125,7 @@ func NewManager(
> + =09	thresholdsFirstObservedAt:    thresholdsObservedAt{},
> + =09	dedicatedImageFs:             nil,
> + =09	thresholdNotifiers:           []ThresholdNotifier{},
> ++	=09etcHostsPath:                 etcHostsPath,
> + =09}
> + =09return manager, manager
> + }
> +@@ -503,7 +508,7 @@ func (m *managerImpl) podEphemeralStorageLimitEvict=
ion(podStats statsapi.PodStat
> + =09} else {
> + =09	fsStatsSet =3D []fsStatsType{fsStatsRoot, fsStatsLogs, fsStatsLoca=
lVolumeSource}
> + =09}
> +-	podEphemeralUsage, err :=3D podLocalEphemeralStorageUsage(podStats, p=
od, fsStatsSet)
> ++	podEphemeralUsage, err :=3D podLocalEphemeralStorageUsage(podStats, p=
od, fsStatsSet, m.etcHostsPath(pod.UID))
> + =09if err !=3D nil {
> + =09	klog.Errorf("eviction manager: error getting pod disk usage %v", e=
rr)
> + =09	return false
> +diff --git a/src/import/pkg/kubelet/eviction/helpers.go b/src/import/pk=
g/kubelet/eviction/helpers.go
> +index dfdb8ce3b60..41c55855aad 100644
> +--- a/src/import/pkg/kubelet/eviction/helpers.go
> ++++ b/src/import/pkg/kubelet/eviction/helpers.go
> +@@ -18,6 +18,7 @@ package eviction
> +=20
> + import (
> + =09"fmt"
> ++	"os"
> + =09"sort"
> + =09"strconv"
> + =09"strings"
> +@@ -415,7 +416,7 @@ func localEphemeralVolumeNames(pod *v1.Pod) []strin=
g {
> + }
> +=20
> + // podLocalEphemeralStorageUsage aggregates pod local ephemeral storag=
e usage and inode consumption for the specified stats to measure.
> +-func podLocalEphemeralStorageUsage(podStats statsapi.PodStats, pod *v1=
.Pod, statsToMeasure []fsStatsType) (v1.ResourceList, error) {
> ++func podLocalEphemeralStorageUsage(podStats statsapi.PodStats, pod *v1=
.Pod, statsToMeasure []fsStatsType, etcHostsPath string) (v1.ResourceList, =
error) {
> + =09disk :=3D resource.Quantity{Format: resource.BinarySI}
> + =09inodes :=3D resource.Quantity{Format: resource.DecimalSI}
> +=20
> +@@ -429,6 +430,12 @@ func podLocalEphemeralStorageUsage(podStats statsa=
pi.PodStats, pod *v1.Pod, stat
> + =09	disk.Add(podLocalVolumeUsageList[v1.ResourceEphemeralStorage])
> + =09	inodes.Add(podLocalVolumeUsageList[resourceInodes])
> + =09}
> ++	if len(etcHostsPath) > 0 {
> ++	=09if stat, err :=3D os.Stat(etcHostsPath); err =3D=3D nil {
> ++	=09	disk.Add(*resource.NewQuantity(int64(stat.Size()), resource.Binar=
ySI))
> ++	=09	inodes.Add(*resource.NewQuantity(int64(1), resource.DecimalSI))
> ++	=09}
> ++	}
> + =09return v1.ResourceList{
> + =09	v1.ResourceEphemeralStorage: disk,
> + =09	resourceInodes:              inodes,
> +diff --git a/src/import/pkg/kubelet/kubelet.go b/src/import/pkg/kubelet=
/kubelet.go
> +index c2acd358e59..8da5d0f2e92 100644
> +--- a/src/import/pkg/kubelet/kubelet.go
> ++++ b/src/import/pkg/kubelet/kubelet.go
> +@@ -831,8 +831,9 @@ func NewMainKubelet(kubeCfg *kubeletconfiginternal.=
KubeletConfiguration,
> + =09klet.backOff =3D flowcontrol.NewBackOff(backOffPeriod, MaxContainer=
BackOff)
> + =09klet.podKillingCh =3D make(chan *kubecontainer.PodPair, podKillingC=
hannelCapacity)
> +=20
> ++	etcHostsPathFunc :=3D func(podUID types.UID) string { return getEtcHo=
stsPath(klet.getPodDir(podUID)) }
> + =09// setup eviction manager
> +-	evictionManager, evictionAdmitHandler :=3D eviction.NewManager(klet.r=
esourceAnalyzer, evictionConfig, killPodNow(klet.podWorkers, kubeDeps.Recor=
der), klet.podManager.GetMirrorPodByPod, klet.imageManager, klet.containerG=
C, kubeDeps.Recorder, nodeRef, klet.clock)
> ++	evictionManager, evictionAdmitHandler :=3D eviction.NewManager(klet.r=
esourceAnalyzer, evictionConfig, killPodNow(klet.podWorkers, kubeDeps.Recor=
der), klet.podManager.GetMirrorPodByPod, klet.imageManager, klet.containerG=
C, kubeDeps.Recorder, nodeRef, klet.clock, etcHostsPathFunc)
> +=20
> + =09klet.evictionManager =3D evictionManager
> + =09klet.admitHandlers.AddPodAdmitHandler(evictionAdmitHandler)
> +diff --git a/src/import/pkg/kubelet/kubelet_pods.go b/src/import/pkg/ku=
belet/kubelet_pods.go
> +index 013d0f55aea..02857d4b5b3 100644
> +--- a/src/import/pkg/kubelet/kubelet_pods.go
> ++++ b/src/import/pkg/kubelet/kubelet_pods.go
> +@@ -291,10 +291,15 @@ func translateMountPropagation(mountMode *v1.Moun=
tPropagationMode) (runtimeapi.M
> + =09}
> + }
> +=20
> ++// getEtcHostsPath returns the full host-side path to a pod's generate=
d /etc/hosts file
> ++func getEtcHostsPath(podDir string) string {
> ++	return path.Join(podDir, "etc-hosts")
> ++}
> ++
> + // makeHostsMount makes the mountpoint for the hosts file that the con=
tainers
> + // in a pod are injected with.
> + func makeHostsMount(podDir, podIP, hostName, hostDomainName string, ho=
stAliases []v1.HostAlias, useHostNetwork bool) (*kubecontainer.Mount, error=
) {
> +-	hostsFilePath :=3D path.Join(podDir, "etc-hosts")
> ++	hostsFilePath :=3D getEtcHostsPath(podDir)
> + =09if err :=3D ensureHostsFile(hostsFilePath, podIP, hostName, hostDom=
ainName, hostAliases, useHostNetwork); err !=3D nil {
> + =09	return nil, err
> + =09}
> +diff --git a/src/import/pkg/kubelet/kubelet_test.go b/src/import/pkg/ku=
belet/kubelet_test.go
> +index 80c6dcb73b6..9fb417fbb9d 100644
> +--- a/src/import/pkg/kubelet/kubelet_test.go
> ++++ b/src/import/pkg/kubelet/kubelet_test.go
> +@@ -291,8 +291,9 @@ func newTestKubeletWithImageList(
> + =09	UID:       types.UID(kubelet.nodeName),
> + =09	Namespace: "",
> + =09}
> ++	etcHostsPathFunc :=3D func(podUID types.UID) string { return getEtcHo=
stsPath(kubelet.getPodDir(podUID)) }
> + =09// setup eviction manager
> +-	evictionManager, evictionAdmitHandler :=3D eviction.NewManager(kubele=
t.resourceAnalyzer, eviction.Config{}, killPodNow(kubelet.podWorkers, fakeR=
ecorder), kubelet.podManager.GetMirrorPodByPod, kubelet.imageManager, kubel=
et.containerGC, fakeRecorder, nodeRef, kubelet.clock)
> ++	evictionManager, evictionAdmitHandler :=3D eviction.NewManager(kubele=
t.resourceAnalyzer, eviction.Config{}, killPodNow(kubelet.podWorkers, fakeR=
ecorder), kubelet.podManager.GetMirrorPodByPod, kubelet.imageManager, kubel=
et.containerGC, fakeRecorder, nodeRef, kubelet.clock, etcHostsPathFunc)
> +=20
> + =09kubelet.evictionManager =3D evictionManager
> + =09kubelet.admitHandlers.AddPodAdmitHandler(evictionAdmitHandler)
> +diff --git a/src/import/pkg/kubelet/runonce_test.go b/src/import/pkg/ku=
belet/runonce_test.go
> +index 7239133e481..9b162c11702 100644
> +--- a/src/import/pkg/kubelet/runonce_test.go
> ++++ b/src/import/pkg/kubelet/runonce_test.go
> +@@ -125,7 +125,8 @@ func TestRunOnce(t *testing.T) {
> + =09	return nil
> + =09}
> + =09fakeMirrodPodFunc :=3D func(*v1.Pod) (*v1.Pod, bool) { return nil, =
false }
> +-	evictionManager, evictionAdmitHandler :=3D eviction.NewManager(kb.res=
ourceAnalyzer, eviction.Config{}, fakeKillPodFunc, fakeMirrodPodFunc, nil, =
nil, kb.recorder, nodeRef, kb.clock)
> ++	etcHostsPathFunc :=3D func(podUID types.UID) string { return getEtcHo=
stsPath(kb.getPodDir(podUID)) }
> ++	evictionManager, evictionAdmitHandler :=3D eviction.NewManager(kb.res=
ourceAnalyzer, eviction.Config{}, fakeKillPodFunc, fakeMirrodPodFunc, nil, =
nil, kb.recorder, nodeRef, kb.clock, etcHostsPathFunc)
> +=20
> + =09kb.evictionManager =3D evictionManager
> + =09kb.admitHandlers.AddPodAdmitHandler(evictionAdmitHandler)
> +--=20
> +2.17.0
> +
> diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2020-8558.patc=
h b/recipes-containers/kubernetes/kubernetes/CVE-2020-8558.patch
> new file mode 100644
> index 0000000..9eeed26
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/CVE-2020-8558.patch
> @@ -0,0 +1,51 @@
> +From d22a61e21d677f7527bc8a4aeb3288c5e11dd49b Mon Sep 17 00:00:00 2001
> +From: Casey Callendrello <cdc@redhat.com>
> +Date: Fri, 29 May 2020 13:03:37 +0200
> +Subject: [PATCH] kubelet: block non-forwarded packets from crossing the
> + localhost boundary
> +
> +We set route_localnet so that host-network processes can connect to
> +<127.0.0.1:NodePort> and it still works. This, however, is too
> +permissive.
> +
> +So, block martians that are not already in conntrack.
> +
> +See: #90259
> +Signed-off-by: Casey Callendrello <cdc@redhat.com>
> +CVE: CVE-2020-8558
> +Upstream-Status: Backport [https://github.com/kubernetes/kubernetes.git=
 branch:release-1.16]
> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> +---
> + src/import/pkg/kubelet/kubelet_network_linux.go | 16 ++++++++++++++++
> + 1 file changed, 16 insertions(+)
> +
> +diff --git a/src/import/pkg/kubelet/kubelet_network_linux.go b/src/impo=
rt/pkg/kubelet/kubelet_network_linux.go
> +index 1c9ad46b989..d18ab75a053 100644
> +--- a/src/import/pkg/kubelet/kubelet_network_linux.go
> ++++ b/src/import/pkg/kubelet/kubelet_network_linux.go
> +@@ -68,6 +68,22 @@ func (kl *Kubelet) syncNetworkUtil() {
> + =09	klog.Errorf("Failed to ensure rule to drop packet marked by %v in =
%v chain %v: %v", KubeMarkDropChain, utiliptables.TableFilter, KubeFirewall=
Chain, err)
> + =09	return
> + =09}
> ++
> ++	// drop all non-local packets to localhost if they're not part of an =
existing
> ++	// forwarded connection. See #90259
> ++	if !kl.iptClient.IsIpv6() { // ipv6 doesn't have this issue
> ++	=09if _, err :=3D kl.iptClient.EnsureRule(utiliptables.Append, utilip=
tables.TableFilter, KubeFirewallChain,
> ++	=09	"-m", "comment", "--comment", "block incoming localnet connection=
s",
> ++	=09	"--dst", "127.0.0.0/8",
> ++	=09	"!", "--src", "127.0.0.0/8",
> ++	=09	"-m", "conntrack",
> ++	=09	"!", "--ctstate", "RELATED,ESTABLISHED,DNAT",
> ++	=09	"-j", "DROP"); err !=3D nil {
> ++	=09	klog.Errorf("Failed to ensure rule to drop invalid localhost pack=
ets in %v chain %v: %v", utiliptables.TableFilter, KubeFirewallChain, err)
> ++	=09	return
> ++	=09}
> ++	}
> ++
> + =09if _, err :=3D kl.iptClient.EnsureRule(utiliptables.Prepend, utilip=
tables.TableFilter, utiliptables.ChainOutput, "-j", string(KubeFirewallChai=
n)); err !=3D nil {
> + =09	klog.Errorf("Failed to ensure that %s chain %s jumps to %s: %v", u=
tiliptables.TableFilter, utiliptables.ChainOutput, KubeFirewallChain, err)
> + =09	return
> +--=20
> +2.17.0
> +
> diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2020-8559.patc=
h b/recipes-containers/kubernetes/kubernetes/CVE-2020-8559.patch
> new file mode 100644
> index 0000000..f47826d
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/CVE-2020-8559.patch
> @@ -0,0 +1,148 @@
> +From ba3ca4929ed3887c95f94fcf97610f3449446804 Mon Sep 17 00:00:00 2001
> +From: Tim Allclair <tallclair@google.com>
> +Date: Wed, 17 Jun 2020 11:09:02 -0700
> +Subject: [PATCH] Don't return proxied redirects to the client
> +
> +CVE: CVE-2020-8559
> +Upstream-Status: Backport [https://github.com/kubernetes/kubernetes.git=
 branch:release-1.16]
> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> +---
> + .../k8s.io/apimachinery/pkg/util/net/http.go  |  2 +-
> + .../apimachinery/pkg/util/net/http_test.go    | 12 ++---
> + .../pkg/util/proxy/upgradeaware.go            | 10 ++++
> + .../pkg/util/proxy/upgradeaware_test.go       | 47 ++++++++++++++++++-
> + 4 files changed, 62 insertions(+), 9 deletions(-)
> +
> +diff --git a/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/ht=
tp.go b/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http.go
> +index bd79d6c4a09..c24fbc6921c 100644
> +--- a/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http.go
> ++++ b/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http.go
> +@@ -431,7 +431,7 @@ redirectLoop:
> +=20
> + =09	// Only follow redirects to the same host. Otherwise, propagate th=
e redirect response back.
> + =09	if requireSameHostRedirects && location.Hostname() !=3D originalLo=
cation.Hostname() {
> +-	=09	break redirectLoop
> ++	=09	return nil, nil, fmt.Errorf("hostname mismatch: expected %s, foun=
d %s", originalLocation.Hostname(), location.Hostname())
> + =09	}
> +=20
> + =09	// Reset the connection.
> +diff --git a/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/ht=
tp_test.go b/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http_t=
est.go
> +index 4e4e317b9a4..142b80f1a84 100644
> +--- a/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http_test=
.go
> ++++ b/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http_test=
.go
> +@@ -330,13 +330,13 @@ func TestConnectWithRedirects(t *testing.T) {
> + =09	redirects:   []string{"/1", "/2", "/3", "/4", "/5", "/6", "/7", "/=
8", "/9", "/10"},
> + =09	expectError: true,
> + =09}, {
> +-	=09desc:              "redirect to different host are prevented",
> +-	=09redirects:         []string{"http://example.com/foo"},
> +-	=09expectedRedirects: 0,
> ++	=09desc:        "redirect to different host are prevented",
> ++	=09redirects:   []string{"http://example.com/foo"},
> ++	=09expectError: true,
> + =09}, {
> +-	=09desc:              "multiple redirect to different host forbidden"=
,
> +-	=09redirects:         []string{"/1", "/2", "/3", "http://example.com/=
foo"},
> +-	=09expectedRedirects: 3,
> ++	=09desc:        "multiple redirect to different host forbidden",
> ++	=09redirects:   []string{"/1", "/2", "/3", "http://example.com/foo"},
> ++	=09expectError: true,
> + =09}, {
> + =09	desc:              "redirect to different port is allowed",
> + =09	redirects:         []string{"http://HOST/foo"},
> +diff --git a/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/=
upgradeaware.go b/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy=
/upgradeaware.go
> +index fcdc76a0529..3a02919d135 100644
> +--- a/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgrade=
aware.go
> ++++ b/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgrade=
aware.go
> +@@ -298,6 +298,16 @@ func (h *UpgradeAwareHandler) tryUpgrade(w http.Re=
sponseWriter, req *http.Reques
> + =09	rawResponse =3D headerBytes
> + =09}
> +=20
> ++	// If the backend did not upgrade the request, return an error to the=
 client. If the response was
> ++	// an error, the error is forwarded directly after the connection is =
hijacked. Otherwise, just
> ++	// return a generic error here.
> ++	if backendHTTPResponse.StatusCode !=3D http.StatusSwitchingProtocols =
&& backendHTTPResponse.StatusCode < 400 {
> ++	=09err :=3D fmt.Errorf("invalid upgrade response: status code %d", ba=
ckendHTTPResponse.StatusCode)
> ++	=09klog.Errorf("Proxy upgrade error: %v", err)
> ++	=09h.Responder.Error(w, req, err)
> ++	=09return true
> ++	}
> ++
> + =09// Once the connection is hijacked, the ErrorResponder will no long=
er work, so
> + =09// hijacking should be the last step in the upgrade.
> + =09requestHijacker, ok :=3D w.(http.Hijacker)
> +diff --git a/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/=
upgradeaware_test.go b/src/import/staging/src/k8s.io/apimachinery/pkg/util/=
proxy/upgradeaware_test.go
> +index 7d14f6534a8..236362373cd 100644
> +--- a/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgrade=
aware_test.go
> ++++ b/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgrade=
aware_test.go
> +@@ -493,7 +493,7 @@ func (r *noErrorsAllowed) Error(w http.ResponseWrit=
er, req *http.Request, err er
> + =09r.t.Error(err)
> + }
> +=20
> +-func TestProxyUpgradeErrorResponse(t *testing.T) {
> ++func TestProxyUpgradeConnectionErrorResponse(t *testing.T) {
> + =09var (
> + =09	responder   *fakeResponder
> + =09	expectedErr =3D errors.New("EXPECTED")
> +@@ -541,7 +541,7 @@ func TestProxyUpgradeErrorResponse(t *testing.T) {
> +=20
> + func TestProxyUpgradeErrorResponseTerminates(t *testing.T) {
> + =09for _, intercept :=3D range []bool{true, false} {
> +-	=09for _, code :=3D range []int{200, 400, 500} {
> ++	=09for _, code :=3D range []int{400, 500} {
> + =09	=09t.Run(fmt.Sprintf("intercept=3D%v,code=3D%v", intercept, code),=
 func(t *testing.T) {
> + =09	=09	// Set up a backend server
> + =09	=09	backend :=3D http.NewServeMux()
> +@@ -601,6 +601,49 @@ func TestProxyUpgradeErrorResponseTerminates(t *te=
sting.T) {
> + =09}
> + }
> +=20
> ++func TestProxyUpgradeErrorResponse(t *testing.T) {
> ++	for _, intercept :=3D range []bool{true, false} {
> ++	=09for _, code :=3D range []int{200, 300, 302, 307} {
> ++	=09	t.Run(fmt.Sprintf("intercept=3D%v,code=3D%v", intercept, code), f=
unc(t *testing.T) {
> ++	=09	=09// Set up a backend server
> ++	=09	=09backend :=3D http.NewServeMux()
> ++	=09	=09backend.Handle("/hello", http.HandlerFunc(func(w http.Response=
Writer, r *http.Request) {
> ++	=09	=09	http.Redirect(w, r, "https://example.com/there", code)
> ++	=09	=09}))
> ++	=09	=09backendServer :=3D httptest.NewServer(backend)
> ++	=09	=09defer backendServer.Close()
> ++	=09	=09backendServerURL, _ :=3D url.Parse(backendServer.URL)
> ++	=09	=09backendServerURL.Path =3D "/hello"
> ++
> ++	=09	=09// Set up a proxy pointing to a specific path on the backend
> ++	=09	=09proxyHandler :=3D NewUpgradeAwareHandler(backendServerURL, nil=
, false, false, &fakeResponder{t: t})
> ++	=09	=09proxyHandler.InterceptRedirects =3D intercept
> ++	=09	=09proxyHandler.RequireSameHostRedirects =3D true
> ++	=09	=09proxy :=3D httptest.NewServer(proxyHandler)
> ++	=09	=09defer proxy.Close()
> ++	=09	=09proxyURL, _ :=3D url.Parse(proxy.URL)
> ++
> ++	=09	=09conn, err :=3D net.Dial("tcp", proxyURL.Host)
> ++	=09	=09require.NoError(t, err)
> ++	=09	=09bufferedReader :=3D bufio.NewReader(conn)
> ++
> ++	=09	=09// Send upgrade request resulting in a non-101 response from t=
he backend
> ++	=09	=09req, _ :=3D http.NewRequest("GET", "/", nil)
> ++	=09	=09req.Header.Set(httpstream.HeaderConnection, httpstream.HeaderU=
pgrade)
> ++	=09	=09require.NoError(t, req.Write(conn))
> ++	=09	=09// Verify we get the correct response and full message body co=
ntent
> ++	=09	=09resp, err :=3D http.ReadResponse(bufferedReader, nil)
> ++	=09	=09require.NoError(t, err)
> ++	=09	=09assert.Equal(t, fakeStatusCode, resp.StatusCode)
> ++	=09	=09resp.Body.Close()
> ++
> ++	=09	=09// clean up
> ++	=09	=09conn.Close()
> ++	=09	})
> ++	=09}
> ++	}
> ++}
> ++
> + func TestDefaultProxyTransport(t *testing.T) {
> + =09tests :=3D []struct {
> + =09	name,
> +--=20
> +2.17.0
> +
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-c=
ontainers/kubernetes/kubernetes_git.bb
> index 941e0ca..fbe2dd8 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -16,6 +16,9 @@ SRC_URI =3D "git://github.com/kubernetes/kubernetes.gi=
t;branch=3Drelease-1.16;name=3Dk
>             file://CVE-2020-8552.patch \
>             file://CVE-2020-8555.patch \
>             file://CVE-2019-11254.patch \
> +           file://CVE-2020-8557.patch \
> +           file://CVE-2020-8558.patch \
> +           file://CVE-2020-8559.patch \
>            "
>  
>  DEPENDS +=3D "rsync-native \
>
>=20

--=20
---------------------
Thanks,
Zhixiong Chi
Tel: +86-10-8477-7036


--------------66929AB0FD31C22DB071C50E
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5IHRleHQ9IiMw
MDAwMDAiIGJnY29sb3I9IiNGRkZGRkYiPgogICAgPHA+SGkgQnJ1Y2UsPC9wPgogICAgPHA+QWZ0
ZXIgdGhlIGxhc3QgQ1ZFLTEwMTktMTEyNTQgcGF0Y2ggbWVyZ2VkLCB0aGlzIHBhdGNoIGNhbiBi
ZQogICAgICBhcHBsaWVkIHN1Y2Nlc3NmdWxseS48L3A+CiAgICA8cD5UaGFua3MuPGJyPgogICAg
PC9wPgogICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiAyMDIwLzcvMzAg5LiL5Y2I
NDozMCwgWmhpeGlvbmcgQ2hpCiAgICAgIHdyb3RlOjxicj4KICAgIDwvZGl2PgogICAgPGJsb2Nr
cXVvdGUgdHlwZT0iY2l0ZSIKICAgICAgY2l0ZT0ibWlkOjE2MjY3QTk0OEQ5NkI5ODIuMTUxMjlA
bGlzdHMueW9jdG9wcm9qZWN0Lm9yZyI+CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUi
IHdyYXA9IiI+QmFja3BvcnQgdGhlIHBhdGNoZXMgZnJvbSB0aGUgdXBzdHJlYW06CjxhIGNsYXNz
PSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9rdWJlcm5l
dGVzL2t1YmVybmV0ZXMuZ2l0Ij5odHRwczovL2dpdGh1Yi5jb20va3ViZXJuZXRlcy9rdWJlcm5l
dGVzLmdpdDwvYT4gIFticmFuY2g6IHJlbGVhc2UtMS4xNl0KYmEzY2E0OTI5ZWQzODg3Yzk1Zjk0
ZmNmOTc2MTBmMzQ0OTQ0NjgwNAo2ODc1MGZlZmQzZGY3NmI3YjAwOGVmN2IxOGU4YWNkMThkNWMy
ZjJlCmQyMmE2MWUyMWQ2NzdmNzUyN2JjOGE0YWViMzI4OGM1ZTExZGQ0OWIKClNpZ25lZC1vZmYt
Ynk6IFpoaXhpb25nIENoaSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJt
YWlsdG86emhpeGlvbmcuY2hpQHdpbmRyaXZlci5jb20iPiZsdDt6aGl4aW9uZy5jaGlAd2luZHJp
dmVyLmNvbSZndDs8L2E+Ci0tLQogLi4uL2t1YmVybmV0ZXMva3ViZXJuZXRlcy9DVkUtMjAyMC04
NTU3LnBhdGNoIHwgMTc5ICsrKysrKysrKysrKysrKysrKwogLi4uL2t1YmVybmV0ZXMva3ViZXJu
ZXRlcy9DVkUtMjAyMC04NTU4LnBhdGNoIHwgIDUxICsrKysrCiAuLi4va3ViZXJuZXRlcy9rdWJl
cm5ldGVzL0NWRS0yMDIwLTg1NTkucGF0Y2ggfCAxNDggKysrKysrKysrKysrKysrCiAuLi4va3Vi
ZXJuZXRlcy9rdWJlcm5ldGVzX2dpdC5iYiAgICAgICAgICAgICAgfCAgIDMgKwogNCBmaWxlcyBj
aGFuZ2VkLCAzODEgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMtY29u
dGFpbmVycy9rdWJlcm5ldGVzL2t1YmVybmV0ZXMvQ1ZFLTIwMjAtODU1Ny5wYXRjaAogY3JlYXRl
IG1vZGUgMTAwNjQ0IHJlY2lwZXMtY29udGFpbmVycy9rdWJlcm5ldGVzL2t1YmVybmV0ZXMvQ1ZF
LTIwMjAtODU1OC5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMtY29udGFpbmVycy9r
dWJlcm5ldGVzL2t1YmVybmV0ZXMvQ1ZFLTIwMjAtODU1OS5wYXRjaAoKZGlmZiAtLWdpdCBhL3Jl
Y2lwZXMtY29udGFpbmVycy9rdWJlcm5ldGVzL2t1YmVybmV0ZXMvQ1ZFLTIwMjAtODU1Ny5wYXRj
aCBiL3JlY2lwZXMtY29udGFpbmVycy9rdWJlcm5ldGVzL2t1YmVybmV0ZXMvQ1ZFLTIwMjAtODU1
Ny5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi5kZDcwNjI3Ci0tLSAv
ZGV2L251bGwKKysrIGIvcmVjaXBlcy1jb250YWluZXJzL2t1YmVybmV0ZXMva3ViZXJuZXRlcy9D
VkUtMjAyMC04NTU3LnBhdGNoCkBAIC0wLDAgKzEsMTc5IEBACitGcm9tIDY4NzUwZmVmZDNkZjc2
YjdiMDA4ZWY3YjE4ZThhY2QxOGQ1YzJmMmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
OiBKb2VsIFNtaXRoIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0
bzpqb2VzbWl0aEByZWRoYXQuY29tIj4mbHQ7am9lc21pdGhAcmVkaGF0LmNvbSZndDs8L2E+CitE
YXRlOiBUaHUsIDE0IE1heSAyMDIwIDIwOjA5OjU4IC0wNjAwCitTdWJqZWN0OiBbUEFUQ0hdIElu
Y2x1ZGUgcG9kIC9ldGMvaG9zdHMgaW4gZXBoZW1lcmFsIHN0b3JhZ2UgY2FsY3VsYXRpb24gZm9y
CisgZXZpY3Rpb24KKworQ1ZFOiBDVkUtMjAyMC04NTU3CitVcHN0cmVhbS1TdGF0dXM6IEJhY2tw
b3J0IFs8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJodHRwczovL2dpdGh1
Yi5jb20va3ViZXJuZXRlcy9rdWJlcm5ldGVzLmdpdCI+aHR0cHM6Ly9naXRodWIuY29tL2t1YmVy
bmV0ZXMva3ViZXJuZXRlcy5naXQ8L2E+IGJyYW5jaDpyZWxlYXNlLTEuMTZdCitTaWduZWQtb2Zm
LWJ5OiBaaGl4aW9uZyBDaGkgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0i
bWFpbHRvOnpoaXhpb25nLmNoaUB3aW5kcml2ZXIuY29tIj4mbHQ7emhpeGlvbmcuY2hpQHdpbmRy
aXZlci5jb20mZ3Q7PC9hPgorLS0tCisgc3JjL2ltcG9ydC9wa2cva3ViZWxldC9ldmljdGlvbi9C
VUlMRCAgICAgICAgICAgICAgIHwgMSArCisgc3JjL2ltcG9ydC9wa2cva3ViZWxldC9ldmljdGlv
bi9ldmljdGlvbl9tYW5hZ2VyLmdvIHwgNyArKysrKystCisgc3JjL2ltcG9ydC9wa2cva3ViZWxl
dC9ldmljdGlvbi9oZWxwZXJzLmdvICAgICAgICAgIHwgOSArKysrKysrKy0KKyBzcmMvaW1wb3J0
L3BrZy9rdWJlbGV0L2t1YmVsZXQuZ28gICAgICAgICAgICAgICAgICAgfCAzICsrLQorIHNyYy9p
bXBvcnQvcGtnL2t1YmVsZXQva3ViZWxldF9wb2RzLmdvICAgICAgICAgICAgICB8IDcgKysrKysr
LQorIHNyYy9pbXBvcnQvcGtnL2t1YmVsZXQva3ViZWxldF90ZXN0LmdvICAgICAgICAgICAgICB8
IDMgKystCisgc3JjL2ltcG9ydC9wa2cva3ViZWxldC9ydW5vbmNlX3Rlc3QuZ28gICAgICAgICAg
ICAgIHwgMyArKy0KKyA3IGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCisKK2RpZmYgLS1naXQgYS9zcmMvaW1wb3J0L3BrZy9rdWJlbGV0L2V2aWN0aW9uL0JV
SUxEIGIvc3JjL2ltcG9ydC9wa2cva3ViZWxldC9ldmljdGlvbi9CVUlMRAoraW5kZXggMjIwOWIy
NmQ3ZDQuLmU4YzIyNDFlMDc1IDEwMDY0NAorLS0tIGEvc3JjL2ltcG9ydC9wa2cva3ViZWxldC9l
dmljdGlvbi9CVUlMRAorKysrIGIvc3JjL2ltcG9ydC9wa2cva3ViZWxldC9ldmljdGlvbi9CVUlM
RAorQEAgLTY2LDYgKzY2LDcgQEAgZ29fbGlicmFyeSgKKyAgICAgICAgICIvL3N0YWdpbmcvc3Jj
L2s4cy5pby9hcGkvY29yZS92MTpnb19kZWZhdWx0X2xpYnJhcnkiLAorICAgICAgICAgIi8vc3Rh
Z2luZy9zcmMvazhzLmlvL2FwaW1hY2hpbmVyeS9wa2cvYXBpLzxhIGNsYXNzPSJtb3otdHh0LWxp
bmstZnJlZXRleHQiIGhyZWY9InJlc291cmNlOmdvX2RlZmF1bHRfbGlicmFyeSI+cmVzb3VyY2U6
Z29fZGVmYXVsdF9saWJyYXJ5PC9hPiIsCisgICAgICAgICAiLy9zdGFnaW5nL3NyYy9rOHMuaW8v
YXBpbWFjaGluZXJ5L3BrZy9hcGlzL21ldGEvdjE6Z29fZGVmYXVsdF9saWJyYXJ5IiwKKysgICAg
ICAgICIvL3N0YWdpbmcvc3JjL2s4cy5pby9hcGltYWNoaW5lcnkvcGtnL3R5cGVzOmdvX2RlZmF1
bHRfbGlicmFyeSIsCisgICAgICAgICAiLy9zdGFnaW5nL3NyYy9rOHMuaW8vYXBpbWFjaGluZXJ5
L3BrZy91dGlsL2Nsb2NrOmdvX2RlZmF1bHRfbGlicmFyeSIsCisgICAgICAgICAiLy9zdGFnaW5n
L3NyYy9rOHMuaW8vYXBpc2VydmVyL3BrZy91dGlsL2ZlYXR1cmU6Z29fZGVmYXVsdF9saWJyYXJ5
IiwKKyAgICAgICAgICIvL3N0YWdpbmcvc3JjL2s4cy5pby9jbGllbnQtZ28vdG9vbHMvcmVjb3Jk
OmdvX2RlZmF1bHRfbGlicmFyeSIsCitkaWZmIC0tZ2l0IGEvc3JjL2ltcG9ydC9wa2cva3ViZWxl
dC9ldmljdGlvbi9ldmljdGlvbl9tYW5hZ2VyLmdvIGIvc3JjL2ltcG9ydC9wa2cva3ViZWxldC9l
dmljdGlvbi9ldmljdGlvbl9tYW5hZ2VyLmdvCitpbmRleCA0ZWYyYTg5ZGNlNi4uY2EyMThjYjk0
MmYgMTAwNjQ0CistLS0gYS9zcmMvaW1wb3J0L3BrZy9rdWJlbGV0L2V2aWN0aW9uL2V2aWN0aW9u
X21hbmFnZXIuZ28KKysrKyBiL3NyYy9pbXBvcnQvcGtnL2t1YmVsZXQvZXZpY3Rpb24vZXZpY3Rp
b25fbWFuYWdlci5nbworQEAgLTI2LDYgKzI2LDcgQEAgaW1wb3J0ICgKKyAKKyAJdjEgIms4cy5p
by9hcGkvY29yZS92MSIKKyAJIms4cy5pby9hcGltYWNoaW5lcnkvcGtnL2FwaS9yZXNvdXJjZSIK
KysJIms4cy5pby9hcGltYWNoaW5lcnkvcGtnL3R5cGVzIgorIAkiazhzLmlvL2FwaW1hY2hpbmVy
eS9wa2cvdXRpbC9jbG9jayIKKyAJdXRpbGZlYXR1cmUgIms4cy5pby9hcGlzZXJ2ZXIvcGtnL3V0
aWwvZmVhdHVyZSIKKyAJIms4cy5pby9jbGllbnQtZ28vdG9vbHMvcmVjb3JkPGEgY2xhc3M9Im1v
ei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOitAQC05MCw2KzkxLDhAQHR5cGVtYW5h
Z2VySW1wbHN0cnVjdHsrdGhyZXNob2xkTm90aWZpZXJzW11UaHJlc2hvbGROb3RpZmllcisvL3Ro
cmVzaG9sZHNMYXN0VXBkYXRlZGlzdGhlbGFzdHRpbWV0aGV0aHJlc2hvbGROb3RpZmllcnN3ZXJl
dXBkYXRlZC4rdGhyZXNob2xkc0xhc3RVcGRhdGVkdGltZS5UaW1lKysvL2V0Y0hvc3RzUGF0aGlz
YWZ1bmN0aW9udGhhdHdpbGxnZXR0aGVldGMtaG9zdHNmaWxlJ3NwYXRoZm9yYXBvZGdpdmVuaXRz
VUlEKytldGNIb3N0c1BhdGhmdW5jKHBvZFVJRHR5cGVzLlVJRClzdHJpbmcrfSsrLy9lbnN1cmVp
dGltcGxlbWVudHN0aGVyZXF1aXJlZGludGVyZmFjZStAQC0xMDYsNisxMDksN0BAZnVuY05ld01h
bmFnZXIoK3JlY29yZGVycmVjb3JkLkV2ZW50UmVjb3JkZXIsK25vZGVSZWYqdjEuT2JqZWN0UmVm
ZXJlbmNlLCtjbG9ja2Nsb2NrLkNsb2NrLCsrZXRjSG9zdHNQYXRoZnVuYyh0eXBlcy5VSUQpc3Ry
aW5nLCspKE1hbmFnZXIsbGlmZWN5Y2xlLlBvZEFkbWl0SGFuZGxlcil7K21hbmFnZXI6PSZhbXA7
bWFuYWdlckltcGx7K2Nsb2NrOmNsb2NrLCtAQC0xMjEsNisxMjUsN0BAZnVuY05ld01hbmFnZXIo
K3RocmVzaG9sZHNGaXJzdE9ic2VydmVkQXQ6dGhyZXNob2xkc09ic2VydmVkQXR7fSwrZGVkaWNh
dGVkSW1hZ2VGczpuaWwsK3RocmVzaG9sZE5vdGlmaWVyczpbXVRocmVzaG9sZE5vdGlmaWVye30s
KytldGNIb3N0c1BhdGg6ZXRjSG9zdHNQYXRoLCt9K3JldHVybm1hbmFnZXIsbWFuYWdlcit9K0BA
LTUwMyw3KzUwOCw3QEBmdW5jKG0qbWFuYWdlckltcGwpcG9kRXBoZW1lcmFsU3RvcmFnZUxpbWl0
RXZpY3Rpb24ocG9kU3RhdHNzdGF0c2FwaS5Qb2RTdGF0K31lbHNleytmc1N0YXRzU2V0PVtdZnNT
dGF0c1R5cGV7ZnNTdGF0c1Jvb3QsZnNTdGF0c0xvZ3MsZnNTdGF0c0xvY2FsVm9sdW1lU291cmNl
fSt9Ky1wb2RFcGhlbWVyYWxVc2FnZSxlcnI6PXBvZExvY2FsRXBoZW1lcmFsU3RvcmFnZVVzYWdl
KHBvZFN0YXRzLHBvZCxmc1N0YXRzU2V0KSsrcG9kRXBoZW1lcmFsVXNhZ2UsZXJyOj1wb2RMb2Nh
bEVwaGVtZXJhbFN0b3JhZ2VVc2FnZShwb2RTdGF0cyxwb2QsZnNTdGF0c1NldCxtLmV0Y0hvc3Rz
UGF0aChwb2QuVUlEKSkraWZlcnIhPW5pbHsra2xvZy5FcnJvcmYoIj4iCitAQCAtOTAsNiArOTEs
OCBAQCB0eXBlIG1hbmFnZXJJbXBsIHN0cnVjdCB7CisgCXRocmVzaG9sZE5vdGlmaWVycyBbXVRo
cmVzaG9sZE5vdGlmaWVyCisgCS8vIHRocmVzaG9sZHNMYXN0VXBkYXRlZCBpcyB0aGUgbGFzdCB0
aW1lIHRoZSB0aHJlc2hvbGROb3RpZmllcnMgd2VyZSB1cGRhdGVkLgorIAl0aHJlc2hvbGRzTGFz
dFVwZGF0ZWQgdGltZS5UaW1lCisrCS8vIGV0Y0hvc3RzUGF0aCBpcyBhIGZ1bmN0aW9uIHRoYXQg
d2lsbCBnZXQgdGhlIGV0Yy1ob3N0cyBmaWxlJ3MgcGF0aCBmb3IgYSBwb2QgZ2l2ZW4gaXRzIFVJ
RAorKwlldGNIb3N0c1BhdGggZnVuYyhwb2RVSUQgdHlwZXMuVUlEKSBzdHJpbmcKKyB9CisgCisg
Ly8gZW5zdXJlIGl0IGltcGxlbWVudHMgdGhlIHJlcXVpcmVkIGludGVyZmFjZQorQEAgLTEwNiw2
ICsxMDksNyBAQCBmdW5jIE5ld01hbmFnZXIoCisgCXJlY29yZGVyIHJlY29yZC5FdmVudFJlY29y
ZGVyLAorIAlub2RlUmVmICp2MS5PYmplY3RSZWZlcmVuY2UsCisgCWNsb2NrIGNsb2NrLkNsb2Nr
LAorKwlldGNIb3N0c1BhdGggZnVuYyh0eXBlcy5VSUQpIHN0cmluZywKKyApIChNYW5hZ2VyLCBs
aWZlY3ljbGUuUG9kQWRtaXRIYW5kbGVyKSB7CisgCW1hbmFnZXIgOj0gJmFtcDttYW5hZ2VySW1w
bHsKKyAJCWNsb2NrOiAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrLAorQEAgLTEyMSw2ICsx
MjUsNyBAQCBmdW5jIE5ld01hbmFnZXIoCisgCQl0aHJlc2hvbGRzRmlyc3RPYnNlcnZlZEF0OiAg
ICB0aHJlc2hvbGRzT2JzZXJ2ZWRBdHt9LAorIAkJZGVkaWNhdGVkSW1hZ2VGczogICAgICAgICAg
ICAgbmlsLAorIAkJdGhyZXNob2xkTm90aWZpZXJzOiAgICAgICAgICAgW11UaHJlc2hvbGROb3Rp
Zmllcnt9LAorKwkJZXRjSG9zdHNQYXRoOiAgICAgICAgICAgICAgICAgZXRjSG9zdHNQYXRoLAor
IAl9CisgCXJldHVybiBtYW5hZ2VyLCBtYW5hZ2VyCisgfQorQEAgLTUwMyw3ICs1MDgsNyBAQCBm
dW5jIChtICptYW5hZ2VySW1wbCkgcG9kRXBoZW1lcmFsU3RvcmFnZUxpbWl0RXZpY3Rpb24ocG9k
U3RhdHMgc3RhdHNhcGkuUG9kU3RhdAorIAl9IGVsc2UgeworIAkJZnNTdGF0c1NldCA9IFtdZnNT
dGF0c1R5cGV7ZnNTdGF0c1Jvb3QsIGZzU3RhdHNMb2dzLCBmc1N0YXRzTG9jYWxWb2x1bWVTb3Vy
Y2V9CisgCX0KKy0JcG9kRXBoZW1lcmFsVXNhZ2UsIGVyciA6PSBwb2RMb2NhbEVwaGVtZXJhbFN0
b3JhZ2VVc2FnZShwb2RTdGF0cywgcG9kLCBmc1N0YXRzU2V0KQorKwlwb2RFcGhlbWVyYWxVc2Fn
ZSwgZXJyIDo9IHBvZExvY2FsRXBoZW1lcmFsU3RvcmFnZVVzYWdlKHBvZFN0YXRzLCBwb2QsIGZz
U3RhdHNTZXQsIG0uZXRjSG9zdHNQYXRoKHBvZC5VSUQpKQorIAlpZiBlcnIgIT0gbmlsIHsKKyAJ
CWtsb2cuRXJyb3JmKCI8L2E+ZXZpY3Rpb24gbWFuYWdlcjogZXJyb3IgZ2V0dGluZyBwb2QgZGlz
ayB1c2FnZSAldiIsIGVycikKKyAJCXJldHVybiBmYWxzZQorZGlmZiAtLWdpdCBhL3NyYy9pbXBv
cnQvcGtnL2t1YmVsZXQvZXZpY3Rpb24vaGVscGVycy5nbyBiL3NyYy9pbXBvcnQvcGtnL2t1YmVs
ZXQvZXZpY3Rpb24vaGVscGVycy5nbworaW5kZXggZGZkYjhjZTNiNjAuLjQxYzU1ODU1YWFkIDEw
MDY0NAorLS0tIGEvc3JjL2ltcG9ydC9wa2cva3ViZWxldC9ldmljdGlvbi9oZWxwZXJzLmdvCisr
KysgYi9zcmMvaW1wb3J0L3BrZy9rdWJlbGV0L2V2aWN0aW9uL2hlbHBlcnMuZ28KK0BAIC0xOCw2
ICsxOCw3IEBAIHBhY2thZ2UgZXZpY3Rpb24KKyAKKyBpbXBvcnQgKAorIAkiZm10IgorKwkib3Mi
CisgCSJzb3J0IgorIAkic3RyY29udiIKKyAJInN0cmluZ3MiCitAQCAtNDE1LDcgKzQxNiw3IEBA
IGZ1bmMgbG9jYWxFcGhlbWVyYWxWb2x1bWVOYW1lcyhwb2QgKnYxLlBvZCkgW11zdHJpbmcgewor
IH0KKyAKKyAvLyBwb2RMb2NhbEVwaGVtZXJhbFN0b3JhZ2VVc2FnZSBhZ2dyZWdhdGVzIHBvZCBs
b2NhbCBlcGhlbWVyYWwgc3RvcmFnZSB1c2FnZSBhbmQgaW5vZGUgY29uc3VtcHRpb24gZm9yIHRo
ZSBzcGVjaWZpZWQgc3RhdHMgdG8gbWVhc3VyZS4KKy1mdW5jIHBvZExvY2FsRXBoZW1lcmFsU3Rv
cmFnZVVzYWdlKHBvZFN0YXRzIHN0YXRzYXBpLlBvZFN0YXRzLCBwb2QgKnYxLlBvZCwgc3RhdHNU
b01lYXN1cmUgW11mc1N0YXRzVHlwZSkgKHYxLlJlc291cmNlTGlzdCwgZXJyb3IpIHsKKytmdW5j
IHBvZExvY2FsRXBoZW1lcmFsU3RvcmFnZVVzYWdlKHBvZFN0YXRzIHN0YXRzYXBpLlBvZFN0YXRz
LCBwb2QgKnYxLlBvZCwgc3RhdHNUb01lYXN1cmUgW11mc1N0YXRzVHlwZSwgZXRjSG9zdHNQYXRo
IHN0cmluZykgKHYxLlJlc291cmNlTGlzdCwgZXJyb3IpIHsKKyAJZGlzayA6PSByZXNvdXJjZS5R
dWFudGl0eXtGb3JtYXQ6IHJlc291cmNlLkJpbmFyeVNJfQorIAlpbm9kZXMgOj0gcmVzb3VyY2Uu
UXVhbnRpdHl7Rm9ybWF0OiByZXNvdXJjZS5EZWNpbWFsU0l9CisgCitAQCAtNDI5LDYgKzQzMCwx
MiBAQCBmdW5jIHBvZExvY2FsRXBoZW1lcmFsU3RvcmFnZVVzYWdlKHBvZFN0YXRzIHN0YXRzYXBp
LlBvZFN0YXRzLCBwb2QgKnYxLlBvZCwgc3RhdAorIAkJZGlzay5BZGQocG9kTG9jYWxWb2x1bWVV
c2FnZUxpc3RbdjEuUmVzb3VyY2VFcGhlbWVyYWxTdG9yYWdlXSkKKyAJCWlub2Rlcy5BZGQocG9k
TG9jYWxWb2x1bWVVc2FnZUxpc3RbcmVzb3VyY2VJbm9kZXNdKQorIAl9CisrCWlmIGxlbihldGNI
b3N0c1BhdGgpICZndDsgMCB7CisrCQlpZiBzdGF0LCBlcnIgOj0gb3MuU3RhdChldGNIb3N0c1Bh
dGgpOyBlcnIgPT0gbmlsIHsKKysJCQlkaXNrLkFkZCgqcmVzb3VyY2UuTmV3UXVhbnRpdHkoaW50
NjQoc3RhdC5TaXplKCkpLCByZXNvdXJjZS5CaW5hcnlTSSkpCisrCQkJaW5vZGVzLkFkZCgqcmVz
b3VyY2UuTmV3UXVhbnRpdHkoaW50NjQoMSksIHJlc291cmNlLkRlY2ltYWxTSSkpCisrCQl9Cisr
CX0KKyAJcmV0dXJuIHYxLlJlc291cmNlTGlzdHsKKyAJCXYxLlJlc291cmNlRXBoZW1lcmFsU3Rv
cmFnZTogZGlzaywKKyAJCXJlc291cmNlSW5vZGVzOiAgICAgICAgICAgICAgaW5vZGVzLAorZGlm
ZiAtLWdpdCBhL3NyYy9pbXBvcnQvcGtnL2t1YmVsZXQva3ViZWxldC5nbyBiL3NyYy9pbXBvcnQv
cGtnL2t1YmVsZXQva3ViZWxldC5nbworaW5kZXggYzJhY2QzNThlNTkuLjhkYTVkMGYyZTkyIDEw
MDY0NAorLS0tIGEvc3JjL2ltcG9ydC9wa2cva3ViZWxldC9rdWJlbGV0LmdvCisrKysgYi9zcmMv
aW1wb3J0L3BrZy9rdWJlbGV0L2t1YmVsZXQuZ28KK0BAIC04MzEsOCArODMxLDkgQEAgZnVuYyBO
ZXdNYWluS3ViZWxldChrdWJlQ2ZnICprdWJlbGV0Y29uZmlnaW50ZXJuYWwuS3ViZWxldENvbmZp
Z3VyYXRpb24sCisgCWtsZXQuYmFja09mZiA9IGZsb3djb250cm9sLk5ld0JhY2tPZmYoYmFja09m
ZlBlcmlvZCwgTWF4Q29udGFpbmVyQmFja09mZikKKyAJa2xldC5wb2RLaWxsaW5nQ2ggPSBtYWtl
KGNoYW4gKmt1YmVjb250YWluZXIuUG9kUGFpciwgcG9kS2lsbGluZ0NoYW5uZWxDYXBhY2l0eSkK
KyAKKysJZXRjSG9zdHNQYXRoRnVuYyA6PSBmdW5jKHBvZFVJRCB0eXBlcy5VSUQpIHN0cmluZyB7
IHJldHVybiBnZXRFdGNIb3N0c1BhdGgoa2xldC5nZXRQb2REaXIocG9kVUlEKSkgfQorIAkvLyBz
ZXR1cCBldmljdGlvbiBtYW5hZ2VyCistCWV2aWN0aW9uTWFuYWdlciwgZXZpY3Rpb25BZG1pdEhh
bmRsZXIgOj0gZXZpY3Rpb24uTmV3TWFuYWdlcihrbGV0LnJlc291cmNlQW5hbHl6ZXIsIGV2aWN0
aW9uQ29uZmlnLCBraWxsUG9kTm93KGtsZXQucG9kV29ya2Vycywga3ViZURlcHMuUmVjb3JkZXIp
LCBrbGV0LnBvZE1hbmFnZXIuR2V0TWlycm9yUG9kQnlQb2QsIGtsZXQuaW1hZ2VNYW5hZ2VyLCBr
bGV0LmNvbnRhaW5lckdDLCBrdWJlRGVwcy5SZWNvcmRlciwgbm9kZVJlZiwga2xldC5jbG9jaykK
KysJZXZpY3Rpb25NYW5hZ2VyLCBldmljdGlvbkFkbWl0SGFuZGxlciA6PSBldmljdGlvbi5OZXdN
YW5hZ2VyKGtsZXQucmVzb3VyY2VBbmFseXplciwgZXZpY3Rpb25Db25maWcsIGtpbGxQb2ROb3co
a2xldC5wb2RXb3JrZXJzLCBrdWJlRGVwcy5SZWNvcmRlciksIGtsZXQucG9kTWFuYWdlci5HZXRN
aXJyb3JQb2RCeVBvZCwga2xldC5pbWFnZU1hbmFnZXIsIGtsZXQuY29udGFpbmVyR0MsIGt1YmVE
ZXBzLlJlY29yZGVyLCBub2RlUmVmLCBrbGV0LmNsb2NrLCBldGNIb3N0c1BhdGhGdW5jKQorIAor
IAlrbGV0LmV2aWN0aW9uTWFuYWdlciA9IGV2aWN0aW9uTWFuYWdlcgorIAlrbGV0LmFkbWl0SGFu
ZGxlcnMuQWRkUG9kQWRtaXRIYW5kbGVyKGV2aWN0aW9uQWRtaXRIYW5kbGVyKQorZGlmZiAtLWdp
dCBhL3NyYy9pbXBvcnQvcGtnL2t1YmVsZXQva3ViZWxldF9wb2RzLmdvIGIvc3JjL2ltcG9ydC9w
a2cva3ViZWxldC9rdWJlbGV0X3BvZHMuZ28KK2luZGV4IDAxM2QwZjU1YWVhLi4wMjg1N2Q0YjVi
MyAxMDA2NDQKKy0tLSBhL3NyYy9pbXBvcnQvcGtnL2t1YmVsZXQva3ViZWxldF9wb2RzLmdvCisr
KysgYi9zcmMvaW1wb3J0L3BrZy9rdWJlbGV0L2t1YmVsZXRfcG9kcy5nbworQEAgLTI5MSwxMCAr
MjkxLDE1IEBAIGZ1bmMgdHJhbnNsYXRlTW91bnRQcm9wYWdhdGlvbihtb3VudE1vZGUgKnYxLk1v
dW50UHJvcGFnYXRpb25Nb2RlKSAocnVudGltZWFwaS5NCisgCX0KKyB9CisgCisrLy8gZ2V0RXRj
SG9zdHNQYXRoIHJldHVybnMgdGhlIGZ1bGwgaG9zdC1zaWRlIHBhdGggdG8gYSBwb2QncyBnZW5l
cmF0ZWQgL2V0Yy9ob3N0cyBmaWxlCisrZnVuYyBnZXRFdGNIb3N0c1BhdGgocG9kRGlyIHN0cmlu
Zykgc3RyaW5nIHsKKysJcmV0dXJuIHBhdGguSm9pbihwb2REaXIsICJldGMtaG9zdHMiKQorK30K
KysKKyAvLyBtYWtlSG9zdHNNb3VudCBtYWtlcyB0aGUgbW91bnRwb2ludCBmb3IgdGhlIGhvc3Rz
IGZpbGUgdGhhdCB0aGUgY29udGFpbmVycworIC8vIGluIGEgcG9kIGFyZSBpbmplY3RlZCB3aXRo
LgorIGZ1bmMgbWFrZUhvc3RzTW91bnQocG9kRGlyLCBwb2RJUCwgaG9zdE5hbWUsIGhvc3REb21h
aW5OYW1lIHN0cmluZywgaG9zdEFsaWFzZXMgW112MS5Ib3N0QWxpYXMsIHVzZUhvc3ROZXR3b3Jr
IGJvb2wpICgqa3ViZWNvbnRhaW5lci5Nb3VudCwgZXJyb3IpIHsKKy0JaG9zdHNGaWxlUGF0aCA6
PSBwYXRoLkpvaW4ocG9kRGlyLCAiZXRjLWhvc3RzIikKKysJaG9zdHNGaWxlUGF0aCA6PSBnZXRF
dGNIb3N0c1BhdGgocG9kRGlyKQorIAlpZiBlcnIgOj0gZW5zdXJlSG9zdHNGaWxlKGhvc3RzRmls
ZVBhdGgsIHBvZElQLCBob3N0TmFtZSwgaG9zdERvbWFpbk5hbWUsIGhvc3RBbGlhc2VzLCB1c2VI
b3N0TmV0d29yayk7IGVyciAhPSBuaWwgeworIAkJcmV0dXJuIG5pbCwgZXJyCisgCX0KK2RpZmYg
LS1naXQgYS9zcmMvaW1wb3J0L3BrZy9rdWJlbGV0L2t1YmVsZXRfdGVzdC5nbyBiL3NyYy9pbXBv
cnQvcGtnL2t1YmVsZXQva3ViZWxldF90ZXN0LmdvCitpbmRleCA4MGM2ZGNiNzNiNi4uOWZiNDE3
ZmJiOWQgMTAwNjQ0CistLS0gYS9zcmMvaW1wb3J0L3BrZy9rdWJlbGV0L2t1YmVsZXRfdGVzdC5n
bworKysrIGIvc3JjL2ltcG9ydC9wa2cva3ViZWxldC9rdWJlbGV0X3Rlc3QuZ28KK0BAIC0yOTEs
OCArMjkxLDkgQEAgZnVuYyBuZXdUZXN0S3ViZWxldFdpdGhJbWFnZUxpc3QoCisgCQlVSUQ6ICAg
ICAgIHR5cGVzLlVJRChrdWJlbGV0Lm5vZGVOYW1lKSwKKyAJCU5hbWVzcGFjZTogIiIsCisgCX0K
KysJZXRjSG9zdHNQYXRoRnVuYyA6PSBmdW5jKHBvZFVJRCB0eXBlcy5VSUQpIHN0cmluZyB7IHJl
dHVybiBnZXRFdGNIb3N0c1BhdGgoa3ViZWxldC5nZXRQb2REaXIocG9kVUlEKSkgfQorIAkvLyBz
ZXR1cCBldmljdGlvbiBtYW5hZ2VyCistCWV2aWN0aW9uTWFuYWdlciwgZXZpY3Rpb25BZG1pdEhh
bmRsZXIgOj0gZXZpY3Rpb24uTmV3TWFuYWdlcihrdWJlbGV0LnJlc291cmNlQW5hbHl6ZXIsIGV2
aWN0aW9uLkNvbmZpZ3t9LCBraWxsUG9kTm93KGt1YmVsZXQucG9kV29ya2VycywgZmFrZVJlY29y
ZGVyKSwga3ViZWxldC5wb2RNYW5hZ2VyLkdldE1pcnJvclBvZEJ5UG9kLCBrdWJlbGV0LmltYWdl
TWFuYWdlciwga3ViZWxldC5jb250YWluZXJHQywgZmFrZVJlY29yZGVyLCBub2RlUmVmLCBrdWJl
bGV0LmNsb2NrKQorKwlldmljdGlvbk1hbmFnZXIsIGV2aWN0aW9uQWRtaXRIYW5kbGVyIDo9IGV2
aWN0aW9uLk5ld01hbmFnZXIoa3ViZWxldC5yZXNvdXJjZUFuYWx5emVyLCBldmljdGlvbi5Db25m
aWd7fSwga2lsbFBvZE5vdyhrdWJlbGV0LnBvZFdvcmtlcnMsIGZha2VSZWNvcmRlciksIGt1YmVs
ZXQucG9kTWFuYWdlci5HZXRNaXJyb3JQb2RCeVBvZCwga3ViZWxldC5pbWFnZU1hbmFnZXIsIGt1
YmVsZXQuY29udGFpbmVyR0MsIGZha2VSZWNvcmRlciwgbm9kZVJlZiwga3ViZWxldC5jbG9jaywg
ZXRjSG9zdHNQYXRoRnVuYykKKyAKKyAJa3ViZWxldC5ldmljdGlvbk1hbmFnZXIgPSBldmljdGlv
bk1hbmFnZXIKKyAJa3ViZWxldC5hZG1pdEhhbmRsZXJzLkFkZFBvZEFkbWl0SGFuZGxlcihldmlj
dGlvbkFkbWl0SGFuZGxlcikKK2RpZmYgLS1naXQgYS9zcmMvaW1wb3J0L3BrZy9rdWJlbGV0L3J1
bm9uY2VfdGVzdC5nbyBiL3NyYy9pbXBvcnQvcGtnL2t1YmVsZXQvcnVub25jZV90ZXN0LmdvCitp
bmRleCA3MjM5MTMzZTQ4MS4uOWIxNjJjMTE3MDIgMTAwNjQ0CistLS0gYS9zcmMvaW1wb3J0L3Br
Zy9rdWJlbGV0L3J1bm9uY2VfdGVzdC5nbworKysrIGIvc3JjL2ltcG9ydC9wa2cva3ViZWxldC9y
dW5vbmNlX3Rlc3QuZ28KK0BAIC0xMjUsNyArMTI1LDggQEAgZnVuYyBUZXN0UnVuT25jZSh0ICp0
ZXN0aW5nLlQpIHsKKyAJCXJldHVybiBuaWwKKyAJfQorIAlmYWtlTWlycm9kUG9kRnVuYyA6PSBm
dW5jKCp2MS5Qb2QpICgqdjEuUG9kLCBib29sKSB7IHJldHVybiBuaWwsIGZhbHNlIH0KKy0JZXZp
Y3Rpb25NYW5hZ2VyLCBldmljdGlvbkFkbWl0SGFuZGxlciA6PSBldmljdGlvbi5OZXdNYW5hZ2Vy
KGtiLnJlc291cmNlQW5hbHl6ZXIsIGV2aWN0aW9uLkNvbmZpZ3t9LCBmYWtlS2lsbFBvZEZ1bmMs
IGZha2VNaXJyb2RQb2RGdW5jLCBuaWwsIG5pbCwga2IucmVjb3JkZXIsIG5vZGVSZWYsIGtiLmNs
b2NrKQorKwlldGNIb3N0c1BhdGhGdW5jIDo9IGZ1bmMocG9kVUlEIHR5cGVzLlVJRCkgc3RyaW5n
IHsgcmV0dXJuIGdldEV0Y0hvc3RzUGF0aChrYi5nZXRQb2REaXIocG9kVUlEKSkgfQorKwlldmlj
dGlvbk1hbmFnZXIsIGV2aWN0aW9uQWRtaXRIYW5kbGVyIDo9IGV2aWN0aW9uLk5ld01hbmFnZXIo
a2IucmVzb3VyY2VBbmFseXplciwgZXZpY3Rpb24uQ29uZmlne30sIGZha2VLaWxsUG9kRnVuYywg
ZmFrZU1pcnJvZFBvZEZ1bmMsIG5pbCwgbmlsLCBrYi5yZWNvcmRlciwgbm9kZVJlZiwga2IuY2xv
Y2ssIGV0Y0hvc3RzUGF0aEZ1bmMpCisgCisgCWtiLmV2aWN0aW9uTWFuYWdlciA9IGV2aWN0aW9u
TWFuYWdlcgorIAlrYi5hZG1pdEhhbmRsZXJzLkFkZFBvZEFkbWl0SGFuZGxlcihldmljdGlvbkFk
bWl0SGFuZGxlcikKKy0tIAorMi4xNy4wCisKZGlmZiAtLWdpdCBhL3JlY2lwZXMtY29udGFpbmVy
cy9rdWJlcm5ldGVzL2t1YmVybmV0ZXMvQ1ZFLTIwMjAtODU1OC5wYXRjaCBiL3JlY2lwZXMtY29u
dGFpbmVycy9rdWJlcm5ldGVzL2t1YmVybmV0ZXMvQ1ZFLTIwMjAtODU1OC5wYXRjaApuZXcgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi45ZWVlZDI2Ci0tLSAvZGV2L251bGwKKysrIGIv
cmVjaXBlcy1jb250YWluZXJzL2t1YmVybmV0ZXMva3ViZXJuZXRlcy9DVkUtMjAyMC04NTU4LnBh
dGNoCkBAIC0wLDAgKzEsNTEgQEAKK0Zyb20gZDIyYTYxZTIxZDY3N2Y3NTI3YmM4YTRhZWIzMjg4
YzVlMTFkZDQ5YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IENhc2V5IENhbGxlbmRy
ZWxsbyA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86Y2RjQHJl
ZGhhdC5jb20iPiZsdDtjZGNAcmVkaGF0LmNvbSZndDs8L2E+CitEYXRlOiBGcmksIDI5IE1heSAy
MDIwIDEzOjAzOjM3ICswMjAwCitTdWJqZWN0OiBbUEFUQ0hdIGt1YmVsZXQ6IGJsb2NrIG5vbi1m
b3J3YXJkZWQgcGFja2V0cyBmcm9tIGNyb3NzaW5nIHRoZQorIGxvY2FsaG9zdCBib3VuZGFyeQor
CitXZSBzZXQgcm91dGVfbG9jYWxuZXQgc28gdGhhdCBob3N0LW5ldHdvcmsgcHJvY2Vzc2VzIGNh
biBjb25uZWN0IHRvCismbHQ7MTI3LjAuMC4xOk5vZGVQb3J0Jmd0OyBhbmQgaXQgc3RpbGwgd29y
a3MuIFRoaXMsIGhvd2V2ZXIsIGlzIHRvbworcGVybWlzc2l2ZS4KKworU28sIGJsb2NrIG1hcnRp
YW5zIHRoYXQgYXJlIG5vdCBhbHJlYWR5IGluIGNvbm50cmFjay4KKworU2VlOiAjOTAyNTkKK1Np
Z25lZC1vZmYtYnk6IENhc2V5IENhbGxlbmRyZWxsbyA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJm
YzIzOTZFIiBocmVmPSJtYWlsdG86Y2RjQHJlZGhhdC5jb20iPiZsdDtjZGNAcmVkaGF0LmNvbSZn
dDs8L2E+CitDVkU6IENWRS0yMDIwLTg1NTgKK1Vwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgWzxh
IGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9r
dWJlcm5ldGVzL2t1YmVybmV0ZXMuZ2l0Ij5odHRwczovL2dpdGh1Yi5jb20va3ViZXJuZXRlcy9r
dWJlcm5ldGVzLmdpdDwvYT4gYnJhbmNoOnJlbGVhc2UtMS4xNl0KK1NpZ25lZC1vZmYtYnk6IFpo
aXhpb25nIENoaSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86
emhpeGlvbmcuY2hpQHdpbmRyaXZlci5jb20iPiZsdDt6aGl4aW9uZy5jaGlAd2luZHJpdmVyLmNv
bSZndDs8L2E+CistLS0KKyBzcmMvaW1wb3J0L3BrZy9rdWJlbGV0L2t1YmVsZXRfbmV0d29ya19s
aW51eC5nbyB8IDE2ICsrKysrKysrKysrKysrKysKKyAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0
aW9ucygrKQorCitkaWZmIC0tZ2l0IGEvc3JjL2ltcG9ydC9wa2cva3ViZWxldC9rdWJlbGV0X25l
dHdvcmtfbGludXguZ28gYi9zcmMvaW1wb3J0L3BrZy9rdWJlbGV0L2t1YmVsZXRfbmV0d29ya19s
aW51eC5nbworaW5kZXggMWM5YWQ0NmI5ODkuLmQxOGFiNzVhMDUzIDEwMDY0NAorLS0tIGEvc3Jj
L2ltcG9ydC9wa2cva3ViZWxldC9rdWJlbGV0X25ldHdvcmtfbGludXguZ28KKysrKyBiL3NyYy9p
bXBvcnQvcGtnL2t1YmVsZXQva3ViZWxldF9uZXR3b3JrX2xpbnV4LmdvCitAQCAtNjgsNiArNjgs
MjIgQEAgZnVuYyAoa2wgKkt1YmVsZXQpIHN5bmNOZXR3b3JrVXRpbCgpIHsKKyAJCWtsb2cuRXJy
b3JmKCJGYWlsZWQgdG8gZW5zdXJlIHJ1bGUgdG8gZHJvcCBwYWNrZXQgbWFya2VkIGJ5ICV2IGlu
ICV2IGNoYWluICV2OiAldiIsIEt1YmVNYXJrRHJvcENoYWluLCB1dGlsaXB0YWJsZXMuVGFibGVG
aWx0ZXIsIEt1YmVGaXJld2FsbENoYWluLCBlcnIpCisgCQlyZXR1cm4KKyAJfQorKworKwkvLyBk
cm9wIGFsbCBub24tbG9jYWwgcGFja2V0cyB0byBsb2NhbGhvc3QgaWYgdGhleSdyZSBub3QgcGFy
dCBvZiBhbiBleGlzdGluZworKwkvLyBmb3J3YXJkZWQgY29ubmVjdGlvbi4gU2VlICM5MDI1OQor
KwlpZiAha2wuaXB0Q2xpZW50LklzSXB2NigpIHsgLy8gaXB2NiBkb2Vzbid0IGhhdmUgdGhpcyBp
c3N1ZQorKwkJaWYgXywgZXJyIDo9IGtsLmlwdENsaWVudC5FbnN1cmVSdWxlKHV0aWxpcHRhYmxl
cy5BcHBlbmQsIHV0aWxpcHRhYmxlcy5UYWJsZUZpbHRlciwgS3ViZUZpcmV3YWxsQ2hhaW4sCisr
CQkJIi1tIiwgImNvbW1lbnQiLCAiLS1jb21tZW50IiwgImJsb2NrIGluY29taW5nIGxvY2FsbmV0
IGNvbm5lY3Rpb25zIiwKKysJCQkiLS1kc3QiLCAiMTI3LjAuMC4wLzgiLAorKwkJCSIhIiwgIi0t
c3JjIiwgIjEyNy4wLjAuMC84IiwKKysJCQkiLW0iLCAiY29ubnRyYWNrIiwKKysJCQkiISIsICIt
LWN0c3RhdGUiLCAiUkVMQVRFRCxFU1RBQkxJU0hFRCxETkFUIiwKKysJCQkiLWoiLCAiRFJPUCIp
OyBlcnIgIT0gbmlsIHsKKysJCQlrbG9nLkVycm9yZigiRmFpbGVkIHRvIGVuc3VyZSBydWxlIHRv
IGRyb3AgaW52YWxpZCBsb2NhbGhvc3QgcGFja2V0cyBpbiAldiBjaGFpbiAldjogJXYiLCB1dGls
aXB0YWJsZXMuVGFibGVGaWx0ZXIsIEt1YmVGaXJld2FsbENoYWluLCBlcnIpCisrCQkJcmV0dXJu
CisrCQl9CisrCX0KKysKKyAJaWYgXywgZXJyIDo9IGtsLmlwdENsaWVudC5FbnN1cmVSdWxlKHV0
aWxpcHRhYmxlcy5QcmVwZW5kLCB1dGlsaXB0YWJsZXMuVGFibGVGaWx0ZXIsIHV0aWxpcHRhYmxl
cy5DaGFpbk91dHB1dCwgIi1qIiwgc3RyaW5nKEt1YmVGaXJld2FsbENoYWluKSk7IGVyciAhPSBu
aWwgeworIAkJa2xvZy5FcnJvcmYoIkZhaWxlZCB0byBlbnN1cmUgdGhhdCAlcyBjaGFpbiAlcyBq
dW1wcyB0byAlczogJXYiLCB1dGlsaXB0YWJsZXMuVGFibGVGaWx0ZXIsIHV0aWxpcHRhYmxlcy5D
aGFpbk91dHB1dCwgS3ViZUZpcmV3YWxsQ2hhaW4sIGVycikKKyAJCXJldHVybgorLS0gCisyLjE3
LjAKKwpkaWZmIC0tZ2l0IGEvcmVjaXBlcy1jb250YWluZXJzL2t1YmVybmV0ZXMva3ViZXJuZXRl
cy9DVkUtMjAyMC04NTU5LnBhdGNoIGIvcmVjaXBlcy1jb250YWluZXJzL2t1YmVybmV0ZXMva3Vi
ZXJuZXRlcy9DVkUtMjAyMC04NTU5LnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAuLmY0NzgyNmQKLS0tIC9kZXYvbnVsbAorKysgYi9yZWNpcGVzLWNvbnRhaW5lcnMva3Vi
ZXJuZXRlcy9rdWJlcm5ldGVzL0NWRS0yMDIwLTg1NTkucGF0Y2gKQEAgLTAsMCArMSwxNDggQEAK
K0Zyb20gYmEzY2E0OTI5ZWQzODg3Yzk1Zjk0ZmNmOTc2MTBmMzQ0OTQ0NjgwNCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb206IFRpbSBBbGxjbGFpciA8YSBjbGFzcz0ibW96LXR4dC1saW5r
LXJmYzIzOTZFIiBocmVmPSJtYWlsdG86dGFsbGNsYWlyQGdvb2dsZS5jb20iPiZsdDt0YWxsY2xh
aXJAZ29vZ2xlLmNvbSZndDs8L2E+CitEYXRlOiBXZWQsIDE3IEp1biAyMDIwIDExOjA5OjAyIC0w
NzAwCitTdWJqZWN0OiBbUEFUQ0hdIERvbid0IHJldHVybiBwcm94aWVkIHJlZGlyZWN0cyB0byB0
aGUgY2xpZW50CisKK0NWRTogQ1ZFLTIwMjAtODU1OQorVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9y
dCBbPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6Ly9naXRodWIu
Y29tL2t1YmVybmV0ZXMva3ViZXJuZXRlcy5naXQiPmh0dHBzOi8vZ2l0aHViLmNvbS9rdWJlcm5l
dGVzL2t1YmVybmV0ZXMuZ2l0PC9hPiBicmFuY2g6cmVsZWFzZS0xLjE2XQorU2lnbmVkLW9mZi1i
eTogWmhpeGlvbmcgQ2hpIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1h
aWx0bzp6aGl4aW9uZy5jaGlAd2luZHJpdmVyLmNvbSI+Jmx0O3poaXhpb25nLmNoaUB3aW5kcml2
ZXIuY29tJmd0OzwvYT4KKy0tLQorIC4uLi9rOHMuaW8vYXBpbWFjaGluZXJ5L3BrZy91dGlsL25l
dC9odHRwLmdvICB8ICAyICstCisgLi4uL2FwaW1hY2hpbmVyeS9wa2cvdXRpbC9uZXQvaHR0cF90
ZXN0LmdvICAgIHwgMTIgKystLS0KKyAuLi4vcGtnL3V0aWwvcHJveHkvdXBncmFkZWF3YXJlLmdv
ICAgICAgICAgICAgfCAxMCArKysrCisgLi4uL3BrZy91dGlsL3Byb3h5L3VwZ3JhZGVhd2FyZV90
ZXN0LmdvICAgICAgIHwgNDcgKysrKysrKysrKysrKysrKysrLQorIDQgZmlsZXMgY2hhbmdlZCwg
NjIgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL3NyYy9pbXBv
cnQvc3RhZ2luZy9zcmMvazhzLmlvL2FwaW1hY2hpbmVyeS9wa2cvdXRpbC9uZXQvaHR0cC5nbyBi
L3NyYy9pbXBvcnQvc3RhZ2luZy9zcmMvazhzLmlvL2FwaW1hY2hpbmVyeS9wa2cvdXRpbC9uZXQv
aHR0cC5nbworaW5kZXggYmQ3OWQ2YzRhMDkuLmMyNGZiYzY5MjFjIDEwMDY0NAorLS0tIGEvc3Jj
L2ltcG9ydC9zdGFnaW5nL3NyYy9rOHMuaW8vYXBpbWFjaGluZXJ5L3BrZy91dGlsL25ldC9odHRw
LmdvCisrKysgYi9zcmMvaW1wb3J0L3N0YWdpbmcvc3JjL2s4cy5pby9hcGltYWNoaW5lcnkvcGtn
L3V0aWwvbmV0L2h0dHAuZ28KK0BAIC00MzEsNyArNDMxLDcgQEAgcmVkaXJlY3RMb29wOgorIAor
IAkJLy8gT25seSBmb2xsb3cgcmVkaXJlY3RzIHRvIHRoZSBzYW1lIGhvc3QuIE90aGVyd2lzZSwg
cHJvcGFnYXRlIHRoZSByZWRpcmVjdCByZXNwb25zZSBiYWNrLgorIAkJaWYgcmVxdWlyZVNhbWVI
b3N0UmVkaXJlY3RzICZhbXA7JmFtcDsgbG9jYXRpb24uSG9zdG5hbWUoKSAhPSBvcmlnaW5hbExv
Y2F0aW9uLkhvc3RuYW1lKCkgeworLQkJCWJyZWFrIHJlZGlyZWN0TG9vcAorKwkJCXJldHVybiBu
aWwsIG5pbCwgZm10LkVycm9yZigiaG9zdG5hbWUgbWlzbWF0Y2g6IGV4cGVjdGVkICVzLCBmb3Vu
ZCAlcyIsIG9yaWdpbmFsTG9jYXRpb24uSG9zdG5hbWUoKSwgbG9jYXRpb24uSG9zdG5hbWUoKSkK
KyAJCX0KKyAKKyAJCS8vIFJlc2V0IHRoZSBjb25uZWN0aW9uLgorZGlmZiAtLWdpdCBhL3NyYy9p
bXBvcnQvc3RhZ2luZy9zcmMvazhzLmlvL2FwaW1hY2hpbmVyeS9wa2cvdXRpbC9uZXQvaHR0cF90
ZXN0LmdvIGIvc3JjL2ltcG9ydC9zdGFnaW5nL3NyYy9rOHMuaW8vYXBpbWFjaGluZXJ5L3BrZy91
dGlsL25ldC9odHRwX3Rlc3QuZ28KK2luZGV4IDRlNGUzMTdiOWE0Li4xNDJiODBmMWE4NCAxMDA2
NDQKKy0tLSBhL3NyYy9pbXBvcnQvc3RhZ2luZy9zcmMvazhzLmlvL2FwaW1hY2hpbmVyeS9wa2cv
dXRpbC9uZXQvaHR0cF90ZXN0LmdvCisrKysgYi9zcmMvaW1wb3J0L3N0YWdpbmcvc3JjL2s4cy5p
by9hcGltYWNoaW5lcnkvcGtnL3V0aWwvbmV0L2h0dHBfdGVzdC5nbworQEAgLTMzMCwxMyArMzMw
LDEzIEBAIGZ1bmMgVGVzdENvbm5lY3RXaXRoUmVkaXJlY3RzKHQgKnRlc3RpbmcuVCkgeworIAkJ
cmVkaXJlY3RzOiAgIFtdc3RyaW5neyIvMSIsICIvMiIsICIvMyIsICIvNCIsICIvNSIsICIvNiIs
ICIvNyIsICIvOCIsICIvOSIsICIvMTAifSwKKyAJCWV4cGVjdEVycm9yOiB0cnVlLAorIAl9LCB7
CistCQlkZXNjOiAgICAgICAgICAgICAgInJlZGlyZWN0IHRvIGRpZmZlcmVudCBob3N0IGFyZSBw
cmV2ZW50ZWQiLAorLQkJcmVkaXJlY3RzOiAgICAgICAgIFtdc3RyaW5nezxhIGNsYXNzPSJtb3ot
dHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Imh0dHA6Ly9leGFtcGxlLmNvbS9mb28iPiJodHRwOi8v
ZXhhbXBsZS5jb20vZm9vIjwvYT59LAorLQkJZXhwZWN0ZWRSZWRpcmVjdHM6IDAsCisrCQlkZXNj
OiAgICAgICAgInJlZGlyZWN0IHRvIGRpZmZlcmVudCBob3N0IGFyZSBwcmV2ZW50ZWQiLAorKwkJ
cmVkaXJlY3RzOiAgIFtdc3RyaW5nezxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhy
ZWY9Imh0dHA6Ly9leGFtcGxlLmNvbS9mb28iPiJodHRwOi8vZXhhbXBsZS5jb20vZm9vIjwvYT59
LAorKwkJZXhwZWN0RXJyb3I6IHRydWUsCisgCX0sIHsKKy0JCWRlc2M6ICAgICAgICAgICAgICAi
bXVsdGlwbGUgcmVkaXJlY3QgdG8gZGlmZmVyZW50IGhvc3QgZm9yYmlkZGVuIiwKKy0JCXJlZGly
ZWN0czogICAgICAgICBbXXN0cmluZ3siLzEiLCAiLzIiLCAiLzMiLCA8YSBjbGFzcz0ibW96LXR4
dC1saW5rLXJmYzIzOTZFIiBocmVmPSJodHRwOi8vZXhhbXBsZS5jb20vZm9vIj4iaHR0cDovL2V4
YW1wbGUuY29tL2ZvbyI8L2E+fSwKKy0JCWV4cGVjdGVkUmVkaXJlY3RzOiAzLAorKwkJZGVzYzog
ICAgICAgICJtdWx0aXBsZSByZWRpcmVjdCB0byBkaWZmZXJlbnQgaG9zdCBmb3JiaWRkZW4iLAor
KwkJcmVkaXJlY3RzOiAgIFtdc3RyaW5neyIvMSIsICIvMiIsICIvMyIsIDxhIGNsYXNzPSJtb3ot
dHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Imh0dHA6Ly9leGFtcGxlLmNvbS9mb28iPiJodHRwOi8v
ZXhhbXBsZS5jb20vZm9vIjwvYT59LAorKwkJZXhwZWN0RXJyb3I6IHRydWUsCisgCX0sIHsKKyAJ
CWRlc2M6ICAgICAgICAgICAgICAicmVkaXJlY3QgdG8gZGlmZmVyZW50IHBvcnQgaXMgYWxsb3dl
ZCIsCisgCQlyZWRpcmVjdHM6ICAgICAgICAgW11zdHJpbmd7PGEgY2xhc3M9Im1vei10eHQtbGlu
ay1yZmMyMzk2RSIgaHJlZj0iaHR0cDovL0hPU1QvZm9vIj4iaHR0cDovL0hPU1QvZm9vIjwvYT59
LAorZGlmZiAtLWdpdCBhL3NyYy9pbXBvcnQvc3RhZ2luZy9zcmMvazhzLmlvL2FwaW1hY2hpbmVy
eS9wa2cvdXRpbC9wcm94eS91cGdyYWRlYXdhcmUuZ28gYi9zcmMvaW1wb3J0L3N0YWdpbmcvc3Jj
L2s4cy5pby9hcGltYWNoaW5lcnkvcGtnL3V0aWwvcHJveHkvdXBncmFkZWF3YXJlLmdvCitpbmRl
eCBmY2RjNzZhMDUyOS4uM2EwMjkxOWQxMzUgMTAwNjQ0CistLS0gYS9zcmMvaW1wb3J0L3N0YWdp
bmcvc3JjL2s4cy5pby9hcGltYWNoaW5lcnkvcGtnL3V0aWwvcHJveHkvdXBncmFkZWF3YXJlLmdv
CisrKysgYi9zcmMvaW1wb3J0L3N0YWdpbmcvc3JjL2s4cy5pby9hcGltYWNoaW5lcnkvcGtnL3V0
aWwvcHJveHkvdXBncmFkZWF3YXJlLmdvCitAQCAtMjk4LDYgKzI5OCwxNiBAQCBmdW5jIChoICpV
cGdyYWRlQXdhcmVIYW5kbGVyKSB0cnlVcGdyYWRlKHcgaHR0cC5SZXNwb25zZVdyaXRlciwgcmVx
ICpodHRwLlJlcXVlcworIAkJcmF3UmVzcG9uc2UgPSBoZWFkZXJCeXRlcworIAl9CisgCisrCS8v
IElmIHRoZSBiYWNrZW5kIGRpZCBub3QgdXBncmFkZSB0aGUgcmVxdWVzdCwgcmV0dXJuIGFuIGVy
cm9yIHRvIHRoZSBjbGllbnQuIElmIHRoZSByZXNwb25zZSB3YXMKKysJLy8gYW4gZXJyb3IsIHRo
ZSBlcnJvciBpcyBmb3J3YXJkZWQgZGlyZWN0bHkgYWZ0ZXIgdGhlIGNvbm5lY3Rpb24gaXMgaGlq
YWNrZWQuIE90aGVyd2lzZSwganVzdAorKwkvLyByZXR1cm4gYSBnZW5lcmljIGVycm9yIGhlcmUu
CisrCWlmIGJhY2tlbmRIVFRQUmVzcG9uc2UuU3RhdHVzQ29kZSAhPSBodHRwLlN0YXR1c1N3aXRj
aGluZ1Byb3RvY29scyAmYW1wOyZhbXA7IGJhY2tlbmRIVFRQUmVzcG9uc2UuU3RhdHVzQ29kZSAm
bHQ7IDQwMCB7CisrCQllcnIgOj0gZm10LkVycm9yZigiaW52YWxpZCB1cGdyYWRlIHJlc3BvbnNl
OiBzdGF0dXMgY29kZSAlZCIsIGJhY2tlbmRIVFRQUmVzcG9uc2UuU3RhdHVzQ29kZSkKKysJCWts
b2cuRXJyb3JmKCJQcm94eSB1cGdyYWRlIGVycm9yOiAldiIsIGVycikKKysJCWguUmVzcG9uZGVy
LkVycm9yKHcsIHJlcSwgZXJyKQorKwkJcmV0dXJuIHRydWUKKysJfQorKworIAkvLyBPbmNlIHRo
ZSBjb25uZWN0aW9uIGlzIGhpamFja2VkLCB0aGUgRXJyb3JSZXNwb25kZXIgd2lsbCBubyBsb25n
ZXIgd29yaywgc28KKyAJLy8gaGlqYWNraW5nIHNob3VsZCBiZSB0aGUgbGFzdCBzdGVwIGluIHRo
ZSB1cGdyYWRlLgorIAlyZXF1ZXN0SGlqYWNrZXIsIG9rIDo9IHcuKGh0dHAuSGlqYWNrZXIpCitk
aWZmIC0tZ2l0IGEvc3JjL2ltcG9ydC9zdGFnaW5nL3NyYy9rOHMuaW8vYXBpbWFjaGluZXJ5L3Br
Zy91dGlsL3Byb3h5L3VwZ3JhZGVhd2FyZV90ZXN0LmdvIGIvc3JjL2ltcG9ydC9zdGFnaW5nL3Ny
Yy9rOHMuaW8vYXBpbWFjaGluZXJ5L3BrZy91dGlsL3Byb3h5L3VwZ3JhZGVhd2FyZV90ZXN0Lmdv
CitpbmRleCA3ZDE0ZjY1MzRhOC4uMjM2MzYyMzczY2QgMTAwNjQ0CistLS0gYS9zcmMvaW1wb3J0
L3N0YWdpbmcvc3JjL2s4cy5pby9hcGltYWNoaW5lcnkvcGtnL3V0aWwvcHJveHkvdXBncmFkZWF3
YXJlX3Rlc3QuZ28KKysrKyBiL3NyYy9pbXBvcnQvc3RhZ2luZy9zcmMvazhzLmlvL2FwaW1hY2hp
bmVyeS9wa2cvdXRpbC9wcm94eS91cGdyYWRlYXdhcmVfdGVzdC5nbworQEAgLTQ5Myw3ICs0OTMs
NyBAQCBmdW5jIChyICpub0Vycm9yc0FsbG93ZWQpIEVycm9yKHcgaHR0cC5SZXNwb25zZVdyaXRl
ciwgcmVxICpodHRwLlJlcXVlc3QsIGVyciBlcgorIAlyLnQuRXJyb3IoZXJyKQorIH0KKyAKKy1m
dW5jIFRlc3RQcm94eVVwZ3JhZGVFcnJvclJlc3BvbnNlKHQgKnRlc3RpbmcuVCkgeworK2Z1bmMg
VGVzdFByb3h5VXBncmFkZUNvbm5lY3Rpb25FcnJvclJlc3BvbnNlKHQgKnRlc3RpbmcuVCkgewor
IAl2YXIgKAorIAkJcmVzcG9uZGVyICAgKmZha2VSZXNwb25kZXIKKyAJCWV4cGVjdGVkRXJyID0g
ZXJyb3JzLk5ldygiRVhQRUNURUQ8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVm
PSJtYWlsdG86KStAQC01NDEsNys1NDEsN0BAZnVuY1Rlc3RQcm94eVVwZ3JhZGVFcnJvclJlc3Bv
bnNlKHQqdGVzdGluZy5UKXsrK2Z1bmNUZXN0UHJveHlVcGdyYWRlRXJyb3JSZXNwb25zZVRlcm1p
bmF0ZXModCp0ZXN0aW5nLlQpeytmb3JfLGludGVyY2VwdDo9cmFuZ2VbXWJvb2x7dHJ1ZSxmYWxz
ZX17Ky1mb3JfLGNvZGU6PXJhbmdlW11pbnR7MjAwLDQwMCw1MDB9eysrZm9yXyxjb2RlOj1yYW5n
ZVtdaW50ezQwMCw1MDB9eyt0LlJ1bihmbXQuU3ByaW50ZigiPiIpCitAQCAtNTQxLDcgKzU0MSw3
IEBAIGZ1bmMgVGVzdFByb3h5VXBncmFkZUVycm9yUmVzcG9uc2UodCAqdGVzdGluZy5UKSB7Cisg
CisgZnVuYyBUZXN0UHJveHlVcGdyYWRlRXJyb3JSZXNwb25zZVRlcm1pbmF0ZXModCAqdGVzdGlu
Zy5UKSB7CisgCWZvciBfLCBpbnRlcmNlcHQgOj0gcmFuZ2UgW11ib29se3RydWUsIGZhbHNlfSB7
CistCQlmb3IgXywgY29kZSA6PSByYW5nZSBbXWludHsyMDAsIDQwMCwgNTAwfSB7CisrCQlmb3Ig
XywgY29kZSA6PSByYW5nZSBbXWludHs0MDAsIDUwMH0geworIAkJCXQuUnVuKGZtdC5TcHJpbnRm
KCI8L2E+aW50ZXJjZXB0PSV2LGNvZGU9JXYiLCBpbnRlcmNlcHQsIGNvZGUpLCBmdW5jKHQgKnRl
c3RpbmcuVCkgeworIAkJCQkvLyBTZXQgdXAgYSBiYWNrZW5kIHNlcnZlcgorIAkJCQliYWNrZW5k
IDo9IGh0dHAuTmV3U2VydmVNdXgoKQorQEAgLTYwMSw2ICs2MDEsNDkgQEAgZnVuYyBUZXN0UHJv
eHlVcGdyYWRlRXJyb3JSZXNwb25zZVRlcm1pbmF0ZXModCAqdGVzdGluZy5UKSB7CisgCX0KKyB9
CisgCisrZnVuYyBUZXN0UHJveHlVcGdyYWRlRXJyb3JSZXNwb25zZSh0ICp0ZXN0aW5nLlQpIHsK
KysJZm9yIF8sIGludGVyY2VwdCA6PSByYW5nZSBbXWJvb2x7dHJ1ZSwgZmFsc2V9IHsKKysJCWZv
ciBfLCBjb2RlIDo9IHJhbmdlIFtdaW50ezIwMCwgMzAwLCAzMDIsIDMwN30geworKwkJCXQuUnVu
KGZtdC5TcHJpbnRmKCJpbnRlcmNlcHQ9JXYsY29kZT0ldiIsIGludGVyY2VwdCwgY29kZSksIGZ1
bmModCAqdGVzdGluZy5UKSB7CisrCQkJCS8vIFNldCB1cCBhIGJhY2tlbmQgc2VydmVyCisrCQkJ
CWJhY2tlbmQgOj0gaHR0cC5OZXdTZXJ2ZU11eCgpCisrCQkJCWJhY2tlbmQuSGFuZGxlKCIvaGVs
bG8iLCBodHRwLkhhbmRsZXJGdW5jKGZ1bmModyBodHRwLlJlc3BvbnNlV3JpdGVyLCByICpodHRw
LlJlcXVlc3QpIHsKKysJCQkJCWh0dHAuUmVkaXJlY3QodywgciwgPGEgY2xhc3M9Im1vei10eHQt
bGluay1yZmMyMzk2RSIgaHJlZj0iaHR0cHM6Ly9leGFtcGxlLmNvbS90aGVyZSI+Imh0dHBzOi8v
ZXhhbXBsZS5jb20vdGhlcmUiPC9hPiwgY29kZSkKKysJCQkJfSkpCisrCQkJCWJhY2tlbmRTZXJ2
ZXIgOj0gaHR0cHRlc3QuTmV3U2VydmVyKGJhY2tlbmQpCisrCQkJCWRlZmVyIGJhY2tlbmRTZXJ2
ZXIuQ2xvc2UoKQorKwkJCQliYWNrZW5kU2VydmVyVVJMLCBfIDo9IHVybC5QYXJzZShiYWNrZW5k
U2VydmVyLlVSTCkKKysJCQkJYmFja2VuZFNlcnZlclVSTC5QYXRoID0gIi9oZWxsbyIKKysKKysJ
CQkJLy8gU2V0IHVwIGEgcHJveHkgcG9pbnRpbmcgdG8gYSBzcGVjaWZpYyBwYXRoIG9uIHRoZSBi
YWNrZW5kCisrCQkJCXByb3h5SGFuZGxlciA6PSBOZXdVcGdyYWRlQXdhcmVIYW5kbGVyKGJhY2tl
bmRTZXJ2ZXJVUkwsIG5pbCwgZmFsc2UsIGZhbHNlLCAmYW1wO2Zha2VSZXNwb25kZXJ7dDogdH0p
CisrCQkJCXByb3h5SGFuZGxlci5JbnRlcmNlcHRSZWRpcmVjdHMgPSBpbnRlcmNlcHQKKysJCQkJ
cHJveHlIYW5kbGVyLlJlcXVpcmVTYW1lSG9zdFJlZGlyZWN0cyA9IHRydWUKKysJCQkJcHJveHkg
Oj0gaHR0cHRlc3QuTmV3U2VydmVyKHByb3h5SGFuZGxlcikKKysJCQkJZGVmZXIgcHJveHkuQ2xv
c2UoKQorKwkJCQlwcm94eVVSTCwgXyA6PSB1cmwuUGFyc2UocHJveHkuVVJMKQorKworKwkJCQlj
b25uLCBlcnIgOj0gbmV0LkRpYWwoInRjcCIsIHByb3h5VVJMLkhvc3QpCisrCQkJCXJlcXVpcmUu
Tm9FcnJvcih0LCBlcnIpCisrCQkJCWJ1ZmZlcmVkUmVhZGVyIDo9IGJ1ZmlvLk5ld1JlYWRlcihj
b25uKQorKworKwkJCQkvLyBTZW5kIHVwZ3JhZGUgcmVxdWVzdCByZXN1bHRpbmcgaW4gYSBub24t
MTAxIHJlc3BvbnNlIGZyb20gdGhlIGJhY2tlbmQKKysJCQkJcmVxLCBfIDo9IGh0dHAuTmV3UmVx
dWVzdCgiR0VUIiwgIi8iLCBuaWwpCisrCQkJCXJlcS5IZWFkZXIuU2V0KGh0dHBzdHJlYW0uSGVh
ZGVyQ29ubmVjdGlvbiwgaHR0cHN0cmVhbS5IZWFkZXJVcGdyYWRlKQorKwkJCQlyZXF1aXJlLk5v
RXJyb3IodCwgcmVxLldyaXRlKGNvbm4pKQorKwkJCQkvLyBWZXJpZnkgd2UgZ2V0IHRoZSBjb3Jy
ZWN0IHJlc3BvbnNlIGFuZCBmdWxsIG1lc3NhZ2UgYm9keSBjb250ZW50CisrCQkJCXJlc3AsIGVy
ciA6PSBodHRwLlJlYWRSZXNwb25zZShidWZmZXJlZFJlYWRlciwgbmlsKQorKwkJCQlyZXF1aXJl
Lk5vRXJyb3IodCwgZXJyKQorKwkJCQlhc3NlcnQuRXF1YWwodCwgZmFrZVN0YXR1c0NvZGUsIHJl
c3AuU3RhdHVzQ29kZSkKKysJCQkJcmVzcC5Cb2R5LkNsb3NlKCkKKysKKysJCQkJLy8gY2xlYW4g
dXAKKysJCQkJY29ubi5DbG9zZSgpCisrCQkJfSkKKysJCX0KKysJfQorK30KKysKKyBmdW5jIFRl
c3REZWZhdWx0UHJveHlUcmFuc3BvcnQodCAqdGVzdGluZy5UKSB7CisgCXRlc3RzIDo9IFtdc3Ry
dWN0IHsKKyAJCW5hbWUsCistLSAKKzIuMTcuMAorCmRpZmYgLS1naXQgYS9yZWNpcGVzLWNvbnRh
aW5lcnMva3ViZXJuZXRlcy9rdWJlcm5ldGVzX2dpdC5iYiBiL3JlY2lwZXMtY29udGFpbmVycy9r
dWJlcm5ldGVzL2t1YmVybmV0ZXNfZ2l0LmJiCmluZGV4IDk0MWUwY2EuLmZiZTJkZDggMTAwNjQ0
Ci0tLSBhL3JlY2lwZXMtY29udGFpbmVycy9rdWJlcm5ldGVzL2t1YmVybmV0ZXNfZ2l0LmJiCisr
KyBiL3JlY2lwZXMtY29udGFpbmVycy9rdWJlcm5ldGVzL2t1YmVybmV0ZXNfZ2l0LmJiCkBAIC0x
Niw2ICsxNiw5IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9rdWJlcm5ldGVzL2t1YmVy
bmV0ZXMuZ2l0O2JyYW5jaD1yZWxlYXNlLTEuMTY7bmFtZT1rCiAgICAgICAgICAgIDxhIGNsYXNz
PSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9ImZpbGU6Ly9DVkUtMjAyMC04NTUyLnBhdGNo
Ij5maWxlOi8vQ1ZFLTIwMjAtODU1Mi5wYXRjaDwvYT4gXAogICAgICAgICAgICA8YSBjbGFzcz0i
bW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJmaWxlOi8vQ1ZFLTIwMjAtODU1NS5wYXRjaCI+
ZmlsZTovL0NWRS0yMDIwLTg1NTUucGF0Y2g8L2E+IFwKICAgICAgICAgICAgPGEgY2xhc3M9Im1v
ei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iZmlsZTovL0NWRS0yMDE5LTExMjU0LnBhdGNoIj5m
aWxlOi8vQ1ZFLTIwMTktMTEyNTQucGF0Y2g8L2E+IFwKKyAgICAgICAgICAgPGEgY2xhc3M9Im1v
ei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iZmlsZTovL0NWRS0yMDIwLTg1NTcucGF0Y2giPmZp
bGU6Ly9DVkUtMjAyMC04NTU3LnBhdGNoPC9hPiBcCisgICAgICAgICAgIDxhIGNsYXNzPSJtb3ot
dHh0LWxpbmstZnJlZXRleHQiIGhyZWY9ImZpbGU6Ly9DVkUtMjAyMC04NTU4LnBhdGNoIj5maWxl
Oi8vQ1ZFLTIwMjAtODU1OC5wYXRjaDwvYT4gXAorICAgICAgICAgICA8YSBjbGFzcz0ibW96LXR4
dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJmaWxlOi8vQ1ZFLTIwMjAtODU1OS5wYXRjaCI+ZmlsZTov
L0NWRS0yMDIwLTg1NTkucGF0Y2g8L2E+IFwKICAgICAgICAgICAiCiAKIERFUEVORFMgKz0gInJz
eW5jLW5hdGl2ZSBcCjwvcHJlPgogICAgICA8YnI+CiAgICAgIDxmaWVsZHNldCBjbGFzcz0ibWlt
ZUF0dGFjaG1lbnRIZWFkZXIiPjwvZmllbGRzZXQ+CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90
ZS1wcmUiIHdyYXA9IiI+CjwvcHJlPgogICAgPC9ibG9ja3F1b3RlPgogICAgPHByZSBjbGFzcz0i
bW96LXNpZ25hdHVyZSIgY29scz0iNzIiPi0tIAotLS0tLS0tLS0tLS0tLS0tLS0tLS0KVGhhbmtz
LApaaGl4aW9uZyBDaGkKVGVsOiArODYtMTAtODQ3Ny03MDM2CjwvcHJlPgogIDwvYm9keT4KPC9o
dG1sPgo=

--------------66929AB0FD31C22DB071C50E--

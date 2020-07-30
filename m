Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web11.3320.1596138866994689254
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 12:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oF4umBGd;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id l13so6740944qvt.10
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Jul 2020 12:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=pYeoYhiYDuTPsHGywFoIuZyXWj+YsVC8PmtHUJdtNPs=;
        b=oF4umBGdfe9r5m+9ysTmQ9oZw0/9acmLL+ABS/FXeGoi0ypH7F8oHG4U/dkNmeJUcQ
         0iXATZaErtU6wLiqRi4r4acgxzHgmqutQb6A9Yh/Lc44IjKYvTNxnxzb/IUPVHKXf32M
         nGsJ06YVYRk2s+Rnov4HuRt1i5QVlB+PdECUG8V8Nr3UvgoT2WlLbYGBuasEcD+puKAW
         8Lvp78JcbXMJvtxUcnHEE1eaZ3MJ8GvjiydRoGf97fhTj+sU8tg3bUb3klocFQzXQwSk
         fkA5lXAps365MzIY3kS+gAHuoe9cuooC51E3AN1uamKKnVhIltBpfzFfFlQ3z+UzcFbF
         +XKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=pYeoYhiYDuTPsHGywFoIuZyXWj+YsVC8PmtHUJdtNPs=;
        b=A4/7eQPn37n2kAfv+ZhPDN881DbHGB4h3YDHdPsDma4ftPi95tF+rrFze0COnI92NS
         63QtSAlowpasoS/u7OChLepgdzJm3x22cAmFyDGO0p1AUw7Oih1fVvBmG74GPapU1t9N
         3uMSZI9y18kPdAbNMrswSFVps8CvlysNLElB39TL3I+YzYBI51pYmgZhypx24FN27IaD
         v7a6utTyC7Yz/Xp+F2G/i3xoSijS10ugMgsex7wDLaBC7kAiy1BmnKMYak9gKO2Ib+HA
         8RAg9EPUGc5+7N/r06IVXw1GKTMM7rCxJdXf2twWu+YZB/9FPaOPEs2bgUR5qBz+9Z1M
         Qrdg==
X-Gm-Message-State: AOAM533GStE3HxNRZhMAm0BaNU+CZ5FKQK85/hC5TXKNnRHE8w5y11rS
	F1dTqV+m2AJ7MFgGUczLgIk=
X-Google-Smtp-Source: ABdhPJx+2aVEju0vm9lKsoRyE32f92QisB6xDNz2gGD0ZiS5wFeP15Pyp4Gu+AG0zxlPwadHKHyKCA==
X-Received: by 2002:a0c:d44e:: with SMTP id r14mr759519qvh.105.1596138865894;
        Thu, 30 Jul 2020 12:54:25 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id b4sm4986559qkd.75.2020.07.30.12.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 12:54:25 -0700 (PDT)
Date: Thu, 30 Jul 2020 15:54:23 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Zhixiong Chi <zhixiong.chi@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][zeus][PATCH] kubernetes: fix three CVE issues
Message-ID: <20200730195420.GA29435@gmail.com>
References: <16267A948D96B982.15129@lists.yoctoproject.org>
 <6e83d4b7-e38b-b68f-2b10-82992de6e845@windriver.com>
MIME-Version: 1.0
In-Reply-To: <6e83d4b7-e38b-b68f-2b10-82992de6e845@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit


merged (and yes, I went back and picked up the older CVE patch as well).

But remember, when submitting these to an older branch, we should also
be summarizing if other branches are vulenerable.

In master, we'll update the version to pick up the change, but it is still
useful to know if it is fixed in the k8s release branch.

And in particular, I need the following answered: does dunfell need these
patches as well ?

Bruce

In message: Re: [meta-virtualization][zeus][PATCH] kubernetes: fix three CVE issues
on 30/07/2020 Zhixiong Chi wrote:

> Hi Bruce,
> 
> After the last CVE-1019-11254 patch merged, this patch can be applied
> successfully.
> 
> Thanks.
> 
> On 2020/7/30 下午4:30, Zhixiong Chi wrote:
> 
>     Backport the patches from the upstream:
>     https://github.com/kubernetes/kubernetes.git  [branch: release-1.16]
>     ba3ca4929ed3887c95f94fcf97610f3449446804
>     68750fefd3df76b7b008ef7b18e8acd18d5c2f2e
>     d22a61e21d677f7527bc8a4aeb3288c5e11dd49b
> 
>     Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
>     ---
>      .../kubernetes/kubernetes/CVE-2020-8557.patch | 179 ++++++++++++++++++
>      .../kubernetes/kubernetes/CVE-2020-8558.patch |  51 +++++
>      .../kubernetes/kubernetes/CVE-2020-8559.patch | 148 +++++++++++++++
>      .../kubernetes/kubernetes_git.bb              |   3 +
>      4 files changed, 381 insertions(+)
>      create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2020-8557.patch
>      create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2020-8558.patch
>      create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2020-8559.patch
> 
>     diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2020-8557.patch b/recipes-containers/kubernetes/kubernetes/CVE-2020-8557.patch
>     new file mode 100644
>     index 0000000..dd70627
>     --- /dev/null
>     +++ b/recipes-containers/kubernetes/kubernetes/CVE-2020-8557.patch
>     @@ -0,0 +1,179 @@
>     +From 68750fefd3df76b7b008ef7b18e8acd18d5c2f2e Mon Sep 17 00:00:00 2001
>     +From: Joel Smith <joesmith@redhat.com>
>     +Date: Thu, 14 May 2020 20:09:58 -0600
>     +Subject: [PATCH] Include pod /etc/hosts in ephemeral storage calculation for
>     + eviction
>     +
>     +CVE: CVE-2020-8557
>     +Upstream-Status: Backport [https://github.com/kubernetes/kubernetes.git branch:release-1.16]
>     +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
>     +---
>     + src/import/pkg/kubelet/eviction/BUILD               | 1 +
>     + src/import/pkg/kubelet/eviction/eviction_manager.go | 7 ++++++-
>     + src/import/pkg/kubelet/eviction/helpers.go          | 9 ++++++++-
>     + src/import/pkg/kubelet/kubelet.go                   | 3 ++-
>     + src/import/pkg/kubelet/kubelet_pods.go              | 7 ++++++-
>     + src/import/pkg/kubelet/kubelet_test.go              | 3 ++-
>     + src/import/pkg/kubelet/runonce_test.go              | 3 ++-
>     + 7 files changed, 27 insertions(+), 6 deletions(-)
>     +
>     +diff --git a/src/import/pkg/kubelet/eviction/BUILD b/src/import/pkg/kubelet/eviction/BUILD
>     +index 2209b26d7d4..e8c2241e075 100644
>     +--- a/src/import/pkg/kubelet/eviction/BUILD
>     ++++ b/src/import/pkg/kubelet/eviction/BUILD
>     +@@ -66,6 +66,7 @@ go_library(
>     +         "//staging/src/k8s.io/api/core/v1:go_default_library",
>     +         "//staging/src/k8s.io/apimachinery/pkg/api/resource:go_default_library",
>     +         "//staging/src/k8s.io/apimachinery/pkg/apis/meta/v1:go_default_library",
>     ++        "//staging/src/k8s.io/apimachinery/pkg/types:go_default_library",
>     +         "//staging/src/k8s.io/apimachinery/pkg/util/clock:go_default_library",
>     +         "//staging/src/k8s.io/apiserver/pkg/util/feature:go_default_library",
>     +         "//staging/src/k8s.io/client-go/tools/record:go_default_library",
>     +diff --git a/src/import/pkg/kubelet/eviction/eviction_manager.go b/src/import/pkg/kubelet/eviction/eviction_manager.go
>     +index 4ef2a89dce6..ca218cb942f 100644
>     +--- a/src/import/pkg/kubelet/eviction/eviction_manager.go
>     ++++ b/src/import/pkg/kubelet/eviction/eviction_manager.go
>     +@@ -26,6 +26,7 @@ import (
>     +
>     +       v1 "k8s.io/api/core/v1"
>     +       "k8s.io/apimachinery/pkg/api/resource"
>     ++      "k8s.io/apimachinery/pkg/types"
>     +       "k8s.io/apimachinery/pkg/util/clock"
>     +       utilfeature "k8s.io/apiserver/pkg/util/feature"
>     +       "k8s.io/client-go/tools/record"
>     +@@ -90,6 +91,8 @@ type managerImpl struct {
>     +       thresholdNotifiers []ThresholdNotifier
>     +       // thresholdsLastUpdated is the last time the thresholdNotifiers were updated.
>     +       thresholdsLastUpdated time.Time
>     ++      // etcHostsPath is a function that will get the etc-hosts file's path for a pod given its UID
>     ++      etcHostsPath func(podUID types.UID) string
>     + }
>     + 
>     + // ensure it implements the required interface
>     +@@ -106,6 +109,7 @@ func NewManager(
>     +       recorder record.EventRecorder,
>     +       nodeRef *v1.ObjectReference,
>     +       clock clock.Clock,
>     ++      etcHostsPath func(types.UID) string,
>     + ) (Manager, lifecycle.PodAdmitHandler) {
>     +       manager := &managerImpl{
>     +               clock:                        clock,
>     +@@ -121,6 +125,7 @@ func NewManager(
>     +               thresholdsFirstObservedAt:    thresholdsObservedAt{},
>     +               dedicatedImageFs:             nil,
>     +               thresholdNotifiers:           []ThresholdNotifier{},
>     ++              etcHostsPath:                 etcHostsPath,
>     +       }
>     +       return manager, manager
>     + }
>     +@@ -503,7 +508,7 @@ func (m *managerImpl) podEphemeralStorageLimitEviction(podStats statsapi.PodStat
>     +       } else {
>     +               fsStatsSet = []fsStatsType{fsStatsRoot, fsStatsLogs, fsStatsLocalVolumeSource}
>     +       }
>     +-      podEphemeralUsage, err := podLocalEphemeralStorageUsage(podStats, pod, fsStatsSet)
>     ++      podEphemeralUsage, err := podLocalEphemeralStorageUsage(podStats, pod, fsStatsSet, m.etcHostsPath(pod.UID))
>     +       if err != nil {
>     +               klog.Errorf("eviction manager: error getting pod disk usage %v", err)
>     +               return false
>     +diff --git a/src/import/pkg/kubelet/eviction/helpers.go b/src/import/pkg/kubelet/eviction/helpers.go
>     +index dfdb8ce3b60..41c55855aad 100644
>     +--- a/src/import/pkg/kubelet/eviction/helpers.go
>     ++++ b/src/import/pkg/kubelet/eviction/helpers.go
>     +@@ -18,6 +18,7 @@ package eviction
>     +
>     + import (
>     +       "fmt"
>     ++      "os"
>     +       "sort"
>     +       "strconv"
>     +       "strings"
>     +@@ -415,7 +416,7 @@ func localEphemeralVolumeNames(pod *v1.Pod) []string {
>     + }
>     +
>     + // podLocalEphemeralStorageUsage aggregates pod local ephemeral storage usage and inode consumption for the specified stats to measure.
>     +-func podLocalEphemeralStorageUsage(podStats statsapi.PodStats, pod *v1.Pod, statsToMeasure []fsStatsType) (v1.ResourceList, error) {
>     ++func podLocalEphemeralStorageUsage(podStats statsapi.PodStats, pod *v1.Pod, statsToMeasure []fsStatsType, etcHostsPath string) (v1.ResourceList, error) {
>     +       disk := resource.Quantity{Format: resource.BinarySI}
>     +       inodes := resource.Quantity{Format: resource.DecimalSI}
>     +
>     +@@ -429,6 +430,12 @@ func podLocalEphemeralStorageUsage(podStats statsapi.PodStats, pod *v1.Pod, stat
>     +               disk.Add(podLocalVolumeUsageList[v1.ResourceEphemeralStorage])
>     +               inodes.Add(podLocalVolumeUsageList[resourceInodes])
>     +       }
>     ++      if len(etcHostsPath) > 0 {
>     ++              if stat, err := os.Stat(etcHostsPath); err == nil {
>     ++                      disk.Add(*resource.NewQuantity(int64(stat.Size()), resource.BinarySI))
>     ++                      inodes.Add(*resource.NewQuantity(int64(1), resource.DecimalSI))
>     ++              }
>     ++      }
>     +       return v1.ResourceList{
>     +               v1.ResourceEphemeralStorage: disk,
>     +               resourceInodes:              inodes,
>     +diff --git a/src/import/pkg/kubelet/kubelet.go b/src/import/pkg/kubelet/kubelet.go
>     +index c2acd358e59..8da5d0f2e92 100644
>     +--- a/src/import/pkg/kubelet/kubelet.go
>     ++++ b/src/import/pkg/kubelet/kubelet.go
>     +@@ -831,8 +831,9 @@ func NewMainKubelet(kubeCfg *kubeletconfiginternal.KubeletConfiguration,
>     +       klet.backOff = flowcontrol.NewBackOff(backOffPeriod, MaxContainerBackOff)
>     +       klet.podKillingCh = make(chan *kubecontainer.PodPair, podKillingChannelCapacity)
>     +
>     ++      etcHostsPathFunc := func(podUID types.UID) string { return getEtcHostsPath(klet.getPodDir(podUID)) }
>     +       // setup eviction manager
>     +-      evictionManager, evictionAdmitHandler := eviction.NewManager(klet.resourceAnalyzer, evictionConfig, killPodNow(klet.podWorkers, kubeDeps.Recorder), klet.podManager.GetMirrorPodByPod, klet.imageManager, klet.containerGC, kubeDeps.Recorder, nodeRef, klet.clock)
>     ++      evictionManager, evictionAdmitHandler := eviction.NewManager(klet.resourceAnalyzer, evictionConfig, killPodNow(klet.podWorkers, kubeDeps.Recorder), klet.podManager.GetMirrorPodByPod, klet.imageManager, klet.containerGC, kubeDeps.Recorder, nodeRef, klet.clock, etcHostsPathFunc)
>     +
>     +       klet.evictionManager = evictionManager
>     +       klet.admitHandlers.AddPodAdmitHandler(evictionAdmitHandler)
>     +diff --git a/src/import/pkg/kubelet/kubelet_pods.go b/src/import/pkg/kubelet/kubelet_pods.go
>     +index 013d0f55aea..02857d4b5b3 100644
>     +--- a/src/import/pkg/kubelet/kubelet_pods.go
>     ++++ b/src/import/pkg/kubelet/kubelet_pods.go
>     +@@ -291,10 +291,15 @@ func translateMountPropagation(mountMode *v1.MountPropagationMode) (runtimeapi.M
>     +       }
>     + }
>     +
>     ++// getEtcHostsPath returns the full host-side path to a pod's generated /etc/hosts file
>     ++func getEtcHostsPath(podDir string) string {
>     ++      return path.Join(podDir, "etc-hosts")
>     ++}
>     ++
>     + // makeHostsMount makes the mountpoint for the hosts file that the containers
>     + // in a pod are injected with.
>     + func makeHostsMount(podDir, podIP, hostName, hostDomainName string, hostAliases []v1.HostAlias, useHostNetwork bool) (*kubecontainer.Mount, error) {
>     +-      hostsFilePath := path.Join(podDir, "etc-hosts")
>     ++      hostsFilePath := getEtcHostsPath(podDir)
>     +       if err := ensureHostsFile(hostsFilePath, podIP, hostName, hostDomainName, hostAliases, useHostNetwork); err != nil {
>     +               return nil, err
>     +       }
>     +diff --git a/src/import/pkg/kubelet/kubelet_test.go b/src/import/pkg/kubelet/kubelet_test.go
>     +index 80c6dcb73b6..9fb417fbb9d 100644
>     +--- a/src/import/pkg/kubelet/kubelet_test.go
>     ++++ b/src/import/pkg/kubelet/kubelet_test.go
>     +@@ -291,8 +291,9 @@ func newTestKubeletWithImageList(
>     +               UID:       types.UID(kubelet.nodeName),
>     +               Namespace: "",
>     +       }
>     ++      etcHostsPathFunc := func(podUID types.UID) string { return getEtcHostsPath(kubelet.getPodDir(podUID)) }
>     +       // setup eviction manager
>     +-      evictionManager, evictionAdmitHandler := eviction.NewManager(kubelet.resourceAnalyzer, eviction.Config{}, killPodNow(kubelet.podWorkers, fakeRecorder), kubelet.podManager.GetMirrorPodByPod, kubelet.imageManager, kubelet.containerGC, fakeRecorder, nodeRef, kubelet.clock)
>     ++      evictionManager, evictionAdmitHandler := eviction.NewManager(kubelet.resourceAnalyzer, eviction.Config{}, killPodNow(kubelet.podWorkers, fakeRecorder), kubelet.podManager.GetMirrorPodByPod, kubelet.imageManager, kubelet.containerGC, fakeRecorder, nodeRef, kubelet.clock, etcHostsPathFunc)
>     +
>     +       kubelet.evictionManager = evictionManager
>     +       kubelet.admitHandlers.AddPodAdmitHandler(evictionAdmitHandler)
>     +diff --git a/src/import/pkg/kubelet/runonce_test.go b/src/import/pkg/kubelet/runonce_test.go
>     +index 7239133e481..9b162c11702 100644
>     +--- a/src/import/pkg/kubelet/runonce_test.go
>     ++++ b/src/import/pkg/kubelet/runonce_test.go
>     +@@ -125,7 +125,8 @@ func TestRunOnce(t *testing.T) {
>     +               return nil
>     +       }
>     +       fakeMirrodPodFunc := func(*v1.Pod) (*v1.Pod, bool) { return nil, false }
>     +-      evictionManager, evictionAdmitHandler := eviction.NewManager(kb.resourceAnalyzer, eviction.Config{}, fakeKillPodFunc, fakeMirrodPodFunc, nil, nil, kb.recorder, nodeRef, kb.clock)
>     ++      etcHostsPathFunc := func(podUID types.UID) string { return getEtcHostsPath(kb.getPodDir(podUID)) }
>     ++      evictionManager, evictionAdmitHandler := eviction.NewManager(kb.resourceAnalyzer, eviction.Config{}, fakeKillPodFunc, fakeMirrodPodFunc, nil, nil, kb.recorder, nodeRef, kb.clock, etcHostsPathFunc)
>     +
>     +       kb.evictionManager = evictionManager
>     +       kb.admitHandlers.AddPodAdmitHandler(evictionAdmitHandler)
>     +--
>     +2.17.0
>     +
>     diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2020-8558.patch b/recipes-containers/kubernetes/kubernetes/CVE-2020-8558.patch
>     new file mode 100644
>     index 0000000..9eeed26
>     --- /dev/null
>     +++ b/recipes-containers/kubernetes/kubernetes/CVE-2020-8558.patch
>     @@ -0,0 +1,51 @@
>     +From d22a61e21d677f7527bc8a4aeb3288c5e11dd49b Mon Sep 17 00:00:00 2001
>     +From: Casey Callendrello <cdc@redhat.com>
>     +Date: Fri, 29 May 2020 13:03:37 +0200
>     +Subject: [PATCH] kubelet: block non-forwarded packets from crossing the
>     + localhost boundary
>     +
>     +We set route_localnet so that host-network processes can connect to
>     +<127.0.0.1:NodePort> and it still works. This, however, is too
>     +permissive.
>     +
>     +So, block martians that are not already in conntrack.
>     +
>     +See: #90259
>     +Signed-off-by: Casey Callendrello <cdc@redhat.com>
>     +CVE: CVE-2020-8558
>     +Upstream-Status: Backport [https://github.com/kubernetes/kubernetes.git branch:release-1.16]
>     +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
>     +---
>     + src/import/pkg/kubelet/kubelet_network_linux.go | 16 ++++++++++++++++
>     + 1 file changed, 16 insertions(+)
>     +
>     +diff --git a/src/import/pkg/kubelet/kubelet_network_linux.go b/src/import/pkg/kubelet/kubelet_network_linux.go
>     +index 1c9ad46b989..d18ab75a053 100644
>     +--- a/src/import/pkg/kubelet/kubelet_network_linux.go
>     ++++ b/src/import/pkg/kubelet/kubelet_network_linux.go
>     +@@ -68,6 +68,22 @@ func (kl *Kubelet) syncNetworkUtil() {
>     +               klog.Errorf("Failed to ensure rule to drop packet marked by %v in %v chain %v: %v", KubeMarkDropChain, utiliptables.TableFilter, KubeFirewallChain, err)
>     +               return
>     +       }
>     ++
>     ++      // drop all non-local packets to localhost if they're not part of an existing
>     ++      // forwarded connection. See #90259
>     ++      if !kl.iptClient.IsIpv6() { // ipv6 doesn't have this issue
>     ++              if _, err := kl.iptClient.EnsureRule(utiliptables.Append, utiliptables.TableFilter, KubeFirewallChain,
>     ++                      "-m", "comment", "--comment", "block incoming localnet connections",
>     ++                      "--dst", "127.0.0.0/8",
>     ++                      "!", "--src", "127.0.0.0/8",
>     ++                      "-m", "conntrack",
>     ++                      "!", "--ctstate", "RELATED,ESTABLISHED,DNAT",
>     ++                      "-j", "DROP"); err != nil {
>     ++                      klog.Errorf("Failed to ensure rule to drop invalid localhost packets in %v chain %v: %v", utiliptables.TableFilter, KubeFirewallChain, err)
>     ++                      return
>     ++              }
>     ++      }
>     ++
>     +       if _, err := kl.iptClient.EnsureRule(utiliptables.Prepend, utiliptables.TableFilter, utiliptables.ChainOutput, "-j", string(KubeFirewallChain)); err != nil {
>     +               klog.Errorf("Failed to ensure that %s chain %s jumps to %s: %v", utiliptables.TableFilter, utiliptables.ChainOutput, KubeFirewallChain, err)
>     +               return
>     +--
>     +2.17.0
>     +
>     diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2020-8559.patch b/recipes-containers/kubernetes/kubernetes/CVE-2020-8559.patch
>     new file mode 100644
>     index 0000000..f47826d
>     --- /dev/null
>     +++ b/recipes-containers/kubernetes/kubernetes/CVE-2020-8559.patch
>     @@ -0,0 +1,148 @@
>     +From ba3ca4929ed3887c95f94fcf97610f3449446804 Mon Sep 17 00:00:00 2001
>     +From: Tim Allclair <tallclair@google.com>
>     +Date: Wed, 17 Jun 2020 11:09:02 -0700
>     +Subject: [PATCH] Don't return proxied redirects to the client
>     +
>     +CVE: CVE-2020-8559
>     +Upstream-Status: Backport [https://github.com/kubernetes/kubernetes.git branch:release-1.16]
>     +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
>     +---
>     + .../k8s.io/apimachinery/pkg/util/net/http.go  |  2 +-
>     + .../apimachinery/pkg/util/net/http_test.go    | 12 ++---
>     + .../pkg/util/proxy/upgradeaware.go            | 10 ++++
>     + .../pkg/util/proxy/upgradeaware_test.go       | 47 ++++++++++++++++++-
>     + 4 files changed, 62 insertions(+), 9 deletions(-)
>     +
>     +diff --git a/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http.go b/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http.go
>     +index bd79d6c4a09..c24fbc6921c 100644
>     +--- a/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http.go
>     ++++ b/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http.go
>     +@@ -431,7 +431,7 @@ redirectLoop:
>     +
>     +               // Only follow redirects to the same host. Otherwise, propagate the redirect response back.
>     +               if requireSameHostRedirects && location.Hostname() != originalLocation.Hostname() {
>     +-                      break redirectLoop
>     ++                      return nil, nil, fmt.Errorf("hostname mismatch: expected %s, found %s", originalLocation.Hostname(), location.Hostname())
>     +               }
>     +
>     +               // Reset the connection.
>     +diff --git a/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http_test.go b/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http_test.go
>     +index 4e4e317b9a4..142b80f1a84 100644
>     +--- a/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http_test.go
>     ++++ b/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http_test.go
>     +@@ -330,13 +330,13 @@ func TestConnectWithRedirects(t *testing.T) {
>     +               redirects:   []string{"/1", "/2", "/3", "/4", "/5", "/6", "/7", "/8", "/9", "/10"},
>     +               expectError: true,
>     +       }, {
>     +-              desc:              "redirect to different host are prevented",
>     +-              redirects:         []string{"http://example.com/foo"},
>     +-              expectedRedirects: 0,
>     ++              desc:        "redirect to different host are prevented",
>     ++              redirects:   []string{"http://example.com/foo"},
>     ++              expectError: true,
>     +       }, {
>     +-              desc:              "multiple redirect to different host forbidden",
>     +-              redirects:         []string{"/1", "/2", "/3", "http://example.com/foo"},
>     +-              expectedRedirects: 3,
>     ++              desc:        "multiple redirect to different host forbidden",
>     ++              redirects:   []string{"/1", "/2", "/3", "http://example.com/foo"},
>     ++              expectError: true,
>     +       }, {
>     +               desc:              "redirect to different port is allowed",
>     +               redirects:         []string{"http://HOST/foo"},
>     +diff --git a/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go b/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go
>     +index fcdc76a0529..3a02919d135 100644
>     +--- a/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go
>     ++++ b/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go
>     +@@ -298,6 +298,16 @@ func (h *UpgradeAwareHandler) tryUpgrade(w http.ResponseWriter, req *http.Reques
>     +               rawResponse = headerBytes
>     +       }
>     +
>     ++      // If the backend did not upgrade the request, return an error to the client. If the response was
>     ++      // an error, the error is forwarded directly after the connection is hijacked. Otherwise, just
>     ++      // return a generic error here.
>     ++      if backendHTTPResponse.StatusCode != http.StatusSwitchingProtocols && backendHTTPResponse.StatusCode < 400 {
>     ++              err := fmt.Errorf("invalid upgrade response: status code %d", backendHTTPResponse.StatusCode)
>     ++              klog.Errorf("Proxy upgrade error: %v", err)
>     ++              h.Responder.Error(w, req, err)
>     ++              return true
>     ++      }
>     ++
>     +       // Once the connection is hijacked, the ErrorResponder will no longer work, so
>     +       // hijacking should be the last step in the upgrade.
>     +       requestHijacker, ok := w.(http.Hijacker)
>     +diff --git a/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware_test.go b/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware_test.go
>     +index 7d14f6534a8..236362373cd 100644
>     +--- a/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware_test.go
>     ++++ b/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware_test.go
>     +@@ -493,7 +493,7 @@ func (r *noErrorsAllowed) Error(w http.ResponseWriter, req *http.Request, err er
>     +       r.t.Error(err)
>     + }
>     +
>     +-func TestProxyUpgradeErrorResponse(t *testing.T) {
>     ++func TestProxyUpgradeConnectionErrorResponse(t *testing.T) {
>     +       var (
>     +               responder   *fakeResponder
>     +               expectedErr = errors.New("EXPECTED")
>     +@@ -541,7 +541,7 @@ func TestProxyUpgradeErrorResponse(t *testing.T) {
>     + 
>     + func TestProxyUpgradeErrorResponseTerminates(t *testing.T) {
>     +       for _, intercept := range []bool{true, false} {
>     +-              for _, code := range []int{200, 400, 500} {
>     ++              for _, code := range []int{400, 500} {
>     +                       t.Run(fmt.Sprintf("intercept=%v,code=%v", intercept, code), func(t *testing.T) {
>     +                               // Set up a backend server
>     +                               backend := http.NewServeMux()
>     +@@ -601,6 +601,49 @@ func TestProxyUpgradeErrorResponseTerminates(t *testing.T) {
>     +       }
>     + }
>     +
>     ++func TestProxyUpgradeErrorResponse(t *testing.T) {
>     ++      for _, intercept := range []bool{true, false} {
>     ++              for _, code := range []int{200, 300, 302, 307} {
>     ++                      t.Run(fmt.Sprintf("intercept=%v,code=%v", intercept, code), func(t *testing.T) {
>     ++                              // Set up a backend server
>     ++                              backend := http.NewServeMux()
>     ++                              backend.Handle("/hello", http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
>     ++                                      http.Redirect(w, r, "https://example.com/there", code)
>     ++                              }))
>     ++                              backendServer := httptest.NewServer(backend)
>     ++                              defer backendServer.Close()
>     ++                              backendServerURL, _ := url.Parse(backendServer.URL)
>     ++                              backendServerURL.Path = "/hello"
>     ++
>     ++                              // Set up a proxy pointing to a specific path on the backend
>     ++                              proxyHandler := NewUpgradeAwareHandler(backendServerURL, nil, false, false, &fakeResponder{t: t})
>     ++                              proxyHandler.InterceptRedirects = intercept
>     ++                              proxyHandler.RequireSameHostRedirects = true
>     ++                              proxy := httptest.NewServer(proxyHandler)
>     ++                              defer proxy.Close()
>     ++                              proxyURL, _ := url.Parse(proxy.URL)
>     ++
>     ++                              conn, err := net.Dial("tcp", proxyURL.Host)
>     ++                              require.NoError(t, err)
>     ++                              bufferedReader := bufio.NewReader(conn)
>     ++
>     ++                              // Send upgrade request resulting in a non-101 response from the backend
>     ++                              req, _ := http.NewRequest("GET", "/", nil)
>     ++                              req.Header.Set(httpstream.HeaderConnection, httpstream.HeaderUpgrade)
>     ++                              require.NoError(t, req.Write(conn))
>     ++                              // Verify we get the correct response and full message body content
>     ++                              resp, err := http.ReadResponse(bufferedReader, nil)
>     ++                              require.NoError(t, err)
>     ++                              assert.Equal(t, fakeStatusCode, resp.StatusCode)
>     ++                              resp.Body.Close()
>     ++
>     ++                              // clean up
>     ++                              conn.Close()
>     ++                      })
>     ++              }
>     ++      }
>     ++}
>     ++
>     + func TestDefaultProxyTransport(t *testing.T) {
>     +       tests := []struct {
>     +               name,
>     +--
>     +2.17.0
>     +
>     diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
>     index 941e0ca..fbe2dd8 100644
>     --- a/recipes-containers/kubernetes/kubernetes_git.bb
>     +++ b/recipes-containers/kubernetes/kubernetes_git.bb
>     @@ -16,6 +16,9 @@ SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.16;name=k
>                 file://CVE-2020-8552.patch \
>                 file://CVE-2020-8555.patch \
>                 file://CVE-2019-11254.patch \
>     +           file://CVE-2020-8557.patch \
>     +           file://CVE-2020-8558.patch \
>     +           file://CVE-2020-8559.patch \
>                "
> 
>      DEPENDS += "rsync-native \
> 
> 
>     
> 
> --
> ---------------------
> Thanks,
> Zhixiong Chi
> Tel: +86-10-8477-7036
> 

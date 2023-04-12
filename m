Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F170C77B6E
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 17:03:59 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.49641.1681319036510072212
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 12 Apr 2023 10:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BDl/xtyV;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id dd8so209170qvb.13
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 12 Apr 2023 10:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681319035; x=1683911035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s+JcIsbIV0GzN32OKqsicVY6zeZpc8j5B0cKMgNUlZY=;
        b=BDl/xtyV7nLud9dVZo95ga0ImOW4FcOIrXPxos9WFfyuCt3YNVa5YsTGOKdjPqa6t7
         xQhtfRFPxVRf3rPT5X3rp/Xow/qE7L3+JxpNkatbn0lL2TBxycVP4aHQReASSNJpqhaa
         oB0b9ye0vHJ9O84uxpVLkAKVbctySnRUuolACxwwLE/o9568uzuJ2BYHKlv6RlrHzcXU
         6XSZoqHvxSf4QqnG8KLHcGt2FG/3a4Voosla+fR+Rj+TooFfNwKPKCgp1BFgOm9qLcoZ
         S1QadRIOQ7JuWR0QpcDwqPa6H8V1HbcOcSgX4jCV05uKDS62fdNbZThKdAytQwJzoTwh
         kSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681319035; x=1683911035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+JcIsbIV0GzN32OKqsicVY6zeZpc8j5B0cKMgNUlZY=;
        b=KQjHaRQhxbPrTrOpxSzWZd89eg9Kz8H4/Mg0mubXJfVHhaj7ssYStFb7oGQuOdzdLH
         +S5aJOuUbQNLGaHYMd0fGTUAlUOtOY+YEfNVT0qwngUwazNiEq+Zk3COvagWfjirLiBk
         WdwtbQICGpFpqsTd52HleOPXTSrkTfITU8KDUBmZyQ+BtPUqp2tLv9uYD56cuZ4dmY5Z
         g9eHmxggwECDJg1mwEYk72pUS4YqLNWojxAu79Oy3pj82A1yRLZEtIpzjPi0cesd7Ebf
         dKRNA5lkYjOsNkF1ScUQQq9vbl/WABDpHW7CehP3z8sLVxMryI8dtnLGuoJIX/+kpw6A
         apWQ==
X-Gm-Message-State: AAQBX9cCQYORB6NjAtIV8e2UBKZeoacJE9Vms/DiyM5XotaooeMaCLUy
	2fqcuouTszXGt7Yz/jhDuGLTnZDuB7aspw==
X-Google-Smtp-Source: AKy350aOLNHGK0ULiYskX2J8Q36qCQSi7nfgZA0eOE2RX4YGwCXu6aN8+9YDK3T5LBvYP6j7j6UQ7g==
X-Received: by 2002:a05:6214:c27:b0:5ef:4a4b:cdea with SMTP id a7-20020a0562140c2700b005ef4a4bcdeamr401613qvd.17.1681319035456;
        Wed, 12 Apr 2023 10:03:55 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id u8-20020a0ced28000000b005e8f61012e0sm3639171qvq.27.2023.04.12.10.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 10:03:55 -0700 (PDT)
Date: Wed, 12 Apr 2023 13:03:53 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: sakib.sajal@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH v2] kubernetes: update to
 v1.23.17
Message-ID: <ZDbkeYYdqQ9tdbCn@gmail.com>
References: <20230330151941.932323-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330151941.932323-1-sakib.sajal@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 12 Apr 2023 17:03:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7984

merged to kirkstone.

Bruce

In message: [meta-virtualization][kirkstone][PATCH v2] kubernetes: update to v1.23.17
on 30/03/2023 sakib.sajal@windriver.com wrote:

> Bumping kubernetes to version 1.23.17, which comprises of the following commits:
>     $ git log --no-merges --oneline fbcfa330..953be892
>     953be892721 (tag: v1.23.17) Release commit for Kubernetes v1.23.17
>     6e8e51a6e9b releng: Update images, dependencies and version to Go 1.19.6
>     717b7220f1e Update golang.org/x/net to v0.7.0
>     7ce32a84313 Pin golang.org/x/net to v0.4.0
>     39644edd8c5 add scale test for probes
>     ce58b0469ad use custom dialer for http probes
>     1045dff13cf use custom dialer for tcp probes
>     2b17ed30b0e add custom dialer optimized for probes
>     817b9af22eb Update CHANGELOG/CHANGELOG-1.23.md for v1.23.16
>     cf0cb75908f (tag: v1.23.17-rc.0) Release commit for Kubernetes v1.23.17-rc.0
>     60e5135f758 (tag: v1.23.16) Release commit for Kubernetes v1.23.16
>     dd61fe9127c Fix issue that Audit Server could not correctly encode DeleteOption
>     da38bf46791 egress_selector: prevent goroutines leak on connect() step.
>     9f5af83b8fa Always dial using a context
>     f99efc598c3 tls.Dial() validates hostname, no need to do that manually
>     c4b42ed0f7d Do not include scheduler name in the preemption event message
>     9ddf8802962 Do not leak cross namespace pod metadata in preemption events
>     4dd99967bd7 pkg/controller/job: re-honor exponential backoff
>     53ae12b797c releng: Update images, dependencies and version to Go 1.19.5
>     42cc636b84f Bump Konnectivity to v0.0.35
>     2dae3b969ff Improve vendor verification works for each staging repo
>     3e3120d5ed3 Licensing: skip modules with fewer subdirs than mods
>     9963f00a9cc Add .go-version file containing build go version
>     203d8ac8384 Generate and format files
>     e55e20ed50a delete hardcode go version in golangci-lint config
>     ca22f110d65 update golangci-lint for go 1.19
>     c54219fc231 Update go.mod to go1.19
>     fd427d821dd Update to go1.19
>     3be293676bd Adjust for os/exec changes in 1.19
>     3cab72ac5a7 fix patch_test for gofmt issue
>     249e05a172b Fix quotes that trip up gofmt
>     ab0f90f3d27 Update golangci-lint to 1.46.2 and fix errors
>     7e2e4821dd4 Match go1.17 defaults for SHA-1 and GC
>     0e2e6b9071a fix e2e coverage package for go 1.18
>     6179de8dbb0 Regenerate vendor
>     7c6027a4cd1 Update go.mod files to go1.18, update license vendor script
>     84fde398c4d Ignore unstructured log warnings
>     4da1f79f991 enhance and fix log calls
>     c95a8a17eb4 hack: integrate logcheck into golangci-lint
>     944176729a8 Fix verify: generated-stable-metrics wrt go 1.18
>     3aaa70a7c53 Regen mocks using go 1.18
>     42931a01097 TestWatchRestartsIfTimeoutNotReached: fix
>     0a782b495fd update golangci-lint to 1.45.0
>     1eeda2b1c27 Update to golang.org/x/... matching release-1.24
>     c94870e7a89 Fix SPDY proxy authentication with special chars
>     a346b14331f Improve error message when proxy connection fails
>     981b158aaa9 image pull event include duration with waiting
>     97953921640 kubelet: make the image pull time more accurate in event
>     bf234d8f0dc Update CHANGELOG/CHANGELOG-1.23.md for v1.23.15
>     5c4538e0ac3 (tag: v1.23.16-rc.0) Release commit for Kubernetes v1.23.16-rc.0
>     b84cb8ab293 (tag: v1.23.15) Release commit for Kubernetes v1.23.15
>     ae80fed2259 change k8s.gcr.io/pause to registry.k8s.io/pause
>     3ace674c79b Reduce load of Job integration test
>     1427350c045 Fix endpoint reconciler failing to delete masterlease
>     974e9492a7e use etcd 3.5.6-0 after promotion
>     ec2718f11d6 changelog: CVE-2022-3294 and CVE-2022-3162 were fixed in v1.23.14
>     4eee325a5a7 Limit request retrying to []byte request bodies
>     16c6800134b Merge pull request #113133 from sxllwx:automated-cherry-pick-of-#113133-upstream-release-1.25
>     c27b4b9db8c Add CVE-2021-25749 to CHANGELOG-1.23.md
>     25bc84525e3 Add CVE-2022-3294 to CHANGELOG-1.23.md
>     64548944d67 e2e: use custom timeouts in GetSnapshotContentFromSnapshot()
>     c73e13d1309 test/e2e/storage: replace hardcoded value with custom timeout in cleanup routine
>     65b9cb99755 Update CHANGELOG/CHANGELOG-1.23.md for v1.23.14
>     92d36466905 (tag: v1.23.15-rc.0) Release commit for Kubernetes v1.23.15-rc.0
>     3321ffc07d2 (tag: v1.23.14) Release commit for Kubernetes v1.23.14
>     073dca06ae0 Fix a conflict
>     65beed7952d StatefulSet: Cleanup the complex defer function updating the status
>     d737324312e Be sure to update the status of StatefulSet even if the new replica creation fails
>     bb7c395dd94 fix node address validation
>     073c05d169d Validate etcd paths
>     390fc213595 Use CheckAndMarkAsUncertainViaReconstruction for uncertain volumes
>     23184ed5f68 Remove volume from found during reconstruction if mounted
>     ac6efc17b96 Add unit test for verifying if processReconstructedVolumes works as expected
>     386b026d0b1 Address review comments
>     a44c6b9e317 Fix code to process volumes which were skipped during reconstruction
>     75b8b1ebfd5 Keep track of each pod that uses a volume during reconstruction
>     c5a565c69f8 kubelet: fix pod log line corruption when using timestamps and long lines
>     c33ae96c4b7 hack/scripts: use registry.k8s.io
>     304eb41e106 kubeadm: mutate ClusterConfiguration.imageRepository to "registry.k8s.io"
>     f1e3eabb139 add GetAllocatableCPUs test in cpumanager
>     67309f5422d fix GetAllocatableCPUs in cpumanager
>     a98d0db2af2 kubeadm: use registry.k8s.io instead of k8s.gcr.io
>     132565c82e2 do not return err when PodSandbox not exist
>     589223b64a8 e2e: restore volume lifecycle checks for csi-hostpath driver
>     4edf6775ef8 kubelet: fix volume reconstruction for CSI ephemeral volumes
>     6e3601cc720 NodeLifecycleController: Remove race condition
>     7bc8104ff65 kube-proxy wait for cluster cidr skip delete events
>     6cca0631918 kube-proxy handle node PodCIDR changs
>     f9e15b3ac3f etcd: Updated to v3.5.5
>     c2e5631742f Bump konnectivity network proxy to v0.0.33. Includes a couple bug fixes for better handling of dial failures. [Agent & Server](https://github.com/kubernetes-sigs/apiserver-network-proxy/commits/v0.0.33) include numerous other fixes.
>     b6e86eb30ab Merge pull request #109241 from ravisantoshgudimetla/sts-ar-optional
>     700be498954 service update event should be triggered when appProtocol in port is changed.
>     d053be81df1 Update CHANGELOG/CHANGELOG-1.23.md for v1.23.13
>     56453b2f0ae (tag: v1.23.14-rc.0) Release commit for Kubernetes v1.23.14-rc.0
>     592eca05be2 (tag: v1.23.13) Release commit for Kubernetes v1.23.13
>     bab054e4568 filter out terminated containers in cadvisor_stats_provider
>     4c6c616069d Make mount ref search more robust
>     9ed9ccfd275 CHANGELOG-1.23: Add missing changes for 1.23.12
>     760a96b2dbc Update CHANGELOG/CHANGELOG-1.23.md for v1.23.12
>     51c6ad6b97b Fix list estimator for lists that are executed as gets
>     4634d2f91e0 (tag: v1.23.13-rc.0) Release commit for Kubernetes v1.23.13-rc.0
>     c6939792865 (tag: v1.23.12) Release commit for Kubernetes v1.23.12
>     95d3fbc36dc kubeadm: allow RSA and ECDSA format keys in preflight check
>     9bebb528e09 Limit redirect proxy handling to redirected responses
>     59571b2f136 Make sure auto-mounted subpath mount source is already mounted
>     ae6a6dc2f8e Call SetupDevice only if Volume is not globally Mounted
>     860df6bfc18 Fixes kubelet log compression on Windows
>     ad16e6bb8c0 Update CHANGELOG/CHANGELOG-1.23.md for v1.23.11
>     222372b27c7 (tag: v1.23.12-rc.0) Release commit for Kubernetes v1.23.12-rc.0
>     dc2898b20c6 (tag: v1.23.11) Release commit for Kubernetes v1.23.11
>     301ea5b8cdb Reduce default gzip compression level from 4 to 1 in apiserver
>     0e4fc8b0e6c Add an option for aggregator
>     b69bbf36201 exec auth: support TLS config caching
>     479f049df90 Fix unit test
>     62e1ea58c44 Fix problem in updating VolumeAttached in node status
>     94b41ed31af Call queueSet::boundNextDispatchLocked enough
>     bc157c71601 Add etcd initialization in openapi tests
>     087362857b9 Marshal MicroTime to json and proto at the same precision
>     f58d3f3fe58 Windows: ensure runAsNonRoot does case-insensitive comparison on user name
>     da7c41caa91 Tolerate sub-microsecond eventTime changes on update
>     446f23cea45 Improve kubectl display of invalid errors
>     17335199bab fix unmatch reason when updating pod status
>     240590c3eaa fix nestedPendingOperations mount and umount parallel bug
>     091f4f00395 client-go: make retry in Request thread safe
>     7adf53240c7 Skip "instance not found" error for LB backend address pools
>     5f4953560cb Remove AttachID matching from Detach
>     93dedd539c4 update structured-merge-diff to 4.2.3
>     be5dd1bdc79 regression test for exponential recursion bug on CRDs
>     7ce504b9281 Update CHANGELOG/CHANGELOG-1.23.md for v1.23.10
>     b445d7947a8 (tag: v1.23.11-rc.0) Release commit for Kubernetes v1.23.11-rc.0
>     7e54d50d301 (tag: v1.23.10) Release commit for Kubernetes v1.23.10
>     431ee1484e2 fix a memory leak problem when calling DryRunPreemption
>     23e9d632ad6 Fix deleting UIDs tracking expectations
>     24b8252b105 Fix JobTrackingWithFinalizers when a pod succeeds after the job fails
>     e1ab1debdba hardens integration job tests
>     fe8b09dde6a Copy etcd client debug level logic from upstream
>     61432c1fa21 Give etcd client logger a name
>     c7399df0a5f Share a single etcd3 client logger across all clients
>     9a60b0c5f4b Disable the etcd3 client logger
>     c078600b61d Update Go to 1.17.13
>     a86b61cf3c9 Update Go to 1.17.12
>     5f436c0fb35 fix a possible panic because of taking the address of nil
>     e3a4a91c768 Update naming for a const
>     f00326d1b46 Add rate limiting when calling STS assume role API
>     f008acd481e Ensure the dir of --audit-log-path exists
>     4bc41ee70ca Fix kubelet panic when accessing metrics/resource endpoint
>     b26a7082ad2 Update CHANGELOG/CHANGELOG-1.23.md for v1.23.9
>     90ecbd8cf26 (tag: v1.23.10-rc.0) Release commit for Kubernetes v1.23.10-rc.0
>     c1de2d70269 (tag: v1.23.9) Release commit for Kubernetes v1.23.9
>     579ca64e444 Fixing logic for kubelet permissions check on windows
>     71a4c69a211 Do not skip job requeue in conflict error
>     bf4cb96e0f0 kubeadm: fix the bug that configurable KubernetesVersion not respected during kubeadm join
>     c67e53398b7 Bump cAdvisor to v0.43.1
>     3cc22b53887 Fix: filter out unsatisfied nodes when calling AddPod in PodTopologySpread
>     7d0a546b413 Fixing issue in generatePodSandboxWindowsConfig for hostProcess containers by where pod sandbox won't have HostProcess bit set if pod does not have a security context but containers specify HostProcess.
>     3d5c2341271 Add retry logic for Unix Domain sockets on Windows
>     602dd1dbcfd kubeadm: fix the bug that configurable KubernetesVersion not respected during kubeadm join
>     3d1baf7ff2f GIT-110239: fix activeDeadlineSeconds enforcement bug
>     2eed3eb9177 fix: --chunk-size with selector returns missing result
>     3964e236193 Fixed winkernel proxy failing to query v1 endpoints created by dockershim CNIs
>     c535496be2c Winkernel proxier cache HNS data to improve syncProxyRules performance
>     938a3203c60 Update CHANGELOG/CHANGELOG-1.23.md for v1.23.8
>     05a1dd747bd (tag: v1.23.9-rc.0) Release commit for Kubernetes v1.23.9-rc.0
>     a12b886b1da (tag: v1.23.8) Release commit for Kubernetes v1.23.8
>     a736f42c3ae apiserver: printers should use int64
>     99c3de2562d Revert "Automated cherry pick of #109124: Winkernel proxier cache HNS data to improve syncProxyRules"
>     930092e7153 Add test to check for _v2
>     e6cce430f9c Prune defaults for CRD serving
>     e38a625e116 add missing error handling steps
>     c14aa800f45 add missing error handling steps
>     d5eeb104cf2 fix image pulling failure when IMDS is unavailalbe in kubelet startup
>     772494dc74e test: update graceful node shutdown e2e with watch
>     6041228d192 move the ignore logic higher up to the reconciler
>     0e1588c7584 Ignore EndpointSlices that are already marked for deletion
>     96ddfd61755 kubelet: Mark ready condition as false explicitly for terminal pods
>     57c626299a8 agnhost: bump version 2.39
>     c796630e8de Update Go to 1.17.11
>     1f58ea0af02 add service e2e tests
>     6bdb7a15205 kubelet: add e2e test to verify probe readiness
>     7061d1f4660 kubelet: only shutdown probes for pods that are terminated
>     5899d561f34 kubelet: Pod probes should be handled by pod worker
>     bb09c564009 Enable resize feature
>     a36ff8366b7 Reject proxy requests to 0.0.0.0 as well
>     082620e9cb9 ipvs: fix prevent concurrent map read and map write for 1.23
>     3da57319709 cpu manager policy set to none, no one remove container id from container map, lead memory leak
>     b24dfdee1e0 fix audit union loop variables in closures
>     67219f30455 Updating e2e test to check EndpointSlices and Endpoints as well
>     d5a61580c68 e2e: services with evicted pods doesn't have endpoints
>     5adb67a7eb3 e2e test for evicted pods
>     e0fdecef811 endpoints controller: don't consider terminal endpoints
>     4e9638063f5 endpointslices: terminal pods doesn't receive enpoints
>     51ef8e3917d add pod util to verify pod is terminal
>     1eef73e88e4 Update CHANGELOG/CHANGELOG-1.23.md for v1.23.7
>     782029346ae (tag: v1.23.8-rc.0) Release commit for Kubernetes v1.23.8-rc.0
>     42c05a54746 (tag: v1.23.7) Release commit for Kubernetes v1.23.7
>     e90d92fa5b2 Add test for checking ephemeral volume expansion
>     d6260cf1df9 Fix resizing of ephemeral volumes
>     51f1da831de Fix requests scope classification
>     87e74167efe Update Go to 1.17.10
>     830186c95e8 authn: fix cache mutation by AuthenticatedGroupAdder
>     131a5090f34 GCE: skip updating and deleting external loadbalancers if service is managed outside of service controller
>     424dde318ce untangle fix with healthCheck feature
>     6bf9857f1f0 Winkernel proxier cache HNS data to improve syncProxyRules performance
>     9b4dee89278 Wait for cache to sync in job's TestWatchOrphanPods
>     8f4ff396eb3 fix: exclude non-ready nodes and deleted nodes from azure load balancers
>     fb70875f1a9 Fix OpenAPI loading error caused by empty APIService
>     88bde765611 Test Foreground deletion in job integration
>     11e6ec43964 Fix removing finalizer from finished jobs
>     b6804313363 Don't mark job as failed until expectations are satisfied
>     d0b5adb539d Integration test for backoff limit and finalizers
>     43ec5bfa40c tests: Updates the should delete a collection of pods test
>     fe0da319ad4 component-base: replace url in rest client metrics
>     21b9e9902e7 fix broken find command
>     70882c44773 Allow KUBE_TEST_REPO_LIST to be a remote url as well
>     6d010706ea4 Disable JobTrackingWithFinalizers due to unresolved bug
>     fa7ac2ece9a Update CHANGELOG/CHANGELOG-1.23.md for v1.23.6
>     bb18301a5c8 (tag: v1.23.7-rc.0) Release commit for Kubernetes v1.23.7-rc.0
>     ad3338546da (tag: v1.23.6) Release commit for Kubernetes v1.23.6
>     3df0ce04724 Update Go to 1.17.9
>     4d38e6e99c9 Correct event registration for multiple scheduler plugins.
>     8e1fb52b49b kubelet: rename closeAllConns to onHeartbeatFailure
>     359ad38d11d kubelet apiserver: be gentle closing connections on heartbeat failures
>     327e99d3393 Avoid updating Services with stale specs Fix the bug that service specs in servicesToUpdate may have been updated by clients.
>     727aa48b989 Fix: abort nominating a pod that was already scheduled to a node
>     f0753a49862 fix: race detected in TestErrConnKilled
>     51c860863f7 Replace hardcoded kubectl with kubectl.Name()
>     04d413b92ab kubectl: fix hard-coded value in zsh completion
>     90539b64efd Fix the overestimated cost of deletaged API requests in P&F
>     813751ef7a2 omit enums from static openapi snapshots used to generate clients
>     4d3efbab01d Drop enum tag from certificate request condition
>     814ae980477 Addresses the issue which caused #109115
>     6ba5a0bc383 Add test for indexer with multiple values
>     9342552112d Reduce number of pods in Job+GC tests
>     e637f54d914 kubeadm: add etcd flag for member data consistency
>     897eb36396d Adjust validation checks to pass for both client-side and
>     server-side validation
>     f75e1b071d4 Remove finalizer when orphaned
>     56d9c45895c Fix: Clean job tracking finalizer from orphan pods
>     3b84efd15de Add test for Background delete propagation
>     8077e58bff1 Add integration test for orphan pods when there is GC
>     2faf6317075 Fix a bug that out-of-tree plugin is misplaced when using scheduler v1beta3 config
>     cf4ede44fe7 ipvs: remove port opener
>     70166f26b89 iptables: remove port opener
>     8e44552a6f9 kubelet: If the container status is created, we are waiting
>     02f2986b850 Skip updating Endpoints and EndpointSlice if no relevant fields change
>     f628706339c client-go: update generated
>     3de44bd759a default kubernetes agent for generated clients
>     8d9001df847 generated: make update
>     f4cd617b74f polish comments of non-enum values.
>     2538b2ef438 unmark non-validated types as enums.
>     33a72b11fe8 azure_file: try to get secret namespace from ClaimRef
>     451afa701bf azure_file: add namespace tests for InTree to CSI conversion
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  recipes-containers/kubernetes/kubernetes_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index 170a938..f475bd7 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -5,8 +5,8 @@ applications across multiple hosts, providing basic mechanisms for deployment, \
>  maintenance, and scaling of applications. \
>  "
>  
> -PV = "v1.23.6+git${SRCREV_kubernetes}"
> -SRCREV_kubernetes = "fbcfa33018159c033aee77b0d5456df6771aa9b5"
> +PV = "v1.23.17+git${SRCREV_kubernetes}"
> +SRCREV_kubernetes = "953be8927218ec8067e1af2641e540238ffd7576"
>  SRCREV_kubernetes-release = "7c1aa83dac555de6f05500911467b70aca4949f0"
>  PE = "1"
>  
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7972): https://lists.yoctoproject.org/g/meta-virtualization/message/7972
> Mute This Topic: https://lists.yoctoproject.org/mt/97953124/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



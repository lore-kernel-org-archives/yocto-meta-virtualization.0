Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.18085.1627607710425342571
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 29 Jul 2021 18:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 16U1F9Cl017277
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Jul 2021 18:15:09 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 29 Jul 2021 18:15:08 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 29 Jul 2021 18:15:08 -0700
From: sakib.sajal@windriver.com
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][hardknott][PATCH] k8s: update to v1.20.9
Date: Thu, 29 Jul 2021 21:15:07 -0400
Message-ID: <20210730011507.21104-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Upgrading kubernetes to version 1.20.9 release, which includes the following commits:

    7a576bc3935 Release commit for Kubernetes v1.20.9
    c553357e334 Merge pull request #103677 from puerco/go-11514
    57f38e4e5bb Bump to golang 1.15.14 in build/**
    2cb44e0f167 Bump to golang 1.15.14 in cluster/** and staging/**
    d5d4b638925 Bump to golang 1.15.14 in test/**
    9bdbdaa89a7 Merge pull request #103490 from thejoycekung/automated-cherry-pick-of-#103235-upstream-release-1.20
    66e6d5ee1fa Merge pull request #103171 from tkashem/automated-cherry-pick-of-#96966-release-1.20
    2d0456982ed Merge pull request #103139 from sbangari/automated-cherry-pick-of-#103138-upstream-release-1.20
    2e94d9010bc Merge pull request #103278 from marwanad/automated-cherry-pick-of-#103133-upstream-release-1.20
    449b9314e0f Merge pull request #102390 from CaoDonghui123/automated-cherry-pick-of-#99680-upstream-release-1.20
    86c8e960eea Merge pull request #103320 from jpbetz/fix-102749-1.20
    103ff842129 Update debian-iptables image to buster-v1.6.5
    a833cba11c6 Update debian-base image to buster-v1.8.0
    a67405b9434 Bump SMD to v4.1.2 to pick up #102749 fix
    bd5c54805d4 generate scheduler merge patches on the pod status instead of the full pod
    d80e3d104c1 Merge pull request #102999 from gnufied/automated-cherry-pick-of-#102892-upstream-release-1.20
    96924ca6e66 p&f e2e test: log response header for better troubleshooting
    b445dc60b73 Loadbalancer IngressIP policy should be configured as non-DSR to enable routing mesh by default
    e09055bf5ce Merge pull request #102995 from alculquicondor/automated-cherry-pick-of-#102925-upstream-release-1.20
    a5e231aad73 Merge pull request #102035 from pacoxu/automated-cherry-pick-of-#101595-upstream-release-1.20
    169bed9c3b7 Do not throw error when we can't get canonical path
    411bd654498 Fix Node Resources plugins score when there are pods with no requests
    a003964b8d1 Merge remote-tracking branch 'origin/release-1.20' into release-1.20
    a1892cea1a7 Merge pull request #102853 from gnufied/automated-cherry-pick-of-#102845-upstream-release-1.20
    1889d52d73c Update CHANGELOG/CHANGELOG-1.20.md for v1.20.8
    fae91cad6d0 Release commit for Kubernetes v1.20.9-rc.0
    5575935422c Release commit for Kubernetes v1.20.8
    382e93e46cf Merge pull request #102786 from thejoycekung/go-11513
    f46525aa743 Remove error wrap from logs
    1e97120d353 Merge pull request #101813 from melnikalex/automated-cherry-pick-of-#101592-upstream-release-1.20
    66612c8c554 Merge pull request #102704 from jackfrancis/automated-cherry-pick-of-#102673-upstream-release-1.20
    9bcd24dcc42 staging/publishing: Set default go version to go1.15.13
    9710d085c83 build: Update to k/repo-infra@v0.1.8 (supports go1.15.13)
    24c35ec5eef Use go-runner:v2.3.1-go1.15.13-buster.0 image (built on go1.15.13)
    836cf3f8d5e Update to go1.15.13
    88ad9ae6baf Merge pull request #102703 from aojea/automated-cherry-pick-of-#102683-upstream-release-1.20
    d5eb450f1b7 Merge pull request #101886 from nilo19/automated-cherry-pick-of-#101739-upstream-release-1.20
    68ec9e01490 Merge pull request #101543 from jingxu97/automated-cherry-pick-of-#101495-upstream-release-1.20
    2b49e69455c Merge pull request #102580 from jingxu97/automated-cherry-pick-of-#96843-upstream-release-1.20
    3d5750d0b53 feat: remove ephemeral-storage etcd requirement
    b8f83843a1f endpointslicemirroring controller mirror address status
    76167c6ebf6 Merge pull request #102547 from nilo19/automated-cherry-pick-of-#102516-upstream-release-1.20
    38c41a774fd Merge pull request #102674 from Huang-Wei/automated-cherry-pick-of-#102498-upstream-release-1.20
    dcec9a80597 Merge pull request #102515 from ahg-g/automated-cherry-pick-of-#102306-#102465-upstream-release-1.20
    70bfeab1816 Merge pull request #102499 from jsturtevant/automated-cherry-pick-of-#98510-upstream-release-1.20
    15faec3cf79 Merge pull request #102350 from gnufied/speedup-vsphere-pv-provisioning-120
    4050a40c7be Merge pull request #102164 from andyzhangx/automated-cherry-pick-of-#102083-upstream-release-1.20
    bf0f8cb339f Merge pull request #102118 from feiskyer/automated-cherry-pick-of-#102005-upstream-release-1.20
    f646410eb16 Merge pull request #101896 from aheng-ch/automated-cherry-pick-of-#101615-origin-release-1.20
    9c5dee066d8 Merge pull request #101861 from marseel/automated-cherry-pick-of-#101652-upstream-release-1.20
    9e001aa9208 Merge pull request #101796 from wzshiming/automated-cherry-pick-of-#100326-upstream-release-1.20
    9aae7d8e385 Merge pull request #101826 from feiskyer/automated-cherry-pick-of-#100948-upstream-release-1.20
    252474585f1 Merge pull request #102457 from timebertt/automated-cherry-pick-of-#102176-origin-release-1.20
    aec7df7af4f sched: fix a bug that a preemptor pod exists as a phantom
    449505fd852 Merge pull request #102586 from saschagrunert/release-1.20
    208f301b60e Revert "Cleanup portforward streams after their usage"
    067c3e7ef13 Remove unnecessary snapshot ability check
    706b995869d serviceOwnsFrontendIP shouldn't report error when the public IP doesn't match
    bd3ce3ada0a Merge pull request #102313 from cheftako/automated-cherry-pick-of-#102213-upstream-release-1.20
    a3f3695137f Fix VolumeAttachment garbage collection for migrated PVs
    ef655bda8ce Return UnschedulableAndUnresolvable when looking up volume-related resources returns NotFound error
    e160aa082f9 Return UnschedulableAndUnresolvable instead of Error when failing to lookup pvc or storageclass in VolumeZone plugin
    668e97e2033 Ignore transient errors when gather stats
    4940e1bba04 Speed up PV provisioning for vsphere driver
    266cc3eba11 fix error of setting negative value for containerLogMaxSize
    5f6b1faa3fc Merge pull request #102341 from cpanato/automated-cherry-pick-of-#102302-upstream-release-1.20
    d74b99b351f Upgrade konnectivity-client for GRPC connection fixes
    2e04c1984ec Update etcd image revision
    3b1851700be Update debian-base to buster-v1.7.0
    b81177ad5a8 Update debian-iptables to buster-v1.6.1
    b6b4b974eb9 Merge pull request #102043 from gjkim42/automated-cherry-pick-of-#102027-upstream-release-1.20
    6fd22ceadfc Merge pull request #102183 from julianvmodesto/automated-cherry-pick-of-#102105-upstream-release-1.20
    0c8a940bb52 Respect annotation size limit for SSA last-applied.
    1ddb11ab1a0 Remove unnecessary quotes from get-kube scripts
    8ae534aed1b Merge pull request #102226 from liggitt/automated-cherry-pick-of-#102224-upstream-release-1.20
    629f7b2380f Fix expired unit test certs
    1259f1374d6 Merge pull request #102000 from sbangari/automated-cherry-pick-of-#101358-upstream-release-1.20
    64e5538a211 fix: delete non existing disk issue
    5c0f874a4c5 Azure: avoid setting cached Sku when updating VMSS and VMSS instances
    fa5f52ab4bf Merge pull request #101981 from liggitt/automated-cherry-pick-of-#101950-upstream-release-1.20
    0943471406b Merge pull request #101802 from Jiawei0227/automated-cherry-pick-of-#101737-upstream-release-1.20
    8507827ef72 Update cos-gpu-installer image
    9fd63310788 Merge pull request #100587 from Joseph-Goergen/automated-cherry-pick-of-#99592-upstream-release-1.20
    811726df61c Ref counting is only applicable to Remote endpoints
    a561f961442 Make watch order conformance test reliable
    c86ea8108c3 Update CHANGELOG/CHANGELOG-1.20.md for v1.20.7
    213f20b0c84 Release commit for Kubernetes v1.20.8-rc.0
    132a687512d Release commit for Kubernetes v1.20.7
    d7f7c6bacee fix removing pods from podTopologyHints mapping
    ed19f8dba13 fix: avoid nil-pointer panic when checking the frontend IP configuration
    20dafb7d5c0 Use CSI driver to determine unique name for migrated in-tree plugins
    d656d408467 Merge pull request #101845 from cpanato/go11512
    9e227f1352a Add jitter to lease controller
    7ff67fd04bf staging/publishing: Set default go version to go1.15.12
    c0b28f220f3 build: Update to k/repo-infra@v0.1.7 (supports go1.15.12)
    9bc73e31a99 Use go-runner:v2.3.1-go1.15.12-buster.0 image (built on go1.15.12)
    e62db8cd84c Update to go1.15.12
    516dfa59e61 Merge pull request #100952 from saschagrunert/automated-cherry-pick-of-#99839-upstream-release-1.20
    bf13a7e598c Avoid caching the VMSS instances whose network profile is nil
    cc8a07f2510 Merge pull request #101818 from nilo19/automated-cherry-pick-of-#101752-upstream-release-1.20
    7cfe069cd6d fix: not tagging static public IP
    c4abedfce91 chunk target operatation for aws targetGroup
    6c9e3d8d2cf Merge pull request #101498 from ialidzhikov/automated-cherry-pick-of-#100944-upstream-release-1.20
    5149a75fb5f Fix watchForLockfileContention memory leak
    47e2caa226c Merge pull request #101550 from andyzhangx/automated-cherry-pick-of-#100731-upstream-release-1.20
    30d205ff416 Merge pull request #101519 from andyzhangx/automated-cherry-pick-of-#101398-upstream-release-1.20
    c28b41d542e Merge pull request #101769 from eddiezane/automated-cherry-pick-of-#101005-upstream-release-1.20
    097a895cf73 Merge pull request #101354 from andyzhangx/automated-cherry-pick-of-#101235-upstream-release-1.20
    04723692052 Merge pull request #99705 from andyzhangx/automated-cherry-pick-of-#99550-upstream-release-1.20
    fee056fe3e0 Merge pull request #101763 from aojea/automated-cherry-pick-of-#100103-upstream-release-1.20
    f757b3e8443 Merge pull request #101158 from serathius/automated-cherry-pick-of-#100013-upstream-release-1.20
    61e659964b4 Add test create service with ns
    0f2adadf432 Set namespace when using kubectl create service
    fe7d8068809 Automated cherry pick of #101377: Fix validation in kubectl create ingress (#101428)
    715fad26086 Updating EndpointSlice controllers to avoid duplicate creations
    5bd3ebfe860 Merge pull request #101545 from verult/automated-cherry-pick-of-#101347-upstream-release-1.20
    78bac86a978 Merge pull request #101503 from JornShen/cherry-pick-100913-1.20
    a04915a3946 Merge pull request #101224 from wzshiming/automated-cherry-pick-of-#101093-upstream-release-1.20
    680e537dbd3 Merge pull request #101345 from neolit123/automated-cherry-pick-of-#99336-origin-release-1.20
    6e0f1fe0ff3 Merge pull request #101103 from p0lyn0mial/automated-cherry-pick-of-#100959-upstream-release-1.20
    5f4013145da Update pkg/volume/azure_file/azure_provision.go
    749b68f779d Normalize share name to not include capital letters
    f701e3847d4 Extend pod start timeout to 5min for storage subpath configmap test
    d3758764782 Fix cleanupMountpoint issue for Windows
    a37f62b1490 fix: set "host is down" as corrupted mount
    708b441434a Merge pull request #101363 from xmudrii/automated-cherry-pick-of-#96882-upstream-release-1.20
    e91d9d51934 no watch endpointslice in userpace mode
    56a13cd9bf1 Ensure service deleted when the Azure resource group has been deleted
    4361731e73d Merge pull request #101386 from robscott/automated-cherry-pick-of-#101084-release-1.20
    dd95bba6cd1 Updating EndpointSlice validation to match Endpoints validation
    d21188fcf11 Make parallel build memory threshold configurable
    9b8b8282f54 Merge pull request #101126 from jackfrancis/automated-cherry-pick-of-#100200-upstream-release-1.20
    47442df6cc9 fix: azure file namespace issue in csi translation
    3cfd001c7b7 pkg/kubelet: improve the node informer sync check
    6cc5466e406 Merge pull request #101326 from joelsmith/automated-cherry-pick-of-#101306-upstream-release-1.20
    0fed52d2ed6 Additional CVE-2021-3121 fix
    75fcfc359b8 Merge pull request #101038 from AliceZhang2016/automated-cherry-pick-of-#100762-upstream-release-1.20
    91908ac2108 Fix startupProbe behaviour changed
    bfff15f5684 Fix test
    7e0a8fce3ac Merge pull request #101192 from cpanato/go11511-release-120
    1978727df23 staging/publishing: Set default go version to go1.15.10
    4c53c2f556a build: Update to k/repo-infra@v0.1.6 (supports go1.15.11)
    2881a64df51 Use go-runner:v2.3.1-go1.15.11-buster.0 image (built on go1.15.11)
    4d31b65d944 Update to go1.15.11
    0d404c0decd add duration encoder to structured logger
    c1bb92f1502 Merge pull request #101112 from tkashem/automated-cherry-pick-of-#100678-upstream-release-1.20
    b0641413768 Update CHANGELOG/CHANGELOG-1.20.md for v1.20.6
    f371f8b5de8 Release commit for Kubernetes v1.20.7-rc.0
    8a62859e515 Release commit for Kubernetes v1.20.6
    113ae8b06f2 exec test should not run in Parallel as feature gate is not locked
    bb636525375 hack/update-bazel.sh
    cb9f51ccb77 respect ExecProbeTimeout
    5ec5885eaef apf: exempt probes /healthz /livez /readyz
    e9372dcd113 DelegatingAuthenticationOptions TokenReview request timeout
    fcca48ecf76 list pod list once to avoid timeout
    148445452de Merge pull request #100525 from matthyx/automated-cherry-pick-of-#98571-upstream-release-1.20
    c9b9e61c263 Merge pull request #97012 from towca/patch-6
    24f6ab9b438 Cleanup portforward streams after their usage
    0cd35945de3 Merge pull request #100912 from nilo19/bug/cherry-pick-100690-1.20
    54b62e189be Merge pull request #100075 from ialidzhikov/automated-cherry-pick-of-#99169-upstream-release-1.20
    6edb1ecaa5e Merge pull request #100714 from kevindelgado/automated-cherry-pick-of-#100341-#98576-upstream-release-1.20
    47d338f422f Merge pull request #100722 from cici37/automated-cherry-pick-of-#98210-upstream-release-1.20
    aed6b74e944 Merge pull request #100691 from nilo19/bug/cherry-pick-574-1.20
    2ac4f20d916 Merge pull request #100414 from kishorj/automated-cherry-pick-of-#97431-upstream-release-1.20
    1f147c9daf3 Merge pull request #100379 from prameshj/automated-cherry-pick-of-#99595-upstream-release-1.20
    24e3fdde9d1 Merge pull request #100312 from freehan/automated-cherry-pick-of-#99858-upstream-release-1.20
    ca5eb11c513 Merge pull request #100084 from mborsz/automated-cherry-pick-of-#97009-#97480-#98257-upstream-release-1.20
    373d9d72f78 azure: fix node public IP not able to fetch issues from IMDS
    7b6a5f61871 Merge pull request #100157 from vteratipally/automated-cherry-pick-of-#95655-upstream-release-1.20
    b8f7e215eaa Fix test now that empty struct are tracked in mangaed fields
    be4e5045bf9 Merge pull request #100228 from sbangari/automated-cherry-pick-of-#99958-upstream-release-1.20
    593cd4db7a3 make generated_files
    edc823e71c9 Merge pull request #100399 from andyzhangx/revert-97449-automated-cherry-pick-of-#97417-upstream-release-1.20
    2448db42431 Update bazel and dependencies.
    c23ef1b8501 Update to use cliflag.NamedFlagSets
    27f793607fb Address comments.
    b33400139bf Update NodeIPAM wrapper
    3f67eb336bd Delete build file based on latest changes.
    8f86b0d6f8b Update extension mechanism and related sample.
    9f62b6e3e42 Address review comments
    92ad1ac4e93 Address review comments
    ebab94c722d Modify integration test to fill CCM test gap
    4f221deb97d Update test
    b832be3aec3 Move initialize cloud provider with client builder reference inside controller start func
    f8f5f8dc89d Separate example func and add README.md
    54815679578 Separate func
    5fba2668446 Add demonstration of wiring nodeIPAMController config object
    8e00b7ba1e7 Remove cloud provider name as input parameter.
    6a1c8c46a18 Fix flag passing in CCM.
    95714c2fe69 Use apply to create objects in TestApplyStatus
    beeeb1a8f0d Stop skipping APIService in apply test
    02c3a6373fc Stop clearing OpenAPIConfig for kube-aggregator
    c85828aed7b Declare TCP default for service port protocol
    bb59042ab9f Add ability to skip OpenAPI handler installation
    27b378ad88e do not tag user created public IPs
    7483d6fa733 Merge pull request #100667 from tkashem/automated-cherry-pick-of-#100638-upstream-release-1.20
    3b41bef385d apf: fix test flake
    7849986db90 Merge pull request #100443 from aojea/automated-cherry-pick-of-#98116-upstream-release-1.20
    67f7cc9db9f Merge pull request #100501 from joelsmith/automated-cherry-pick-of-#98477-upstream-release-1.20
    c7c94eab10d Merge pull request #100524 from tkashem/automated-cherry-pick-of-#100254-upstream-release-1.20
    0e5ae49894c Fixed the Dockerfile for the build-image to build from KUBE_BASE_IMAGE_REGISTRY
    c4ddcc9fb22 update gogo/protobuf to v1.3.2
    a8fea204700 Merge pull request #100111 from pacoxu/automated-cherry-pick-of-#100056-upstream-release-1.20
    5ec39ba3a65 Merge pull request #100541 from eddiezane/automated-cherry-pick-of-#100505-upstream-release-1.20
    50bfd4da078 Merge pull request #99038 from apelisse/update-smd-1.20
    5c2ee78eb7a Fixed describe ingress causing SEGFAULT
    cb2690d5c57 Update sigs.k8s.io/structured-merge-diff to v4.0.3
    372b41856ae Stop probing a pod during graceful shutdown
    1e316e6f90b apf: handle error from PollImmediateUntil
    939168c1530 Merge pull request #100375 from cpanato/go11510
    1211cc0faef staging/publishing: Set default go version to go1.15.10
    a7c878739f7 Merge pull request #100493 from roycaihw/automated-cherry-pick-of-#95783-upstream-release-1.20
    c5d2c88bf40 Merge pull request #100315 from deads2k/automated-cherry-pick-of-#99946-upstream-release-1.20
    5c928ab8791 Merge pull request #100380 from robscott/automated-cherry-pick-of-#99795-release-1.20
    a2ff92207dd webhook config manager: HasSynced returns true when the manager is synced with existing webhookconfig objects at startup
    6b618501f9c Merge pull request #100461 from liggitt/automated-cherry-pick-of-#98336-upstream-release-1.20
    140e9dd72de update metadata-concealment to 1.6 for removing legacy checking
    a53e27fb1a8 slice mirroring controller mirror annotations
    2a614fa45e1 additional subnet configuration for AWS ELB
    9f3bf75675f Revert "Automated cherry pick of #97417: fix azure file secret not found issue"
    9c6fb88d52e Use the correct volum handle format for GCE regional PD.
    7cb1061ad5d Increasing maximum number of ports allowed in EndpointSlice
    55fcfd708cc Support > 5 ports in L4 ILB.
    6e776670797 build: Update to k/repo-infra@v0.1.5 (supports go1.15.10)
    a822ae86400 Use go-runner:v2.3.1-go1.15.10-buster.0 image (built on go1.15.10)
    8dc4509e7d6 Update to go1.15.10
    6d41a9990f3 Update CHANGELOG/CHANGELOG-1.20.md for v1.20.5
    bd0426f32b9 Release commit for Kubernetes v1.20.6-rc.0
    6b1d87acf3c Release commit for Kubernetes v1.20.5
    16afd5e714b fix a bug where only service with less than 100 ports can have GCE load balancer
    f9583ca6d19 bazel
    487b07c5afb deepcopy statefulsets
    82cf2d8ca41 full deepcopy on munged pod spec
    6a1fff67539 remove pod toleration toleration seconds mutation
    bc25538854b add markers for inspected validation mutation hits
    4ae0cd194b1 move secret mutation from validation to prepareforupdate
    873af486957 remove unnecessary mutations in validation
    e1e4c5e89f4 tweak validation to avoid mutation
    7e48dab334a Merge pull request #100037 from gjkim42/automated-cherry-pick-of-#99600-upstream-release-1.20
    8d7f96f7d4e For LoadBalancer Service type don't create a HNS policy for empty or invalid external loadbalancer IP
    4b39e92880a Merge pull request #100060 from bobbypage/automated-cherry-pick-of-#95301-upstream-release-1.20
    3090d5ba861 Merge pull request #99207 from iwankgb/cadvisor_0.38.8
    989d96d6abe Merge pull request #100143 from robscott/automated-cherry-pick-of-#99756-release-1.20
    82a10c26a4d Merge pull request #99493 from Nordix/automated-cherry-pick-of-#99464-upstream-release-1.20
    6a21ad7c0ae Merge pull request #100113 from robscott/automated-cherry-pick-of-#99345-release-1.20
    6776ccfe7c6 Merge pull request #99091 from wzshiming/automated-cherry-pick-of-#98200-upstream-release-1.20
    24ab133b43d Merge pull request #98930 from huffmanca/automated-cherry-pick-of-#96021-upstream-release-1.20
    a1b0301da35 Merge pull request #99255 from wzshiming/automated-cherry-pick-of-#98088-upstream-release-1.20
    c1ee348e6b7 Merge pull request #99254 from wzshiming/automated-cherry-pick-of-#98005-upstream-release-1.20
    5fea98b4f95 Merge pull request #99744 from jingxu97/automated-cherry-pick-of-#99463-#99723-upstream-release-1.20
    feae2a5b775 Merge pull request #98811 from damemi/1.20-balance-nodes-ubernetes
    0796e6ca0d8 Moving docker options to daemon.json
    74d3baa6c23 Merge pull request #99826 from feiskyer/automated-cherry-pick-of-#99825-upstream-release-1.20
    1bc820511b8 Merge pull request #99008 from yujuhong/automated-cherry-pick-of-#98830-upstream-release-1.20
    4e4aea62b37 Merge pull request #99438 from yue9944882/automated-cherry-pick-of-#97957-upstream-release-1.20
    2cda9734a15 Updating EndpointSliceMirroring controller to wait for cache to be updated
    28263260b11 Merge pull request #99253 from wzshiming/automated-cherry-pick-of-#97950-upstream-release-1.20
    c4ebd758613 Updating EndpointSlice controller to wait for cache to be updated
    a660f5cbfb2 e2e fix: loosen configmap to 10 in resource quota
    8c06bdd0529 api-server add --lease-max-object-count
    7e9a4be4a5a apiserver add metric etcd_lease_object_counts
    67a75c277a5 apiserver add --lease-reuse-duration-seconds to config lease reuse duration
    d834777e74b Add tests for populated volumes
    8adb218cdec Fix comment on getPodVolumeSubpathListFromDisk
    70afbff84f2 Fix tests to test for new behavior
    b6f98d1c3a9 Add warnings after cleanup back
    c946996f218 Automatically remove orphaned pod's dangling volumes
    d3417520d28 Count pod overhead as an entity's resource usage
    f2fe40c6f8d Merge pull request #99164 from verult/automated-cherry-pick-of-#98555-upstream-release-1.20
    c4af4684437 Merge pull request #99587 from liggitt/automated-cherry-pick-of-#99538-upstream-release-1.20
    6c49363aed0 Merge pull request #98168 from CKchen0726/cherrypick_96876_1.20
    404866ab6d7 Ensure only one LoadBalancer rule is created when HA mode is enabled
    8559d41ec15 Fix issue in checking domain socket for plugin watcher
    033304932ba Use Lstat in plugin watcher to avoid Windows problem
    8feee7ef06c fix smb mount issue on Windows
    1e3c47e7f61 Merge pull request #99017 from aojea/automated-cherry-pick-of-#98305-upstream-release-1.20
    19c6bfe464c Merge pull request #99171 from jkh52/release-1.20
    7c7c7e65413 Skip visiting empty secret and configmap names
    085542b7cf7 Number of sockets is assumed to be same as NUMA nodes
    f90c43eb67e disables APF if the aggregated apiserver cannot locate the core kube-apiserver
    165e5664b0e Merge pull request #98369 from hasheddan/automated-cherry-pick-of-#97700-upstream-release-1.20
    e708a40ab97 Fix repeatedly aquire the inhibit lock
    dff5593d585 Sync node status during kubelet node shutdown
    849c0d19df7 remove executable permission bits
    8022487e21d Upgrading vendored dependencies
    68030c39db5 Upgrading cAdvisor to 0.38.8
    5eb14a18ce7 Update CHANGELOG/CHANGELOG-1.20.md for v1.20.4
    9fdbacd8db5 Release commit for Kubernetes v1.20.5-rc.0
    eda61d35915 build/OWNERS: Add Dan and Sascha as reviewers
    5ecc81d8dbb OWNERS(CHANGELOG): Move reviewers/approvers to CHANGELOG/ dir
    d61e4a1ff0a Bump konnectivity-client to v0.0.15 in release-1.20
    35062261c22 Storage e2e: Remove pd csi driver installation in GKE
    2786062c167 Fix dbus shutdown events not continuing if they are not valid
    d059a916c37 kube-proxy: clear conntrack entries after rules are in place
    f3c73ba7e50 Use -LiteralPath instead of -Path
    97dfcaa1a32 Escape the special character in vsphere windows path
    7748a7d8822 Include unit test
    d691bcf83a0 Adjust defer to correctly call
    f0a40f47245 do not remove volume dir when saveVolumeData fails
    2927f04acb0 Balance nodes in scheduling e2e
    1598f8b7e58 e2e: Pod should avoid nodes that have avoidPod annotation: clean remaining pods
    692caa52216 OWNERS(CHANGELOG): Add release-engineering-reviewers as reviewers
    af2eb120a2f OWNERS(CHANGELOG): Add release-engineering-reviewers as approvers
    c37df23228b OWNERS(sig-release): Add CHANGELOG aliases
    9163fc12fa8 OWNERS(build-image): Add Release Managers as reviewers
    d2487eea38e OWNERS(releng): Sync Release Managers
    5941f1cebb8 OWNERS(sig-release): Remove SIG Release approvers alias
    5935da7151c Merge pull request #96876 from howieyuen/no-execute-taint-missing
    f7b66fe5ad5 Bump Cluster Autoscaler to v1.20.0

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../kubernetes/kubernetes/CVE-2021-20206.patch      | 13 +++++++------
 recipes-containers/kubernetes/kubernetes_git.bb     |  4 ++--
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch b/recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch
index dc4e902..daf1f6d 100644
--- a/recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch
+++ b/recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch
@@ -1,9 +1,10 @@
-From 5e8f9a8a72351e2fb5bcea3e3c58c935314557b6 Mon Sep 17 00:00:00 2001
+From 78e7df60f2bec11a10c7b73475017a45391fe06e Mon Sep 17 00:00:00 2001
 From: Navid Shaikh <navids@vmware.com>
 Date: Thu, 6 May 2021 15:41:08 +0530
 Subject: [PATCH] Bump containernetworking/cni to v0.8.1
 
  Fix CVE-2021-20206
+
 CVE: CVE-2021-20206
 Upstream-Status: Backport [185f65fbddb5239666c0c67fb335589b7570f60c]
 Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
@@ -15,7 +16,7 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  4 files changed, 10 insertions(+), 5 deletions(-)
 
 diff --git a/src/import/go.mod b/src/import/go.mod
-index e0ba549ab40..d4cc9ce01a9 100644
+index 17ccf7e0b78..ac8af36c842 100644
 --- a/src/import/go.mod
 +++ b/src/import/go.mod
 @@ -28,7 +28,7 @@ require (
@@ -37,10 +38,10 @@ index e0ba549ab40..d4cc9ce01a9 100644
  	github.com/coreos/bbolt => github.com/coreos/bbolt v1.3.2
  	github.com/coreos/etcd => github.com/coreos/etcd v3.3.13+incompatible
 diff --git a/src/import/go.sum b/src/import/go.sum
-index 288f4554b1f..9168f49c859 100644
+index 8bfc2b0163c..5826dbf89ab 100644
 --- a/src/import/go.sum
 +++ b/src/import/go.sum
-@@ -113,8 +113,8 @@ github.com/containerd/ttrpc v1.0.2 h1:2/O3oTZN36q2xRolk0a2WWGgh7/Vf/liElg5hFYLX9
+@@ -110,8 +110,8 @@ github.com/containerd/ttrpc v1.0.2 h1:2/O3oTZN36q2xRolk0a2WWGgh7/Vf/liElg5hFYLX9
  github.com/containerd/ttrpc v1.0.2/go.mod h1:UAxOpgT9ziI0gJrmKvgcZivgxOp8iFPSk8httJEt98Y=
  github.com/containerd/typeurl v1.0.1 h1:PvuK4E3D5S5q6IqsPDCy928FhP0LUIGcmZ/Yhgp5Djw=
  github.com/containerd/typeurl v1.0.1/go.mod h1:TB1hUtrpaiO88KEK56ijojHS1+NeF0izUACaJW2mdXg=
@@ -50,7 +51,7 @@ index 288f4554b1f..9168f49c859 100644
 +github.com/containernetworking/cni v0.8.1/go.mod h1:LGwApLUm2FpoOfxTDEeq8T9ipbpZ61X79hmU3w8FmsY=
  github.com/coredns/corefile-migration v1.0.10 h1:7HI4r5S5Fne749a+JDxUZppqBpYoZK8Q53ZVK9cn3aM=
  github.com/coredns/corefile-migration v1.0.10/go.mod h1:RMy/mXdeDlYwzt0vdMEJvT2hGJ2I86/eO0UdXmH9XNI=
- github.com/coreos/bbolt v1.3.2 h1:wZwiHHUieZCquLkDL0B8UhzreNWsPHooDAG3q34zk0s=
+ github.com/coreos/bbolt v1.3.2/go.mod h1:iRUV2dpdMOn7Bo10OQBFzIJO9kkE559Wcmn+qkEiiKk=
 diff --git a/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/find.go b/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/find.go
 index e815404c859..e62029eb788 100644
 --- a/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/find.go
@@ -75,7 +76,7 @@ index e815404c859..e62029eb788 100644
  		return "", fmt.Errorf("no paths provided")
  	}
 diff --git a/src/import/vendor/modules.txt b/src/import/vendor/modules.txt
-index 6a263b51686..c3b68a5f547 100644
+index 83b5fbffd46..f278bb22122 100644
 --- a/src/import/vendor/modules.txt
 +++ b/src/import/vendor/modules.txt
 @@ -257,7 +257,7 @@ github.com/containerd/containerd/pkg/dialer
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index 7b9aab8..c476cff 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -5,8 +5,8 @@ applications across multiple hosts, providing basic mechanisms for deployment, \
 maintenance, and scaling of applications. \
 "
 
-PV = "v1.20.4+git${SRCREV_kubernetes}"
-SRCREV_kubernetes = "e87da0bd6e03ec3fea7933c4b5263d151aafd07c"
+PV = "v1.20.9+git${SRCREV_kubernetes}"
+SRCREV_kubernetes = "7a576bc3935a6b555e33346fd73ad77c925e9e4a"
 SRCREV_kubernetes-release = "cf1e18a801c2ec6cc8c3d3b83bf1cbc4cf0dbc53"
 
 SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.20;name=kubernetes \
-- 
2.32.0


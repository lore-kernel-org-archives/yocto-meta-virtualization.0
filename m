Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79440C8303C
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 10:37:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10749.1752230267862385755
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 11 Jul 2025 03:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=92870e9e9c=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B5t2bC024001
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 11 Jul 2025 03:37:47 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47q3jn67dx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 11 Jul 2025 03:37:46 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Fri, 11 Jul 2025 03:37:16 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Fri, 11 Jul 2025 03:37:14 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][walnascar][PATCH 1/1] kubernetes: Upgrade to 1.32.6
Date: Fri, 11 Jul 2025 16:07:40 +0530
Message-ID: <20250711103740.3168268-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 0GVfe3gs8NpSXviJGhX2VIOwh5rVW0PJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE5OCBTYWx0ZWRfX57BPErO3dL8v cj74uI2h7s7Bgfp1MzMfFGfIeRpqhCGfhdKZxFWlVDdMzliM1WkuyVUuDWtWWyuvRMVHOmIRa0Y bjD17EtJRPmmOaUn7hEZ4/pz0XD83wn5HGME33/3jAXoMhiAQNUOfZLlDZqfXBzhSi/47CGWYa9
 iSGU9YtBhO806k1y1aSTO9EMEtWwqVDCnqTBm5lxnT1HsG8rQANXQa2Gkt0xU+7aj+Ov0Y7ZtSP 0r+xlGpWyqdowg7YU7ZAJ4WhHyNdTWyeuTMedWrMtpjXsKOxS9jqTU8Abuifc+RtcUMrjWm9wQl 40DLnBshbf6yTwgk7uqJFJ18f+wKI1J7jKBZ30gS2QXYsfuWdNJbsIzf00IjSjEMsY0lZ8hitie UMp2zh21
X-Proofpoint-ORIG-GUID: 0GVfe3gs8NpSXviJGhX2VIOwh5rVW0PJ
X-Authority-Analysis: v=2.4 cv=fv3cZE4f c=1 sm=1 tr=0 ts=6870e97b cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=MkUnBrgfyNUA:10 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=6EjJrbmfs1toURgfeI4A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2507080198
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 11 Jul 2025 10:37:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9305

From: Soumya Sambu <soumya.sambu@windriver.com>

Bumping kubernetes to version v1.32.6, which comprises the following commits:

    036f7ed3f1f Release commit for Kubernetes v1.32.6
    66b2951498a Merge pull request #132225 from cpanato/update-go-1-32
    7246ec90c1b Bump images, dependencies and versions to go 1.23.10 and distroless iptables
    2aa6d7d4674 Merge pull request #131782 from rata/automated-cherry-pick-of-#131623-upstream-release-1.32
    5b3e813641d Merge pull request #132099 from gnufied/automated-cherry-pick-of-#131408-upstream-release-1.32
    09750267c3b Merge pull request #132010 from gnufied/automated-cherry-pick-of-#131987-upstream-release-1.32
    6471cec0de5 Merge pull request #131784 from rata/automated-cherry-pick-of-#130243-upstream-release-1.32
    790dc3b4fa5 Merge pull request #131652 from princepereira/automated-cherry-pick-of-#131506-upstream-release-1.32
    b41aa671242 Merge pull request #131786 from rata/automated-cherry-pick-of-#130800-upstream-release-1.32
    448eedf8efd Merge pull request #131875 from pohly/automated-cherry-pick-of-#131844-origin-release-1.32
    de8292ad6f1 Remove warning about resizing failed for unknown reason
    ec4c71b7055 Add tests that validate the return value of resize operation
    89d95c9713a Merge pull request #131936 from cpanato/update-go-1.32
    40849d37eae Bump images, dependencies and versions to go 1.23.9 and distroless iptables
    9a67ee4a707 DRA node: reject static pods which reference ResourceClaims
    07011c05b71 pkg/kubelet/userns: Remove skip on windows
    1d923fbc781 pkg/kubelet/userns: Wrap error to get mappings
    3755f8e2f28 pkg/kubelet/userns: Provide stub implementation for windows
    b5d6f06fe6e pkg/kubelet: Fix userns tests on Windows
    5e7201df697 Revert "Enforce the Minimum Kernel Version 6.3 for UserNamespacesSupport feature"
    a35311c3588 Revert "Switch hard error to a WARNING for kernel version check"
    54889f05324 userns: Wrap more errors
    9326fc30973 userns: Improve error returned if userns is not supported
    fd5862185f2 userns: Use len to handle empty non-nil slices
    95c119b504e Update CHANGELOG/CHANGELOG-1.32.md for v1.32.5
    9894294ef13 (tag: v1.32.5) Release commit for Kubernetes v1.32.5
    3f75cae6030 Merge pull request #131524 from carlory/automated-cherry-pick-of-#131495-release-1.32
    55a2f43a98f Merge pull request #131438 from gnufied/automated-cherry-pick-of-#131418-upstream-release-1.32
    01aff800b63 Merge pull request #131528 from ameukam/update-go-1-23-8
    9a57de0ec6f Update hnslib version in Windows KubeProxy.
    a624d76abdf Merge pull request #131428 from princepereira/automated-cherry-pick-of-#131138-upstream-release-1.32
    7ba97788a71 Bump images, dependencies and versions
    5ad726c6ef3 Handle unsupported node expansion for RWX volumes
    b23e637969f Manually adding fix for failing pull-kubernetes-typecheck tests which had dependency with this commit: https://github.com/kubernetes/kubernetes/commit/61863035803cc105619925a0fa23a779a9578bd4
    cdbea02d39f Mark NodeExpansion finsihed without featuregate check
    69e0af31000 Also change final status by removing featuregate check
    0bec23c9577 Check for newer fields when deciding expansion recovery feature status
    76bf5dbdc88 Fix for HNS local endpoint was being deleted instead of the remote endpoint.
    d5df907c3cb Update CHANGELOG/CHANGELOG-1.32.md for v1.32.4
    59526cd4867 (tag: v1.32.4) Release commit for Kubernetes v1.32.4
    bf1fded1f95 Merge pull request #130773 from JoelSpeed/automated-cherry-pick-of-#130450-kubernetes-release-1.32
    0b7ab453ce6 Merge pull request #130684 from carlory/automated-cherry-pick-of-#130335-upstream-release-1.32
    35716897a3d Merge pull request #131159 from wojtek-t/automated-cherry-pick-of-#131020-upstream-release-1.32
    7b326a95116 Fix race for sending errors in watch
    cdc807a9e84 Merge pull request #131154 from neolit123/automated-cherry-pick-of-#131153-origin-release-1.32
    b5f6d82ff5d CHANGELOG-1.32: fix release note about kubeadm upgrade phases
    01b87d211f1 Fix implementation of ContainsCIDR to allow non-equal addresses
    a0ad8fb28a4 Update CHANGELOG/CHANGELOG-1.32.md for v1.32.3
    32cc146f75a (tag: v1.32.3) Release commit for Kubernetes v1.32.3
    e3daed87346 fix handle terminating pvc when kubelet rebuild dsw
    ef4a6f98333 fix e2e
    ad0c8a10e4e add e2e test to reproduce unexpected unmount after kubelet is restarted
    1b7bbcf2f55 Merge pull request #130508 from cici37/automated-cherry-pick-of-#130035-upstream-release-1.32
    b6fd7487faa Update status before returning err
    d2dbce82b9e Merge pull request #130563 from bitoku/automated-cherry-pick-of-#130097-upstream-release-1.32
    b245ae997ee Merge pull request #130496 from sreeram-venkitesh/automated-cherry-pick-of-#129946-upstream-release-1.32
    d18b6d9d681 Merge pull request #130461 from kariya-mitsuru/automated-cherry-pick-of-#130405-upstream-release-1.32
    e6a89a28f38 Merge pull request #130313 from neolit123/automated-cherry-pick-of-#130202-origin-release-1.32
    31c7235f4c5 Modify how to check the status
    8636d1b4272 Add the feature gate `OrderedNamespaceDeletion` for apiserver.
    8516520fffa Merge pull request #130109 from varad-ahirwadkar/automated-cherry-pick-of-#129114-upstream-release-1.32
    8207fb465f2 Merge pull request #129690 from pohly/automated-cherry-pick-of-#129661-origin-release-1.32
    b0554e32c76 Merge pull request #130505 from aojea/automated-cherry-pick-of-#130484-upstream-release-1.32
    2a60692f5b6 conntrack reconciler must check the dst port
    642b0eae3dd fix(pod/util): typos in getting pod validation options
    dbf78217a10 Add Additional Tests
    1d3fafa1c7e Fix typo
    7826934ada9 Add ControllerRoles Test
    019c9b4d2dd Fix Fixture Data
    549220b61ec Add Watch to controller roles
    0821aa23081 Merge pull request #130165 from mimowo/automated-cherry-pick-of-#130164-upstream-release-1.32
    403f0ce511b Merge pull request #130070 from mimowo/automated-cherry-pick-of-#130068-upstream-release-1.32
    85ff7928f46 Merge pull request #130356 from aojea/automated-cherry-pick-of-#130348-upstream-release-1.32
    53a53b7f62c Merge pull request #130392 from mrIncompetent/automated-cherry-pick-of-#129307-upstream-release-1.32
    f0100b2b68e Merge pull request #130136 from AwesomePatrol/automated-cherry-pick-of-#130113-upstream-release-1.32
    ea73dad5498 Merge pull request #130332 from richabanker/automated-cherry-pick-of-#129996-upstream-release-1.32
    1c07a398470 fix copyright year
    849aa0858f3 Generate register files for all examples
    6ad91995281 add simpletype pkg in v1 for register-gen test
    5fa72a8c1db Add codegen::register to hack/update-codegen.sh
    c05e46c1630 Add missing imports in register-gen
    4c2a0b85f89 Revert "Add random interval to nodeStatusReport interval every time after an actual node status change"
    99eedea5cca Remove the feature-gate check before populating serverRunOptions.Flagz
    a0eb3acf30e test: Add emulated-version flag verification in flagz test
    8b3a93b843e fix: flagz endpoint to return parsed flags value
    412c353d05b kubeadm: fix panic when no UpgradeConfiguration was found in the config file
    dce86010a0f Merge pull request #130034 from aroradaman/automated-cherry-pick-of-#130032-upstream-release-1.32
    fdf6d464bf0 Merge pull request #130253 from fuweid/1.32-backport-130126
    f5fc57e1ee8 proxy: should add PingPeriod for websocket translator
    0126bb57a8f Merge pull request #130175 from liggitt/go-tools-132
    1f27b75275d Honor KUBE_HACK_TOOLS_GOTOOLCHAIN
    00f135bb643 Deflake the PodReplacementPolicyFeatureToggling Job integration test
    1ac9e213a8d Limit ResourceQuota LIST requests to times when informer is not synced
    ac28939fdd6 Update CHANGELOG/CHANGELOG-1.32.md for v1.32.2
    67a30c0adcf (tag: v1.32.2) Release commit for Kubernetes v1.32.2
    d428c6b8fe6 kubelet: fix DRA registration test
    5841717525c Merge pull request #130078 from cpanato/update-go-132
    ae0ec29cbf4 Bump images, dependencies and versions to go 1.23.6 and distroless iptables
    d589f566578 Fix the flaky Job test: TestSuccessPolicy_ReEnabling
    393ffc7d26d Merge pull request #129966 from cpanato/update-go-rel132
    f0022d37526 bump netlink
    80fb77ad8e4 Merge pull request #130015 from aramase/aramase/f/disable_serviceaccountnodeaudiencerestriction_1.32
    b53c36d3273 Merge pull request #130010 from tallclair/automated-cherry-pick-of-#129739-upstream-release-1.32
    953ac56c211 Disable ServiceAccountNodeAudienceRestriction feature gate by default in v1.32
    302fab74111 Kubelet server handler cleanup
    33ca8812233 Merge pull request #129928 from mimowo/fix-job-int-test-1.32
    fa68823677f Bump images, dependencies and versions to go 1.23.5 and distroless iptables
    45b2f1c2008 Fix the remaining flaky integration tests in Job controller
    9d0179ee11d WIP: fix the flaky Job integration tests
    faf35b4eac9 Merge pull request #129862 from neolit123/automated-cherry-pick-of-#129859-origin-release-1.32
    5cc748f3242 kubeadm: use the v1beta4 EtcdAPICall timeout for etcd calls
    dac2e30a730 Merge pull request #129627 from gnufied/automated-cherry-pick-of-#129618-upstream-release-1.32
    ad81b22354c Merge pull request #129743 from pjsharath28/automated-cherry-pick-of-#128997-upstream-release-1.32
    ce39aed39ed Merge pull request #129740 from bobsongplus/automated-cherry-pick-of-#129629-upstream-release-1.32
    4ac02cbbbd9 Merge pull request #129608 from neolit123/automated-cherry-pick-of-#129594-origin-release-1.32
    00faa5e7ae9 DRA CEL: skip estimating the cost in the scheduler
    5648b9caa81 Merge pull request #129782 from pohly/apidiff-release-1.32
    9ade604a07a hack: backport apidiff.sh
    11c3bd3038d Fix: touch /dev/null permission denied on macos
    643951a9622 Merge pull request #129674 from gohilankit/automated-cherry-pick-of-#129630-upstream-release-1.32
    4e43ab095e8 Added check for multipath device mapper
    f89e4c08cfe DRA CEL: add missing size estimator
    051414a53a0 Fix Portworx plugin's CSI translation to copy secret name & namespace
    6473e7b6cae Update CHANGELOG/CHANGELOG-1.32.md for v1.32.1
    e9c9be4007d (tag: v1.32.1) Release commit for Kubernetes v1.32.1
    0bf3f03dda7 We still can't rely on first condition being fs-expansion pending condition
    570f5501897 Bump CSI sidecars to fix CI issues and such

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 recipes-containers/kubernetes/kubernetes_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index b6eb4946..183ba7fd 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -5,9 +5,9 @@ applications across multiple hosts, providing basic mechanisms for deployment, \
 maintenance, and scaling of applications. \
 "
 
-PV = "v1.32.0+git"
-CVE_VERSION = "1.32.0"
-SRCREV_kubernetes = "5fe148234f8ab1184f26069c4f7bef6c37efe347"
+PV = "v1.32.6+git"
+CVE_VERSION = "1.32.6"
+SRCREV_kubernetes = "036f7ed3f1f4a2d97a654269a98ad7be7d460db6"
 SRCREV_kubernetes-release = "21382abdbfa8e6a43fd417306fa649cb651cc06e"
 PE = "1"
 
-- 
2.40.0



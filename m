Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D6ACDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 11:55:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.118524.1698062138579366393
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 Oct 2023 04:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hJY2kjCI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8660c29530=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39NApUCN030836
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Oct 2023 11:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=DLrev
	DooKofrj9EXoTa3gEoL8PhbJTVYbJpnHO5KfgM=; b=hJY2kjCIKdTK13IufVNNV
	ChUNorx02FrUJOa3oOPYyxPDyFpOcwig0Udbo3PBTUM2elgIb6EFMGaSiLu1hXb8
	lGmvasDXP+c5g1gP3pCU0YFlkhbCA45WBnS9G2v1QpsVLFvgCFOIFLDTLfakb4Ae
	Xo2uzZRqY4VqQoTLGXLiFhRxOMiRlVfDDFo0XB5qeaeEtHk1ydRuj0tUJVrsjIUF
	gJLxiooSkKZ4FPSaMjalrl1Xy7OOXRRaCEudJ0cYE3VCg/aT0a9dP32cXqVLE7Ug
	9/Bf/yQxRkuabxAnCfDMX/0XdeEkeW1RESarC1gI1Wzdu97rfNIIpZvYBgPT2h4d
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tv3ux1y3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Oct 2023 11:55:37 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 23 Oct 2023 04:55:35 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][mickledore][PATCH v2 1/1] kubernetes: Upgrade v1.27.1 -> v1.27.5
Date: Mon, 23 Oct 2023 11:55:18 +0000
Message-ID: <20231023115518.3349027-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: j51GSK4LWx9Xzf-7itGA4yH899-8hqhe
X-Proofpoint-GUID: j51GSK4LWx9Xzf-7itGA4yH899-8hqhe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-23_10,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310170000 definitions=main-2310230103
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Oct 2023 11:55:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8384

From: Soumya Sambu <soumya.sambu@windriver.com>

Bumping kubernetes to version v1.27.5, which comprises the following commits:

    38c97fa67ed Merge pull request #120135 from ritazh/cherry-pick-cve-2023-3955-1.27
    89048339422 Merge pull request #120130 from ritazh/cherry-pick-cve-2023-3676-1.27
    acc29048e6d Use environment varaibles for parameters in Powershell
    172644fb55d Use env varaibles for passing path
    00dfa0634be Merge pull request #119868 from liggitt/automated-cherry-pick-of-#119835-upstream-release-1.27
    3b6bcaa0b96 Avoid returning nil responseKind in v1beta1 aggregated discovery
    bd722aa3ff5 Merge pull request #119828 from jeremyrickard/go1207-1.27
    94b3e00eef0 [release-1.27] releng/go: Bump images, versions and deps to use Go 1.20.7
    de56018f04a Merge pull request #117269 from tnqn/automated-cherry-pick-of-#117245-#117249-upstream-release-1.27
    521580378aa Merge pull request #119363 from jsafrane/automated-cherry-pick-of-#117804-upstream-release-1.27
    d35a1c8a7a7 Merge pull request #119620 from liggitt/automated-cherry-pick-of-#117710-upstream-release-1.27
    579208d9616 Merge pull request #117486 from TommyStarK/automated-cherry-pick-of-#117449-upstream-release-1.27
    2ac615ccde3 Merge pull request #117235 from cvvz/automated-cherry-pick-of-#116134-origin-release-1.27
    559f43d49c6 Merge pull request #119466 from mimowo/automated-cherry-pick-of-#119434-upstream-release-1.27
    382c283f339 Merge pull request #119113 from champtar/automated-cherry-pick-of-#118922-upstream-release-1.27
    05b64c6b5e1 Merge pull request #119604 from a7i/automated-cherry-pick-of-#118549-upstream-release-1.27
    ecd45047e45 Merge pull request #119572 from andrewsykim/automated-cherry-pick-of-#118601-origin-release-1.27
    927dba2589a e2e_node: move getSampleDevicePluginPod to device_plugin_test.go
    db832fdfa67 fix 'pod' in kubelet prober metrics
    4c67c5d5e76 priority & fairness: support dynamically configuring work estimator max seats
    6d31f4b31ba Merge pull request #119519 from jingxu97/automated-cherry-pick-of-#118451-upstream-release-1.27
    17c98720e84 Add mininumKubelet tag into ReadWriteOncePod test
    ed0cdc9e0b2 Include ignored pods when computing backoff delay for Job pod failures
    ae24a5cf74b Remarks
    9e1050b4d90 Adjust the algorithm for computing the pod finish time
    fa950050cc9 Update CHANGELOG/CHANGELOG-1.27.md for v1.27.4
    fa3d7990104 Release commit for Kubernetes v1.27.4
    d794e0e5cf8 Merge pull request #119366 from xmudrii/go1206-1.27
    a1b127ca7a1 [release-1.27] releng/go: Bump images, versions and deps to use Go 1.20.6
    aefc4d0392a Rename updateReconstructedFromAPIServer
    eeba02fc625 Rename volumesNeedDevicePath
    5eb3b748e8e Update volumesInUse after attachability is confirmed
    f8bb161ab55 Add uncertain state of volume attach-ability
    08b7937d256 Refactor FindAttachablePluginBySpec out of CSI code path
    16fc1c954ce Merge pull request #119262 from HirazawaUi/automated-cherry-pick-of-#119229-upstream-release-1.27
    3ca3e0ad484 Merge pull request #118947 from Evan-Reilly/automated-cherry-pick-of-#118237-upstream-release-1.27
    5ee5d7346e1 Merge pull request #119096 from aleksandra-malinowska/automated-cherry-pick-of-#117865-upstream-release-1.27
    1484a5c32f0 Fix the converts an empty string to nil.
    b5c876a05b7 Merge pull request #117226 from princepereira/automated-cherry-pick-of-#116749-upstream-release-1.27
    d98c5b8a026 Merge pull request #119160 from alculquicondor/automated-cherry-pick-of-#119159-upstream-release-1.27
    28c79be6747 Add unit tests for parallel StatefulSet create & delete
    66f980be120 Parallel StatefulSet pod create & delete
    288504fbf8d Refactor StatefulSet controller update logic
    92a0f58e2bf Only declare job as finished after removing all finalizers
    c655001fa48 Automated cherry pick of #118716 upstream release 1.27 (#118911)
    052ac3eb1bf Merge pull request #119065 from xmudrii/automated-cherry-pick-of-#118899-upstream-release-1.27
    b667da8e08a Merge pull request #118683 from serathius/automated-cherry-pick-of-#118460-origin-release-1.27
    f8c1cc33cb6 Merge pull request #119139 from kmala/1.27
    5bbacb11989 Merge pull request #118290 from HirazawaUi/automated-cherry-pick-of-#118177-upstream-release-1.27
    b383755e462 Hide numberOfMissedSchedules as an algorithm internal number
    26db84e04c7 Update schedule logic to properly calculate missed schedules
    fe4e288bcdd Merge pull request #118855 from aojea/automated-cherry-pick-of-#118686-upstream-release-1.27
    a54590f218d Merge pull request #117936 from jsafrane/automated-cherry-pick-of-#117243-upstream-release-1.27
    ad569aec159 kubeadm: backdate generated CAs by 5 minutes
    0fc5c972129 client-go: allow to set NotBefore in NewSelfSignedCACert()
    0ed276fb568 Merge pull request #118199 from aleskandro/automated-cherry-pick-of-#118053-origin-release-1.27
    04e86095d38 Merge pull request #118930 from atiratree/automated-cherry-pick-of-#118876-upstream-release-1.27
    3c115eec0b9 Automated cherry pick of #118805: test comment should match the code in podgc (#118913)
    db247e1df34 Merge pull request #118969 from champtar/automated-cherry-pick-of-#117791-upstream-release-1.27
    55872a8eb12 Merge pull request #119086 from neolit123/automated-cherry-pick-of-#118150-origin-release-1.27
    39a4cd1a083 call ./hack/update-vendor.sh
    33af2a45f53 kubeadm: remove function pointer comparison in phase test
    3f4643682e3 CHANGELOG-1.27: Add note for AWS in-tree provider removal
    703edddae4e Updating the nodeAffinity of gated pods having nil affinity should be allowed
    3b874af3878 Merge pull request #118662 from mkowalski/automated-cherry-pick-of-#118329-upstream-release-1.27
    d936e6669bb Merge pull request #118841 from bobbypage/automated-cherry-pick-of-#118497-upstream-release-1.27
    3aa21cec0ec fix the existing problem (0 SerialNumber in all certificate) as part of this PR in a separate commit
    cd08820ba9a update serial number to a valid non-zero number in ca certificate
    5253d8e02c7 Merge pull request #118664 from pohly/automated-cherry-pick-of-#118524-origin-release-1.27
    76b9400cea3 Merge pull request #118283 from pohly/automated-cherry-pick-of-#118257-origin-release-1.27
    1260b845752 Delete CRDs created during field validation tests.
    f689046fb6b kubectl explain should work for both cluster and namespace resources and without a GET method
    f7d82bfdffe Merge pull request #118797 from harche/1.27_cadvisor_bump
    59cd1d0b3bb always execute condition for wait.PollUntilContextTimeout with immediate=true
    5423fffca9d Review remarks to improve HandlePodCleanups in kubelet
    24c67c15240 Fix the deletion of rejected pods
    0539a6a194a Merge pull request #118821 from helayoty/automated-cherry-pick-of-#118049-upstream-release-1.27
    62cf5ee1cdb Unset gated pod info timestamp in addToActiveQ
    027b4632bbb deps: Bump to cAdvisor v0.47.2
    ea2af58b5bd Make etcd component status consistent with health probes
    f2548642c4e e2e storage: terminate worker quietly on test completion
    9a001cea215 Fix flaky persistent volumes e2e test
    eb5825b3a3c Set the node-ips annotation correctly with CloudDualStackNodeIPs
    a2ba2626e85 Update CHANGELOG/CHANGELOG-1.27.md for v1.27.3
    25b4e43193b Release commit for Kubernetes v1.27.3
    aae883e5fa7 Merge pull request #118553 from puerco/bump-1.27-go1.20.5
    e13e5915a78 Merge pull request #118307 from SataQiu/automated-cherry-pick-of-#117169-upstream-release-1.27
    e0a2a6efdd1 update-vendor: update vendored go.sums
    82b2c5aefa3 releng/go: Update images, dependencies and version to Go 1.20.5
    e2cc1a3b21b Merge pull request #118515 from aojea/automated-cherry-pick-of-#118499-upstream-release-1.27
    3a77d5a59f0 Merge pull request #118471 from ritazh/automated-cherry-pick-of-#118356-upstream-release-1.27
    b30e94b1253 kube-proxy avoid race condition using LocalModeNodeCIDR
    5e00018fccf Merge pull request #117948 from dlipovetsky/automated-cherry-pick-of-#117792-#117724-upstream-release-1.27
    76f14499624 Merge pull request #118281 from aojea/automated-cherry-pick-of-#118256-upstream-release-1.27
    d59b91d97b4 Add ephemeralcontainer to imagepolicy securityaccount admission plugin
    d71d96a5d24 Merge pull request #118219 from mimowo/automated-cherry-pick-of-#117586-upstream-release-1.27
    c48bdec2ced Merge pull request #118279 from aojea/automated-cherry-pick-of-#118200-upstream-release-1.27
    c345ce91a03 supported version of etcd 3.5.7-0 for Kubernetes v1.27.0-rc.0
    22e8a99ec6e Fix the git-repo test error caused by the correct use of loop variables
    009a7a6fb9f dra scheduler plugin test: fix loopvar bug and "reserve" expected data
    7888798873e e2e framework retry on Service unavailable errors
    f41a169a354 e2e: apply timeout for CSI Storage Capacity test only to node
    916bc55a7bf Merge pull request #118178 from HirazawaUi/automated-cherry-pick-of-#118156-upstream-release-1.27
    e407c2b4b02 Add DisruptionTarget condition when preempting for critical pod
    d2bd738e274 update webhook test to go 1.21
    4025005877a Merge pull request #118105 from SataQiu/automated-cherry-pick-of-#118069-upstream-release-1.27
    af024b2a086 Merge pull request #118111 from liggitt/automated-cherry-pick-of-#118104-upstream-release-1.27
    9107eee6583 Test APIService safe handling at startup
    0bff4e35669 Fix waiting for CRD sync at server start
    1ae728f4344 kubeadm: fix a bug where the static pod changes detection logic is inconsistent with kubelet
    f404d1c4d3c Update CHANGELOG/CHANGELOG-1.27.md for v1.27.2
    7f6f68fdabc Release commit for Kubernetes v1.27.2

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 recipes-containers/kubernetes/kubernetes_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index 3a6e7119..560fd8b7 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -5,8 +5,8 @@ applications across multiple hosts, providing basic mechanisms for deployment, \
 maintenance, and scaling of applications. \
 "
 
-PV = "v1.27.1+git${SRCREV_kubernetes}"
-SRCREV_kubernetes = "2555e0f90e80a13628f47eca5cde34decc89babb"
+PV = "v1.27.5+git${SRCREV_kubernetes}"
+SRCREV_kubernetes = "93e0d7146fb9c3e9f68aa41b2b4265b2fcdb0a4c"
 SRCREV_kubernetes-release = "21382abdbfa8e6a43fd417306fa649cb651cc06e"
 PE = "1"
 
-- 
2.40.0



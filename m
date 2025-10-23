Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3396CCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 13:13:22 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.20254.1761225195777623870
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 Oct 2025 06:13:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=AzragG/H;
 spf=pass (domain: mvista.com, ip: 209.85.210.181, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so813132b3a.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Oct 2025 06:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1761225194; x=1761829994; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dbUCIXLEnVQrAMEsJJS2k3grO4xSuiTQ7ztOoBQFDbQ=;
        b=AzragG/HxauRCkv1FctmzHnI7+qIdzi+2jutLoOpAJhLiAFHl0FtdwpjworV3CDOR9
         60OxsGeqEAfR6wAspcGslVGqxawHhsQLA+qiTA+lyMZGP647TM8KaZJ15OXaNyPpfrDU
         TbLF5kZxfDKt4ypYrgfrjCS4nko8lVLSX3/Q8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761225194; x=1761829994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dbUCIXLEnVQrAMEsJJS2k3grO4xSuiTQ7ztOoBQFDbQ=;
        b=xI5r9r5ocoB85dyfPYqLadB8gpAtCjnoFYzysK1AgNaku2PQ96fxvvEW0G5n43nftB
         GlGhjoZ47R9qtfzev9WZt7Bp2Wgpiyw7Pf2NvOcv1LlHm7NvPsI234YhUeOkUsckun8t
         bLaOfy8r2WuVV78uQKIOyMboAbxgWPgdVt/0y2bD2ZEiK+Z80TlNQ9LV9LRjCLB3JeuC
         sxiQlXmzgxlozRdhHswUNr07XeLwLWvCDhquI5tUoJI9lCwamMpoIqzKKsCvXOqU7tOf
         OVOdvJIADmlXbOei3UNUR7iPVenS3EpIAAg/B6LE3i2J+wBdUuOTWzjzFG8igcHraYro
         r2tA==
X-Gm-Message-State: AOJu0YydUVCglgtbvFwoejS1xGJ/idVVQsz6ctRsGFJG7ekbNGhq/OyI
	w5NaGIcPtAINJUjx34vbtQqWfhvcqJpnflPSX2IfxPmkW5WaSUCIHa9RljessjY7E2F7xORGjVI
	gw1sT4HY=
X-Gm-Gg: ASbGncu7XuB+ko5LyDEoM3cdPD9REt5PjJk94DwL05F/WBDfYPXcOCcZPl7jY/5jRUi
	Sj8KYnZPqVCS80TWPzwCNtnDQ8JP8DzaRxml4Zc0DUqn0RpH8yLDl6eDv1a7E5YcUJTv9fkloFz
	F0a0QS1wGeAYvmSQbzRbQPJFrWoZ7nCWNoGLWFjPRaGjkKRpE+FtAPUUdcBDuUhWMrQLlni3mFF
	2UMGIhNWvwXjAtMSqaSypJvTTuNpU9wW/9JwZegOif9ffOuCYPvtcAqtwQI6q4eU9dyeYNAwB3d
	AdZEssyB9Ydo4JcBuUxVW2eoqAqlcw2bsQu25wgBJ2E43mln4YYB5dtfBCr3c5k+ak+UIJR3uC3
	3zjXM4R8tSfyeG4/KEl27hukjxjIBPZBTfhkSH7buLnAd3pHjc3ZC/517TqlYrwj9RGZQea2gXd
	osdBGe8DhxHrf4BA==
X-Google-Smtp-Source: AGHT+IFs2ZoE3Z/aDPk/YGi2k1slILPjN6PZFexB+L2bdUyoCcHIWyuyu++e8jetW3+ls0DlUXD2KA==
X-Received: by 2002:a05:6a20:d49b:b0:32d:b925:22ab with SMTP id adf61e73a8af0-33aa6f53c3bmr11592964637.17.1761225194312;
        Thu, 23 Oct 2025 06:13:14 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:8fce:8546:bea:675a:12eb:bfe2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4a753dfsm2170470a12.0.2025.10.23.06.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 06:13:13 -0700 (PDT)
From: vanusuri@mvista.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [meta-virtualization][kirkstone][PATCH] kubernetes: Fix for CVE-2025-5187
Date: Thu, 23 Oct 2025 18:43:04 +0530
Message-Id: <20251023131304.230788-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Oct 2025 13:13:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9421

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-commit: https://github.com/kubernetes/kubernetes/commit/2e6eaa1fbedd776ea9357b4f472c66dec01955b5

Reference: https://github.com/kubernetes/kubernetes/pull/133467
           https://github.com/aks-lts/kubernetes/pull/62/commits/152330ef541b23a027c779597496b62c287fb363

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../kubernetes/kubernetes/CVE-2025-5187.patch | 94 +++++++++++++++++++
 .../kubernetes/kubernetes_git.bb              |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2025-5187.patch

diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2025-5187.patch b/recipes-containers/kubernetes/kubernetes/CVE-2025-5187.patch
new file mode 100644
index 00000000..a3042224
--- /dev/null
+++ b/recipes-containers/kubernetes/kubernetes/CVE-2025-5187.patch
@@ -0,0 +1,94 @@
+From 922f15f1b75eada00309e02b7dd61f73e1736f3f Mon Sep 17 00:00:00 2001
+From: Sergey Kanzhelev <S.Kanzhelev@live.com>
+Date: Thu, 22 May 2025 17:54:10 +0000
+Subject: [PATCH] do not allow the node to update it's owner reference
+
+Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/commit/2e6eaa1fbedd776ea9357b4f472c66dec01955b5]
+CVE: CVE-2025-5187
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ .../admission/noderestriction/admission.go    |  5 +++
+ .../noderestriction/admission_test.go         | 36 +++++++++++++++----
+ 2 files changed, 35 insertions(+), 6 deletions(-)
+
+diff --git a/plugin/pkg/admission/noderestriction/admission.go b/plugin/pkg/admission/noderestriction/admission.go
+index 0a0d48d131f..8dc3ee7e66e 100644
+--- a/plugin/pkg/admission/noderestriction/admission.go
++++ b/plugin/pkg/admission/noderestriction/admission.go
+@@ -441,6 +441,11 @@ func (p *Plugin) admitNode(nodeName string, a admission.Attributes) error {
+ 			return admission.NewForbidden(a, fmt.Errorf("node %q is not allowed to modify taints", nodeName))
+ 		}
+ 
++		// Don't allow a node to update its own ownerReferences.
++		if !apiequality.Semantic.DeepEqual(node.OwnerReferences, oldNode.OwnerReferences) {
++		    return admission.NewForbidden(a, fmt.Errorf("node %q is not allowed to modify ownerReferences", nodeName))
++		}
++
+ 		// Don't allow a node to update labels outside the allowed set.
+ 		// This would allow a node to add or modify its labels in a way that would let it steer privileged workloads to itself.
+ 		modifiedLabels := getModifiedLabels(node.Labels, oldNode.Labels)
+diff --git a/plugin/pkg/admission/noderestriction/admission_test.go b/plugin/pkg/admission/noderestriction/admission_test.go
+index 6a4ccf2d948..1b51c75c4c1 100644
+--- a/plugin/pkg/admission/noderestriction/admission_test.go
++++ b/plugin/pkg/admission/noderestriction/admission_test.go
+@@ -235,10 +235,14 @@ func (a *admitTestCase) run(t *testing.T) {
+ 
+ func Test_nodePlugin_Admit(t *testing.T) {
+ 	var (
+-		mynode = &user.DefaultInfo{Name: "system:node:mynode", Groups: []string{"system:nodes"}}
+-		bob    = &user.DefaultInfo{Name: "bob"}
++		trueRef = true
++		mynode  = &user.DefaultInfo{Name: "system:node:mynode", Groups: []string{"system:nodes"}}
++		bob     = &user.DefaultInfo{Name: "bob"}
++
++		mynodeObjMeta          = metav1.ObjectMeta{Name: "mynode", UID: "mynode-uid"}
++		mynodeObjMetaOwnerRefA = metav1.ObjectMeta{Name: "mynode", UID: "mynode-uid", OwnerReferences: []metav1.OwnerReference{{Name: "fooerA", Controller: &trueRef}}}
++		mynodeObjMetaOwnerRefB = metav1.ObjectMeta{Name: "mynode", UID: "mynode-uid", OwnerReferences: []metav1.OwnerReference{{Name: "fooerB", Controller: &trueRef}}}
+ 
+-		mynodeObjMeta    = metav1.ObjectMeta{Name: "mynode", UID: "mynode-uid"}
+ 		mynodeObj        = &api.Node{ObjectMeta: mynodeObjMeta}
+ 		mynodeObjConfigA = &api.Node{ObjectMeta: mynodeObjMeta, Spec: api.NodeSpec{ConfigSource: &api.NodeConfigSource{
+ 			ConfigMap: &api.ConfigMapNodeConfigSource{
+@@ -255,9 +259,11 @@ func Test_nodePlugin_Admit(t *testing.T) {
+ 				KubeletConfigKey: "kubelet",
+ 			}}}}
+ 
+-		mynodeObjTaintA = &api.Node{ObjectMeta: mynodeObjMeta, Spec: api.NodeSpec{Taints: []api.Taint{{Key: "mykey", Value: "A"}}}}
+-		mynodeObjTaintB = &api.Node{ObjectMeta: mynodeObjMeta, Spec: api.NodeSpec{Taints: []api.Taint{{Key: "mykey", Value: "B"}}}}
+-		othernodeObj    = &api.Node{ObjectMeta: metav1.ObjectMeta{Name: "othernode"}}
++		mynodeObjTaintA    = &api.Node{ObjectMeta: mynodeObjMeta, Spec: api.NodeSpec{Taints: []api.Taint{{Key: "mykey", Value: "A"}}}}
++		mynodeObjTaintB    = &api.Node{ObjectMeta: mynodeObjMeta, Spec: api.NodeSpec{Taints: []api.Taint{{Key: "mykey", Value: "B"}}}}
++		mynodeObjOwnerRefA = &api.Node{ObjectMeta: mynodeObjMetaOwnerRefA}
++		mynodeObjOwnerRefB = &api.Node{ObjectMeta: mynodeObjMetaOwnerRefB}
++		othernodeObj       = &api.Node{ObjectMeta: metav1.ObjectMeta{Name: "othernode"}}
+ 
+ 		coremymirrorpod, v1mymirrorpod           = makeTestPod("ns", "mymirrorpod", "mynode", true)
+ 		coreothermirrorpod, v1othermirrorpod     = makeTestPod("ns", "othermirrorpod", "othernode", true)
+@@ -1029,6 +1035,24 @@ func Test_nodePlugin_Admit(t *testing.T) {
+ 			attributes: admission.NewAttributesRecord(setForbiddenUpdateLabels(mynodeObj, "new"), setForbiddenUpdateLabels(mynodeObj, "old"), nodeKind, mynodeObj.Namespace, mynodeObj.Name, nodeResource, "", admission.Update, &metav1.UpdateOptions{}, false, mynode),
+ 			err:        `is not allowed to modify labels: foo.node-restriction.kubernetes.io/foo, node-restriction.kubernetes.io/foo, other.k8s.io/foo, other.kubernetes.io/foo`,
+ 		},
++		{
++			name:       "forbid update of my node: add owner reference",
++			podsGetter: existingPods,
++			attributes: admission.NewAttributesRecord(mynodeObjOwnerRefA, mynodeObj, nodeKind, mynodeObj.Namespace, mynodeObj.Name, nodeResource, "", admission.Update, &metav1.UpdateOptions{}, false, mynode),
++			err:        "node \"mynode\" is not allowed to modify ownerReferences",
++		},
++		{
++			name:       "forbid update of my node: remove owner reference",
++			podsGetter: existingPods,
++			attributes: admission.NewAttributesRecord(mynodeObj, mynodeObjOwnerRefA, nodeKind, mynodeObj.Namespace, mynodeObj.Name, nodeResource, "", admission.Update, &metav1.UpdateOptions{}, false, mynode),
++			err:        "node \"mynode\" is not allowed to modify ownerReferences",
++		},
++		{
++			name:       "forbid update of my node: change owner reference",
++			podsGetter: existingPods,
++			attributes: admission.NewAttributesRecord(mynodeObjOwnerRefA, mynodeObjOwnerRefB, nodeKind, mynodeObj.Namespace, mynodeObj.Name, nodeResource, "", admission.Update, &metav1.UpdateOptions{}, false, mynode),
++			err:        "node \"mynode\" is not allowed to modify ownerReferences",
++		},
+ 
+ 		// Other node object
+ 		{
+-- 
+2.25.1
+
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index 9d6179e0..41f1ad73 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -38,6 +38,7 @@ SRC_URI:append = " \
            file://CVE-2024-3177.patch;patchdir=src/import \
            file://CVE-2023-3955.patch;patchdir=src/import \
            file://CVE-2023-3676.patch;patchdir=src/import \
+           file://CVE-2025-5187.patch;patchdir=src/import \
           "
 
 DEPENDS += "rsync-native \
-- 
2.25.1



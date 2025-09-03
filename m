Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F912CA1012
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 07:20:29 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.6717.1756884021457415924
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Sep 2025 00:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Ga7UoHhG;
 spf=pass (domain: mvista.com, ip: 209.85.214.179, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-248ff68356aso4480605ad.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Sep 2025 00:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1756884020; x=1757488820; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lJFf3J21TntcdpQuxWn2Fqo9prH4164nNlTzpV2TELg=;
        b=Ga7UoHhGed/1CF5XmVqFkt6SSb+uYosNl3uOEeQrpSmW8Yy7JF8pRYIcmgeyBXPGOX
         iK06kzbypQ8HONkJ4tDeW/ucdlNDnYr+kZuc4mrVk9q5IQjDzuTL8ZAQQ3Yoc6MFu/HW
         RLWgOrkTJKJpuMr7OOwTunYh13CEKJ3fK6rfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756884020; x=1757488820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJFf3J21TntcdpQuxWn2Fqo9prH4164nNlTzpV2TELg=;
        b=TLCanwooBjH3wsAsrRl67/AwMTtAGibnhxlnzVzO0l9W0ph1uuwhNTFqYwRI7qc9cN
         WG3InthVXnV/HRbo98EteutRAI4j0zQOOt9Hn3/9Vo8HZRsU+bwczmeLQJcyTmwF2USD
         WHRjblRiDI/pgm4CQq8l6gIFQ0q3s8aeIvTDrBufvqkuYFi2FTsU0YF7BEqGth7OR6ZC
         Upb938J0XGKbQjT9mcC++kNYMWK8DLF79tMqS4yXXDK+pQW93vi9y6Sk93QfyrwJWGtT
         JLmHf3+DviYjWw1Yg9R0sM6F2KMwmP28MjBnhIrNtmJMsG6JnezJnEWQslk8p4fHw2r7
         RY2Q==
X-Gm-Message-State: AOJu0YwMaXLRlrgmo1jg7c8CI9CbAyc5DXsg4t3FwI/oBPJWA9m+4zUL
	HX23ytgIStxVNsOTwKUTY+bjKPepVx4nIVdG9wCMuig5V78E8mQ+pGbVcnO2JRmu6NZARhMUuzn
	rnsE/
X-Gm-Gg: ASbGncufIGTYSNwvTnwijcm/exHK4wguqCu97Ckq9ZmPmz0m5xPFhi3qNkMl0UNpOZu
	TPZxksIMk5jSZAmfDtzMMDcjMoCm6LaE6fIIarjh1//2B5VYgcGgbYHSigPxZO8MIIPvdbfpG/k
	inRLk0Xa8VNRlH0NBLvnu6tclmq6nHgf7ZNx1CaEpcfR7rnLmdZiNQbrIxMCLbC7IK+3QJpVXaR
	3ZQ7px26kmfwWhjmaZwVd1vCI1RIYsdwXwloGch94mceQVoijsBCzBTtdnc+/gTyBV53eEmdFjN
	X6HN5sxP2UuiUpMp7XggxqFX/sXt14c3XfpzZdTO8/3NDgcwUtyxSzrG6F7OSjyY8DygCmbXdLO
	kv/VCB810IoNwytIw5KIhg44Ds6RD4ozEuVLFLT+0CIg=
X-Google-Smtp-Source: AGHT+IFIkpBDqNS3bRvxm0sa/2OgUru6zj1RGi6mZ62b34/bmNn19tga/L9R2WiHaHAlSal7P+n/Vw==
X-Received: by 2002:a17:902:ea0e:b0:249:274f:84a8 with SMTP id d9443c01a7336-2493efe0734mr182330865ad.25.1756884019805;
        Wed, 03 Sep 2025 00:20:19 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.236.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c92eb0898sm9115075ad.77.2025.09.03.00.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 00:20:19 -0700 (PDT)
From: vanusuri@mvista.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [meta-virtualization][scarthgap][PATCH] kubernetes: Fix for CVE-2025-5187
Date: Wed,  3 Sep 2025 12:50:11 +0530
Message-Id: <20250903072011.124373-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Sep 2025 07:20:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9363

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-commit: https://github.com/kubernetes/kubernetes/commit/2e6eaa1fbedd776ea9357b4f472c66dec01955b5

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../kubernetes/kubernetes/CVE-2025-5187.patch | 91 +++++++++++++++++++
 .../kubernetes/kubernetes_git.bb              |  1 +
 2 files changed, 92 insertions(+)
 create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2025-5187.patch

diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2025-5187.patch b/recipes-containers/kubernetes/kubernetes/CVE-2025-5187.patch
new file mode 100644
index 00000000..56d5d105
--- /dev/null
+++ b/recipes-containers/kubernetes/kubernetes/CVE-2025-5187.patch
@@ -0,0 +1,91 @@
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
+index fca23475120..d244469c9af 100644
+--- a/plugin/pkg/admission/noderestriction/admission.go
++++ b/plugin/pkg/admission/noderestriction/admission.go
+@@ -472,6 +472,11 @@ func (p *Plugin) admitNode(nodeName string, a admission.Attributes) error {
+ 			return admission.NewForbidden(a, fmt.Errorf("node %q is not allowed to modify taints", nodeName))
+ 		}
+ 
++		// Don't allow a node to update its own ownerReferences.
++		if !apiequality.Semantic.DeepEqual(node.OwnerReferences, oldNode.OwnerReferences) {
++			return admission.NewForbidden(a, fmt.Errorf("node %q is not allowed to modify ownerReferences", nodeName))
++		}
++
+ 		// Don't allow a node to update labels outside the allowed set.
+ 		// This would allow a node to add or modify its labels in a way that would let it steer privileged workloads to itself.
+ 		modifiedLabels := getModifiedLabels(node.Labels, oldNode.Labels)
+diff --git a/plugin/pkg/admission/noderestriction/admission_test.go b/plugin/pkg/admission/noderestriction/admission_test.go
+index 8bfd0bfd0ea..5f05b33c9d2 100644
+--- a/plugin/pkg/admission/noderestriction/admission_test.go
++++ b/plugin/pkg/admission/noderestriction/admission_test.go
+@@ -236,10 +236,14 @@ func (a *admitTestCase) run(t *testing.T) {
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
+@@ -256,9 +260,11 @@ func Test_nodePlugin_Admit(t *testing.T) {
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
+@@ -1039,6 +1045,24 @@ func Test_nodePlugin_Admit(t *testing.T) {
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
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index 044175eb..ee44db47 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -34,6 +34,7 @@ SRC_URI:append = " \
            file://cni-containerd-net.conflist \
            file://k8s-init \
            file://99-kubernetes.conf \
+           file://CVE-2025-5187.patch \
           "
 
 DEPENDS += "rsync-native \
-- 
2.25.1



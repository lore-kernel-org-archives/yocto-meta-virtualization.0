Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D522C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 03:50:06 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.4764.1714708201795659925
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 May 2024 20:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XsccScQz;
 spf=pass (domain: mvista.com, ip: 209.85.216.53, mailfrom: asharma@mvista.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2b432be5cc9so249076a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 02 May 2024 20:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1714708201; x=1715313001; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Y+QXNoKeyEpmEIMPWzP0UaRkgOigKOq7BjxYSriKEg=;
        b=XsccScQz4hKoaFg/rxVpPdNwnGPhwDXGIKH1Ctk/4YODpQdxhrXHQheZmBku7bY2yq
         cfk+2zOkN+1Hnfp/yO7aX0zpu+n4LYW1/H3DXuSlulP0/LLrgbmZbZNRQH09BGE1JDxs
         cYTtc5s4YRWSaFnfjqGDYJZ9Bipf+GhL0ouB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714708201; x=1715313001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Y+QXNoKeyEpmEIMPWzP0UaRkgOigKOq7BjxYSriKEg=;
        b=LlhCJPOAWCyBiXzztG25Lihi38Rn2loUtAn/az95VDU+lI4BwbIhhwgkBbBuMMniJz
         nX+Qwhnn6MfGHRMhq2x7s9qroLil3bJZUMOdM/YJDKxNW3TqsP6PFPZL/XrdgqVRLsYr
         MKmesl6T75/QT+UQHSvghDSIrlpry9ke9Xjk3PpqIAn9pG8rrBRCRfDXkvR7Dpa+sW8J
         BwDx/vypoJNOUI1rcUuFJ46/057kCOtr8kzroBYxT2RZ2LMuBVcfSQOvhgJZgLT/mZdv
         V5GKQrVqdNq1vsos7LDYxgo2DoHkKzOaUOTvkNHdIvceJC/F1jpUbgcVGe0DoSK5PYHL
         D34g==
X-Gm-Message-State: AOJu0YwIXZahBVy0KsN2GTwxEDQWgajYm7iDk5GkAvYoxeKW9W9fEuCR
	RLrhpq3aWRRH57vyYdWfW8tL/6bdXxE1kBBK7JjOiCLFxTcOubMzuaWzTK8YxBTqcXU4W8bgU9i
	s
X-Google-Smtp-Source: AGHT+IGHvyUIM4rYUHqQnAIglngLdA7srQ8fzMhl4zZysx42der3aiqAP/Zl23VHEdxLDoDpgq51yg==
X-Received: by 2002:a17:90a:8185:b0:2b2:c73a:7acc with SMTP id e5-20020a17090a818500b002b2c73a7accmr1647718pjn.37.1714708200477;
        Thu, 02 May 2024 20:50:00 -0700 (PDT)
Received: from asharma-Latitude-3400 ([2401:4900:1c30:1150:1ccf:a601:3e8f:180e])
        by smtp.gmail.com with ESMTPSA id cq13-20020a17090af98d00b002a54222e694sm2060991pjb.51.2024.05.02.20.49.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2024 20:50:00 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Fri, 03 May 2024 09:19:54 +0530
From: Ashish Sharma <asharma@mvista.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [meta-virtualization][kirkstone][PATCH] kubernetes: Backport fix for CVE-2024-3177
Date: Fri,  3 May 2024 09:19:53 +0530
Message-Id: <20240503034953.8903-1-asharma@mvista.com>
X-Mailer: git-send-email 2.35.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 03 May 2024 03:50:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8715

Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/pull/124325/commits/3f0922513d235d8bdebe79f0d07da769c04211b8]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../kubernetes/kubernetes/CVE-2024-3177.patch | 237 ++++++++++++++++++
 .../kubernetes/kubernetes_git.bb              |   1 +
 2 files changed, 238 insertions(+)
 create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2024-3177.patch

diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2024-3177.patch b/recipes-containers/kubernetes/kubernetes/CVE-2024-3177.patch
new file mode 100644
index 00000000..20b2ea8a
--- /dev/null
+++ b/recipes-containers/kubernetes/kubernetes/CVE-2024-3177.patch
@@ -0,0 +1,237 @@
+From 3f0922513d235d8bdebe79f0d07da769c04211b8 Mon Sep 17 00:00:00 2001
+From: Rita Zhang <rita.z.zhang@gmail.com>
+Date: Mon, 25 Mar 2024 10:33:41 -0700
+Subject: [PATCH] Add envFrom to serviceaccount admission plugin
+
+Signed-off-by: Rita Zhang <rita.z.zhang@gmail.com>
+
+Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/pull/124325/commits/3f0922513d235d8bdebe79f0d07da769c04211b8]
+CVE: CVE-2024-3177
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ .../pkg/admission/serviceaccount/admission.go |  21 +++
+ .../serviceaccount/admission_test.go          | 122 ++++++++++++++++--
+ 2 files changed, 132 insertions(+), 11 deletions(-)
+
+diff --git a/plugin/pkg/admission/serviceaccount/admission.go b/plugin/pkg/admission/serviceaccount/admission.go
+index c844a051c24b..3f4338128e53 100644
+--- a/plugin/pkg/admission/serviceaccount/admission.go
++++ b/plugin/pkg/admission/serviceaccount/admission.go
+@@ -337,6 +337,13 @@ func (s *Plugin) limitSecretReferences(serviceAccount *corev1.ServiceAccount, po
+ 				}
+ 			}
+ 		}
++		for _, envFrom := range container.EnvFrom {
++			if envFrom.SecretRef != nil {
++				if !mountableSecrets.Has(envFrom.SecretRef.Name) {
++					return fmt.Errorf("init container %s with envFrom referencing secret.secretName=\"%s\" is not allowed because service account %s does not reference that secret", container.Name, envFrom.SecretRef.Name, serviceAccount.Name)
++				}
++			}
++		}
+ 	}
+ 
+ 	for _, container := range pod.Spec.Containers {
+@@ -347,6 +354,13 @@ func (s *Plugin) limitSecretReferences(serviceAccount *corev1.ServiceAccount, po
+ 				}
+ 			}
+ 		}
++		for _, envFrom := range container.EnvFrom {
++			if envFrom.SecretRef != nil {
++				if !mountableSecrets.Has(envFrom.SecretRef.Name) {
++					return fmt.Errorf("container %s with envFrom referencing secret.secretName=\"%s\" is not allowed because service account %s does not reference that secret", container.Name, envFrom.SecretRef.Name, serviceAccount.Name)
++				}
++			}
++		}
+ 	}
+ 
+ 	// limit pull secret references as well
+@@ -388,6 +402,13 @@ func (s *Plugin) limitEphemeralContainerSecretReferences(pod *api.Pod, a admissi
+ 				}
+ 			}
+ 		}
++		for _, envFrom := range container.EnvFrom {
++			if envFrom.SecretRef != nil {
++				if !mountableSecrets.Has(envFrom.SecretRef.Name) {
++					return fmt.Errorf("ephemeral container %s with envFrom referencing secret.secretName=\"%s\" is not allowed because service account %s does not reference that secret", container.Name, envFrom.SecretRef.Name, serviceAccount.Name)
++				}
++			}
++		}
+ 	}
+ 	return nil
+ }
+diff --git a/plugin/pkg/admission/serviceaccount/admission_test.go b/plugin/pkg/admission/serviceaccount/admission_test.go
+index bf15f870d75a..4dba6cd8b13e 100644
+--- a/plugin/pkg/admission/serviceaccount/admission_test.go
++++ b/plugin/pkg/admission/serviceaccount/admission_test.go
+@@ -521,6 +521,25 @@ func TestAllowsReferencedSecret(t *testing.T) {
+ 		t.Errorf("Unexpected error: %v", err)
+ 	}
+ 
++	pod2 = &api.Pod{
++		Spec: api.PodSpec{
++			Containers: []api.Container{
++				{
++					Name: "container-1",
++					EnvFrom: []api.EnvFromSource{
++						{
++							SecretRef: &api.SecretEnvSource{
++								LocalObjectReference: api.LocalObjectReference{
++									Name: "foo"}}}},
++				},
++			},
++		},
++	}
++	attrs = admission.NewAttributesRecord(pod2, nil, api.Kind("Pod").WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("version"), "", admission.Create, &metav1.CreateOptions{}, false, nil)
++	if err := admissiontesting.WithReinvocationTesting(t, admit).Admit(context.TODO(), attrs, nil); err != nil {
++		t.Errorf("Unexpected error: %v", err)
++	}
++
+ 	pod2 = &api.Pod{
+ 		Spec: api.PodSpec{
+ 			InitContainers: []api.Container{
+@@ -545,6 +564,25 @@ func TestAllowsReferencedSecret(t *testing.T) {
+ 		t.Errorf("Unexpected error: %v", err)
+ 	}
+ 
++	pod2 = &api.Pod{
++		Spec: api.PodSpec{
++			InitContainers: []api.Container{
++				{
++					Name: "container-1",
++					EnvFrom: []api.EnvFromSource{
++						{
++							SecretRef: &api.SecretEnvSource{
++								LocalObjectReference: api.LocalObjectReference{
++									Name: "foo"}}}},
++				},
++			},
++		},
++	}
++	attrs = admission.NewAttributesRecord(pod2, nil, api.Kind("Pod").WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("version"), "", admission.Create, &metav1.CreateOptions{}, false, nil)
++	if err := admissiontesting.WithReinvocationTesting(t, admit).Admit(context.TODO(), attrs, nil); err != nil {
++		t.Errorf("Unexpected error: %v", err)
++	}
++
+ 	pod2 = &api.Pod{
+ 		Spec: api.PodSpec{
+ 			ServiceAccountName: DefaultServiceAccountName,
+@@ -572,6 +610,28 @@ func TestAllowsReferencedSecret(t *testing.T) {
+ 	if err := admit.Validate(context.TODO(), attrs, nil); err != nil {
+ 		t.Errorf("Unexpected error: %v", err)
+ 	}
++
++	pod2 = &api.Pod{
++		Spec: api.PodSpec{
++			ServiceAccountName: DefaultServiceAccountName,
++			EphemeralContainers: []api.EphemeralContainer{
++				{
++					EphemeralContainerCommon: api.EphemeralContainerCommon{
++						Name: "container-2",
++						EnvFrom: []api.EnvFromSource{{
++							SecretRef: &api.SecretEnvSource{
++								LocalObjectReference: api.LocalObjectReference{
++									Name: "foo"}}}},
++					},
++				},
++			},
++		},
++	}
++	// validate enforces restrictions on secret mounts when operation==update and subresource==ephemeralcontainers"
++	attrs = admission.NewAttributesRecord(pod2, nil, api.Kind("Pod").WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("version"), "ephemeralcontainers", admission.Update, &metav1.UpdateOptions{}, false, nil)
++	if err := admit.Validate(context.TODO(), attrs, nil); err != nil {
++		t.Errorf("Unexpected error: %v", err)
++	}
+ }
+ 
+ func TestRejectsUnreferencedSecretVolumes(t *testing.T) {
+@@ -628,25 +688,20 @@ func TestRejectsUnreferencedSecretVolumes(t *testing.T) {
+ 
+ 	pod2 = &api.Pod{
+ 		Spec: api.PodSpec{
+-			InitContainers: []api.Container{
++			Containers: []api.Container{
+ 				{
+ 					Name: "container-1",
+-					Env: []api.EnvVar{
++					EnvFrom: []api.EnvFromSource{
+ 						{
+-							Name: "env-1",
+-							ValueFrom: &api.EnvVarSource{
+-								SecretKeyRef: &api.SecretKeySelector{
+-									LocalObjectReference: api.LocalObjectReference{Name: "foo"},
+-								},
+-							},
+-						},
+-					},
++							SecretRef: &api.SecretEnvSource{
++								LocalObjectReference: api.LocalObjectReference{
++									Name: "foo"}}}},
+ 				},
+ 			},
+ 		},
+ 	}
+ 	attrs = admission.NewAttributesRecord(pod2, nil, api.Kind("Pod").WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("version"), "", admission.Create, &metav1.CreateOptions{}, false, nil)
+-	if err := admissiontesting.WithReinvocationTesting(t, admit).Admit(context.TODO(), attrs, nil); err == nil || !strings.Contains(err.Error(), "with envVar") {
++	if err := admissiontesting.WithReinvocationTesting(t, admit).Admit(context.TODO(), attrs, nil); err == nil || !strings.Contains(err.Error(), "with envFrom") {
+ 		t.Errorf("Unexpected error: %v", err)
+ 	}
+ 
+@@ -679,6 +734,30 @@ func TestRejectsUnreferencedSecretVolumes(t *testing.T) {
+ 		t.Errorf("validate only enforces restrictions on secret mounts when operation==create and subresource==''. Unexpected error: %v", err)
+ 	}
+ 
++	pod2 = &api.Pod{
++		Spec: api.PodSpec{
++			ServiceAccountName: DefaultServiceAccountName,
++			InitContainers: []api.Container{
++				{
++					Name: "container-1",
++					EnvFrom: []api.EnvFromSource{
++						{
++							SecretRef: &api.SecretEnvSource{
++								LocalObjectReference: api.LocalObjectReference{
++									Name: "foo"}}}},
++				},
++			},
++		},
++	}
++	attrs = admission.NewAttributesRecord(pod2, nil, api.Kind("Pod").WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("version"), "", admission.Update, &metav1.UpdateOptions{}, false, nil)
++	if err := admissiontesting.WithReinvocationTesting(t, admit).Admit(context.TODO(), attrs, nil); err != nil {
++		t.Errorf("admit only enforces restrictions on secret mounts when operation==create. Unexpected error: %v", err)
++	}
++	attrs = admission.NewAttributesRecord(pod2, nil, api.Kind("Pod").WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("version"), "", admission.Create, &metav1.CreateOptions{}, false, nil)
++	if err := admit.Validate(context.TODO(), attrs, nil); err == nil || !strings.Contains(err.Error(), "with envFrom") {
++		t.Errorf("validate only enforces restrictions on secret mounts when operation==create and subresource==''. Unexpected error: %v", err)
++	}
++
+ 	pod2 = &api.Pod{
+ 		Spec: api.PodSpec{
+ 			ServiceAccountName: DefaultServiceAccountName,
+@@ -709,6 +788,27 @@ func TestRejectsUnreferencedSecretVolumes(t *testing.T) {
+ 	if err := admit.Validate(context.TODO(), attrs, nil); err == nil || !strings.Contains(err.Error(), "with envVar") {
+ 		t.Errorf("validate enforces restrictions on secret mounts when operation==update and subresource==ephemeralcontainers. Unexpected error: %v", err)
+ 	}
++
++	pod2 = &api.Pod{
++		Spec: api.PodSpec{
++			ServiceAccountName: DefaultServiceAccountName,
++			EphemeralContainers: []api.EphemeralContainer{
++				{
++					EphemeralContainerCommon: api.EphemeralContainerCommon{
++						Name: "container-2",
++						EnvFrom: []api.EnvFromSource{{
++							SecretRef: &api.SecretEnvSource{
++								LocalObjectReference: api.LocalObjectReference{
++									Name: "foo"}}}},
++					},
++				},
++			},
++		},
++	}
++	attrs = admission.NewAttributesRecord(pod2, nil, api.Kind("Pod").WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("version"), "ephemeralcontainers", admission.Update, &metav1.UpdateOptions{}, false, nil)
++	if err := admit.Validate(context.TODO(), attrs, nil); err == nil || !strings.Contains(err.Error(), "with envFrom") {
++		t.Errorf("validate enforces restrictions on secret mounts when operation==update and subresource==ephemeralcontainers. Unexpected error: %v", err)
++	}
+ }
+ 
+ func TestAllowUnreferencedSecretVolumesForPermissiveSAs(t *testing.T) {
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index b0c87c47..78d1cd2a 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -35,6 +35,7 @@ SRC_URI:append = " \
            file://cni-containerd-net.conflist \
            file://k8s-init \
            file://99-kubernetes.conf \
+           file://CVE-2024-3177.patch \
           "
 
 DEPENDS += "rsync-native \
-- 
2.35.7



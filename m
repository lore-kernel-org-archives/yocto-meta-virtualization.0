Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4A77D3E797
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 06:53:40 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3415.1765436016940922651
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 10 Dec 2025 22:53:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=LlZdlFpG;
 spf=pass (domain: mvista.com, ip: 209.85.214.173, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29844c68068so8593545ad.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Dec 2025 22:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1765436016; x=1766040816; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EPPxB+Ot3zv4zRbEsmbWjdxCB2vBJ9RIROEs5UW+fPs=;
        b=LlZdlFpG5/Jlq805flF/aoICrCW2jeaRKD1RFvqWn8U3M99JCYSMATvNK9CxOtZmC3
         hY8CuMoFLY34pJO8Vaq2/BdwlcdiiduEqRJs/xZKQXpRKMuckkU0WrDPWh+lDeyQh0sC
         g9oCV4/Bgbaf5x3sXfHIU6CC8svpss7XMSmq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765436016; x=1766040816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EPPxB+Ot3zv4zRbEsmbWjdxCB2vBJ9RIROEs5UW+fPs=;
        b=u8JNwI+JtvM1C4zv7V8v0oY27FYCTfdT/RvqzbLikfWnZ2A8SbOi/2ndsxVkcKSA3a
         V4C4yd20vGIgEbgV59NTqb8rtlqNGgqlAlDLlaUYvS7nZ1qW3LVowj/r1O5pKlqkQaRg
         pMPObh6jNoSLQlRRNyq1MGDRMwAZUDlarOWzb8uX7YHpuzMxBoMKkM22cGCybitgNtyh
         f7f5Go8xVxTW0Ry3YW/+bW7bebPZKou20l0Rw2BJMGMweUCgvuf3Z1LFPZkycwkFfTVK
         tQozxHxteQxTEPuVQZBwrKgUA8cKDYvdfQaCuF+waem1g2j5pZYxKVwT2ULrH+XDps+7
         SXAA==
X-Gm-Message-State: AOJu0YwW6DvFvQIzRSGtkp0jLOQifXiG+bMZaxE8JQhvfJzv9ycSxGwA
	2yaVdJOU7pYPobVgXi8mES2j0cUtfd4IXICH/ql0Ar4xE6BLz4T3I/4IVkg8BZOo2wQaF4lqcW9
	jNahv
X-Gm-Gg: AY/fxX7ujlNA7YcIOyOKGRBhZZnWso26Xq52SPrh3zSr85fPxC+mBRhZZw/f6ETI0Li
	g2YhA+dgDbixe580tblfLARtved7D9Komgo22bj4LGjkhNX4omdaKWL6EUrUzJAO+MS2emARNp5
	Ivbvtdd8RVuK1f9zQsx/AUlsmRsi1vZp8q2lkxVPm979QkbHGT6iiYsL41hOzFcklhxK/QYzkbY
	g9chjygzmmkJ7+29j2O6aWdvzT0tgscFjs3yqRrcUB5fxVycErQLrBaaZYTaAUdOgmjenODl5pW
	6MgTFT2dHB7fyLl2QSyyFkczwcI1/tOecucW8NjIGEv/UUFFXI+CG+fSRpYz0OqDuW5vAyoFFMS
	+1pChxI0pogLy5APlMr6oRjznfsPRkqUsdBqHUFl9hO9V0VmfMYi7R86XrcCYz8M6z5OJJr6QCa
	dXp5TkMugrxhKV8PgN/xKh604=
X-Google-Smtp-Source: AGHT+IE+VIess0cnwuvOXaDu48FblPV2UHPifeqOK5z1druDZzWnX/sPE70C5pal9r3901jxlZ2e7g==
X-Received: by 2002:a17:902:e78f:b0:297:d697:41e with SMTP id d9443c01a7336-29ec24844aemr51362965ad.37.1765436015615;
        Wed, 10 Dec 2025 22:53:35 -0800 (PST)
Received: from MVIN00352.mvista.com ([2406:7400:54:6629:3e8b:44a3:3456:f4ea])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9d38c74sm13671885ad.31.2025.12.10.22.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 22:53:34 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [meta-vitualization][scarthgap][patch v2] kubernetes: Fix CVE-2024-3177
Date: Thu, 11 Dec 2025 12:23:26 +0530
Message-ID: <20251211065326.61303-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 11 Dec 2025 06:53:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9479

Upstream-commit: https://github.com/kubernetes/kubernetes/commit/34546f4725df0d5493b4e18e3229d3ed201fe260

Reference: https://github.com/kubernetes/kubernetes/issues/124336

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../kubernetes/kubernetes/CVE-2024-3177.patch | 237 ++++++++++++++++++
 .../kubernetes/kubernetes_git.bb              |   1 +
 2 files changed, 238 insertions(+)
 create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2024-3177.patch

diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2024-3177.patch b/recipes-containers/kubernetes/kubernetes/CVE-2024-3177.patch
new file mode 100644
index 00000000..e6b2c6c4
--- /dev/null
+++ b/recipes-containers/kubernetes/kubernetes/CVE-2024-3177.patch
@@ -0,0 +1,237 @@
+From 34546f4725df0d5493b4e18e3229d3ed201fe260 Mon Sep 17 00:00:00 2001
+From: Rita Zhang <rita.z.zhang@gmail.com>
+Date: Mon, 25 Mar 2024 10:33:41 -0700
+Subject: [PATCH] Add envFrom to serviceaccount admission plugin
+
+Signed-off-by: Rita Zhang <rita.z.zhang@gmail.com>
+
+Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/commit/34546f4725df0d5493b4e18e3229d3ed201fe260]
+CVE: CVE-2024-3177
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ .../pkg/admission/serviceaccount/admission.go |  21 +++
+ .../serviceaccount/admission_test.go          | 122 ++++++++++++++++--
+ 2 files changed, 132 insertions(+), 11 deletions(-)
+
+diff --git a/plugin/pkg/admission/serviceaccount/admission.go b/plugin/pkg/admission/serviceaccount/admission.go
+index c844a051c24b3..3f4338128e53c 100644
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
+index b5155f5cd33e6..01b08da455f47 100644
+--- a/plugin/pkg/admission/serviceaccount/admission_test.go
++++ b/plugin/pkg/admission/serviceaccount/admission_test.go
+@@ -520,6 +520,25 @@ func TestAllowsReferencedSecret(t *testing.T) {
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
+@@ -544,6 +563,25 @@ func TestAllowsReferencedSecret(t *testing.T) {
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
+@@ -571,6 +609,28 @@ func TestAllowsReferencedSecret(t *testing.T) {
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
+@@ -627,25 +687,20 @@ func TestRejectsUnreferencedSecretVolumes(t *testing.T) {
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
+@@ -678,6 +733,30 @@ func TestRejectsUnreferencedSecretVolumes(t *testing.T) {
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
+@@ -708,6 +787,27 @@ func TestRejectsUnreferencedSecretVolumes(t *testing.T) {
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
index 5339371c..ab322306 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -36,6 +36,7 @@ SRC_URI:append = " \
            file://99-kubernetes.conf \
            file://CVE-2025-5187.patch \
            file://CVE-2024-10220.patch \
+           file://CVE-2024-3177.patch \
           "
 
 DEPENDS += "rsync-native \
-- 
2.43.0



Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E34CCD1AB
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 08:41:39 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.5388.1761295290761318208
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 01:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fbahvDoU;
 spf=pass (domain: mvista.com, ip: 209.85.210.178, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7a265a02477so1385643b3a.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Oct 2025 01:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1761295290; x=1761900090; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=13SEJmcv/V5v5se4r1vIgtJphCvIhGvFMuVeOQ84BMc=;
        b=fbahvDoUgi+Nxiw7Q3FPBMFyuXmWNqTw7pSHNZEvsCKgXHRXrBeCVNkxaWC57XHTN0
         Vj7P78YPLxEKoxbxnD+9wJGMlpG9R4eUIbQRdYW1TeOxFzS8BTVj8bVcFL2d/sS/Hlei
         K86f8XYwDQe85DdQtrOF7zq+HgZ/lq/RkjS20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761295290; x=1761900090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13SEJmcv/V5v5se4r1vIgtJphCvIhGvFMuVeOQ84BMc=;
        b=cOdwAwfHhzfkV4lnqBYbPH0wBRnO+uobwe8nHxaf4CwWojPUWupOnGlqhc/s+iZyNJ
         QQe0KnM8qEUEtzxBQ9y+91pP/RBVgGN7xJ/FHHiR4V1zm1wiezrNyPqUwvEDSkMo0d+n
         uoSsLu55U9x9ZWI+s/YlaTuy/ihMwzmaIKJB1GoULSSfgA6BY/suhErPqz1hQgrjbKdV
         brmWzAnU60uscAKiuP/SM/VROZDdhQtHyqpmTvF+eRVrJwHuhcon5LEIM2bXvN2ORhYC
         YB/Koh7oBuqq//41jZaXQJneoZBDhJDFav7scucfiiLwUHaeCvTXDIKGSsmH2WficquQ
         KDNA==
X-Gm-Message-State: AOJu0YwmwWUjWJRqBJ1eqvuk5frijYB32yaYefDTBUwdB36Z5jW5bvz0
	FvLuFMEhjgwhpsUfvMa+hb4efLGYbZSR8eoewR+oKKyxecYFNHjsm713z8wvG1l1AFvUP+RAR+S
	7VrJ7uvI=
X-Gm-Gg: ASbGncvHdJafRmPqbaCywl6KVS96KbDP16SHfq/52AcFaR+YZBDbFdNsYRiv61Ic3rQ
	jeQT20YC55lk3wqdZCVUN1+JQz8C5UjkRYu4c4pNSXeuBFP3333nFweHPmSAQ+GnJIvzOXEqJjc
	UDULvB1AdOLNAs6DT1vTsTy7+/BWpVSY5o5BXq7qcNYnzwpyk6LLRyNmO0F6sIyOSnRtfF5wPc1
	QWKyjUpiPdJ3xV+Gylc7LCotDAreJUca7UePNIy0WXXuOPKxadqLOYEz1IxUXkbUgSFpTS1bBuo
	peaWaoQBxSni82LCEVZliJi6VAq0WB6BxGExvugxILoeWlaQWIgLCsBcelb1eqDJ7B+dg0Rbu5h
	DAQC8UyR5NG5hXo9s9tmaoShY7TmEQEsmx60y+dAVdWydNiXFag13GI0ORAZPRwg6H4DvTnnHqk
	EhiZGPLPT4VLnT
X-Google-Smtp-Source: AGHT+IGeF76MX7DKxDC6J87EYa6AeJSb+MPP+i3DuTpsvovoJ8DgK/nOnMvQ3aRSV5zTAJJ2VbHqyQ==
X-Received: by 2002:a05:6a20:1591:b0:2db:f868:22c with SMTP id adf61e73a8af0-33deb276db2mr1957582637.40.1761295289412;
        Fri, 24 Oct 2025 01:41:29 -0700 (PDT)
Received: from MVIN00352.. ([2401:4900:8fce:8546:d407:7db9:48da:327a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274dc33desm5092593b3a.71.2025.10.24.01.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 01:41:28 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [meta-vitualization][scarthgap][patch] kubernetes: Fix CVE-2024-3177
Date: Fri, 24 Oct 2025 14:11:20 +0530
Message-ID: <20251024084120.465184-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:41:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9422

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
index ee44db47..c9fecfa6 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -35,6 +35,7 @@ SRC_URI:append = " \
            file://k8s-init \
            file://99-kubernetes.conf \
            file://CVE-2025-5187.patch \
+           file://CVE-2024-3177.patch \
           "
 
 DEPENDS += "rsync-native \
-- 
2.43.0



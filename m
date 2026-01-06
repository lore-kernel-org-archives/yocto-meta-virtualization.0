Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6D2CEFCFE
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 19:42:02 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.98748.1767728512084271322
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Jan 2026 11:41:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KSXnXfx3;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-888310b91c5so259706d6.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jan 2026 11:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767728511; x=1768333311; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VT+qqYRKIyttcc4Q30IMNEyEcCT8nJNxzZrFAq2Fp9U=;
        b=KSXnXfx3db5LN+bWxpstyfQ5Zna0OfeGHAYp8PsM/mYFlIQOff3mr18sbkRY7TOcOF
         ls/6UgSvbHLLk7bCo7FcBwRr1X7Y6PDHqoUaJ1A0fq0PTebWNzxg6BpWUt1SIgtT6hw/
         OvUekJOIX2SVqvyWGmpjzh6+wpY/RkCHuGQgQFLtc07vupBdDlIUj58pfVCJoJ87CTRv
         yaNyaioX2AHBIBnhnWTvIIjMjapHNmf8K8iYaQC87LJJP+p/thfSwyxwc0lA1mkYxCWW
         /rQPt3Hlv42IOQRtqyvbtVKHP9mNKXUGdk0STzmZkWVgbHQdTXvdzFIye9nxDaeAYkL+
         446Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767728511; x=1768333311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VT+qqYRKIyttcc4Q30IMNEyEcCT8nJNxzZrFAq2Fp9U=;
        b=bvHIgAb85aZyXW3efVDu83AisapQDr/2ZE5MfRFYFZ9PLhqgJ9m7dIrRSL/AiAEsmp
         SiKEkS1JWFerIO1avjDb9l8OEZkW7oM45ywfsLi+nIbWPQpCSNDGzTl2FzCid/Hd70oQ
         C4AorTghEU82zPfO7mbRIrQ3s2XJXO+nwFmjtJN12zRESuXiYX4MAWmvYfWbCGzlgvXu
         K5R8HubJ7/hpvtJfpaWmk5CGkLVqgUdOQV6XwRRmNYNUxj92rPksdPXAU+TGV9QyR0Ys
         CwIFhBfSVLPd1n2ceMGIHCDPWXz/mW3a+MuUgZ+WfMKymg4Cg4MxvGiccay5mE10zA01
         gwgg==
X-Gm-Message-State: AOJu0YzateUYsN4/O5zDM7T8UA4sUVzpwT+SU7szTKtdQ9Yxy446IV35
	R4ngq5VR8rAIW3iImQOcQ0pvngnrCin0m6+YE1TDvEWNpSYDUHkFn/cekY1M0MGaUEw=
X-Gm-Gg: AY/fxX5EpU1pwkDvLqETdZhVqOQgNYGtRdAmkcuOy9fL/2DE73i6x9FNVqXhZVg+tbS
	eNsMdiLjZfZbpnouA0JgZBS2ltnHMJFcb+VvTUrrYuMBr/UlYx/m6DGkN7PP695fQgMqj4X/R02
	65Ll1oIp156D+Wgh9HZ0Q2Rp7QXGec3W3Hp3ibUEBADA7IBdAzedMAoKrd///zAZCSVvI9GdxOD
	9P9QdBWoHGox9DTePKbmvOSEQRgpxCb5KLNi1OAv5GTnmoLCWKowhJ2zpcIQCaFvlbR2+LVKj3k
	gRse19PtoIDiwD6IQb2pkDh4aQ/dtQBJei5y92Dhg790dLa476ozmd4veJIpkBVcP8+H5i6w9ks
	j6nKWN2XvVGh16Ctq/pZNc9l84Z/jHLV421/f4/Ajz3Wh8JL0yZDLBqlAN9OU/7fL1I2fbaXqTp
	1fYk87pcTMLyJHQ+SqICKjbyNnKWYK0rUPrxXKV/X7CsyIKPNb2hOImgb97YuQ7g2B
X-Google-Smtp-Source: AGHT+IHFC4umiIRQs0XwnH0KmTchh+x6O4cOyih1jAWQj7LvMs9E7viyW/R/F1tyKQRFqGz1qG5LlA==
X-Received: by 2002:a05:6214:258c:b0:882:36d6:e5c1 with SMTP id 6a1803df08f44-89083cede3cmr4179686d6.29.1767728510992;
        Tue, 06 Jan 2026 11:41:50 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077253218sm18965386d6.43.2026.01.06.11.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:41:50 -0800 (PST)
Date: Tue, 6 Jan 2026 14:41:48 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: vanusuri@mvista.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [meta-vitualization][scarthgap][patch v2]
 kubernetes: Fix CVE-2024-3177
Message-ID: <aV1lfNwXKBg8NQZL@gmail.com>
References: <20251211065326.61303-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211065326.61303-1-vanusuri@mvista.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jan 2026 19:42:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9527

merged.

Bruce

In message: [meta-virtualization] [meta-vitualization][scarthgap][patch v2] kubernetes: Fix CVE-2024-3177
on 11/12/2025 Vijay Anusuri via lists.yoctoproject.org wrote:

> Upstream-commit: https://github.com/kubernetes/kubernetes/commit/34546f4725df0d5493b4e18e3229d3ed201fe260
> 
> Reference: https://github.com/kubernetes/kubernetes/issues/124336
> 
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../kubernetes/kubernetes/CVE-2024-3177.patch | 237 ++++++++++++++++++
>  .../kubernetes/kubernetes_git.bb              |   1 +
>  2 files changed, 238 insertions(+)
>  create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2024-3177.patch
> 
> diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2024-3177.patch b/recipes-containers/kubernetes/kubernetes/CVE-2024-3177.patch
> new file mode 100644
> index 00000000..e6b2c6c4
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/CVE-2024-3177.patch
> @@ -0,0 +1,237 @@
> +From 34546f4725df0d5493b4e18e3229d3ed201fe260 Mon Sep 17 00:00:00 2001
> +From: Rita Zhang <rita.z.zhang@gmail.com>
> +Date: Mon, 25 Mar 2024 10:33:41 -0700
> +Subject: [PATCH] Add envFrom to serviceaccount admission plugin
> +
> +Signed-off-by: Rita Zhang <rita.z.zhang@gmail.com>
> +
> +Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/commit/34546f4725df0d5493b4e18e3229d3ed201fe260]
> +CVE: CVE-2024-3177
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + .../pkg/admission/serviceaccount/admission.go |  21 +++
> + .../serviceaccount/admission_test.go          | 122 ++++++++++++++++--
> + 2 files changed, 132 insertions(+), 11 deletions(-)
> +
> +diff --git a/plugin/pkg/admission/serviceaccount/admission.go b/plugin/pkg/admission/serviceaccount/admission.go
> +index c844a051c24b3..3f4338128e53c 100644
> +--- a/plugin/pkg/admission/serviceaccount/admission.go
> ++++ b/plugin/pkg/admission/serviceaccount/admission.go
> +@@ -337,6 +337,13 @@ func (s *Plugin) limitSecretReferences(serviceAccount *corev1.ServiceAccount, po
> + 				}
> + 			}
> + 		}
> ++		for _, envFrom := range container.EnvFrom {
> ++			if envFrom.SecretRef != nil {
> ++				if !mountableSecrets.Has(envFrom.SecretRef.Name) {
> ++					return fmt.Errorf("init container %s with envFrom referencing secret.secretName=\"%s\" is not allowed because service account %s does not reference that secret", container.Name, envFrom.SecretRef.Name, serviceAccount.Name)
> ++				}
> ++			}
> ++		}
> + 	}
> + 
> + 	for _, container := range pod.Spec.Containers {
> +@@ -347,6 +354,13 @@ func (s *Plugin) limitSecretReferences(serviceAccount *corev1.ServiceAccount, po
> + 				}
> + 			}
> + 		}
> ++		for _, envFrom := range container.EnvFrom {
> ++			if envFrom.SecretRef != nil {
> ++				if !mountableSecrets.Has(envFrom.SecretRef.Name) {
> ++					return fmt.Errorf("container %s with envFrom referencing secret.secretName=\"%s\" is not allowed because service account %s does not reference that secret", container.Name, envFrom.SecretRef.Name, serviceAccount.Name)
> ++				}
> ++			}
> ++		}
> + 	}
> + 
> + 	// limit pull secret references as well
> +@@ -388,6 +402,13 @@ func (s *Plugin) limitEphemeralContainerSecretReferences(pod *api.Pod, a admissi
> + 				}
> + 			}
> + 		}
> ++		for _, envFrom := range container.EnvFrom {
> ++			if envFrom.SecretRef != nil {
> ++				if !mountableSecrets.Has(envFrom.SecretRef.Name) {
> ++					return fmt.Errorf("ephemeral container %s with envFrom referencing secret.secretName=\"%s\" is not allowed because service account %s does not reference that secret", container.Name, envFrom.SecretRef.Name, serviceAccount.Name)
> ++				}
> ++			}
> ++		}
> + 	}
> + 	return nil
> + }
> +diff --git a/plugin/pkg/admission/serviceaccount/admission_test.go b/plugin/pkg/admission/serviceaccount/admission_test.go
> +index b5155f5cd33e6..01b08da455f47 100644
> +--- a/plugin/pkg/admission/serviceaccount/admission_test.go
> ++++ b/plugin/pkg/admission/serviceaccount/admission_test.go
> +@@ -520,6 +520,25 @@ func TestAllowsReferencedSecret(t *testing.T) {
> + 		t.Errorf("Unexpected error: %v", err)
> + 	}
> + 
> ++	pod2 = &api.Pod{
> ++		Spec: api.PodSpec{
> ++			Containers: []api.Container{
> ++				{
> ++					Name: "container-1",
> ++					EnvFrom: []api.EnvFromSource{
> ++						{
> ++							SecretRef: &api.SecretEnvSource{
> ++								LocalObjectReference: api.LocalObjectReference{
> ++									Name: "foo"}}}},
> ++				},
> ++			},
> ++		},
> ++	}
> ++	attrs = admission.NewAttributesRecord(pod2, nil, api.Kind("Pod").WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("version"), "", admission.Create, &metav1.CreateOptions{}, false, nil)
> ++	if err := admissiontesting.WithReinvocationTesting(t, admit).Admit(context.TODO(), attrs, nil); err != nil {
> ++		t.Errorf("Unexpected error: %v", err)
> ++	}
> ++
> + 	pod2 = &api.Pod{
> + 		Spec: api.PodSpec{
> + 			InitContainers: []api.Container{
> +@@ -544,6 +563,25 @@ func TestAllowsReferencedSecret(t *testing.T) {
> + 		t.Errorf("Unexpected error: %v", err)
> + 	}
> + 
> ++	pod2 = &api.Pod{
> ++		Spec: api.PodSpec{
> ++			InitContainers: []api.Container{
> ++				{
> ++					Name: "container-1",
> ++					EnvFrom: []api.EnvFromSource{
> ++						{
> ++							SecretRef: &api.SecretEnvSource{
> ++								LocalObjectReference: api.LocalObjectReference{
> ++									Name: "foo"}}}},
> ++				},
> ++			},
> ++		},
> ++	}
> ++	attrs = admission.NewAttributesRecord(pod2, nil, api.Kind("Pod").WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("version"), "", admission.Create, &metav1.CreateOptions{}, false, nil)
> ++	if err := admissiontesting.WithReinvocationTesting(t, admit).Admit(context.TODO(), attrs, nil); err != nil {
> ++		t.Errorf("Unexpected error: %v", err)
> ++	}
> ++
> + 	pod2 = &api.Pod{
> + 		Spec: api.PodSpec{
> + 			ServiceAccountName: DefaultServiceAccountName,
> +@@ -571,6 +609,28 @@ func TestAllowsReferencedSecret(t *testing.T) {
> + 	if err := admit.Validate(context.TODO(), attrs, nil); err != nil {
> + 		t.Errorf("Unexpected error: %v", err)
> + 	}
> ++
> ++	pod2 = &api.Pod{
> ++		Spec: api.PodSpec{
> ++			ServiceAccountName: DefaultServiceAccountName,
> ++			EphemeralContainers: []api.EphemeralContainer{
> ++				{
> ++					EphemeralContainerCommon: api.EphemeralContainerCommon{
> ++						Name: "container-2",
> ++						EnvFrom: []api.EnvFromSource{{
> ++							SecretRef: &api.SecretEnvSource{
> ++								LocalObjectReference: api.LocalObjectReference{
> ++									Name: "foo"}}}},
> ++					},
> ++				},
> ++			},
> ++		},
> ++	}
> ++	// validate enforces restrictions on secret mounts when operation==update and subresource==ephemeralcontainers"
> ++	attrs = admission.NewAttributesRecord(pod2, nil, api.Kind("Pod").WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("version"), "ephemeralcontainers", admission.Update, &metav1.UpdateOptions{}, false, nil)
> ++	if err := admit.Validate(context.TODO(), attrs, nil); err != nil {
> ++		t.Errorf("Unexpected error: %v", err)
> ++	}
> + }
> + 
> + func TestRejectsUnreferencedSecretVolumes(t *testing.T) {
> +@@ -627,25 +687,20 @@ func TestRejectsUnreferencedSecretVolumes(t *testing.T) {
> + 
> + 	pod2 = &api.Pod{
> + 		Spec: api.PodSpec{
> +-			InitContainers: []api.Container{
> ++			Containers: []api.Container{
> + 				{
> + 					Name: "container-1",
> +-					Env: []api.EnvVar{
> ++					EnvFrom: []api.EnvFromSource{
> + 						{
> +-							Name: "env-1",
> +-							ValueFrom: &api.EnvVarSource{
> +-								SecretKeyRef: &api.SecretKeySelector{
> +-									LocalObjectReference: api.LocalObjectReference{Name: "foo"},
> +-								},
> +-							},
> +-						},
> +-					},
> ++							SecretRef: &api.SecretEnvSource{
> ++								LocalObjectReference: api.LocalObjectReference{
> ++									Name: "foo"}}}},
> + 				},
> + 			},
> + 		},
> + 	}
> + 	attrs = admission.NewAttributesRecord(pod2, nil, api.Kind("Pod").WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("version"), "", admission.Create, &metav1.CreateOptions{}, false, nil)
> +-	if err := admissiontesting.WithReinvocationTesting(t, admit).Admit(context.TODO(), attrs, nil); err == nil || !strings.Contains(err.Error(), "with envVar") {
> ++	if err := admissiontesting.WithReinvocationTesting(t, admit).Admit(context.TODO(), attrs, nil); err == nil || !strings.Contains(err.Error(), "with envFrom") {
> + 		t.Errorf("Unexpected error: %v", err)
> + 	}
> + 
> +@@ -678,6 +733,30 @@ func TestRejectsUnreferencedSecretVolumes(t *testing.T) {
> + 		t.Errorf("validate only enforces restrictions on secret mounts when operation==create and subresource==''. Unexpected error: %v", err)
> + 	}
> + 
> ++	pod2 = &api.Pod{
> ++		Spec: api.PodSpec{
> ++			ServiceAccountName: DefaultServiceAccountName,
> ++			InitContainers: []api.Container{
> ++				{
> ++					Name: "container-1",
> ++					EnvFrom: []api.EnvFromSource{
> ++						{
> ++							SecretRef: &api.SecretEnvSource{
> ++								LocalObjectReference: api.LocalObjectReference{
> ++									Name: "foo"}}}},
> ++				},
> ++			},
> ++		},
> ++	}
> ++	attrs = admission.NewAttributesRecord(pod2, nil, api.Kind("Pod").WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("version"), "", admission.Update, &metav1.UpdateOptions{}, false, nil)
> ++	if err := admissiontesting.WithReinvocationTesting(t, admit).Admit(context.TODO(), attrs, nil); err != nil {
> ++		t.Errorf("admit only enforces restrictions on secret mounts when operation==create. Unexpected error: %v", err)
> ++	}
> ++	attrs = admission.NewAttributesRecord(pod2, nil, api.Kind("Pod").WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("version"), "", admission.Create, &metav1.CreateOptions{}, false, nil)
> ++	if err := admit.Validate(context.TODO(), attrs, nil); err == nil || !strings.Contains(err.Error(), "with envFrom") {
> ++		t.Errorf("validate only enforces restrictions on secret mounts when operation==create and subresource==''. Unexpected error: %v", err)
> ++	}
> ++
> + 	pod2 = &api.Pod{
> + 		Spec: api.PodSpec{
> + 			ServiceAccountName: DefaultServiceAccountName,
> +@@ -708,6 +787,27 @@ func TestRejectsUnreferencedSecretVolumes(t *testing.T) {
> + 	if err := admit.Validate(context.TODO(), attrs, nil); err == nil || !strings.Contains(err.Error(), "with envVar") {
> + 		t.Errorf("validate enforces restrictions on secret mounts when operation==update and subresource==ephemeralcontainers. Unexpected error: %v", err)
> + 	}
> ++
> ++	pod2 = &api.Pod{
> ++		Spec: api.PodSpec{
> ++			ServiceAccountName: DefaultServiceAccountName,
> ++			EphemeralContainers: []api.EphemeralContainer{
> ++				{
> ++					EphemeralContainerCommon: api.EphemeralContainerCommon{
> ++						Name: "container-2",
> ++						EnvFrom: []api.EnvFromSource{{
> ++							SecretRef: &api.SecretEnvSource{
> ++								LocalObjectReference: api.LocalObjectReference{
> ++									Name: "foo"}}}},
> ++					},
> ++				},
> ++			},
> ++		},
> ++	}
> ++	attrs = admission.NewAttributesRecord(pod2, nil, api.Kind("Pod").WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("version"), "ephemeralcontainers", admission.Update, &metav1.UpdateOptions{}, false, nil)
> ++	if err := admit.Validate(context.TODO(), attrs, nil); err == nil || !strings.Contains(err.Error(), "with envFrom") {
> ++		t.Errorf("validate enforces restrictions on secret mounts when operation==update and subresource==ephemeralcontainers. Unexpected error: %v", err)
> ++	}
> + }
> + 
> + func TestAllowUnreferencedSecretVolumesForPermissiveSAs(t *testing.T) {
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index 5339371c..ab322306 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -36,6 +36,7 @@ SRC_URI:append = " \
>             file://99-kubernetes.conf \
>             file://CVE-2025-5187.patch \
>             file://CVE-2024-10220.patch \
> +           file://CVE-2024-3177.patch \
>            "
>  
>  DEPENDS += "rsync-native \
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9479): https://lists.yoctoproject.org/g/meta-virtualization/message/9479
> Mute This Topic: https://lists.yoctoproject.org/mt/116725677/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



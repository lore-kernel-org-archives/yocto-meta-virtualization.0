Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7338C25B78
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 02:28:18 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.5942.1715653695102414537
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 May 2024 19:28:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nccDmSTr;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-43e1d15a46eso8296391cf.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 May 2024 19:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715653694; x=1716258494; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I7/qOjQlpY3WH2ITmtAFpEMxzjz6fSX1dJmfQnteyY0=;
        b=nccDmSTrQ+veUN1qsBZnC2C9ACSNfMc2qH2o3TnCAe7z8GxN2kcldj9e5i5gWRqX5a
         D3VKjltgLOWB3QKICxL276LzF6L4+mhqL7TiftqoBVN9DjDp7EtFBBO6GyPh4O6C+HQc
         dZD0cgDJXY1r9FDLVI/b3lPPjDHiAulNNr4QgXpr/rGIietzCSLyEgdzMAVWPWwRDDN0
         I8UuXD85Oy6Y9dzKhPe3+iXd079LGG0WE9ToxFPuI5vhoK1/AqrdQeuemAApHKFDhZ9d
         xkExrluCdEvw297fJS3Yd9wGqmWhPLh8wEQ+x9HuSf+ncJsX8JZfpChQfXA0UffnFFli
         IYPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715653694; x=1716258494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7/qOjQlpY3WH2ITmtAFpEMxzjz6fSX1dJmfQnteyY0=;
        b=LAp6KCdGS7aBacIaeY5qcrxVAKXXIZ1XPS9dUCidN+3ieA2oKohP0MrCDTwwslBJ3G
         IToY+lEtdTkIgC3rUYs/gADSK2Bk1vnIM0RLKb9gbKOR7v33DkVCxhYyVnFsZyx6SZcs
         ENV51jrSzkNDQ1sDgNTZwmVExrDm4GKnxlVzkXI0DsI4J9dpEYzNqPHND/5rXxTqjMl1
         XinwhyHmJHk4GSBwotzzycJr4WM+cpR/0fgPC3Szu1LXUpYbV7k5/fleeMIonkj4GrJ8
         RvY4BnHHe2KsJlZ/j+r6GB8Fv8e5fXVrcW064vB/KUoFn5SI5H+5OzBuxOfsFHQhb+RD
         7lvA==
X-Gm-Message-State: AOJu0YzDO0vNAphauVYhbSJYX7ZCLEgZ1y+qUc7ugmG+RSQMQo/DX7yL
	mbZIgEWj8benN4Z0zak2JwApx60GwutDxW1nZvXFmDfVtp+3evte
X-Google-Smtp-Source: AGHT+IFrGy6y7foFlR2sVYTbP5mCXekhD9LANeBjSeTSeWaizoofW3GhPqFDU0zNcL5fMIpPQwbdcA==
X-Received: by 2002:a05:622a:2288:b0:43a:d7f2:2feb with SMTP id d75a77b69052e-43dfda8c32cmr141652801cf.2.1715653693879;
        Mon, 13 May 2024 19:28:13 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43df54d6afasm62565291cf.24.2024.05.13.19.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 19:28:13 -0700 (PDT)
Date: Mon, 13 May 2024 22:28:11 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: asharma@mvista.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH] kubernetes: Backport fix
 for CVE-2024-3177
Message-ID: <ZkLMO/fg1d5Skn4B@gmail.com>
References: <20240503034953.8903-1-asharma@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503034953.8903-1-asharma@mvista.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 14 May 2024 02:28:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8720

merged to kirkstone

Bruce

In message: [meta-virtualization][kirkstone][PATCH] kubernetes: Backport fix for CVE-2024-3177
on 03/05/2024 Ashish Sharma via lists.yoctoproject.org wrote:

> Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/pull/124325/commits/3f0922513d235d8bdebe79f0d07da769c04211b8]
> 
> Signed-off-by: Ashish Sharma <asharma@mvista.com>
> ---
>  .../kubernetes/kubernetes/CVE-2024-3177.patch | 237 ++++++++++++++++++
>  .../kubernetes/kubernetes_git.bb              |   1 +
>  2 files changed, 238 insertions(+)
>  create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2024-3177.patch
> 
> diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2024-3177.patch b/recipes-containers/kubernetes/kubernetes/CVE-2024-3177.patch
> new file mode 100644
> index 00000000..20b2ea8a
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/CVE-2024-3177.patch
> @@ -0,0 +1,237 @@
> +From 3f0922513d235d8bdebe79f0d07da769c04211b8 Mon Sep 17 00:00:00 2001
> +From: Rita Zhang <rita.z.zhang@gmail.com>
> +Date: Mon, 25 Mar 2024 10:33:41 -0700
> +Subject: [PATCH] Add envFrom to serviceaccount admission plugin
> +
> +Signed-off-by: Rita Zhang <rita.z.zhang@gmail.com>
> +
> +Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/pull/124325/commits/3f0922513d235d8bdebe79f0d07da769c04211b8]
> +CVE: CVE-2024-3177
> +Signed-off-by: Ashish Sharma <asharma@mvista.com>
> +
> + .../pkg/admission/serviceaccount/admission.go |  21 +++
> + .../serviceaccount/admission_test.go          | 122 ++++++++++++++++--
> + 2 files changed, 132 insertions(+), 11 deletions(-)
> +
> +diff --git a/plugin/pkg/admission/serviceaccount/admission.go b/plugin/pkg/admission/serviceaccount/admission.go
> +index c844a051c24b..3f4338128e53 100644
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
> +index bf15f870d75a..4dba6cd8b13e 100644
> +--- a/plugin/pkg/admission/serviceaccount/admission_test.go
> ++++ b/plugin/pkg/admission/serviceaccount/admission_test.go
> +@@ -521,6 +521,25 @@ func TestAllowsReferencedSecret(t *testing.T) {
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
> +@@ -545,6 +564,25 @@ func TestAllowsReferencedSecret(t *testing.T) {
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
> +@@ -572,6 +610,28 @@ func TestAllowsReferencedSecret(t *testing.T) {
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
> +@@ -628,25 +688,20 @@ func TestRejectsUnreferencedSecretVolumes(t *testing.T) {
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
> +@@ -679,6 +734,30 @@ func TestRejectsUnreferencedSecretVolumes(t *testing.T) {
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
> +@@ -709,6 +788,27 @@ func TestRejectsUnreferencedSecretVolumes(t *testing.T) {
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
> index b0c87c47..78d1cd2a 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -35,6 +35,7 @@ SRC_URI:append = " \
>             file://cni-containerd-net.conflist \
>             file://k8s-init \
>             file://99-kubernetes.conf \
> +           file://CVE-2024-3177.patch \
>            "
>  
>  DEPENDS += "rsync-native \
> -- 
> 2.35.7
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8715): https://lists.yoctoproject.org/g/meta-virtualization/message/8715
> Mute This Topic: https://lists.yoctoproject.org/mt/105882014/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



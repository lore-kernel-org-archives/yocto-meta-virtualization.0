Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47818C5ACB3
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 04:09:17 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.27964.1700539747527936819
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Nov 2023 20:09:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HLMqRtnk;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-670e7ae4a2eso21497596d6.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Nov 2023 20:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700539746; x=1701144546; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LE+sXQRPGjZF1RkXxORk91giq9JYZxoeDjKsa4I9fzg=;
        b=HLMqRtnkiOcOVQLlrdRcuFrqq0nmm0MXKIIGoDA1xDRoXGkXPUSjfZTP7H59hMMjmr
         7on5GWzf8LOZ4bMnB2VH3kJCo/z5cRWky9H7FKHwwxt23ztk6r8eflZCHIntnO3F9cP2
         9QWYGkUMTtRuV+pSqKcnRFg3Ygrh3+hbVQlvRCKBlw+E+jqr3E/s+OxBttrJqYr4T0Ev
         ZxmpyHkmFNRxPxVYNzG6AnjPD191R291A2ceqyrKwcrpB8wzQDuysYIubHppThrCmcgn
         MN+9hrLVWn2OoRPGj3mbjhEsddj29PP5miIphg6H/ImEH6u6iAigJxb6LfrfPrUexVgd
         r2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700539746; x=1701144546;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LE+sXQRPGjZF1RkXxORk91giq9JYZxoeDjKsa4I9fzg=;
        b=fwHAKfnpnrcLSKZlihvlhoSG02C0krYOcjiDkuRD/Pr1Zbjd4Msamyr5ZhVrHFKyqS
         NH+/R6tJqU8AT68U3J0v5GmmkdkHS3bnGlZZ4gN462t0F93UXozh4+CdSmwXZMoj87qx
         p1pjqBywvg96DmtMsgie7j3DG9o4oPPZ5EQJuJFDMOLRiRxTSoLJz7QNzRzdokZD2xGD
         2iAHjUfO9d1iXhQ57lFW7HfkwoKWVTLbZ8cgfjGVNwUhcj4M1I519Ocp4GIIqTpYGCf9
         4FDgmSoKTKZPb1r4haIFg5BnrBYKOMcHl5SE0nWjF3oO96RjfYTX5Z41WGtChn783KfR
         YT6Q==
X-Gm-Message-State: AOJu0Yxi00duvUeJ1MoDnM7BwDcHB9Pw+o3eztQkOldyxevnLc+wTn2T
	VoxrHW4hsIoUfkzj5Ok4pgWmBzJx+/5elQ==
X-Google-Smtp-Source: AGHT+IFYZyuzpLfu33zF+67uttTUIsOeWYhQJCPuEPuX9ZXcDxe6sXT3biUg0qCNlvmiPBynRKc87w==
X-Received: by 2002:a05:6214:258e:b0:66f:b9ef:9636 with SMTP id fq14-20020a056214258e00b0066fb9ef9636mr2220801qvb.32.1700539745704;
        Mon, 20 Nov 2023 20:09:05 -0800 (PST)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id mh10-20020a056214564a00b00677ee93c52csm3627162qvb.114.2023.11.20.20.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 20:09:05 -0800 (PST)
Date: Tue, 21 Nov 2023 04:09:03 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: soumya.sambu@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH v2 2/2] kubernetes: Fix
 CVE-2023-2727, CVE-2023-2728
Message-ID: <ZVwtX7t6Vame2/3o@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113035848.1875360-1-soumya.sambu@windriver.com>
 <20231113041609.1888228-1-soumya.sambu@windriver.com>
 <20231113041641.1888686-1-soumya.sambu@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Nov 2023 04:09:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8463


All three are now merged.

Thanks for the CVE information in the commit, it makes it
much easier and faster to merge.

Bruce

In message: [meta-virtualization][kirkstone][PATCH v2 2/2] kubernetes: Fix CVE-2023-2727, CVE-2023-2728
on 13/11/2023 Soumya via lists.yoctoproject.org wrote:

> From: Soumya Sambu <soumya.sambu@windriver.com>
> 
> Users may be able to launch containers using images that are restricted by
> ImagePolicyWebhook when using ephemeral containers, Kubernetes clusters are
> only affected if the ImagePolicyWebhook admission plugin is used together
> with ephemeral containers.
> 
> Users may be able to launch containers that bypass the mountable secrets
> policy enforced by the ServiceAccount admission plugin when using ephemeral
> containers. The policy ensures pods running with a service account may only
> reference secrets specified in the service account's secrets field. Kuberenetes
> clusters are only affected if the ServiceAccount admission plugin and the
> `kubernetes.io/enforce-mountab'le-secrets` annotation are used teogether with
> ephemeralcontainers.
> 
> CVE: CVE-2023-2727, CVE-2023-2728
> 
> Affected Versions
> 1.27.0 - v1.27.2
> v1.26.0 - v1.26.5
> v1.25.0 - v1.25.10
> <= v1.24.14
> 
> master branch(kubernetes v1.28.2) is not impacted
> mickledore branch(kubernetes v1.27.5) is not impacted
> 
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-2727
> https://nvd.nist.gov/vuln/detail/CVE-2023-2728
> 
> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> ---
>  .../CVE-2023-2727-CVE-2023-2728.patch         | 559 ++++++++++++++++++
>  .../kubernetes/kubernetes_git.bb              |   1 +
>  2 files changed, 560 insertions(+)
>  create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2023-2727-CVE-2023-2728.patch
> 
> diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2023-2727-CVE-2023-2728.patch b/recipes-containers/kubernetes/kubernetes/CVE-2023-2727-CVE-2023-2728.patch
> new file mode 100644
> index 00000000..2a9e8489
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/CVE-2023-2727-CVE-2023-2728.patch
> @@ -0,0 +1,559 @@
> +From f754a4dee31455a0d7fc0f51cb85348af9ea5e1f Mon Sep 17 00:00:00 2001
> +From: Rita Zhang <rita.z.zhang@gmail.com>
> +Date: Tue, 30 May 2023 20:35:33 +0000
> +Subject: [PATCH] Add ephemeralcontainer to imagepolicy securityaccount
> + admission plugin
> +
> +Signed-off-by: Rita Zhang <rita.z.zhang@gmail.com>
> +
> +CVE: CVE-2023-2727, CVE-2023-2728
> +
> +Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/commit/f754a4dee31455a0d7fc0f51cb85348af9ea5e1f]
> +
> +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> +---
> + plugin/pkg/admission/imagepolicy/admission.go |  28 ++--
> + .../admission/imagepolicy/admission_test.go   | 148 +++++++++++++++++-
> + .../pkg/admission/serviceaccount/admission.go |  57 ++++++-
> + .../serviceaccount/admission_test.go          |  88 +++++++++++
> + 4 files changed, 297 insertions(+), 24 deletions(-)
> +
> +diff --git a/plugin/pkg/admission/imagepolicy/admission.go b/plugin/pkg/admission/imagepolicy/admission.go
> +index aea4f713eb5..3dfcbf95eef 100644
> +--- a/plugin/pkg/admission/imagepolicy/admission.go
> ++++ b/plugin/pkg/admission/imagepolicy/admission.go
> +@@ -46,6 +46,7 @@ import (
> +
> + // PluginName indicates name of admission plugin.
> + const PluginName = "ImagePolicyWebhook"
> ++const ephemeralcontainers = "ephemeralcontainers"
> +
> + // AuditKeyPrefix is used as the prefix for all audit keys handled by this
> + // pluggin. Some well known suffixes are listed below.
> +@@ -132,8 +133,9 @@ func (a *Plugin) webhookError(pod *api.Pod, attributes admission.Attributes, err
> +
> + // Validate makes an admission decision based on the request attributes
> + func (a *Plugin) Validate(ctx context.Context, attributes admission.Attributes, o admission.ObjectInterfaces) (err error) {
> +-	// Ignore all calls to subresources or resources other than pods.
> +-	if attributes.GetSubresource() != "" || attributes.GetResource().GroupResource() != api.Resource("pods") {
> ++	// Ignore all calls to subresources other than ephemeralcontainers or calls to resources other than pods.
> ++	subresource := attributes.GetSubresource()
> ++	if (subresource != "" && subresource != ephemeralcontainers) || attributes.GetResource().GroupResource() != api.Resource("pods") {
> +		return nil
> +	}
> +
> +@@ -144,13 +146,21 @@ func (a *Plugin) Validate(ctx context.Context, attributes admission.Attributes,
> +
> +	// Build list of ImageReviewContainerSpec
> +	var imageReviewContainerSpecs []v1alpha1.ImageReviewContainerSpec
> +-	containers := make([]api.Container, 0, len(pod.Spec.Containers)+len(pod.Spec.InitContainers))
> +-	containers = append(containers, pod.Spec.Containers...)
> +-	containers = append(containers, pod.Spec.InitContainers...)
> +-	for _, c := range containers {
> +-		imageReviewContainerSpecs = append(imageReviewContainerSpecs, v1alpha1.ImageReviewContainerSpec{
> +-			Image: c.Image,
> +-		})
> ++	if subresource == "" {
> ++		containers := make([]api.Container, 0, len(pod.Spec.Containers)+len(pod.Spec.InitContainers))
> ++		containers = append(containers, pod.Spec.Containers...)
> ++		containers = append(containers, pod.Spec.InitContainers...)
> ++		for _, c := range containers {
> ++			imageReviewContainerSpecs = append(imageReviewContainerSpecs, v1alpha1.ImageReviewContainerSpec{
> ++				Image: c.Image,
> ++			})
> ++		}
> ++	} else if subresource == ephemeralcontainers {
> ++		for _, c := range pod.Spec.EphemeralContainers {
> ++			imageReviewContainerSpecs = append(imageReviewContainerSpecs, v1alpha1.ImageReviewContainerSpec{
> ++				Image: c.Image,
> ++			})
> ++		}
> +	}
> +	imageReview := v1alpha1.ImageReview{
> +		Spec: v1alpha1.ImageReviewSpec{
> +diff --git a/plugin/pkg/admission/imagepolicy/admission_test.go b/plugin/pkg/admission/imagepolicy/admission_test.go
> +index d1f81d51950..a9188462fb9 100644
> +--- a/plugin/pkg/admission/imagepolicy/admission_test.go
> ++++ b/plugin/pkg/admission/imagepolicy/admission_test.go
> +@@ -37,7 +37,6 @@ import (
> +	api "k8s.io/kubernetes/pkg/apis/core"
> +
> +	"fmt"
> +-	"io/ioutil"
> +	"os"
> +	"path/filepath"
> +	"text/template"
> +@@ -67,7 +66,7 @@ imagePolicy:
> + `
> +
> + func TestNewFromConfig(t *testing.T) {
> +-	dir, err := ioutil.TempDir("", "")
> ++	dir, err := os.MkdirTemp("", "")
> +	if err != nil {
> +		t.Fatal(err)
> +	}
> +@@ -92,7 +91,7 @@ func TestNewFromConfig(t *testing.T) {
> +		{data.Key, clientKey},
> +	}
> +	for _, file := range files {
> +-		if err := ioutil.WriteFile(file.name, file.data, 0400); err != nil {
> ++		if err := os.WriteFile(file.name, file.data, 0400); err != nil {
> +			t.Fatal(err)
> +		}
> +	}
> +@@ -196,7 +195,7 @@ current-context: default
> +		// Use a closure so defer statements trigger between loop iterations.
> +		t.Run(tt.msg, func(t *testing.T) {
> +			err := func() error {
> +-				tempfile, err := ioutil.TempFile("", "")
> ++				tempfile, err := os.CreateTemp("", "")
> +				if err != nil {
> +					return err
> +				}
> +@@ -211,7 +210,7 @@ current-context: default
> +					return fmt.Errorf("failed to execute test template: %v", err)
> +				}
> +
> +-				tempconfigfile, err := ioutil.TempFile("", "")
> ++				tempconfigfile, err := os.CreateTemp("", "")
> +				if err != nil {
> +					return err
> +				}
> +@@ -359,7 +358,7 @@ func (m *mockService) HTTPStatusCode() int { return m.statusCode }
> + // newImagePolicyWebhook creates a temporary kubeconfig file from the provided arguments and attempts to load
> + // a new newImagePolicyWebhook from it.
> + func newImagePolicyWebhook(callbackURL string, clientCert, clientKey, ca []byte, cacheTime time.Duration, defaultAllow bool) (*Plugin, error) {
> +-	tempfile, err := ioutil.TempFile("", "")
> ++	tempfile, err := os.CreateTemp("", "")
> +	if err != nil {
> +		return nil, err
> +	}
> +@@ -381,7 +380,7 @@ func newImagePolicyWebhook(callbackURL string, clientCert, clientKey, ca []byte,
> +		return nil, err
> +	}
> +
> +-	tempconfigfile, err := ioutil.TempFile("", "")
> ++	tempconfigfile, err := os.CreateTemp("", "")
> +	if err != nil {
> +		return nil, err
> +	}
> +@@ -595,17 +594,23 @@ func TestContainerCombinations(t *testing.T) {
> +		test                 string
> +		pod                  *api.Pod
> +		wantAllowed, wantErr bool
> ++		subresource          string
> ++		operation            admission.Operation
> +	}{
> +		{
> +			test:        "Single container allowed",
> +			pod:         goodPod("good"),
> +			wantAllowed: true,
> ++			subresource: "",
> ++			operation:   admission.Create,
> +		},
> +		{
> +			test:        "Single container denied",
> +			pod:         goodPod("bad"),
> +			wantAllowed: false,
> +			wantErr:     true,
> ++			subresource: "",
> ++			operation:   admission.Create,
> +		},
> +		{
> +			test: "One good container, one bad",
> +@@ -627,6 +632,8 @@ func TestContainerCombinations(t *testing.T) {
> +			},
> +			wantAllowed: false,
> +			wantErr:     true,
> ++			subresource: "",
> ++			operation:   admission.Create,
> +		},
> +		{
> +			test: "Multiple good containers",
> +@@ -648,6 +655,8 @@ func TestContainerCombinations(t *testing.T) {
> +			},
> +			wantAllowed: true,
> +			wantErr:     false,
> ++			subresource: "",
> ++			operation:   admission.Create,
> +		},
> +		{
> +			test: "Multiple bad containers",
> +@@ -669,6 +678,8 @@ func TestContainerCombinations(t *testing.T) {
> +			},
> +			wantAllowed: false,
> +			wantErr:     true,
> ++			subresource: "",
> ++			operation:   admission.Create,
> +		},
> +		{
> +			test: "Good container, bad init container",
> +@@ -692,6 +703,8 @@ func TestContainerCombinations(t *testing.T) {
> +			},
> +			wantAllowed: false,
> +			wantErr:     true,
> ++			subresource: "",
> ++			operation:   admission.Create,
> +		},
> +		{
> +			test: "Bad container, good init container",
> +@@ -715,6 +728,8 @@ func TestContainerCombinations(t *testing.T) {
> +			},
> +			wantAllowed: false,
> +			wantErr:     true,
> ++			subresource: "",
> ++			operation:   admission.Create,
> +		},
> +		{
> +			test: "Good container, good init container",
> +@@ -738,6 +753,123 @@ func TestContainerCombinations(t *testing.T) {
> +			},
> +			wantAllowed: true,
> +			wantErr:     false,
> ++			subresource: "",
> ++			operation:   admission.Create,
> ++		},
> ++		{
> ++			test: "Good container, good init container, bad ephemeral container when updating ephemeralcontainers subresource",
> ++			pod: &api.Pod{
> ++				Spec: api.PodSpec{
> ++					ServiceAccountName: "default",
> ++					SecurityContext:    &api.PodSecurityContext{},
> ++					Containers: []api.Container{
> ++						{
> ++							Image:           "good",
> ++							SecurityContext: &api.SecurityContext{},
> ++						},
> ++					},
> ++					InitContainers: []api.Container{
> ++						{
> ++							Image:           "good",
> ++							SecurityContext: &api.SecurityContext{},
> ++						},
> ++					},
> ++					EphemeralContainers: []api.EphemeralContainer{
> ++						{
> ++							EphemeralContainerCommon: api.EphemeralContainerCommon{
> ++								Image:           "bad",
> ++								SecurityContext: &api.SecurityContext{},
> ++							},
> ++						},
> ++					},
> ++				},
> ++			},
> ++			wantAllowed: false,
> ++			wantErr:     true,
> ++			subresource: "ephemeralcontainers",
> ++			operation:   admission.Update,
> ++		},
> ++		{
> ++			test: "Good container, good init container, bad ephemeral container when updating subresource=='' which sets initContainer and container only",
> ++			pod: &api.Pod{
> ++				Spec: api.PodSpec{
> ++					ServiceAccountName: "default",
> ++					SecurityContext:    &api.PodSecurityContext{},
> ++					Containers: []api.Container{
> ++						{
> ++							Image:           "good",
> ++							SecurityContext: &api.SecurityContext{},
> ++						},
> ++					},
> ++					InitContainers: []api.Container{
> ++						{
> ++							Image:           "good",
> ++							SecurityContext: &api.SecurityContext{},
> ++						},
> ++					},
> ++					EphemeralContainers: []api.EphemeralContainer{
> ++						{
> ++							EphemeralContainerCommon: api.EphemeralContainerCommon{
> ++								Image:           "bad",
> ++								SecurityContext: &api.SecurityContext{},
> ++							},
> ++						},
> ++					},
> ++				},
> ++			},
> ++			wantAllowed: true,
> ++			wantErr:     false,
> ++			subresource: "",
> ++			operation:   admission.Update,
> ++		},
> ++
> ++		{
> ++			test: "Bad container, good ephemeral container when updating subresource=='ephemeralcontainers' which sets ephemeralcontainers only",
> ++			pod: &api.Pod{
> ++				Spec: api.PodSpec{
> ++					ServiceAccountName: "default",
> ++					SecurityContext:    &api.PodSecurityContext{},
> ++					Containers: []api.Container{
> ++						{
> ++							Image:           "bad",
> ++							SecurityContext: &api.SecurityContext{},
> ++						},
> ++					},
> ++					EphemeralContainers: []api.EphemeralContainer{
> ++						{
> ++							EphemeralContainerCommon: api.EphemeralContainerCommon{
> ++								Image:           "good",
> ++								SecurityContext: &api.SecurityContext{},
> ++							},
> ++						},
> ++					},
> ++				},
> ++			},
> ++			wantAllowed: true,
> ++			wantErr:     false,
> ++			subresource: "ephemeralcontainers",
> ++			operation:   admission.Update,
> ++		},
> ++		{
> ++			test: "Good ephemeral container",
> ++			pod: &api.Pod{
> ++				Spec: api.PodSpec{
> ++					ServiceAccountName: "default",
> ++					SecurityContext:    &api.PodSecurityContext{},
> ++					EphemeralContainers: []api.EphemeralContainer{
> ++						{
> ++							EphemeralContainerCommon: api.EphemeralContainerCommon{
> ++								Image:           "good",
> ++								SecurityContext: &api.SecurityContext{},
> ++							},
> ++						},
> ++					},
> ++				},
> ++			},
> ++			wantAllowed: true,
> ++			wantErr:     false,
> ++			subresource: "ephemeralcontainers",
> ++			operation:   admission.Update,
> +		},
> +	}
> +	for _, tt := range tests {
> +@@ -759,7 +891,7 @@ func TestContainerCombinations(t *testing.T) {
> +				return
> +			}
> +
> +-			attr := admission.NewAttributesRecord(tt.pod, nil, api.Kind("Pod").WithVersion("version"), "namespace", "", api.Resource("pods").WithVersion("version"), "", admission.Create, &metav1.CreateOptions{}, false, &user.DefaultInfo{})
> ++			attr := admission.NewAttributesRecord(tt.pod, nil, api.Kind("Pod").WithVersion("version"), "namespace", "", api.Resource("pods").WithVersion("version"), tt.subresource, tt.operation, &metav1.CreateOptions{}, false, &user.DefaultInfo{})
> +
> +			err = wh.Validate(context.TODO(), attr, nil)
> +			if tt.wantAllowed {
> +diff --git a/plugin/pkg/admission/serviceaccount/admission.go b/plugin/pkg/admission/serviceaccount/admission.go
> +index 035d54ea8ea..f6e25f3c19d 100644
> +--- a/plugin/pkg/admission/serviceaccount/admission.go
> ++++ b/plugin/pkg/admission/serviceaccount/admission.go
> +@@ -100,7 +100,7 @@ var _ = genericadmissioninitializer.WantsExternalKubeInformerFactory(&Plugin{})
> + // 5. If MountServiceAccountToken is true, it adds a VolumeMount with the pod's ServiceAccount's api token secret to containers
> + func NewServiceAccount() *Plugin {
> +	return &Plugin{
> +-		Handler: admission.NewHandler(admission.Create),
> ++		Handler: admission.NewHandler(admission.Create, admission.Update),
> +		// TODO: enable this once we've swept secret usage to account for adding secret references to service accounts
> +		LimitSecretReferences: false,
> +		// Auto mount service account API token secrets
> +@@ -140,7 +140,10 @@ func (s *Plugin) Admit(ctx context.Context, a admission.Attributes, o admission.
> +	if shouldIgnore(a) {
> +		return nil
> +	}
> +-
> ++	if a.GetOperation() != admission.Create {
> ++		// we only mutate pods during create requests
> ++		return nil
> ++	}
> +	pod := a.GetObject().(*api.Pod)
> +
> +	// Don't modify the spec of mirror pods.
> +@@ -157,7 +160,7 @@ func (s *Plugin) Admit(ctx context.Context, a admission.Attributes, o admission.
> +
> +	serviceAccount, err := s.getServiceAccount(a.GetNamespace(), pod.Spec.ServiceAccountName)
> +	if err != nil {
> +-		return admission.NewForbidden(a, fmt.Errorf("error looking up service account %s/%s: %v", a.GetNamespace(), pod.Spec.ServiceAccountName, err))
> ++		return admission.NewForbidden(a, fmt.Errorf("error looking up service account %s/%s: %w", a.GetNamespace(), pod.Spec.ServiceAccountName, err))
> +	}
> +	if s.MountServiceAccountToken && shouldAutomount(serviceAccount, pod) {
> +		s.mountServiceAccountToken(serviceAccount, pod)
> +@@ -180,6 +183,15 @@ func (s *Plugin) Validate(ctx context.Context, a admission.Attributes, o admissi
> +
> +	pod := a.GetObject().(*api.Pod)
> +
> ++	if a.GetOperation() == admission.Update && a.GetSubresource() == "ephemeralcontainers" {
> ++		return s.limitEphemeralContainerSecretReferences(pod, a)
> ++	}
> ++
> ++	if a.GetOperation() != admission.Create {
> ++		// we only validate pod specs during create requests
> ++		return nil
> ++	}
> ++
> +	// Mirror pods have restrictions on what they can reference
> +	if _, isMirrorPod := pod.Annotations[api.MirrorPodAnnotationKey]; isMirrorPod {
> +		if len(pod.Spec.ServiceAccountName) != 0 {
> +@@ -205,6 +217,10 @@ func (s *Plugin) Validate(ctx context.Context, a admission.Attributes, o admissi
> +		return nil
> +	}
> +
> ++	// Require container pods to have service accounts
> ++	if len(pod.Spec.ServiceAccountName) == 0 {
> ++		return admission.NewForbidden(a, fmt.Errorf("no service account specified for pod %s/%s", a.GetNamespace(), pod.Name))
> ++	}
> +	// Ensure the referenced service account exists
> +	serviceAccount, err := s.getServiceAccount(a.GetNamespace(), pod.Spec.ServiceAccountName)
> +	if err != nil {
> +@@ -221,10 +237,7 @@ func (s *Plugin) Validate(ctx context.Context, a admission.Attributes, o admissi
> + }
> +
> + func shouldIgnore(a admission.Attributes) bool {
> +-	if a.GetResource().GroupResource() != api.Resource("pods") {
> +-		return true
> +-	}
> +-	if a.GetSubresource() != "" {
> ++	if a.GetResource().GroupResource() != api.Resource("pods") || (a.GetSubresource() != "" && a.GetSubresource() != "ephemeralcontainers") {
> +		return true
> +	}
> +	obj := a.GetObject()
> +@@ -350,6 +363,36 @@ func (s *Plugin) limitSecretReferences(serviceAccount *corev1.ServiceAccount, po
> +	return nil
> + }
> +
> ++func (s *Plugin) limitEphemeralContainerSecretReferences(pod *api.Pod, a admission.Attributes) error {
> ++	// Require ephemeral container pods to have service accounts
> ++	if len(pod.Spec.ServiceAccountName) == 0 {
> ++		return admission.NewForbidden(a, fmt.Errorf("no service account specified for pod %s/%s", a.GetNamespace(), pod.Name))
> ++	}
> ++	// Ensure the referenced service account exists
> ++	serviceAccount, err := s.getServiceAccount(a.GetNamespace(), pod.Spec.ServiceAccountName)
> ++	if err != nil {
> ++		return admission.NewForbidden(a, fmt.Errorf("error looking up service account %s/%s: %w", a.GetNamespace(), pod.Spec.ServiceAccountName, err))
> ++	}
> ++	if !s.enforceMountableSecrets(serviceAccount) {
> ++		return nil
> ++	}
> ++	// Ensure all secrets the ephemeral containers reference are allowed by the service account
> ++	mountableSecrets := sets.NewString()
> ++	for _, s := range serviceAccount.Secrets {
> ++		mountableSecrets.Insert(s.Name)
> ++	}
> ++	for _, container := range pod.Spec.EphemeralContainers {
> ++		for _, env := range container.Env {
> ++			if env.ValueFrom != nil && env.ValueFrom.SecretKeyRef != nil {
> ++				if !mountableSecrets.Has(env.ValueFrom.SecretKeyRef.Name) {
> ++					return fmt.Errorf("ephemeral container %s with envVar %s referencing secret.secretName=\"%s\" is not allowed because service account %s does not reference that secret", container.Name, env.Name, env.ValueFrom.SecretKeyRef.Name, serviceAccount.Name)
> ++				}
> ++			}
> ++		}
> ++	}
> ++	return nil
> ++}
> ++
> + func (s *Plugin) mountServiceAccountToken(serviceAccount *corev1.ServiceAccount, pod *api.Pod) {
> +	// Find the volume and volume name for the ServiceAccountTokenSecret if it already exists
> +	tokenVolumeName := ""
> +diff --git a/plugin/pkg/admission/serviceaccount/admission_test.go b/plugin/pkg/admission/serviceaccount/admission_test.go
> +index ca43abf9c3f..f5359253985 100644
> +--- a/plugin/pkg/admission/serviceaccount/admission_test.go
> ++++ b/plugin/pkg/admission/serviceaccount/admission_test.go
> +@@ -545,6 +545,34 @@ func TestAllowsReferencedSecret(t *testing.T) {
> +	if err := admissiontesting.WithReinvocationTesting(t, admit).Admit(context.TODO(), attrs, nil); err != nil {
> +		t.Errorf("Unexpected error: %v", err)
> +	}
> ++
> ++	pod2 = &api.Pod{
> ++		Spec: api.PodSpec{
> ++			ServiceAccountName: DefaultServiceAccountName,
> ++			EphemeralContainers: []api.EphemeralContainer{
> ++				{
> ++					EphemeralContainerCommon: api.EphemeralContainerCommon{
> ++						Name: "container-2",
> ++						Env: []api.EnvVar{
> ++							{
> ++								Name: "env-1",
> ++								ValueFrom: &api.EnvVarSource{
> ++									SecretKeyRef: &api.SecretKeySelector{
> ++										LocalObjectReference: api.LocalObjectReference{Name: "foo"},
> ++									},
> ++								},
> ++							},
> ++						},
> ++					},
> ++				},
> ++			},
> ++		},
> ++	}
> ++	// validate enforces restrictions on secret mounts when operation==create and subresource=='' or operation==update and subresource==ephemeralcontainers"
> ++	attrs = admission.NewAttributesRecord(pod2, nil, api.Kind("Pod").WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("version"), "ephemeralcontainers", admission.Update, &metav1.UpdateOptions{}, false, nil)
> ++	if err := admit.Validate(context.TODO(), attrs, nil); err != nil {
> ++		t.Errorf("Unexpected error: %v", err)
> ++	}
> + }
> +
> + func TestRejectsUnreferencedSecretVolumes(t *testing.T) {
> +@@ -622,6 +650,66 @@ func TestRejectsUnreferencedSecretVolumes(t *testing.T) {
> +	if err := admissiontesting.WithReinvocationTesting(t, admit).Admit(context.TODO(), attrs, nil); err == nil || !strings.Contains(err.Error(), "with envVar") {
> +		t.Errorf("Unexpected error: %v", err)
> +	}
> ++
> ++	pod2 = &api.Pod{
> ++		Spec: api.PodSpec{
> ++			ServiceAccountName: DefaultServiceAccountName,
> ++			InitContainers: []api.Container{
> ++				{
> ++					Name: "container-1",
> ++					Env: []api.EnvVar{
> ++						{
> ++							Name: "env-1",
> ++							ValueFrom: &api.EnvVarSource{
> ++								SecretKeyRef: &api.SecretKeySelector{
> ++									LocalObjectReference: api.LocalObjectReference{Name: "foo"},
> ++								},
> ++							},
> ++						},
> ++					},
> ++				},
> ++			},
> ++		},
> ++	}
> ++	attrs = admission.NewAttributesRecord(pod2, nil, api.Kind("Pod").WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("version"), "", admission.Update, &metav1.UpdateOptions{}, false, nil)
> ++	if err := admissiontesting.WithReinvocationTesting(t, admit).Admit(context.TODO(), attrs, nil); err != nil {
> ++		t.Errorf("admit only enforces restrictions on secret mounts when operation==create. Unexpected error: %v", err)
> ++	}
> ++	attrs = admission.NewAttributesRecord(pod2, nil, api.Kind("Pod").WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("version"), "", admission.Create, &metav1.CreateOptions{}, false, nil)
> ++	if err := admit.Validate(context.TODO(), attrs, nil); err == nil || !strings.Contains(err.Error(), "with envVar") {
> ++		t.Errorf("validate only enforces restrictions on secret mounts when operation==create and subresource==''. Unexpected error: %v", err)
> ++	}
> ++
> ++	pod2 = &api.Pod{
> ++		Spec: api.PodSpec{
> ++			ServiceAccountName: DefaultServiceAccountName,
> ++			EphemeralContainers: []api.EphemeralContainer{
> ++				{
> ++					EphemeralContainerCommon: api.EphemeralContainerCommon{
> ++						Name: "container-2",
> ++						Env: []api.EnvVar{
> ++							{
> ++								Name: "env-1",
> ++								ValueFrom: &api.EnvVarSource{
> ++									SecretKeyRef: &api.SecretKeySelector{
> ++										LocalObjectReference: api.LocalObjectReference{Name: "foo"},
> ++									},
> ++								},
> ++							},
> ++						},
> ++					},
> ++				},
> ++			},
> ++		},
> ++	}
> ++	attrs = admission.NewAttributesRecord(pod2, nil, api.Kind("Pod").WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("version"), "", admission.Update, &metav1.UpdateOptions{}, false, nil)
> ++	if err := admissiontesting.WithReinvocationTesting(t, admit).Admit(context.TODO(), attrs, nil); err != nil {
> ++		t.Errorf("admit only enforces restrictions on secret mounts when operation==create and subresource==''. Unexpected error: %v", err)
> ++	}
> ++	attrs = admission.NewAttributesRecord(pod2, nil, api.Kind("Pod").WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("version"), "ephemeralcontainers", admission.Update, &metav1.UpdateOptions{}, false, nil)
> ++	if err := admit.Validate(context.TODO(), attrs, nil); err == nil || !strings.Contains(err.Error(), "with envVar") {
> ++		t.Errorf("validate enforces restrictions on secret mounts when operation==update and subresource==ephemeralcontainers. Unexpected error: %v", err)
> ++	}
> + }
> +
> + func TestAllowUnreferencedSecretVolumesForPermissiveSAs(t *testing.T) {
> +--
> +2.40.0
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index dc741bbf..b0c87c47 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -31,6 +31,7 @@ SRC_URI:append = " \
>             file://0001-build-golang.sh-convert-remaining-go-calls-to-use.patch;patchdir=src/import \
>             file://0001-Makefile.generated_files-Fix-race-issue-for-installi.patch;patchdir=src/import \
>             file://CVE-2023-2431.patch;patchdir=src/import \
> +           file://CVE-2023-2727-CVE-2023-2728.patch;patchdir=src/import \
>             file://cni-containerd-net.conflist \
>             file://k8s-init \
>             file://99-kubernetes.conf \
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8458): https://lists.yoctoproject.org/g/meta-virtualization/message/8458
> Mute This Topic: https://lists.yoctoproject.org/mt/102555691/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


In message: [meta-virtualization][kirkstone][PATCH v2 1/2] kubernetes: Fix CVE-2023-2431
on 13/11/2023 Soumya via lists.yoctoproject.org wrote:

> From: Soumya Sambu <soumya.sambu@windriver.com>
> 
> A security issue was discovered in Kubelet that allows pods to bypass the
> seccomp profile enforcement. Pods that use localhost type for seccomp profile
> but specify an empty profile field, are affected by this issue. In this
> scenario, this vulnerability allows the pod to run in unconfined (seccomp
> disabled) mode. This bug affects Kubelet.
> 
> CVE: CVE-2023-2431
> Affected Versions
> v1.27.0 - v1.27.1
> v1.26.0 - v1.26.4
> v1.25.0 - v1.25.9
> <= v1.24.13
> 
> master branch(kubernetes v1.28.2) is not impacted
> mickledore branch(kubernetes v1.27.5) is not impacted
> 
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-2431
> 
> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> ---
>  .../kubernetes/kubernetes/CVE-2023-2431.patch | 863 ++++++++++++++++++
>  .../kubernetes/kubernetes_git.bb              |   1 +
>  2 files changed, 864 insertions(+)
>  create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2023-2431.patch
> 
> diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2023-2431.patch b/recipes-containers/kubernetes/kubernetes/CVE-2023-2431.patch
> new file mode 100644
> index 00000000..56c3a6e1
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/CVE-2023-2431.patch
> @@ -0,0 +1,863 @@
> +From 73174f870735251e7d4240cdc36983d1bef7db5f Mon Sep 17 00:00:00 2001
> +From: Craig Ingram <cjingram@google.com>
> +Date: Fri, 24 Feb 2023 15:24:49 -0500
> +Subject: [PATCH] Return error for localhost seccomp type with no localhost
> + profile defined
> +
> +CVE: CVE-2023-2431
> +
> +Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/commit/73174f870735251e7d4240cdc36983d1bef7db5f]
> +
> +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> +---
> + pkg/kubelet/kuberuntime/helpers.go            |  66 ++--
> + pkg/kubelet/kuberuntime/helpers_test.go       | 350 ++++--------------
> + .../kuberuntime_container_linux.go            |  16 +-
> + .../kuberuntime_container_linux_test.go       |  22 +-
> + pkg/kubelet/kuberuntime/security_context.go   |  15 +-
> + 5 files changed, 153 insertions(+), 316 deletions(-)
> +
> +diff --git a/pkg/kubelet/kuberuntime/helpers.go b/pkg/kubelet/kuberuntime/helpers.go
> +index fa580335cf8..b36e01166f8 100644
> +--- a/pkg/kubelet/kuberuntime/helpers.go
> ++++ b/pkg/kubelet/kuberuntime/helpers.go
> +@@ -209,28 +209,32 @@ func toKubeRuntimeStatus(status *runtimeapi.RuntimeStatus) *kubecontainer.Runtim
> +	return &kubecontainer.RuntimeStatus{Conditions: conditions}
> + }
> +
> +-func fieldProfile(scmp *v1.SeccompProfile, profileRootPath string, fallbackToRuntimeDefault bool) string {
> ++func fieldProfile(scmp *v1.SeccompProfile, profileRootPath string, fallbackToRuntimeDefault bool) (string, error) {
> +	if scmp == nil {
> +		if fallbackToRuntimeDefault {
> +-			return v1.SeccompProfileRuntimeDefault
> ++			return v1.SeccompProfileRuntimeDefault, nil
> +		}
> +-		return ""
> ++		return "", nil
> +	}
> +	if scmp.Type == v1.SeccompProfileTypeRuntimeDefault {
> +-		return v1.SeccompProfileRuntimeDefault
> +-	}
> +-	if scmp.Type == v1.SeccompProfileTypeLocalhost && scmp.LocalhostProfile != nil && len(*scmp.LocalhostProfile) > 0 {
> +-		fname := filepath.Join(profileRootPath, *scmp.LocalhostProfile)
> +-		return v1.SeccompLocalhostProfileNamePrefix + fname
> ++		return v1.SeccompProfileRuntimeDefault, nil
> ++	}
> ++	if scmp.Type == v1.SeccompProfileTypeLocalhost {
> ++		if scmp.LocalhostProfile != nil && len(*scmp.LocalhostProfile) > 0 {
> ++			fname := filepath.Join(profileRootPath, *scmp.LocalhostProfile)
> ++			return v1.SeccompLocalhostProfileNamePrefix + fname, nil
> ++		} else {
> ++			return "", fmt.Errorf("localhostProfile must be set if seccompProfile type is Localhost.")
> ++		}
> +	}
> +	if scmp.Type == v1.SeccompProfileTypeUnconfined {
> +-		return v1.SeccompProfileNameUnconfined
> ++		return v1.SeccompProfileNameUnconfined, nil
> +	}
> +
> +	if fallbackToRuntimeDefault {
> +-		return v1.SeccompProfileRuntimeDefault
> ++		return v1.SeccompProfileRuntimeDefault, nil
> +	}
> +-	return ""
> ++	return "", nil
> + }
> +
> + func annotationProfile(profile, profileRootPath string) string {
> +@@ -243,7 +247,7 @@ func annotationProfile(profile, profileRootPath string) string {
> + }
> +
> + func (m *kubeGenericRuntimeManager) getSeccompProfilePath(annotations map[string]string, containerName string,
> +-	podSecContext *v1.PodSecurityContext, containerSecContext *v1.SecurityContext, fallbackToRuntimeDefault bool) string {
> ++	podSecContext *v1.PodSecurityContext, containerSecContext *v1.SecurityContext, fallbackToRuntimeDefault bool) (string, error) {
> +	// container fields are applied first
> +	if containerSecContext != nil && containerSecContext.SeccompProfile != nil {
> +		return fieldProfile(containerSecContext.SeccompProfile, m.seccompProfileRoot, fallbackToRuntimeDefault)
> +@@ -252,7 +256,7 @@ func (m *kubeGenericRuntimeManager) getSeccompProfilePath(annotations map[string
> +	// if container field does not exist, try container annotation (deprecated)
> +	if containerName != "" {
> +		if profile, ok := annotations[v1.SeccompContainerAnnotationKeyPrefix+containerName]; ok {
> +-			return annotationProfile(profile, m.seccompProfileRoot)
> ++			return annotationProfile(profile, m.seccompProfileRoot), nil
> +		}
> +	}
> +
> +@@ -263,46 +267,50 @@ func (m *kubeGenericRuntimeManager) getSeccompProfilePath(annotations map[string
> +
> +	// as last resort, try to apply pod annotation (deprecated)
> +	if profile, ok := annotations[v1.SeccompPodAnnotationKey]; ok {
> +-		return annotationProfile(profile, m.seccompProfileRoot)
> ++		return annotationProfile(profile, m.seccompProfileRoot), nil
> +	}
> +
> +	if fallbackToRuntimeDefault {
> +-		return v1.SeccompProfileRuntimeDefault
> ++		return v1.SeccompProfileRuntimeDefault, nil
> +	}
> +
> +-	return ""
> ++	return "", nil
> + }
> +
> +-func fieldSeccompProfile(scmp *v1.SeccompProfile, profileRootPath string, fallbackToRuntimeDefault bool) *runtimeapi.SecurityProfile {
> ++func fieldSeccompProfile(scmp *v1.SeccompProfile, profileRootPath string, fallbackToRuntimeDefault bool) (*runtimeapi.SecurityProfile, error) {
> +	if scmp == nil {
> +		if fallbackToRuntimeDefault {
> +			return &runtimeapi.SecurityProfile{
> +				ProfileType: runtimeapi.SecurityProfile_RuntimeDefault,
> +-			}
> ++			}, nil
> +		}
> +		return &runtimeapi.SecurityProfile{
> +			ProfileType: runtimeapi.SecurityProfile_Unconfined,
> +-		}
> ++		}, nil
> +	}
> +	if scmp.Type == v1.SeccompProfileTypeRuntimeDefault {
> +		return &runtimeapi.SecurityProfile{
> +			ProfileType: runtimeapi.SecurityProfile_RuntimeDefault,
> +-		}
> ++		}, nil
> +	}
> +-	if scmp.Type == v1.SeccompProfileTypeLocalhost && scmp.LocalhostProfile != nil && len(*scmp.LocalhostProfile) > 0 {
> +-		fname := filepath.Join(profileRootPath, *scmp.LocalhostProfile)
> +-		return &runtimeapi.SecurityProfile{
> +-			ProfileType:  runtimeapi.SecurityProfile_Localhost,
> +-			LocalhostRef: fname,
> ++	if scmp.Type == v1.SeccompProfileTypeLocalhost {
> ++		if scmp.LocalhostProfile != nil && len(*scmp.LocalhostProfile) > 0 {
> ++			fname := filepath.Join(profileRootPath, *scmp.LocalhostProfile)
> ++			return &runtimeapi.SecurityProfile{
> ++				ProfileType:  runtimeapi.SecurityProfile_Localhost,
> ++				LocalhostRef: fname,
> ++			}, nil
> ++		} else {
> ++			return nil, fmt.Errorf("localhostProfile must be set if seccompProfile type is Localhost.")
> +		}
> +	}
> +	return &runtimeapi.SecurityProfile{
> +		ProfileType: runtimeapi.SecurityProfile_Unconfined,
> +-	}
> ++	}, nil
> + }
> +
> + func (m *kubeGenericRuntimeManager) getSeccompProfile(annotations map[string]string, containerName string,
> +-	podSecContext *v1.PodSecurityContext, containerSecContext *v1.SecurityContext, fallbackToRuntimeDefault bool) *runtimeapi.SecurityProfile {
> ++	podSecContext *v1.PodSecurityContext, containerSecContext *v1.SecurityContext, fallbackToRuntimeDefault bool) (*runtimeapi.SecurityProfile, error) {
> +	// container fields are applied first
> +	if containerSecContext != nil && containerSecContext.SeccompProfile != nil {
> +		return fieldSeccompProfile(containerSecContext.SeccompProfile, m.seccompProfileRoot, fallbackToRuntimeDefault)
> +@@ -316,12 +324,12 @@ func (m *kubeGenericRuntimeManager) getSeccompProfile(annotations map[string]str
> +	if fallbackToRuntimeDefault {
> +		return &runtimeapi.SecurityProfile{
> +			ProfileType: runtimeapi.SecurityProfile_RuntimeDefault,
> +-		}
> ++		}, nil
> +	}
> +
> +	return &runtimeapi.SecurityProfile{
> +		ProfileType: runtimeapi.SecurityProfile_Unconfined,
> +-	}
> ++	}, nil
> + }
> +
> + func ipcNamespaceForPod(pod *v1.Pod) runtimeapi.NamespaceMode {
> +diff --git a/pkg/kubelet/kuberuntime/helpers_test.go b/pkg/kubelet/kuberuntime/helpers_test.go
> +index 25065f30411..70ad7250ce2 100644
> +--- a/pkg/kubelet/kuberuntime/helpers_test.go
> ++++ b/pkg/kubelet/kuberuntime/helpers_test.go
> +@@ -242,17 +242,18 @@ func TestFieldProfile(t *testing.T) {
> +		scmpProfile     *v1.SeccompProfile
> +		rootPath        string
> +		expectedProfile string
> ++		expectedError   string
> +	}{
> +		{
> +			description:     "no seccompProfile should return empty",
> +			expectedProfile: "",
> +		},
> +		{
> +-			description: "type localhost without profile should return empty",
> ++			description: "type localhost without profile should return error",
> +			scmpProfile: &v1.SeccompProfile{
> +				Type: v1.SeccompProfileTypeLocalhost,
> +			},
> +-			expectedProfile: "",
> ++			expectedError: "localhostProfile must be set if seccompProfile type is Localhost.",
> +		},
> +		{
> +			description: "unknown type should return empty",
> +@@ -279,7 +280,7 @@ func TestFieldProfile(t *testing.T) {
> +			description: "SeccompProfileTypeLocalhost should return localhost",
> +			scmpProfile: &v1.SeccompProfile{
> +				Type:             v1.SeccompProfileTypeLocalhost,
> +-				LocalhostProfile: utilpointer.StringPtr("profile.json"),
> ++				LocalhostProfile: utilpointer.String("profile.json"),
> +			},
> +			rootPath:        "/test/",
> +			expectedProfile: "localhost//test/profile.json",
> +@@ -287,8 +288,13 @@ func TestFieldProfile(t *testing.T) {
> +	}
> +
> +	for i, test := range tests {
> +-		seccompProfile := fieldProfile(test.scmpProfile, test.rootPath, false)
> +-		assert.Equal(t, test.expectedProfile, seccompProfile, "TestCase[%d]: %s", i, test.description)
> ++		seccompProfile, err := fieldProfile(test.scmpProfile, test.rootPath, false)
> ++		if test.expectedError != "" {
> ++			assert.EqualError(t, err, test.expectedError, "TestCase[%d]: %s", i, test.description)
> ++		} else {
> ++			assert.NoError(t, err, "TestCase[%d]: %s", i, test.description)
> ++			assert.Equal(t, test.expectedProfile, seccompProfile, "TestCase[%d]: %s", i, test.description)
> ++		}
> +	}
> + }
> +
> +@@ -298,17 +304,18 @@ func TestFieldProfileDefaultSeccomp(t *testing.T) {
> +		scmpProfile     *v1.SeccompProfile
> +		rootPath        string
> +		expectedProfile string
> ++		expectedError   string
> +	}{
> +		{
> +			description:     "no seccompProfile should return runtime/default",
> +			expectedProfile: v1.SeccompProfileRuntimeDefault,
> +		},
> +		{
> +-			description: "type localhost without profile should return runtime/default",
> ++			description: "type localhost without profile should return error",
> +			scmpProfile: &v1.SeccompProfile{
> +				Type: v1.SeccompProfileTypeLocalhost,
> +			},
> +-			expectedProfile: v1.SeccompProfileRuntimeDefault,
> ++			expectedError: "localhostProfile must be set if seccompProfile type is Localhost.",
> +		},
> +		{
> +			description: "unknown type should return runtime/default",
> +@@ -335,7 +342,7 @@ func TestFieldProfileDefaultSeccomp(t *testing.T) {
> +			description: "SeccompProfileTypeLocalhost should return localhost",
> +			scmpProfile: &v1.SeccompProfile{
> +				Type:             v1.SeccompProfileTypeLocalhost,
> +-				LocalhostProfile: utilpointer.StringPtr("profile.json"),
> ++				LocalhostProfile: utilpointer.String("profile.json"),
> +			},
> +			rootPath:        "/test/",
> +			expectedProfile: "localhost//test/profile.json",
> +@@ -343,8 +350,13 @@ func TestFieldProfileDefaultSeccomp(t *testing.T) {
> +	}
> +
> +	for i, test := range tests {
> +-		seccompProfile := fieldProfile(test.scmpProfile, test.rootPath, true)
> +-		assert.Equal(t, test.expectedProfile, seccompProfile, "TestCase[%d]: %s", i, test.description)
> ++		seccompProfile, err := fieldProfile(test.scmpProfile, test.rootPath, true)
> ++		if test.expectedError != "" {
> ++			assert.EqualError(t, err, test.expectedError, "TestCase[%d]: %s", i, test.description)
> ++		} else {
> ++			assert.NoError(t, err, "TestCase[%d]: %s", i, test.description)
> ++			assert.Equal(t, test.expectedProfile, seccompProfile, "TestCase[%d]: %s", i, test.description)
> ++		}
> +	}
> + }
> +
> +@@ -359,6 +371,7 @@ func TestGetSeccompProfilePath(t *testing.T) {
> +		containerSc     *v1.SecurityContext
> +		containerName   string
> +		expectedProfile string
> ++		expectedError   string
> +	}{
> +		{
> +			description:     "no seccomp should return empty",
> +@@ -369,91 +382,6 @@ func TestGetSeccompProfilePath(t *testing.T) {
> +			containerName:   "container1",
> +			expectedProfile: "",
> +		},
> +-		{
> +-			description: "annotations: pod runtime/default seccomp profile should return runtime/default",
> +-			annotation: map[string]string{
> +-				v1.SeccompPodAnnotationKey: v1.SeccompProfileRuntimeDefault,
> +-			},
> +-			expectedProfile: "runtime/default",
> +-		},
> +-		{
> +-			description: "annotations: pod docker/default seccomp profile should return docker/default",
> +-			annotation: map[string]string{
> +-				v1.SeccompPodAnnotationKey: v1.DeprecatedSeccompProfileDockerDefault,
> +-			},
> +-			expectedProfile: "docker/default",
> +-		},
> +-		{
> +-			description: "annotations: pod runtime/default seccomp profile with containerName should return runtime/default",
> +-			annotation: map[string]string{
> +-				v1.SeccompPodAnnotationKey: v1.SeccompProfileRuntimeDefault,
> +-			},
> +-			containerName:   "container1",
> +-			expectedProfile: "runtime/default",
> +-		},
> +-		{
> +-			description: "annotations: pod docker/default seccomp profile with containerName should return docker/default",
> +-			annotation: map[string]string{
> +-				v1.SeccompPodAnnotationKey: v1.DeprecatedSeccompProfileDockerDefault,
> +-			},
> +-			containerName:   "container1",
> +-			expectedProfile: "docker/default",
> +-		},
> +-		{
> +-			description: "annotations: pod unconfined seccomp profile should return unconfined",
> +-			annotation: map[string]string{
> +-				v1.SeccompPodAnnotationKey: v1.SeccompProfileNameUnconfined,
> +-			},
> +-			expectedProfile: "unconfined",
> +-		},
> +-		{
> +-			description: "annotations: pod unconfined seccomp profile with containerName should return unconfined",
> +-			annotation: map[string]string{
> +-				v1.SeccompPodAnnotationKey: v1.SeccompProfileNameUnconfined,
> +-			},
> +-			containerName:   "container1",
> +-			expectedProfile: "unconfined",
> +-		},
> +-		{
> +-			description: "annotations: pod localhost seccomp profile should return local profile path",
> +-			annotation: map[string]string{
> +-				v1.SeccompPodAnnotationKey: "localhost/chmod.json",
> +-			},
> +-			expectedProfile: seccompLocalhostPath("chmod.json"),
> +-		},
> +-		{
> +-			description: "annotations: pod localhost seccomp profile with containerName should return local profile path",
> +-			annotation: map[string]string{
> +-				v1.SeccompPodAnnotationKey: "localhost/chmod.json",
> +-			},
> +-			containerName:   "container1",
> +-			expectedProfile: seccompLocalhostPath("chmod.json"),
> +-		},
> +-		{
> +-			description: "annotations: container localhost seccomp profile with containerName should return local profile path",
> +-			annotation: map[string]string{
> +-				v1.SeccompContainerAnnotationKeyPrefix + "container1": "localhost/chmod.json",
> +-			},
> +-			containerName:   "container1",
> +-			expectedProfile: seccompLocalhostPath("chmod.json"),
> +-		},
> +-		{
> +-			description: "annotations: container localhost seccomp profile should override pod profile",
> +-			annotation: map[string]string{
> +-				v1.SeccompPodAnnotationKey:                            v1.SeccompProfileNameUnconfined,
> +-				v1.SeccompContainerAnnotationKeyPrefix + "container1": "localhost/chmod.json",
> +-			},
> +-			containerName:   "container1",
> +-			expectedProfile: seccompLocalhostPath("chmod.json"),
> +-		},
> +-		{
> +-			description: "annotations: container localhost seccomp profile with unmatched containerName should return empty",
> +-			annotation: map[string]string{
> +-				v1.SeccompContainerAnnotationKeyPrefix + "container1": "localhost/chmod.json",
> +-			},
> +-			containerName:   "container2",
> +-			expectedProfile: "",
> +-		},
> +		{
> +			description:     "pod seccomp profile set to unconfined returns unconfined",
> +			podSc:           &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeUnconfined}},
> +@@ -480,14 +408,14 @@ func TestGetSeccompProfilePath(t *testing.T) {
> +			expectedProfile: seccompLocalhostPath("filename"),
> +		},
> +		{
> +-			description:     "pod seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns empty",
> +-			podSc:           &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
> +-			expectedProfile: "",
> ++			description:   "pod seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns error",
> ++			podSc:         &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
> ++			expectedError: "localhostProfile must be set if seccompProfile type is Localhost.",
> +		},
> +		{
> +-			description:     "container seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns empty",
> +-			containerSc:     &v1.SecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
> +-			expectedProfile: "",
> ++			description:   "container seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns error",
> ++			containerSc:   &v1.SecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
> ++			expectedError: "localhostProfile must be set if seccompProfile type is Localhost.",
> +		},
> +		{
> +			description:     "container seccomp profile set to SeccompProfileTypeLocalhost returns 'localhost/' + LocalhostProfile",
> +@@ -500,41 +428,16 @@ func TestGetSeccompProfilePath(t *testing.T) {
> +			containerSc:     &v1.SecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeRuntimeDefault}},
> +			expectedProfile: "runtime/default",
> +		},
> +-		{
> +-			description: "prioritise container field over container annotation, pod field and pod annotation",
> +-			podSc:       &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost, LocalhostProfile: getLocal("field-pod-profile.json")}},
> +-			containerSc: &v1.SecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost, LocalhostProfile: getLocal("field-cont-profile.json")}},
> +-			annotation: map[string]string{
> +-				v1.SeccompPodAnnotationKey:                            "localhost/annota-pod-profile.json",
> +-				v1.SeccompContainerAnnotationKeyPrefix + "container1": "localhost/annota-cont-profile.json",
> +-			},
> +-			containerName:   "container1",
> +-			expectedProfile: seccompLocalhostPath("field-cont-profile.json"),
> +-		},
> +-		{
> +-			description: "prioritise container annotation over pod field",
> +-			podSc:       &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost, LocalhostProfile: getLocal("field-pod-profile.json")}},
> +-			annotation: map[string]string{
> +-				v1.SeccompPodAnnotationKey:                            "localhost/annota-pod-profile.json",
> +-				v1.SeccompContainerAnnotationKeyPrefix + "container1": "localhost/annota-cont-profile.json",
> +-			},
> +-			containerName:   "container1",
> +-			expectedProfile: seccompLocalhostPath("annota-cont-profile.json"),
> +-		},
> +-		{
> +-			description: "prioritise pod field over pod annotation",
> +-			podSc:       &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost, LocalhostProfile: getLocal("field-pod-profile.json")}},
> +-			annotation: map[string]string{
> +-				v1.SeccompPodAnnotationKey: "localhost/annota-pod-profile.json",
> +-			},
> +-			containerName:   "container1",
> +-			expectedProfile: seccompLocalhostPath("field-pod-profile.json"),
> +-		},
> +	}
> +
> +	for i, test := range tests {
> +-		seccompProfile := m.getSeccompProfilePath(test.annotation, test.containerName, test.podSc, test.containerSc, false)
> +-		assert.Equal(t, test.expectedProfile, seccompProfile, "TestCase[%d]: %s", i, test.description)
> ++		seccompProfile, err := m.getSeccompProfilePath(test.annotation, test.containerName, test.podSc, test.containerSc, false)
> ++		if test.expectedError != "" {
> ++			assert.EqualError(t, err, test.expectedError, "TestCase[%d]: %s", i, test.description)
> ++		} else {
> ++			assert.NoError(t, err, "TestCase[%d]: %s", i, test.description)
> ++			assert.Equal(t, test.expectedProfile, seccompProfile, "TestCase[%d]: %s", i, test.description)
> ++		}
> +	}
> + }
> +
> +@@ -549,6 +452,7 @@ func TestGetSeccompProfilePathDefaultSeccomp(t *testing.T) {
> +		containerSc     *v1.SecurityContext
> +		containerName   string
> +		expectedProfile string
> ++		expectedError   string
> +	}{
> +		{
> +			description:     "no seccomp should return runtime/default",
> +@@ -559,91 +463,6 @@ func TestGetSeccompProfilePathDefaultSeccomp(t *testing.T) {
> +			containerName:   "container1",
> +			expectedProfile: v1.SeccompProfileRuntimeDefault,
> +		},
> +-		{
> +-			description: "annotations: pod runtime/default seccomp profile should return runtime/default",
> +-			annotation: map[string]string{
> +-				v1.SeccompPodAnnotationKey: v1.SeccompProfileRuntimeDefault,
> +-			},
> +-			expectedProfile: v1.SeccompProfileRuntimeDefault,
> +-		},
> +-		{
> +-			description: "annotations: pod docker/default seccomp profile should return docker/default",
> +-			annotation: map[string]string{
> +-				v1.SeccompPodAnnotationKey: v1.DeprecatedSeccompProfileDockerDefault,
> +-			},
> +-			expectedProfile: "docker/default",
> +-		},
> +-		{
> +-			description: "annotations: pod runtime/default seccomp profile with containerName should return runtime/default",
> +-			annotation: map[string]string{
> +-				v1.SeccompPodAnnotationKey: v1.SeccompProfileRuntimeDefault,
> +-			},
> +-			containerName:   "container1",
> +-			expectedProfile: v1.SeccompProfileRuntimeDefault,
> +-		},
> +-		{
> +-			description: "annotations: pod docker/default seccomp profile with containerName should return docker/default",
> +-			annotation: map[string]string{
> +-				v1.SeccompPodAnnotationKey: v1.DeprecatedSeccompProfileDockerDefault,
> +-			},
> +-			containerName:   "container1",
> +-			expectedProfile: "docker/default",
> +-		},
> +-		{
> +-			description: "annotations: pod unconfined seccomp profile should return unconfined",
> +-			annotation: map[string]string{
> +-				v1.SeccompPodAnnotationKey: v1.SeccompProfileNameUnconfined,
> +-			},
> +-			expectedProfile: "unconfined",
> +-		},
> +-		{
> +-			description: "annotations: pod unconfined seccomp profile with containerName should return unconfined",
> +-			annotation: map[string]string{
> +-				v1.SeccompPodAnnotationKey: v1.SeccompProfileNameUnconfined,
> +-			},
> +-			containerName:   "container1",
> +-			expectedProfile: "unconfined",
> +-		},
> +-		{
> +-			description: "annotations: pod localhost seccomp profile should return local profile path",
> +-			annotation: map[string]string{
> +-				v1.SeccompPodAnnotationKey: "localhost/chmod.json",
> +-			},
> +-			expectedProfile: seccompLocalhostPath("chmod.json"),
> +-		},
> +-		{
> +-			description: "annotations: pod localhost seccomp profile with containerName should return local profile path",
> +-			annotation: map[string]string{
> +-				v1.SeccompPodAnnotationKey: "localhost/chmod.json",
> +-			},
> +-			containerName:   "container1",
> +-			expectedProfile: seccompLocalhostPath("chmod.json"),
> +-		},
> +-		{
> +-			description: "annotations: container localhost seccomp profile with containerName should return local profile path",
> +-			annotation: map[string]string{
> +-				v1.SeccompContainerAnnotationKeyPrefix + "container1": "localhost/chmod.json",
> +-			},
> +-			containerName:   "container1",
> +-			expectedProfile: seccompLocalhostPath("chmod.json"),
> +-		},
> +-		{
> +-			description: "annotations: container localhost seccomp profile should override pod profile",
> +-			annotation: map[string]string{
> +-				v1.SeccompPodAnnotationKey:                            v1.SeccompProfileNameUnconfined,
> +-				v1.SeccompContainerAnnotationKeyPrefix + "container1": "localhost/chmod.json",
> +-			},
> +-			containerName:   "container1",
> +-			expectedProfile: seccompLocalhostPath("chmod.json"),
> +-		},
> +-		{
> +-			description: "annotations: container localhost seccomp profile with unmatched containerName should return runtime/default",
> +-			annotation: map[string]string{
> +-				v1.SeccompContainerAnnotationKeyPrefix + "container1": "localhost/chmod.json",
> +-			},
> +-			containerName:   "container2",
> +-			expectedProfile: v1.SeccompProfileRuntimeDefault,
> +-		},
> +		{
> +			description:     "pod seccomp profile set to unconfined returns unconfined",
> +			podSc:           &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeUnconfined}},
> +@@ -670,14 +489,14 @@ func TestGetSeccompProfilePathDefaultSeccomp(t *testing.T) {
> +			expectedProfile: seccompLocalhostPath("filename"),
> +		},
> +		{
> +-			description:     "pod seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns runtime/default",
> +-			podSc:           &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
> +-			expectedProfile: v1.SeccompProfileRuntimeDefault,
> ++			description:   "pod seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns error",
> ++			podSc:         &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
> ++			expectedError: "localhostProfile must be set if seccompProfile type is Localhost.",
> +		},
> +		{
> +-			description:     "container seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns runtime/default",
> +-			containerSc:     &v1.SecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
> +-			expectedProfile: v1.SeccompProfileRuntimeDefault,
> ++			description:   "container seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns error",
> ++			containerSc:   &v1.SecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
> ++			expectedError: "localhostProfile must be set if seccompProfile type is Localhost.",
> +		},
> +		{
> +			description:     "container seccomp profile set to SeccompProfileTypeLocalhost returns 'localhost/' + LocalhostProfile",
> +@@ -690,41 +509,16 @@ func TestGetSeccompProfilePathDefaultSeccomp(t *testing.T) {
> +			containerSc:     &v1.SecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeRuntimeDefault}},
> +			expectedProfile: "runtime/default",
> +		},
> +-		{
> +-			description: "prioritise container field over container annotation, pod field and pod annotation",
> +-			podSc:       &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost, LocalhostProfile: getLocal("field-pod-profile.json")}},
> +-			containerSc: &v1.SecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost, LocalhostProfile: getLocal("field-cont-profile.json")}},
> +-			annotation: map[string]string{
> +-				v1.SeccompPodAnnotationKey:                            "localhost/annota-pod-profile.json",
> +-				v1.SeccompContainerAnnotationKeyPrefix + "container1": "localhost/annota-cont-profile.json",
> +-			},
> +-			containerName:   "container1",
> +-			expectedProfile: seccompLocalhostPath("field-cont-profile.json"),
> +-		},
> +-		{
> +-			description: "prioritise container annotation over pod field",
> +-			podSc:       &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost, LocalhostProfile: getLocal("field-pod-profile.json")}},
> +-			annotation: map[string]string{
> +-				v1.SeccompPodAnnotationKey:                            "localhost/annota-pod-profile.json",
> +-				v1.SeccompContainerAnnotationKeyPrefix + "container1": "localhost/annota-cont-profile.json",
> +-			},
> +-			containerName:   "container1",
> +-			expectedProfile: seccompLocalhostPath("annota-cont-profile.json"),
> +-		},
> +-		{
> +-			description: "prioritise pod field over pod annotation",
> +-			podSc:       &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost, LocalhostProfile: getLocal("field-pod-profile.json")}},
> +-			annotation: map[string]string{
> +-				v1.SeccompPodAnnotationKey: "localhost/annota-pod-profile.json",
> +-			},
> +-			containerName:   "container1",
> +-			expectedProfile: seccompLocalhostPath("field-pod-profile.json"),
> +-		},
> +	}
> +
> +	for i, test := range tests {
> +-		seccompProfile := m.getSeccompProfilePath(test.annotation, test.containerName, test.podSc, test.containerSc, true)
> +-		assert.Equal(t, test.expectedProfile, seccompProfile, "TestCase[%d]: %s", i, test.description)
> ++		seccompProfile, err := m.getSeccompProfilePath(test.annotation, test.containerName, test.podSc, test.containerSc, true)
> ++		if test.expectedError != "" {
> ++			assert.EqualError(t, err, test.expectedError, "TestCase[%d]: %s", i, test.description)
> ++		} else {
> ++			assert.NoError(t, err, "TestCase[%d]: %s", i, test.description)
> ++			assert.Equal(t, test.expectedProfile, seccompProfile, "TestCase[%d]: %s", i, test.description)
> ++		}
> +	}
> + }
> +
> +@@ -747,6 +541,7 @@ func TestGetSeccompProfile(t *testing.T) {
> +		containerSc     *v1.SecurityContext
> +		containerName   string
> +		expectedProfile *runtimeapi.SecurityProfile
> ++		expectedError   string
> +	}{
> +		{
> +			description:     "no seccomp should return unconfined",
> +@@ -781,14 +576,14 @@ func TestGetSeccompProfile(t *testing.T) {
> +			},
> +		},
> +		{
> +-			description:     "pod seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns unconfined",
> +-			podSc:           &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
> +-			expectedProfile: unconfinedProfile,
> ++			description:   "pod seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns error",
> ++			podSc:         &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
> ++			expectedError: "localhostProfile must be set if seccompProfile type is Localhost.",
> +		},
> +		{
> +-			description:     "container seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns unconfined",
> +-			containerSc:     &v1.SecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
> +-			expectedProfile: unconfinedProfile,
> ++			description:   "container seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns error",
> ++			containerSc:   &v1.SecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
> ++			expectedError: "localhostProfile must be set if seccompProfile type is Localhost.",
> +		},
> +		{
> +			description: "container seccomp profile set to SeccompProfileTypeLocalhost returns 'localhost/' + LocalhostProfile",
> +@@ -817,8 +612,13 @@ func TestGetSeccompProfile(t *testing.T) {
> +	}
> +
> +	for i, test := range tests {
> +-		seccompProfile := m.getSeccompProfile(test.annotation, test.containerName, test.podSc, test.containerSc, false)
> +-		assert.Equal(t, test.expectedProfile, seccompProfile, "TestCase[%d]: %s", i, test.description)
> ++		seccompProfile, err := m.getSeccompProfile(test.annotation, test.containerName, test.podSc, test.containerSc, false)
> ++		if test.expectedError != "" {
> ++			assert.EqualError(t, err, test.expectedError, "TestCase[%d]: %s", i, test.description)
> ++		} else {
> ++			assert.NoError(t, err, "TestCase[%d]: %s", i, test.description)
> ++			assert.Equal(t, test.expectedProfile, seccompProfile, "TestCase[%d]: %s", i, test.description)
> ++		}
> +	}
> + }
> +
> +@@ -841,6 +641,7 @@ func TestGetSeccompProfileDefaultSeccomp(t *testing.T) {
> +		containerSc     *v1.SecurityContext
> +		containerName   string
> +		expectedProfile *runtimeapi.SecurityProfile
> ++		expectedError   string
> +	}{
> +		{
> +			description:     "no seccomp should return RuntimeDefault",
> +@@ -875,14 +676,14 @@ func TestGetSeccompProfileDefaultSeccomp(t *testing.T) {
> +			},
> +		},
> +		{
> +-			description:     "pod seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns unconfined",
> +-			podSc:           &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
> +-			expectedProfile: unconfinedProfile,
> ++			description:   "pod seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns error",
> ++			podSc:         &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
> ++			expectedError: "localhostProfile must be set if seccompProfile type is Localhost.",
> +		},
> +		{
> +-			description:     "container seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns unconfined",
> +-			containerSc:     &v1.SecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
> +-			expectedProfile: unconfinedProfile,
> ++			description:   "container seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns error",
> ++			containerSc:   &v1.SecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
> ++			expectedError: "localhostProfile must be set if seccompProfile type is Localhost.",
> +		},
> +		{
> +			description: "container seccomp profile set to SeccompProfileTypeLocalhost returns 'localhost/' + LocalhostProfile",
> +@@ -911,8 +712,13 @@ func TestGetSeccompProfileDefaultSeccomp(t *testing.T) {
> +	}
> +
> +	for i, test := range tests {
> +-		seccompProfile := m.getSeccompProfile(test.annotation, test.containerName, test.podSc, test.containerSc, true)
> +-		assert.Equal(t, test.expectedProfile, seccompProfile, "TestCase[%d]: %s", i, test.description)
> ++		seccompProfile, err := m.getSeccompProfile(test.annotation, test.containerName, test.podSc, test.containerSc, true)
> ++		if test.expectedError != "" {
> ++			assert.EqualError(t, err, test.expectedError, "TestCase[%d]: %s", i, test.description)
> ++		} else {
> ++			assert.NoError(t, err, "TestCase[%d]: %s", i, test.description)
> ++			assert.Equal(t, test.expectedProfile, seccompProfile, "TestCase[%d]: %s", i, test.description)
> ++		}
> +	}
> + }
> +
> +diff --git a/pkg/kubelet/kuberuntime/kuberuntime_container_linux.go b/pkg/kubelet/kuberuntime/kuberuntime_container_linux.go
> +index 6cb9e54729e..54670673bcd 100644
> +--- a/pkg/kubelet/kuberuntime/kuberuntime_container_linux.go
> ++++ b/pkg/kubelet/kuberuntime/kuberuntime_container_linux.go
> +@@ -46,15 +46,23 @@ func (m *kubeGenericRuntimeManager) applyPlatformSpecificContainerConfig(config
> +		libcontainercgroups.IsCgroup2UnifiedMode() {
> +		enforceMemoryQoS = true
> +	}
> +-	config.Linux = m.generateLinuxContainerConfig(container, pod, uid, username, nsTarget, enforceMemoryQoS)
> ++	cl, err := m.generateLinuxContainerConfig(container, pod, uid, username, nsTarget, enforceMemoryQoS)
> ++	if err != nil {
> ++		return err
> ++	}
> ++	config.Linux = cl
> +	return nil
> + }
> +
> + // generateLinuxContainerConfig generates linux container config for kubelet runtime v1.
> +-func (m *kubeGenericRuntimeManager) generateLinuxContainerConfig(container *v1.Container, pod *v1.Pod, uid *int64, username string, nsTarget *kubecontainer.ContainerID, enforceMemoryQoS bool) *runtimeapi.LinuxContainerConfig {
> ++func (m *kubeGenericRuntimeManager) generateLinuxContainerConfig(container *v1.Container, pod *v1.Pod, uid *int64, username string, nsTarget *kubecontainer.ContainerID, enforceMemoryQoS bool) (*runtimeapi.LinuxContainerConfig, error) {
> ++	sc, err := m.determineEffectiveSecurityContext(pod, container, uid, username)
> ++	if err != nil {
> ++		return nil, err
> ++	}
> +	lc := &runtimeapi.LinuxContainerConfig{
> +		Resources:       &runtimeapi.LinuxContainerResources{},
> +-		SecurityContext: m.determineEffectiveSecurityContext(pod, container, uid, username),
> ++		SecurityContext: sc,
> +	}
> +
> +	if nsTarget != nil && lc.SecurityContext.NamespaceOptions.Pid == runtimeapi.NamespaceMode_CONTAINER {
> +@@ -125,7 +133,7 @@ func (m *kubeGenericRuntimeManager) generateLinuxContainerConfig(container *v1.C
> +		}
> +	}
> +
> +-	return lc
> ++	return lc, nil
> + }
> +
> + // calculateLinuxResources will create the linuxContainerResources type based on the provided CPU and memory resource requests, limits
> +diff --git a/pkg/kubelet/kuberuntime/kuberuntime_container_linux_test.go b/pkg/kubelet/kuberuntime/kuberuntime_container_linux_test.go
> +index 46817e00fb0..98f635cc932 100644
> +--- a/pkg/kubelet/kuberuntime/kuberuntime_container_linux_test.go
> ++++ b/pkg/kubelet/kuberuntime/kuberuntime_container_linux_test.go
> +@@ -47,6 +47,8 @@ func makeExpectedConfig(m *kubeGenericRuntimeManager, pod *v1.Pod, containerInde
> +	restartCountUint32 := uint32(restartCount)
> +	envs := make([]*runtimeapi.KeyValue, len(opts.Envs))
> +
> ++	l, _ := m.generateLinuxContainerConfig(container, pod, new(int64), "", nil, enforceMemoryQoS)
> ++
> +	expectedConfig := &runtimeapi.ContainerConfig{
> +		Metadata: &runtimeapi.ContainerMetadata{
> +			Name:    container.Name,
> +@@ -64,7 +66,7 @@ func makeExpectedConfig(m *kubeGenericRuntimeManager, pod *v1.Pod, containerInde
> +		Stdin:       container.Stdin,
> +		StdinOnce:   container.StdinOnce,
> +		Tty:         container.TTY,
> +-		Linux:       m.generateLinuxContainerConfig(container, pod, new(int64), "", nil, enforceMemoryQoS),
> ++		Linux:       l,
> +		Envs:        envs,
> +	}
> +	return expectedConfig
> +@@ -215,7 +217,8 @@ func TestGenerateLinuxContainerConfigResources(t *testing.T) {
> +			},
> +		}
> +
> +-		linuxConfig := m.generateLinuxContainerConfig(&pod.Spec.Containers[0], pod, new(int64), "", nil, false)
> ++		linuxConfig, err := m.generateLinuxContainerConfig(&pod.Spec.Containers[0], pod, new(int64), "", nil, false)
> ++		assert.NoError(t, err)
> +		assert.Equal(t, test.expected.CpuPeriod, linuxConfig.GetResources().CpuPeriod, test.name)
> +		assert.Equal(t, test.expected.CpuQuota, linuxConfig.GetResources().CpuQuota, test.name)
> +		assert.Equal(t, test.expected.CpuShares, linuxConfig.GetResources().CpuShares, test.name)
> +@@ -329,6 +332,8 @@ func TestGenerateContainerConfigWithMemoryQoSEnforced(t *testing.T) {
> +		memoryLow       int64
> +		memoryHigh      int64
> +	}
> ++	l1, _ := m.generateLinuxContainerConfig(&pod1.Spec.Containers[0], pod1, new(int64), "", nil, true)
> ++	l2, _ := m.generateLinuxContainerConfig(&pod2.Spec.Containers[0], pod2, new(int64), "", nil, true)
> +	tests := []struct {
> +		name     string
> +		pod      *v1.Pod
> +@@ -338,7 +343,7 @@ func TestGenerateContainerConfigWithMemoryQoSEnforced(t *testing.T) {
> +			name: "Request128MBLimit256MB",
> +			pod:  pod1,
> +			expected: &expectedResult{
> +-				m.generateLinuxContainerConfig(&pod1.Spec.Containers[0], pod1, new(int64), "", nil, true),
> ++				l1,
> +				128 * 1024 * 1024,
> +				int64(float64(256*1024*1024) * m.memoryThrottlingFactor),
> +			},
> +@@ -347,7 +352,7 @@ func TestGenerateContainerConfigWithMemoryQoSEnforced(t *testing.T) {
> +			name: "Request128MBWithoutLimit",
> +			pod:  pod2,
> +			expected: &expectedResult{
> +-				m.generateLinuxContainerConfig(&pod2.Spec.Containers[0], pod2, new(int64), "", nil, true),
> ++				l2,
> +				128 * 1024 * 1024,
> +				int64(pod2MemoryHigh),
> +			},
> +@@ -355,7 +360,8 @@ func TestGenerateContainerConfigWithMemoryQoSEnforced(t *testing.T) {
> +	}
> +
> +	for _, test := range tests {
> +-		linuxConfig := m.generateLinuxContainerConfig(&test.pod.Spec.Containers[0], test.pod, new(int64), "", nil, true)
> ++		linuxConfig, err := m.generateLinuxContainerConfig(&test.pod.Spec.Containers[0], test.pod, new(int64), "", nil, true)
> ++		assert.NoError(t, err)
> +		assert.Equal(t, test.expected.containerConfig, linuxConfig, test.name)
> +		assert.Equal(t, linuxConfig.GetResources().GetUnified()["memory.min"], strconv.FormatInt(test.expected.memoryLow, 10), test.name)
> +		assert.Equal(t, linuxConfig.GetResources().GetUnified()["memory.high"], strconv.FormatInt(test.expected.memoryHigh, 10), test.name)
> +@@ -578,7 +584,8 @@ func TestGenerateLinuxContainerConfigNamespaces(t *testing.T) {
> +		},
> +	} {
> +		t.Run(tc.name, func(t *testing.T) {
> +-			got := m.generateLinuxContainerConfig(&tc.pod.Spec.Containers[0], tc.pod, nil, "", tc.target, false)
> ++			got, err := m.generateLinuxContainerConfig(&tc.pod.Spec.Containers[0], tc.pod, nil, "", tc.target, false)
> ++			assert.NoError(t, err)
> +			if diff := cmp.Diff(tc.want, got.SecurityContext.NamespaceOptions); diff != "" {
> +				t.Errorf("%v: diff (-want +got):\n%v", t.Name(), diff)
> +			}
> +@@ -669,7 +676,8 @@ func TestGenerateLinuxContainerConfigSwap(t *testing.T) {
> +	} {
> +		t.Run(tc.name, func(t *testing.T) {
> +			m.memorySwapBehavior = tc.swapSetting
> +-			actual := m.generateLinuxContainerConfig(&tc.pod.Spec.Containers[0], tc.pod, nil, "", nil, false)
> ++			actual, err := m.generateLinuxContainerConfig(&tc.pod.Spec.Containers[0], tc.pod, nil, "", nil, false)
> ++			assert.NoError(t, err)
> +			assert.Equal(t, tc.expected, actual.Resources.MemorySwapLimitInBytes, "memory swap config for %s", tc.name)
> +		})
> +	}
> +diff --git a/pkg/kubelet/kuberuntime/security_context.go b/pkg/kubelet/kuberuntime/security_context.go
> +index c9d33e44305..3b575c8e974 100644
> +--- a/pkg/kubelet/kuberuntime/security_context.go
> ++++ b/pkg/kubelet/kuberuntime/security_context.go
> +@@ -24,7 +24,7 @@ import (
> + )
> +
> + // determineEffectiveSecurityContext gets container's security context from v1.Pod and v1.Container.
> +-func (m *kubeGenericRuntimeManager) determineEffectiveSecurityContext(pod *v1.Pod, container *v1.Container, uid *int64, username string) *runtimeapi.LinuxContainerSecurityContext {
> ++func (m *kubeGenericRuntimeManager) determineEffectiveSecurityContext(pod *v1.Pod, container *v1.Container, uid *int64, username string) (*runtimeapi.LinuxContainerSecurityContext, error) {
> +	effectiveSc := securitycontext.DetermineEffectiveSecurityContext(pod, container)
> +	synthesized := convertToRuntimeSecurityContext(effectiveSc)
> +	if synthesized == nil {
> +@@ -36,9 +36,16 @@ func (m *kubeGenericRuntimeManager) determineEffectiveSecurityContext(pod *v1.Po
> +
> +	// TODO: Deprecated, remove after we switch to Seccomp field
> +	// set SeccompProfilePath.
> +-	synthesized.SeccompProfilePath = m.getSeccompProfilePath(pod.Annotations, container.Name, pod.Spec.SecurityContext, container.SecurityContext, m.seccompDefault)
> ++	var err error
> ++	synthesized.SeccompProfilePath, err = m.getSeccompProfilePath(pod.Annotations, container.Name, pod.Spec.SecurityContext, container.SecurityContext, m.seccompDefault)
> ++	if err != nil {
> ++		return nil, err
> ++	}
> +
> +-	synthesized.Seccomp = m.getSeccompProfile(pod.Annotations, container.Name, pod.Spec.SecurityContext, container.SecurityContext, m.seccompDefault)
> ++	synthesized.Seccomp, err = m.getSeccompProfile(pod.Annotations, container.Name, pod.Spec.SecurityContext, container.SecurityContext, m.seccompDefault)
> ++	if err != nil {
> ++		return nil, err
> ++	}
> +
> +	// set ApparmorProfile.
> +	synthesized.ApparmorProfile = apparmor.GetProfileNameFromPodAnnotations(pod.Annotations, container.Name)
> +@@ -74,7 +81,7 @@ func (m *kubeGenericRuntimeManager) determineEffectiveSecurityContext(pod *v1.Po
> +	synthesized.MaskedPaths = securitycontext.ConvertToRuntimeMaskedPaths(effectiveSc.ProcMount)
> +	synthesized.ReadonlyPaths = securitycontext.ConvertToRuntimeReadonlyPaths(effectiveSc.ProcMount)
> +
> +-	return synthesized
> ++	return synthesized, nil
> + }
> +
> + // convertToRuntimeSecurityContext converts v1.SecurityContext to runtimeapi.SecurityContext.
> +--
> +2.40.0
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index 59892c92..dc741bbf 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -30,6 +30,7 @@ SRC_URI:append = " \
>             file://0001-cross-don-t-build-tests-by-default.patch;patchdir=src/import \
>             file://0001-build-golang.sh-convert-remaining-go-calls-to-use.patch;patchdir=src/import \
>             file://0001-Makefile.generated_files-Fix-race-issue-for-installi.patch;patchdir=src/import \
> +           file://CVE-2023-2431.patch;patchdir=src/import \
>             file://cni-containerd-net.conflist \
>             file://k8s-init \
>             file://99-kubernetes.conf \
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8457): https://lists.yoctoproject.org/g/meta-virtualization/message/8457
> Mute This Topic: https://lists.yoctoproject.org/mt/102555683/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


In message: [meta-virtualization][kirkstone][PATCH v2 1/1] kubernetes: Adjust patches to resolve error that occur with devtool
on 13/11/2023 Soumya via lists.yoctoproject.org wrote:

> From: Soumya Sambu <soumya.sambu@windriver.com>
> 
> Adjust patches and .bb to fix  below error which occurs with devtool modify command -
> 
> ERROR: Applying patch '0001-hack-lib-golang.sh-use-CC-from-environment.patch' on
> target directory
> CmdError('sh -c \'PATCHFILE="0001-hack-lib-golang.sh-use-CC-from-environment.patch"
> git -c user.name="OpenEmbedded" -c user.email="oe.patch@oe" commit -F /tmp/tmp_ptvioq3
> --author="Koen Kooi <koen.kooi@linaro.org>"
> --date="Mon, 23 Jul 2018 15:28:02 +0200"\'', 0, 'stdout: On branch devtool
> Changes not staged for commit:
>   (use "git add <file>..." to update what will be committed)
>   (use "git restore <file>..." to discard changes in working directory)
>   (commit or discard the untracked or modified content in submodules)
> \tmodified:   src/import (modified content)
> 
> no changes added to commit (use "git add" and/or "git commit -a")
> 
> stderr: ')
> 
> This error is not seen on master branch, fixed with below commit -
> [https://git.yoctoproject.org/meta-virtualization/commit/?id=d9af46db9aa9060c1ec10118b2cccabfc8264904]
> 
> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> ---
>  ...rated_files-Fix-race-issue-for-installi.patch | 16 +++++++++-------
>  ...ng.sh-convert-remaining-go-calls-to-use.patch | 16 ++++++++--------
>  ...0001-cross-don-t-build-tests-by-default.patch | 10 +++++-----
>  ...k-lib-golang.sh-use-CC-from-environment.patch | 12 +++++++-----
>  recipes-containers/kubernetes/kubernetes_git.bb  |  8 ++++----
>  5 files changed, 33 insertions(+), 29 deletions(-)
> 
> diff --git a/recipes-containers/kubernetes/kubernetes/0001-Makefile.generated_files-Fix-race-issue-for-installi.patch b/recipes-containers/kubernetes/kubernetes/0001-Makefile.generated_files-Fix-race-issue-for-installi.patch
> index 02bb5e91..1b08b8c3 100644
> --- a/recipes-containers/kubernetes/kubernetes/0001-Makefile.generated_files-Fix-race-issue-for-installi.patch
> +++ b/recipes-containers/kubernetes/kubernetes/0001-Makefile.generated_files-Fix-race-issue-for-installi.patch
> @@ -1,7 +1,7 @@
>  From 441df8a24a2c80e320f140b5d9bc352c7ce8a64a Mon Sep 17 00:00:00 2001
>  From: Robert Yang <liezhi.yang@windriver.com>
>  Date: Thu, 15 Oct 2020 07:27:35 +0000
> -Subject: [PATCH] src/import/build/root/Makefile.generated_files: Fix race issue for installing
> +Subject: [PATCH] src/import/build/root/Makefile.generated_files: Fix race issue for installing 
>   go2make
>  
>  The src/import/build/root/Makefile.generated_files are called several times during the build, so the
> @@ -25,14 +25,14 @@ Upstream-Status: Pending
>  
>  Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>  ---
> - src/import/build/root/Makefile.generated_files | 4 +++-
> + build/root/Makefile.generated_files | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>  
> -Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/src/import/build/root/Makefile.generated_files
> -===================================================================
> ---- kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630.orig/src/import/build/root/Makefile.generated_files
> -+++ kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/src/import/build/root/Makefile.generated_files
> -@@ -67,7 +67,9 @@
> +diff --git a/build/root/Makefile.generated_files b/build/root/Makefile.generated_files
> +index d86a90cbb39..19a3d332476 100644
> +--- a/build/root/Makefile.generated_files
> ++++ b/build/root/Makefile.generated_files
> +@@ -67,7 +67,9 @@ $(META_DIR)/$(GO_PKGDEPS_FILE): FORCE
>   	if [[ "$(DBG_CODEGEN)" == 1 ]]; then          \
>   	    echo "DBG: calculating Go dependencies";  \
>   	fi
> @@ -43,3 +43,5 @@ Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/src/import
>   	hack/run-in-gopath.sh go2make                       \
>   	    k8s.io/kubernetes/...                           \
>   	    --prune  k8s.io/kubernetes/staging              \
> +--
> +2.40.0
> diff --git a/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-convert-remaining-go-calls-to-use.patch b/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-convert-remaining-go-calls-to-use.patch
> index 8adbafb3..00425c7d 100644
> --- a/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-convert-remaining-go-calls-to-use.patch
> +++ b/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-convert-remaining-go-calls-to-use.patch
> @@ -8,11 +8,11 @@ Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>   hack/lib/golang.sh | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>  
> -diff --git a/src/import/hack/lib/golang.sh b/src/import/hack/lib/golang.sh
> -index e9148ec08fa..71d3c987563 100755
> ---- a/src/import/hack/lib/golang.sh
> -+++ b/src/import/hack/lib/golang.sh
> -@@ -651,7 +651,7 @@ kube::golang::build_some_binaries() {
> +diff --git a/hack/lib/golang.sh b/hack/lib/golang.sh
> +index d0f4b00dadf..cef0c2075a3 100755
> +--- a/hack/lib/golang.sh
> ++++ b/hack/lib/golang.sh
> +@@ -654,7 +654,7 @@ kube::golang::build_some_binaries() {
>           kube::golang::create_coverage_dummy_test "${package}"
>           kube::util::trap_add "kube::golang::delete_coverage_dummy_test \"${package}\"" EXIT
>   
> @@ -21,7 +21,7 @@ index e9148ec08fa..71d3c987563 100755
>             -covermode count \
>             -coverpkg k8s.io/...,k8s.io/kubernetes/vendor/k8s.io/... \
>             "${build_args[@]}" \
> -@@ -663,13 +663,13 @@ kube::golang::build_some_binaries() {
> +@@ -666,13 +666,13 @@ kube::golang::build_some_binaries() {
>       done
>       if [[ "${#uncovered[@]}" != 0 ]]; then
>         V=2 kube::log::info "Building ${uncovered[*]} without coverage..."
> @@ -37,7 +37,7 @@ index e9148ec08fa..71d3c987563 100755
>      fi
>   }
>   
> -@@ -725,7 +725,7 @@ kube::golang::build_binaries_for_platform() {
> +@@ -730,7 +730,7 @@ kube::golang::build_binaries_for_platform() {
>       testpkg=$(dirname "${test}")
>   
>       mkdir -p "$(dirname "${outfile}")"
> @@ -47,5 +47,5 @@ index e9148ec08fa..71d3c987563 100755
>         -gcflags "${gogcflags:-}" \
>         -asmflags "${goasmflags:-}" \
>  -- 
> -2.19.1
> +2.40.0
>  
> diff --git a/recipes-containers/kubernetes/kubernetes/0001-cross-don-t-build-tests-by-default.patch b/recipes-containers/kubernetes/kubernetes/0001-cross-don-t-build-tests-by-default.patch
> index 659e3013..cd5e46f1 100644
> --- a/recipes-containers/kubernetes/kubernetes/0001-cross-don-t-build-tests-by-default.patch
> +++ b/recipes-containers/kubernetes/kubernetes/0001-cross-don-t-build-tests-by-default.patch
> @@ -15,10 +15,10 @@ Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>   hack/make-rules/cross.sh | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>  
> -diff --git a/src/import/hack/make-rules/cross.sh b/hack/make-rules/cross.sh
> -index 8e1e938..0898c5c 100755
> ---- a/src/import/hack/make-rules/cross.sh
> -+++ b/src/import/hack/make-rules/cross.sh
> +diff --git a/hack/make-rules/cross.sh b/hack/make-rules/cross.sh
> +index f8a6d0dbf5e..d22bf52b1cc 100755
> +--- a/hack/make-rules/cross.sh
> ++++ b/hack/make-rules/cross.sh
>  @@ -33,6 +33,6 @@ make all WHAT="${KUBE_NODE_TARGETS[*]}" KUBE_BUILD_PLATFORMS="${KUBE_NODE_PLATFO
>   
>   make all WHAT="${KUBE_CLIENT_TARGETS[*]}" KUBE_BUILD_PLATFORMS="${KUBE_CLIENT_PLATFORMS[*]}"
> @@ -29,5 +29,5 @@ index 8e1e938..0898c5c 100755
>  -make all WHAT="${KUBE_TEST_SERVER_TARGETS[*]}" KUBE_BUILD_PLATFORMS="${KUBE_TEST_SERVER_PLATFORMS[*]}"
>  +#make all WHAT="${KUBE_TEST_SERVER_TARGETS[*]}" KUBE_BUILD_PLATFORMS="${KUBE_TEST_SERVER_PLATFORMS[*]}"
>  -- 
> -2.7.4
> +2.40.0
>  
> diff --git a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch b/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch
> index 3a22a2ef..8684a94a 100644
> --- a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch
> +++ b/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch
> @@ -11,11 +11,11 @@ Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>   hack/lib/golang.sh | 4 ----
>   1 file changed, 4 deletions(-)
>  
> -Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/src/import/hack/lib/golang.sh
> -===================================================================
> ---- kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630.orig/src/import/hack/lib/golang.sh
> -+++ kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/src/import/hack/lib/golang.sh
> -@@ -414,19 +414,15 @@
> +diff --git a/hack/lib/golang.sh b/hack/lib/golang.sh
> +index e16a60d1867..d0f4b00dadf 100755
> +--- a/hack/lib/golang.sh
> ++++ b/hack/lib/golang.sh
> +@@ -420,19 +420,15 @@ kube::golang::set_platform_envs() {
>           ;;
>         "linux/arm")
>           export CGO_ENABLED=1
> @@ -35,3 +35,5 @@ Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/src/import
>           ;;
>       esac
>     fi
> +--
> +2.40.0
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index f475bd73..59892c92 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -26,10 +26,10 @@ SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.23;name=k
>             git://github.com/kubernetes/release;branch=master;name=kubernetes-release;destsuffix=git/release;protocol=https"
>  
>  SRC_URI:append = " \
> -           file://0001-hack-lib-golang.sh-use-CC-from-environment.patch \
> -           file://0001-cross-don-t-build-tests-by-default.patch \
> -           file://0001-build-golang.sh-convert-remaining-go-calls-to-use.patch \
> -           file://0001-Makefile.generated_files-Fix-race-issue-for-installi.patch \
> +           file://0001-hack-lib-golang.sh-use-CC-from-environment.patch;patchdir=src/import \
> +           file://0001-cross-don-t-build-tests-by-default.patch;patchdir=src/import \
> +           file://0001-build-golang.sh-convert-remaining-go-calls-to-use.patch;patchdir=src/import \
> +           file://0001-Makefile.generated_files-Fix-race-issue-for-installi.patch;patchdir=src/import \
>             file://cni-containerd-net.conflist \
>             file://k8s-init \
>             file://99-kubernetes.conf \
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8456): https://lists.yoctoproject.org/g/meta-virtualization/message/8456
> Mute This Topic: https://lists.yoctoproject.org/mt/102555494/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 




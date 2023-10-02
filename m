Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6410AE748F5
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 16:17:05 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.86486.1696263419557680395
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Oct 2023 09:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JViKfp4b;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-775810b032aso336887885a.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 02 Oct 2023 09:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696263418; x=1696868218; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yHS/U1vPmGrG6wYxQg1yYlvB4/FOn7wFFpSkJJbXYj8=;
        b=JViKfp4b5V6FuMnkcnnucIrzAQavO55UB42LhhxyGTIDbIeegiPnRzVkjbYROOD8Km
         v5islnVVHW4zp0XhKuMnCLgM83mNH6EFwBugi6MLBo9t+rzC4IHYXn2NTfH8/LBhiVek
         nKmzha61PvITHUT1mShrSkQptGK1eGL4s8W5TR7h4uZbugD/VKAdXafpGnFsX1dqrswh
         ekUXaap+22mX+ww2QucYe0zvmEaDHyxQZs2TaC6USlIlF5Bomu26xhZ+W9nre3viVg5s
         nG1ZC+tVeenxurKHOYKclGo0XfVBQOxSe/IFEn3xent6tNWj4y8iaq3noAMLZDQc+Gwh
         93EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696263418; x=1696868218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHS/U1vPmGrG6wYxQg1yYlvB4/FOn7wFFpSkJJbXYj8=;
        b=XYM0vrw/X2TCAvdx7dMYXlAYkR2dKNA1yEwJgRaMfJ+/EQEX39NlHbgn64bMzvVc8G
         mBM7Lx16bU6nu2dCHGJuuXDCmT1Osui6vIU+mb/wkZOAGUD1FauWBGtFEgxN3REg++7o
         czCHjp+V0Py9951HflgvjSTROazccq0/mmKsPuHmFt2qLH9uOI1irGYS7quIrqM8i4LZ
         IjPTfe1J00S+0sP7edSP78vqjQ61Xy58dQRA5JAUt5jkuBBZNcxY2nkJbitQD+PdIzQU
         XZuJyLXpf9fUhIu447gpA0uZAlQ3FxUwC4UTvvfygLQArhhaWGJwiNZT2mv3rGfhHew2
         NoHw==
X-Gm-Message-State: AOJu0Yy0Rs/RSi4mxjsgC87H2RSX9K09S1uPA2gVVT6tmlTYIP9k+jmH
	p9e+J5zqlhSgwSFnKFxR6ms=
X-Google-Smtp-Source: AGHT+IHLv26RZI9zuycinHdoYk4oWiZTlXVJfWZdB9N4UtMWBSR0H8KdW0c3Lv9JAVQoI7fziIRjvQ==
X-Received: by 2002:a05:6214:3d0a:b0:658:2857:ed69 with SMTP id ol10-20020a0562143d0a00b006582857ed69mr13701709qvb.1.1696263418068;
        Mon, 02 Oct 2023 09:16:58 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id k9-20020a0cf289000000b0064f53943626sm6270630qvl.89.2023.10.02.09.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 09:16:57 -0700 (PDT)
Date: Mon, 2 Oct 2023 16:16:55 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: vanusuri@mvista.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][dunfell][PATCH] kubernetes: Backport fix
 for CVE-2021-25735 and CVE-2021-25737
Message-ID: <ZRrs9zn4yCLinkDt@gmail.com>
References: <20230927104840.37144-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927104840.37144-1-vanusuri@mvista.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 02 Oct 2023 16:17:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8333

merged to dunfell

Bruce


In message: [meta-virtualization][dunfell][PATCH] kubernetes: Backport fix for CVE-2021-25735 and CVE-2021-25737
on 27/09/2023 Vijay Anusuri via lists.yoctoproject.org wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
> 
> Upstream-commit:
> https://github.com/kubernetes/kubernetes/commit/e612ebfdff22e4bd27ad8345f7c82f074bfedf26
> &
> https://github.com/kubernetes/kubernetes/commit/d57f0641d60b73934ebc2cdf4b6a63182217d10c
> & https://github.com/kubernetes/kubernetes/commit/901e8e07e1f031456ecd7fefce965aaa05916825
> 
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../kubernetes/CVE-2021-25735-pre1.patch      | 613 ++++++++++++++++++
>  .../kubernetes/CVE-2021-25735.patch           | 535 +++++++++++++++
>  .../kubernetes/CVE-2021-25737.patch           | 128 ++++
>  .../kubernetes/kubernetes_git.bb              |   3 +
>  4 files changed, 1279 insertions(+)
>  create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2021-25735-pre1.patch
>  create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2021-25735.patch
>  create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2021-25737.patch
> 
> diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2021-25735-pre1.patch b/recipes-containers/kubernetes/kubernetes/CVE-2021-25735-pre1.patch
> new file mode 100644
> index 00000000..2066188a
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/CVE-2021-25735-pre1.patch
> @@ -0,0 +1,613 @@
> +From e612ebfdff22e4bd27ad8345f7c82f074bfedf26 Mon Sep 17 00:00:00 2001
> +From: wojtekt <wojtekt@google.com>
> +Date: Tue, 26 Nov 2019 13:29:26 +0100
> +Subject: [PATCH] Immutable field and validation
> +
> +Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/commit/e612ebfdff22e4bd27ad8345f7c82f074bfedf26]
> +CVE: CVE-2021-25735 #Dependency Patch1
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + pkg/apis/core/types.go                        |  12 +
> + pkg/apis/core/validation/validation.go        |  24 +-
> + pkg/apis/core/validation/validation_test.go   | 209 ++++++++++++++++--
> + pkg/features/kube_features.go                 |   7 +
> + pkg/registry/core/configmap/strategy.go       |  28 ++-
> + pkg/registry/core/secret/strategy.go          |  17 ++
> + staging/src/k8s.io/api/core/v1/types.go       |  16 ++
> + .../k8sdeps/transformer/hash/hash.go          |  20 +-
> + .../k8sdeps/transformer/hash/hash_test.go     |   4 +-
> + .../src/k8s.io/kubectl/pkg/util/hash/hash.go  |  20 +-
> + .../k8s.io/kubectl/pkg/util/hash/hash_test.go |   4 +-
> + 11 files changed, 322 insertions(+), 39 deletions(-)
> +
> +diff --git a/pkg/apis/core/types.go b/pkg/apis/core/types.go
> +index 74d22ae973e87..c5ada193effc4 100644
> +--- a/src/import/pkg/apis/core/types.go
> ++++ b/src/import/pkg/apis/core/types.go
> +@@ -4735,6 +4735,12 @@ type Secret struct {
> + 	// +optional
> + 	metav1.ObjectMeta
> + 
> ++	// Immutable field, if set, ensures that data stored in the Secret cannot
> ++	// be updated (only object metadata can be modified).
> ++	// This is an alpha field enabled by ImmutableEphemeralVolumes feature gate.
> ++	// +optional
> ++	Immutable *bool
> ++
> + 	// Data contains the secret data. Each key must consist of alphanumeric
> + 	// characters, '-', '_' or '.'. The serialized form of the secret data is a
> + 	// base64 encoded string, representing the arbitrary (possibly non-string)
> +@@ -4857,6 +4863,12 @@ type ConfigMap struct {
> + 	// +optional
> + 	metav1.ObjectMeta
> + 
> ++	// Immutable field, if set, ensures that data stored in the ConfigMap cannot
> ++	// be updated (only object metadata can be modified).
> ++	// This is an alpha field enabled by ImmutableEphemeralVolumes feature gate.
> ++	// +optional
> ++	Immutable *bool
> ++
> + 	// Data contains the configuration data.
> + 	// Each key must consist of alphanumeric characters, '-', '_' or '.'.
> + 	// Values with non-UTF-8 byte sequences must use the BinaryData field.
> +diff --git a/pkg/apis/core/validation/validation.go b/pkg/apis/core/validation/validation.go
> +index 4ad241c745b7d..8e3cfd9d9e423 100644
> +--- a/src/import/pkg/apis/core/validation/validation.go
> ++++ b/src/import/pkg/apis/core/validation/validation.go
> +@@ -5005,6 +5005,16 @@ func ValidateSecretUpdate(newSecret, oldSecret *core.Secret) field.ErrorList {
> + 	}
> + 
> + 	allErrs = append(allErrs, ValidateImmutableField(newSecret.Type, oldSecret.Type, field.NewPath("type"))...)
> ++	if oldSecret.Immutable != nil && *oldSecret.Immutable {
> ++		if !reflect.DeepEqual(newSecret.Immutable, oldSecret.Immutable) {
> ++			allErrs = append(allErrs, field.Forbidden(field.NewPath("immutable"), "field is immutable when `immutable` is set"))
> ++		}
> ++		if !reflect.DeepEqual(newSecret.Data, oldSecret.Data) {
> ++			allErrs = append(allErrs, field.Forbidden(field.NewPath("data"), "field is immutable when `immutable` is set"))
> ++		}
> ++		// We don't validate StringData, as it was already converted back to Data
> ++		// before validation is happening.
> ++	}
> + 
> + 	allErrs = append(allErrs, ValidateSecret(newSecret)...)
> + 	return allErrs
> +@@ -5051,8 +5061,20 @@ func ValidateConfigMap(cfg *core.ConfigMap) field.ErrorList {
> + func ValidateConfigMapUpdate(newCfg, oldCfg *core.ConfigMap) field.ErrorList {
> + 	allErrs := field.ErrorList{}
> + 	allErrs = append(allErrs, ValidateObjectMetaUpdate(&newCfg.ObjectMeta, &oldCfg.ObjectMeta, field.NewPath("metadata"))...)
> +-	allErrs = append(allErrs, ValidateConfigMap(newCfg)...)
> + 
> ++	if oldCfg.Immutable != nil && *oldCfg.Immutable {
> ++		if !reflect.DeepEqual(newCfg.Immutable, oldCfg.Immutable) {
> ++			allErrs = append(allErrs, field.Forbidden(field.NewPath("immutable"), "field is immutable when `immutable` is set"))
> ++		}
> ++		if !reflect.DeepEqual(newCfg.Data, oldCfg.Data) {
> ++			allErrs = append(allErrs, field.Forbidden(field.NewPath("data"), "field is immutable when `immutable` is set"))
> ++		}
> ++		if !reflect.DeepEqual(newCfg.BinaryData, oldCfg.BinaryData) {
> ++			allErrs = append(allErrs, field.Forbidden(field.NewPath("binaryData"), "field is immutable when `immutable` is set"))
> ++		}
> ++	}
> ++
> ++	allErrs = append(allErrs, ValidateConfigMap(newCfg)...)
> + 	return allErrs
> + }
> + 
> +diff --git a/pkg/apis/core/validation/validation_test.go b/pkg/apis/core/validation/validation_test.go
> +index 8ba68da00fe05..de8c1d49fc196 100644
> +--- a/src/import/pkg/apis/core/validation/validation_test.go
> ++++ b/src/import/pkg/apis/core/validation/validation_test.go
> +@@ -13117,6 +13117,104 @@ func TestValidateSecret(t *testing.T) {
> + 	}
> + }
> + 
> ++func TestValidateSecretUpdate(t *testing.T) {
> ++	validSecret := func() core.Secret {
> ++		return core.Secret{
> ++			ObjectMeta: metav1.ObjectMeta{
> ++				Name:            "foo",
> ++				Namespace:       "bar",
> ++				ResourceVersion: "20",
> ++			},
> ++			Data: map[string][]byte{
> ++				"data-1": []byte("bar"),
> ++			},
> ++		}
> ++	}
> ++
> ++	falseVal := false
> ++	trueVal := true
> ++
> ++	secret := validSecret()
> ++	immutableSecret := validSecret()
> ++	immutableSecret.Immutable = &trueVal
> ++	mutableSecret := validSecret()
> ++	mutableSecret.Immutable = &falseVal
> ++
> ++	secretWithData := validSecret()
> ++	secretWithData.Data["data-2"] = []byte("baz")
> ++	immutableSecretWithData := validSecret()
> ++	immutableSecretWithData.Immutable = &trueVal
> ++	immutableSecretWithData.Data["data-2"] = []byte("baz")
> ++
> ++	secretWithChangedData := validSecret()
> ++	secretWithChangedData.Data["data-1"] = []byte("foo")
> ++	immutableSecretWithChangedData := validSecret()
> ++	immutableSecretWithChangedData.Immutable = &trueVal
> ++	immutableSecretWithChangedData.Data["data-1"] = []byte("foo")
> ++
> ++	tests := []struct {
> ++		name      string
> ++		oldSecret core.Secret
> ++		newSecret core.Secret
> ++		valid     bool
> ++	}{
> ++		{
> ++			name:      "mark secret immutable",
> ++			oldSecret: secret,
> ++			newSecret: immutableSecret,
> ++			valid:     true,
> ++		},
> ++		{
> ++			name:      "revert immutable secret",
> ++			oldSecret: immutableSecret,
> ++			newSecret: secret,
> ++			valid:     false,
> ++		},
> ++		{
> ++			name:      "makr immutable secret mutable",
> ++			oldSecret: immutableSecret,
> ++			newSecret: mutableSecret,
> ++			valid:     false,
> ++		},
> ++		{
> ++			name:      "add data in secret",
> ++			oldSecret: secret,
> ++			newSecret: secretWithData,
> ++			valid:     true,
> ++		},
> ++		{
> ++			name:      "add data in immutable secret",
> ++			oldSecret: immutableSecret,
> ++			newSecret: immutableSecretWithData,
> ++			valid:     false,
> ++		},
> ++		{
> ++			name:      "change data in secret",
> ++			oldSecret: secret,
> ++			newSecret: secretWithChangedData,
> ++			valid:     true,
> ++		},
> ++		{
> ++			name:      "change data in immutable secret",
> ++			oldSecret: immutableSecret,
> ++			newSecret: immutableSecretWithChangedData,
> ++			valid:     false,
> ++		},
> ++	}
> ++
> ++	for _, tc := range tests {
> ++		t.Run(tc.name, func(t *testing.T) {
> ++			errs := ValidateSecretUpdate(&tc.newSecret, &tc.oldSecret)
> ++			if tc.valid && len(errs) > 0 {
> ++				t.Errorf("Unexpected error: %v", errs)
> ++			}
> ++			if !tc.valid && len(errs) == 0 {
> ++				t.Errorf("Unexpected lack of error")
> ++			}
> ++		})
> ++	}
> ++}
> ++
> + func TestValidateDockerConfigSecret(t *testing.T) {
> + 	validDockerSecret := func() core.Secret {
> + 		return core.Secret{
> +@@ -13731,40 +13829,105 @@ func TestValidateConfigMapUpdate(t *testing.T) {
> + 			Data: data,
> + 		}
> + 	}
> ++	validConfigMap := func() core.ConfigMap {
> ++		return newConfigMap("1", "validname", "validdns", map[string]string{"key": "value"})
> ++	}
> + 
> +-	var (
> +-		validConfigMap = newConfigMap("1", "validname", "validns", map[string]string{"key": "value"})
> +-		noVersion      = newConfigMap("", "validname", "validns", map[string]string{"key": "value"})
> +-	)
> ++	falseVal := false
> ++	trueVal := true
> ++
> ++	configMap := validConfigMap()
> ++	immutableConfigMap := validConfigMap()
> ++	immutableConfigMap.Immutable = &trueVal
> ++	mutableConfigMap := validConfigMap()
> ++	mutableConfigMap.Immutable = &falseVal
> ++
> ++	configMapWithData := validConfigMap()
> ++	configMapWithData.Data["key-2"] = "value-2"
> ++	immutableConfigMapWithData := validConfigMap()
> ++	immutableConfigMapWithData.Immutable = &trueVal
> ++	immutableConfigMapWithData.Data["key-2"] = "value-2"
> ++
> ++	configMapWithChangedData := validConfigMap()
> ++	configMapWithChangedData.Data["key"] = "foo"
> ++	immutableConfigMapWithChangedData := validConfigMap()
> ++	immutableConfigMapWithChangedData.Immutable = &trueVal
> ++	immutableConfigMapWithChangedData.Data["key"] = "foo"
> ++
> ++	noVersion := newConfigMap("", "validname", "validns", map[string]string{"key": "value"})
> + 
> + 	cases := []struct {
> +-		name    string
> +-		newCfg  core.ConfigMap
> +-		oldCfg  core.ConfigMap
> +-		isValid bool
> ++		name   string
> ++		newCfg core.ConfigMap
> ++		oldCfg core.ConfigMap
> ++		valid  bool
> + 	}{
> + 		{
> +-			name:    "valid",
> +-			newCfg:  validConfigMap,
> +-			oldCfg:  validConfigMap,
> +-			isValid: true,
> ++			name:   "valid",
> ++			newCfg: configMap,
> ++			oldCfg: configMap,
> ++			valid:  true,
> + 		},
> + 		{
> +-			name:    "invalid",
> +-			newCfg:  noVersion,
> +-			oldCfg:  validConfigMap,
> +-			isValid: false,
> ++			name:   "invalid",
> ++			newCfg: noVersion,
> ++			oldCfg: configMap,
> ++			valid:  false,
> ++		},
> ++		{
> ++			name:   "mark configmap immutable",
> ++			oldCfg: configMap,
> ++			newCfg: immutableConfigMap,
> ++			valid:  true,
> ++		},
> ++		{
> ++			name:   "revert immutable configmap",
> ++			oldCfg: immutableConfigMap,
> ++			newCfg: configMap,
> ++			valid:  false,
> ++		},
> ++		{
> ++			name:   "mark immutable configmap mutable",
> ++			oldCfg: immutableConfigMap,
> ++			newCfg: mutableConfigMap,
> ++			valid:  false,
> ++		},
> ++		{
> ++			name:   "add data in configmap",
> ++			oldCfg: configMap,
> ++			newCfg: configMapWithData,
> ++			valid:  true,
> ++		},
> ++		{
> ++			name:   "add data in immutable configmap",
> ++			oldCfg: immutableConfigMap,
> ++			newCfg: immutableConfigMapWithData,
> ++			valid:  false,
> ++		},
> ++		{
> ++			name:   "change data in configmap",
> ++			oldCfg: configMap,
> ++			newCfg: configMapWithChangedData,
> ++			valid:  true,
> ++		},
> ++		{
> ++			name:   "change data in immutable configmap",
> ++			oldCfg: immutableConfigMap,
> ++			newCfg: immutableConfigMapWithChangedData,
> ++			valid:  false,
> + 		},
> + 	}
> + 
> + 	for _, tc := range cases {
> +-		errs := ValidateConfigMapUpdate(&tc.newCfg, &tc.oldCfg)
> +-		if tc.isValid && len(errs) > 0 {
> +-			t.Errorf("%v: unexpected error: %v", tc.name, errs)
> +-		}
> +-		if !tc.isValid && len(errs) == 0 {
> +-			t.Errorf("%v: unexpected non-error", tc.name)
> +-		}
> ++		t.Run(tc.name, func(t *testing.T) {
> ++			errs := ValidateConfigMapUpdate(&tc.newCfg, &tc.oldCfg)
> ++			if tc.valid && len(errs) > 0 {
> ++				t.Errorf("Unexpected error: %v", errs)
> ++			}
> ++			if !tc.valid && len(errs) == 0 {
> ++				t.Errorf("Unexpected lack of error")
> ++			}
> ++		})
> + 	}
> + }
> + 
> +diff --git a/pkg/features/kube_features.go b/pkg/features/kube_features.go
> +index 309dbb2955663..00da711112d71 100644
> +--- a/src/import/pkg/features/kube_features.go
> ++++ b/src/import/pkg/features/kube_features.go
> +@@ -548,6 +548,12 @@ const (
> + 	//
> + 	// Enables topology aware service routing
> + 	ServiceTopology featuregate.Feature = "ServiceTopology"
> ++
> ++	// owner: @wojtek-t
> ++	// alpha: v1.18
> ++	//
> ++	// Enables a feature to make secrets and configmaps data immutable.
> ++	ImmutableEphemeralVolumes featuregate.Feature = "ImmutableEphemeralVolumes"
> + )
> + 
> + func init() {
> +@@ -634,6 +640,7 @@ var defaultKubernetesFeatureGates = map[featuregate.Feature]featuregate.FeatureS
> + 	AllowInsecureBackendProxy:                      {Default: true, PreRelease: featuregate.Beta},
> + 	PodDisruptionBudget:                            {Default: true, PreRelease: featuregate.Beta},
> + 	ServiceTopology:                                {Default: false, PreRelease: featuregate.Alpha},
> ++	ImmutableEphemeralVolumes:                      {Default: false, PreRelease: featuregate.Alpha},
> + 
> + 	// inherited features from generic apiserver, relisted here to get a conflict if it is changed
> + 	// unintentionally on either side:
> +diff --git a/pkg/registry/core/configmap/strategy.go b/pkg/registry/core/configmap/strategy.go
> +index 4f8bf42e3bd60..d592c181c0c2e 100644
> +--- a/src/import/pkg/registry/core/configmap/strategy.go
> ++++ b/src/import/pkg/registry/core/configmap/strategy.go
> +@@ -28,9 +28,11 @@ import (
> + 	"k8s.io/apiserver/pkg/registry/rest"
> + 	pkgstorage "k8s.io/apiserver/pkg/storage"
> + 	"k8s.io/apiserver/pkg/storage/names"
> ++	utilfeature "k8s.io/apiserver/pkg/util/feature"
> + 	"k8s.io/kubernetes/pkg/api/legacyscheme"
> + 	api "k8s.io/kubernetes/pkg/apis/core"
> + 	"k8s.io/kubernetes/pkg/apis/core/validation"
> ++	"k8s.io/kubernetes/pkg/features"
> + )
> + 
> + // strategy implements behavior for ConfigMap objects
> +@@ -54,7 +56,8 @@ func (strategy) NamespaceScoped() bool {
> + }
> + 
> + func (strategy) PrepareForCreate(ctx context.Context, obj runtime.Object) {
> +-	_ = obj.(*api.ConfigMap)
> ++	configMap := obj.(*api.ConfigMap)
> ++	dropDisabledFields(configMap, nil)
> + }
> + 
> + func (strategy) Validate(ctx context.Context, obj runtime.Object) field.ErrorList {
> +@@ -72,12 +75,9 @@ func (strategy) AllowCreateOnUpdate() bool {
> + }
> + 
> + func (strategy) PrepareForUpdate(ctx context.Context, newObj, oldObj runtime.Object) {
> +-	_ = oldObj.(*api.ConfigMap)
> +-	_ = newObj.(*api.ConfigMap)
> +-}
> +-
> +-func (strategy) AllowUnconditionalUpdate() bool {
> +-	return true
> ++	oldConfigMap := oldObj.(*api.ConfigMap)
> ++	newConfigMap := newObj.(*api.ConfigMap)
> ++	dropDisabledFields(newConfigMap, oldConfigMap)
> + }
> + 
> + func (strategy) ValidateUpdate(ctx context.Context, newObj, oldObj runtime.Object) field.ErrorList {
> +@@ -86,6 +86,20 @@ func (strategy) ValidateUpdate(ctx context.Context, newObj, oldObj runtime.Objec
> + 	return validation.ValidateConfigMapUpdate(newCfg, oldCfg)
> + }
> + 
> ++func isImmutableInUse(configMap *api.ConfigMap) bool {
> ++	return configMap != nil && configMap.Immutable != nil
> ++}
> ++
> ++func dropDisabledFields(configMap *api.ConfigMap, oldConfigMap *api.ConfigMap) {
> ++	if !utilfeature.DefaultFeatureGate.Enabled(features.ImmutableEphemeralVolumes) && !isImmutableInUse(oldConfigMap) {
> ++		configMap.Immutable = nil
> ++	}
> ++}
> ++
> ++func (strategy) AllowUnconditionalUpdate() bool {
> ++	return true
> ++}
> ++
> + // GetAttrs returns labels and fields of a given object for filtering purposes.
> + func GetAttrs(obj runtime.Object) (labels.Set, fields.Set, error) {
> + 	configMap, ok := obj.(*api.ConfigMap)
> +diff --git a/pkg/registry/core/secret/strategy.go b/pkg/registry/core/secret/strategy.go
> +index 1701805065e6c..0d5908d8975f1 100644
> +--- a/src/import/pkg/registry/core/secret/strategy.go
> ++++ b/src/import/pkg/registry/core/secret/strategy.go
> +@@ -29,9 +29,11 @@ import (
> + 	"k8s.io/apiserver/pkg/registry/rest"
> + 	pkgstorage "k8s.io/apiserver/pkg/storage"
> + 	"k8s.io/apiserver/pkg/storage/names"
> ++	utilfeature "k8s.io/apiserver/pkg/util/feature"
> + 	"k8s.io/kubernetes/pkg/api/legacyscheme"
> + 	api "k8s.io/kubernetes/pkg/apis/core"
> + 	"k8s.io/kubernetes/pkg/apis/core/validation"
> ++	"k8s.io/kubernetes/pkg/features"
> + )
> + 
> + // strategy implements behavior for Secret objects
> +@@ -53,6 +55,8 @@ func (strategy) NamespaceScoped() bool {
> + }
> + 
> + func (strategy) PrepareForCreate(ctx context.Context, obj runtime.Object) {
> ++	secret := obj.(*api.Secret)
> ++	dropDisabledFields(secret, nil)
> + }
> + 
> + func (strategy) Validate(ctx context.Context, obj runtime.Object) field.ErrorList {
> +@@ -67,12 +71,25 @@ func (strategy) AllowCreateOnUpdate() bool {
> + }
> + 
> + func (strategy) PrepareForUpdate(ctx context.Context, obj, old runtime.Object) {
> ++	newSecret := obj.(*api.Secret)
> ++	oldSecret := old.(*api.Secret)
> ++	dropDisabledFields(newSecret, oldSecret)
> + }
> + 
> + func (strategy) ValidateUpdate(ctx context.Context, obj, old runtime.Object) field.ErrorList {
> + 	return validation.ValidateSecretUpdate(obj.(*api.Secret), old.(*api.Secret))
> + }
> + 
> ++func isImmutableInUse(secret *api.Secret) bool {
> ++	return secret != nil && secret.Immutable != nil
> ++}
> ++
> ++func dropDisabledFields(secret *api.Secret, oldSecret *api.Secret) {
> ++	if !utilfeature.DefaultFeatureGate.Enabled(features.ImmutableEphemeralVolumes) && !isImmutableInUse(oldSecret) {
> ++		secret.Immutable = nil
> ++	}
> ++}
> ++
> + func (strategy) AllowUnconditionalUpdate() bool {
> + 	return true
> + }
> +diff --git a/staging/src/k8s.io/api/core/v1/types.go b/staging/src/k8s.io/api/core/v1/types.go
> +index a78372aeaffa7..1e3aa51730427 100644
> +--- a/src/import/staging/src/k8s.io/api/core/v1/types.go
> ++++ b/src/import/staging/src/k8s.io/api/core/v1/types.go
> +@@ -5424,6 +5424,14 @@ type Secret struct {
> + 	// +optional
> + 	metav1.ObjectMeta `json:"metadata,omitempty" protobuf:"bytes,1,opt,name=metadata"`
> + 
> ++	// Immutable, if set to true, ensures that data stored in the Secret cannot
> ++	// be updated (only object metadata can be modified).
> ++	// If not set to true, the field can be modified at any time.
> ++	// Defaulted to nil.
> ++	// This is an alpha field enabled by ImmutableEphemeralVolumes feature gate.
> ++	// +optional
> ++	Immutable *bool `json:"immutable,omitempty"`
> ++
> + 	// Data contains the secret data. Each key must consist of alphanumeric
> + 	// characters, '-', '_' or '.'. The serialized form of the secret data is a
> + 	// base64 encoded string, representing the arbitrary (possibly non-string)
> +@@ -5557,6 +5565,14 @@ type ConfigMap struct {
> + 	// +optional
> + 	metav1.ObjectMeta `json:"metadata,omitempty" protobuf:"bytes,1,opt,name=metadata"`
> + 
> ++	// Immutable, if set to true, ensures that data stored in the ConfigMap cannot
> ++	// be updated (only object metadata can be modified).
> ++	// If not set to true, the field can be modified at any time.
> ++	// Defaulted to nil.
> ++	// This is an alpha field enabled by ImmutableEphemeralVolumes feature gate.
> ++	// +optional
> ++	Immutable *bool `json:"immutable,omitempty"`
> ++
> + 	// Data contains the configuration data.
> + 	// Each key must consist of alphanumeric characters, '-', '_' or '.'.
> + 	// Values with non-UTF-8 byte sequences must use the BinaryData field.
> +diff --git a/staging/src/k8s.io/cli-runtime/pkg/kustomize/k8sdeps/transformer/hash/hash.go b/staging/src/k8s.io/cli-runtime/pkg/kustomize/k8sdeps/transformer/hash/hash.go
> +index 17e24ff3e6443..85bf1e731c3fb 100644
> +--- a/src/import/staging/src/k8s.io/cli-runtime/pkg/kustomize/k8sdeps/transformer/hash/hash.go
> ++++ b/src/import/staging/src/k8s.io/cli-runtime/pkg/kustomize/k8sdeps/transformer/hash/hash.go
> +@@ -90,7 +90,14 @@ func SecretHash(sec *v1.Secret) (string, error) {
> + // Data, Kind, and Name are taken into account.
> + func encodeConfigMap(cm *v1.ConfigMap) (string, error) {
> + 	// json.Marshal sorts the keys in a stable order in the encoding
> +-	m := map[string]interface{}{"kind": "ConfigMap", "name": cm.Name, "data": cm.Data}
> ++	m := map[string]interface{}{
> ++		"kind": "ConfigMap",
> ++		"name": cm.Name,
> ++		"data": cm.Data,
> ++	}
> ++	if cm.Immutable != nil {
> ++		m["immutable"] = *cm.Immutable
> ++	}
> + 	if len(cm.BinaryData) > 0 {
> + 		m["binaryData"] = cm.BinaryData
> + 	}
> +@@ -105,7 +112,16 @@ func encodeConfigMap(cm *v1.ConfigMap) (string, error) {
> + // Data, Kind, Name, and Type are taken into account.
> + func encodeSecret(sec *v1.Secret) (string, error) {
> + 	// json.Marshal sorts the keys in a stable order in the encoding
> +-	data, err := json.Marshal(map[string]interface{}{"kind": "Secret", "type": sec.Type, "name": sec.Name, "data": sec.Data})
> ++	m := map[string]interface{}{
> ++		"kind": "Secret",
> ++		"type": sec.Type,
> ++		"name": sec.Name,
> ++		"data": sec.Data,
> ++	}
> ++	if sec.Immutable != nil {
> ++		m["immutable"] = *sec.Immutable
> ++	}
> ++	data, err := json.Marshal(m)
> + 	if err != nil {
> + 		return "", err
> + 	}
> +diff --git a/staging/src/k8s.io/cli-runtime/pkg/kustomize/k8sdeps/transformer/hash/hash_test.go b/staging/src/k8s.io/cli-runtime/pkg/kustomize/k8sdeps/transformer/hash/hash_test.go
> +index 2d336f35a824e..144fe444e4cac 100644
> +--- a/src/import/staging/src/k8s.io/cli-runtime/pkg/kustomize/k8sdeps/transformer/hash/hash_test.go
> ++++ b/src/import/staging/src/k8s.io/cli-runtime/pkg/kustomize/k8sdeps/transformer/hash/hash_test.go
> +@@ -178,8 +178,8 @@ not their metadata (e.g. the Data of a ConfigMap, but nothing in ObjectMeta).
> + 		obj      interface{}
> + 		expect   int
> + 	}{
> +-		{"ConfigMap", v1.ConfigMap{}, 4},
> +-		{"Secret", v1.Secret{}, 5},
> ++		{"ConfigMap", v1.ConfigMap{}, 5},
> ++		{"Secret", v1.Secret{}, 6},
> + 	}
> + 	for _, c := range cases {
> + 		val := reflect.ValueOf(c.obj)
> +diff --git a/staging/src/k8s.io/kubectl/pkg/util/hash/hash.go b/staging/src/k8s.io/kubectl/pkg/util/hash/hash.go
> +index de0036245d2f1..1b20f384b7098 100644
> +--- a/src/import/staging/src/k8s.io/kubectl/pkg/util/hash/hash.go
> ++++ b/src/import/staging/src/k8s.io/kubectl/pkg/util/hash/hash.go
> +@@ -56,7 +56,14 @@ func SecretHash(sec *v1.Secret) (string, error) {
> + // Data, Kind, and Name are taken into account.
> + func encodeConfigMap(cm *v1.ConfigMap) (string, error) {
> + 	// json.Marshal sorts the keys in a stable order in the encoding
> +-	m := map[string]interface{}{"kind": "ConfigMap", "name": cm.Name, "data": cm.Data}
> ++	m := map[string]interface{}{
> ++		"kind": "ConfigMap",
> ++		"name": cm.Name,
> ++		"data": cm.Data,
> ++	}
> ++	if cm.Immutable != nil {
> ++		m["immutable"] = *cm.Immutable
> ++	}
> + 	if len(cm.BinaryData) > 0 {
> + 		m["binaryData"] = cm.BinaryData
> + 	}
> +@@ -70,8 +77,17 @@ func encodeConfigMap(cm *v1.ConfigMap) (string, error) {
> + // encodeSecret encodes a Secret.
> + // Data, Kind, Name, and Type are taken into account.
> + func encodeSecret(sec *v1.Secret) (string, error) {
> ++	m := map[string]interface{}{
> ++		"kind": "Secret",
> ++		"type": sec.Type,
> ++		"name": sec.Name,
> ++		"data": sec.Data,
> ++	}
> ++	if sec.Immutable != nil {
> ++		m["immutable"] = *sec.Immutable
> ++	}
> + 	// json.Marshal sorts the keys in a stable order in the encoding
> +-	data, err := json.Marshal(map[string]interface{}{"kind": "Secret", "type": sec.Type, "name": sec.Name, "data": sec.Data})
> ++	data, err := json.Marshal(m)
> + 	if err != nil {
> + 		return "", err
> + 	}
> +diff --git a/staging/src/k8s.io/kubectl/pkg/util/hash/hash_test.go b/staging/src/k8s.io/kubectl/pkg/util/hash/hash_test.go
> +index f527a98a2026c..455459c3b3df5 100644
> +--- a/src/import/staging/src/k8s.io/kubectl/pkg/util/hash/hash_test.go
> ++++ b/src/import/staging/src/k8s.io/kubectl/pkg/util/hash/hash_test.go
> +@@ -164,8 +164,8 @@ not their metadata (e.g. the Data of a ConfigMap, but nothing in ObjectMeta).
> + 		obj      interface{}
> + 		expect   int
> + 	}{
> +-		{"ConfigMap", v1.ConfigMap{}, 4},
> +-		{"Secret", v1.Secret{}, 5},
> ++		{"ConfigMap", v1.ConfigMap{}, 5},
> ++		{"Secret", v1.Secret{}, 6},
> + 	}
> + 	for _, c := range cases {
> + 		val := reflect.ValueOf(c.obj)
> diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2021-25735.patch b/recipes-containers/kubernetes/kubernetes/CVE-2021-25735.patch
> new file mode 100644
> index 00000000..dce50f3e
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/CVE-2021-25735.patch
> @@ -0,0 +1,535 @@
> +From 7d4efe7ad8cf06c0c1d6092cf1f77964edb8016f Mon Sep 17 00:00:00 2001
> +From: David Eads <deads@redhat.com>
> +Date: Fri, 29 Jan 2021 13:47:31 -0500
> +Subject: [PATCH 1/8] tweak validation to avoid mutation
> +
> +Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/commit/d57f0641d60b73934ebc2cdf4b6a63182217d10c]
> +CVE: CVE-2021-25735
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + pkg/apis/core/validation/validation.go | 46 +++++++++-----------------
> + 1 file changed, 15 insertions(+), 31 deletions(-)
> +
> +diff --git a/pkg/apis/core/validation/validation.go b/pkg/apis/core/validation/validation.go
> +index 8e3cfd9d9e4..89e5b5811c4 100644
> +--- a/src/import/pkg/apis/core/validation/validation.go
> ++++ b/src/import/pkg/apis/core/validation/validation.go
> +@@ -29,8 +29,6 @@ import (
> + 	"unicode"
> + 	"unicode/utf8"
> + 
> +-	"k8s.io/klog"
> +-
> + 	"k8s.io/api/core/v1"
> + 	apiequality "k8s.io/apimachinery/pkg/api/equality"
> + 	"k8s.io/apimachinery/pkg/api/resource"
> +@@ -4530,11 +4528,8 @@ func ValidateNodeUpdate(node, oldNode *core.Node) field.ErrorList {
> + 		addresses[address] = true
> + 	}
> + 
> +-	if len(oldNode.Spec.PodCIDRs) == 0 {
> +-		// Allow the controller manager to assign a CIDR to a node if it doesn't have one.
> +-		//this is a no op for a string slice.
> +-		oldNode.Spec.PodCIDRs = node.Spec.PodCIDRs
> +-	} else {
> ++	// Allow the controller manager to assign a CIDR to a node if it doesn't have one.
> ++	if len(oldNode.Spec.PodCIDRs) > 0 {
> + 		// compare the entire slice
> + 		if len(oldNode.Spec.PodCIDRs) != len(node.Spec.PodCIDRs) {
> + 			allErrs = append(allErrs, field.Forbidden(field.NewPath("spec", "podCIDRs"), "node updates may not change podCIDR except from \"\" to valid"))
> +@@ -4548,46 +4543,35 @@ func ValidateNodeUpdate(node, oldNode *core.Node) field.ErrorList {
> + 	}
> + 
> + 	// Allow controller manager updating provider ID when not set
> +-	if len(oldNode.Spec.ProviderID) == 0 {
> +-		oldNode.Spec.ProviderID = node.Spec.ProviderID
> +-	} else {
> +-		if oldNode.Spec.ProviderID != node.Spec.ProviderID {
> +-			allErrs = append(allErrs, field.Forbidden(field.NewPath("spec", "providerID"), "node updates may not change providerID except from \"\" to valid"))
> +-		}
> ++	if len(oldNode.Spec.ProviderID) > 0 && oldNode.Spec.ProviderID != node.Spec.ProviderID {
> ++		allErrs = append(allErrs, field.Forbidden(field.NewPath("spec", "providerID"), "node updates may not change providerID except from \"\" to valid"))
> + 	}
> + 
> + 	if node.Spec.ConfigSource != nil {
> + 		allErrs = append(allErrs, validateNodeConfigSourceSpec(node.Spec.ConfigSource, field.NewPath("spec", "configSource"))...)
> + 	}
> +-	oldNode.Spec.ConfigSource = node.Spec.ConfigSource
> + 	if node.Status.Config != nil {
> + 		allErrs = append(allErrs, validateNodeConfigStatus(node.Status.Config, field.NewPath("status", "config"))...)
> + 	}
> +-	oldNode.Status.Config = node.Status.Config
> +-
> +-	// TODO: move reset function to its own location
> +-	// Ignore metadata changes now that they have been tested
> +-	oldNode.ObjectMeta = node.ObjectMeta
> +-	// Allow users to update capacity
> +-	oldNode.Status.Capacity = node.Status.Capacity
> +-	// Allow users to unschedule node
> +-	oldNode.Spec.Unschedulable = node.Spec.Unschedulable
> +-	// Clear status
> +-	oldNode.Status = node.Status
> + 
> + 	// update taints
> + 	if len(node.Spec.Taints) > 0 {
> + 		allErrs = append(allErrs, validateNodeTaints(node.Spec.Taints, fldPath.Child("taints"))...)
> + 	}
> +-	oldNode.Spec.Taints = node.Spec.Taints
> + 
> +-	// We made allowed changes to oldNode, and now we compare oldNode to node. Any remaining differences indicate changes to protected fields.
> +-	// TODO: Add a 'real' error type for this error and provide print actual diffs.
> +-	if !apiequality.Semantic.DeepEqual(oldNode, node) {
> +-		klog.V(4).Infof("Update failed validation %#v vs %#v", oldNode, node)
> +-		allErrs = append(allErrs, field.Forbidden(field.NewPath(""), "node updates may only change labels, taints, or capacity (or configSource, if the DynamicKubeletConfig feature gate is enabled)"))
> ++	if node.Spec.DoNotUseExternalID != oldNode.Spec.DoNotUseExternalID {
> ++		allErrs = append(allErrs, field.Forbidden(field.NewPath("spec", "externalID"), "may not be updated"))
> + 	}
> + 
> ++	// status and metadata are allowed change (barring restrictions above), so separately test spec field.
> ++	// spec only has a few fields, so check the ones we don't allow changing
> ++	//  1. PodCIDRs - immutable after first set - checked above
> ++	//  2. ProviderID - immutable after first set - checked above
> ++	//  3. Unschedulable - allowed to change
> ++	//  4. Taints - allowed to change
> ++	//  5. ConfigSource - allowed to change (and checked above)
> ++	//  6. DoNotUseExternalID - immutable - checked above
> ++
> + 	return allErrs
> + }
> + 
> +-- 
> +2.25.1
> +
> +
> +From 0ef8605f4535713f17ede4bcf162ad513cbf6900 Mon Sep 17 00:00:00 2001
> +From: David Eads <deads@redhat.com>
> +Date: Mon, 15 Feb 2021 16:21:42 -0500
> +Subject: [PATCH 2/8] remove unnecessary mutations in validation
> +
> +These mutations are already done in the strategy
> +---
> + pkg/apis/core/validation/validation.go | 22 ++--------------------
> + 1 file changed, 2 insertions(+), 20 deletions(-)
> +
> +diff --git a/pkg/apis/core/validation/validation.go b/pkg/apis/core/validation/validation.go
> +index 89e5b5811c4..3381f2a37c2 100644
> +--- a/src/import/pkg/apis/core/validation/validation.go
> ++++ b/src/import/pkg/apis/core/validation/validation.go
> +@@ -1874,13 +1874,11 @@ func ValidatePersistentVolumeUpdate(newPv, oldPv *core.PersistentVolume) field.E
> + }
> + 
> + // ValidatePersistentVolumeStatusUpdate tests to see if the status update is legal for an end user to make.
> +-// newPv is updated with fields that cannot be changed.
> + func ValidatePersistentVolumeStatusUpdate(newPv, oldPv *core.PersistentVolume) field.ErrorList {
> + 	allErrs := ValidateObjectMetaUpdate(&newPv.ObjectMeta, &oldPv.ObjectMeta, field.NewPath("metadata"))
> + 	if len(newPv.ResourceVersion) == 0 {
> + 		allErrs = append(allErrs, field.Required(field.NewPath("resourceVersion"), ""))
> + 	}
> +-	newPv.Spec = oldPv.Spec
> + 	return allErrs
> + }
> + 
> +@@ -2026,7 +2024,6 @@ func ValidatePersistentVolumeClaimStatusUpdate(newPvc, oldPvc *core.PersistentVo
> + 	for r, qty := range newPvc.Status.Capacity {
> + 		allErrs = append(allErrs, validateBasicResource(qty, capPath.Key(string(r)))...)
> + 	}
> +-	newPvc.Spec = oldPvc.Spec
> + 	return allErrs
> + }
> + 
> +@@ -3795,8 +3792,7 @@ func ValidateContainerStateTransition(newStatuses, oldStatuses []core.ContainerS
> + 	return allErrs
> + }
> + 
> +-// ValidatePodStatusUpdate tests to see if the update is legal for an end user to make. newPod is updated with fields
> +-// that cannot be changed.
> ++// ValidatePodStatusUpdate tests to see if the update is legal for an end user to make.
> + func ValidatePodStatusUpdate(newPod, oldPod *core.Pod) field.ErrorList {
> + 	fldPath := field.NewPath("metadata")
> + 	allErrs := ValidateObjectMetaUpdate(&newPod.ObjectMeta, &oldPod.ObjectMeta, fldPath)
> +@@ -3819,9 +3815,6 @@ func ValidatePodStatusUpdate(newPod, oldPod *core.Pod) field.ErrorList {
> + 	allErrs = append(allErrs, ValidateContainerStateTransition(newPod.Status.ContainerStatuses, oldPod.Status.ContainerStatuses, fldPath.Child("containerStatuses"), oldPod.Spec.RestartPolicy)...)
> + 	allErrs = append(allErrs, ValidateContainerStateTransition(newPod.Status.InitContainerStatuses, oldPod.Status.InitContainerStatuses, fldPath.Child("initContainerStatuses"), oldPod.Spec.RestartPolicy)...)
> + 
> +-	// For status update we ignore changes to pod spec.
> +-	newPod.Spec = oldPod.Spec
> +-
> + 	return allErrs
> + }
> + 
> +@@ -5287,7 +5280,6 @@ func ValidateResourceQuantityValue(resource string, value resource.Quantity, fld
> + }
> + 
> + // ValidateResourceQuotaUpdate tests to see if the update is legal for an end user to make.
> +-// newResourceQuota is updated with fields that cannot be changed.
> + func ValidateResourceQuotaUpdate(newResourceQuota, oldResourceQuota *core.ResourceQuota) field.ErrorList {
> + 	allErrs := ValidateObjectMetaUpdate(&newResourceQuota.ObjectMeta, &oldResourceQuota.ObjectMeta, field.NewPath("metadata"))
> + 	allErrs = append(allErrs, ValidateResourceQuotaSpec(&newResourceQuota.Spec, field.NewPath("spec"))...)
> +@@ -5306,12 +5298,10 @@ func ValidateResourceQuotaUpdate(newResourceQuota, oldResourceQuota *core.Resour
> + 		allErrs = append(allErrs, field.Invalid(fldPath, newResourceQuota.Spec.Scopes, fieldImmutableErrorMsg))
> + 	}
> + 
> +-	newResourceQuota.Status = oldResourceQuota.Status
> + 	return allErrs
> + }
> + 
> + // ValidateResourceQuotaStatusUpdate tests to see if the status update is legal for an end user to make.
> +-// newResourceQuota is updated with fields that cannot be changed.
> + func ValidateResourceQuotaStatusUpdate(newResourceQuota, oldResourceQuota *core.ResourceQuota) field.ErrorList {
> + 	allErrs := ValidateObjectMetaUpdate(&newResourceQuota.ObjectMeta, &oldResourceQuota.ObjectMeta, field.NewPath("metadata"))
> + 	if len(newResourceQuota.ResourceVersion) == 0 {
> +@@ -5329,7 +5319,6 @@ func ValidateResourceQuotaStatusUpdate(newResourceQuota, oldResourceQuota *core.
> + 		allErrs = append(allErrs, ValidateResourceQuotaResourceName(string(k), resPath)...)
> + 		allErrs = append(allErrs, ValidateResourceQuantityValue(string(k), v, resPath)...)
> + 	}
> +-	newResourceQuota.Spec = oldResourceQuota.Spec
> + 	return allErrs
> + }
> + 
> +@@ -5362,19 +5351,14 @@ func validateKubeFinalizerName(stringValue string, fldPath *field.Path) field.Er
> + }
> + 
> + // ValidateNamespaceUpdate tests to make sure a namespace update can be applied.
> +-// newNamespace is updated with fields that cannot be changed
> + func ValidateNamespaceUpdate(newNamespace *core.Namespace, oldNamespace *core.Namespace) field.ErrorList {
> + 	allErrs := ValidateObjectMetaUpdate(&newNamespace.ObjectMeta, &oldNamespace.ObjectMeta, field.NewPath("metadata"))
> +-	newNamespace.Spec.Finalizers = oldNamespace.Spec.Finalizers
> +-	newNamespace.Status = oldNamespace.Status
> + 	return allErrs
> + }
> + 
> +-// ValidateNamespaceStatusUpdate tests to see if the update is legal for an end user to make. newNamespace is updated with fields
> +-// that cannot be changed.
> ++// ValidateNamespaceStatusUpdate tests to see if the update is legal for an end user to make.
> + func ValidateNamespaceStatusUpdate(newNamespace, oldNamespace *core.Namespace) field.ErrorList {
> + 	allErrs := ValidateObjectMetaUpdate(&newNamespace.ObjectMeta, &oldNamespace.ObjectMeta, field.NewPath("metadata"))
> +-	newNamespace.Spec = oldNamespace.Spec
> + 	if newNamespace.DeletionTimestamp.IsZero() {
> + 		if newNamespace.Status.Phase != core.NamespaceActive {
> + 			allErrs = append(allErrs, field.Invalid(field.NewPath("status", "Phase"), newNamespace.Status.Phase, "may only be 'Active' if `deletionTimestamp` is empty"))
> +@@ -5388,7 +5372,6 @@ func ValidateNamespaceStatusUpdate(newNamespace, oldNamespace *core.Namespace) f
> + }
> + 
> + // ValidateNamespaceFinalizeUpdate tests to see if the update is legal for an end user to make.
> +-// newNamespace is updated with fields that cannot be changed.
> + func ValidateNamespaceFinalizeUpdate(newNamespace, oldNamespace *core.Namespace) field.ErrorList {
> + 	allErrs := ValidateObjectMetaUpdate(&newNamespace.ObjectMeta, &oldNamespace.ObjectMeta, field.NewPath("metadata"))
> + 
> +@@ -5397,7 +5380,6 @@ func ValidateNamespaceFinalizeUpdate(newNamespace, oldNamespace *core.Namespace)
> + 		idxPath := fldPath.Index(i)
> + 		allErrs = append(allErrs, validateFinalizerName(string(newNamespace.Spec.Finalizers[i]), idxPath)...)
> + 	}
> +-	newNamespace.Status = oldNamespace.Status
> + 	return allErrs
> + }
> + 
> +-- 
> +2.25.1
> +
> +
> +From 198ac41f97e11140b634274e34f0102e33806145 Mon Sep 17 00:00:00 2001
> +From: David Eads <deads@redhat.com>
> +Date: Mon, 15 Feb 2021 16:55:41 -0500
> +Subject: [PATCH 3/8] move secret mutation from validation to prepareforupdate
> +
> +---
> + pkg/apis/core/validation/validation.go | 4 ----
> + pkg/registry/core/secret/strategy.go   | 6 ++++++
> + 2 files changed, 6 insertions(+), 4 deletions(-)
> +
> +diff --git a/pkg/apis/core/validation/validation.go b/pkg/apis/core/validation/validation.go
> +index 3381f2a37c2..9775b268e90 100644
> +--- a/src/import/pkg/apis/core/validation/validation.go
> ++++ b/src/import/pkg/apis/core/validation/validation.go
> +@@ -4977,10 +4977,6 @@ func ValidateSecret(secret *core.Secret) field.ErrorList {
> + func ValidateSecretUpdate(newSecret, oldSecret *core.Secret) field.ErrorList {
> + 	allErrs := ValidateObjectMetaUpdate(&newSecret.ObjectMeta, &oldSecret.ObjectMeta, field.NewPath("metadata"))
> + 
> +-	if len(newSecret.Type) == 0 {
> +-		newSecret.Type = oldSecret.Type
> +-	}
> +-
> + 	allErrs = append(allErrs, ValidateImmutableField(newSecret.Type, oldSecret.Type, field.NewPath("type"))...)
> + 	if oldSecret.Immutable != nil && *oldSecret.Immutable {
> + 		if !reflect.DeepEqual(newSecret.Immutable, oldSecret.Immutable) {
> +diff --git a/pkg/registry/core/secret/strategy.go b/pkg/registry/core/secret/strategy.go
> +index 0d5908d8975..aad00387ac1 100644
> +--- a/src/import/pkg/registry/core/secret/strategy.go
> ++++ b/src/import/pkg/registry/core/secret/strategy.go
> +@@ -73,6 +73,12 @@ func (strategy) AllowCreateOnUpdate() bool {
> + func (strategy) PrepareForUpdate(ctx context.Context, obj, old runtime.Object) {
> + 	newSecret := obj.(*api.Secret)
> + 	oldSecret := old.(*api.Secret)
> ++
> ++	// this is weird, but consistent with what the validatedUpdate function used to do.
> ++	if len(newSecret.Type) == 0 {
> ++		newSecret.Type = oldSecret.Type
> ++	}
> ++
> + 	dropDisabledFields(newSecret, oldSecret)
> + }
> + 
> +-- 
> +2.25.1
> +
> +
> +From 7973d58ea8fe93c2be920a766c7c5d6a4a2529e6 Mon Sep 17 00:00:00 2001
> +From: David Eads <deads@redhat.com>
> +Date: Mon, 15 Feb 2021 17:18:11 -0500
> +Subject: [PATCH 4/8] add markers for inspected validation mutation hits
> +
> +---
> + pkg/apis/core/validation/validation.go                 | 10 +++++-----
> + .../pkg/apis/apiextensions/validation/validation.go    |  2 +-
> + 2 files changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/pkg/apis/core/validation/validation.go b/pkg/apis/core/validation/validation.go
> +index 9775b268e90..6f634db468e 100644
> +--- a/src/import/pkg/apis/core/validation/validation.go
> ++++ b/src/import/pkg/apis/core/validation/validation.go
> +@@ -1953,7 +1953,7 @@ func ValidatePersistentVolumeClaimUpdate(newPvc, oldPvc *core.PersistentVolumeCl
> + 	// Claims are immutable in order to enforce quota, range limits, etc. without gaming the system.
> + 	if len(oldPvc.Spec.VolumeName) == 0 {
> + 		// volumeName changes are allowed once.
> +-		oldPvcClone.Spec.VolumeName = newPvcClone.Spec.VolumeName
> ++		oldPvcClone.Spec.VolumeName = newPvcClone.Spec.VolumeName // +k8s:verify-mutation:reason=clone
> + 	}
> + 
> + 	if validateStorageClassUpgrade(oldPvcClone.Annotations, newPvcClone.Annotations,
> +@@ -1969,7 +1969,7 @@ func ValidatePersistentVolumeClaimUpdate(newPvc, oldPvc *core.PersistentVolumeCl
> + 	if utilfeature.DefaultFeatureGate.Enabled(features.ExpandPersistentVolumes) {
> + 		// lets make sure storage values are same.
> + 		if newPvc.Status.Phase == core.ClaimBound && newPvcClone.Spec.Resources.Requests != nil {
> +-			newPvcClone.Spec.Resources.Requests["storage"] = oldPvc.Spec.Resources.Requests["storage"]
> ++			newPvcClone.Spec.Resources.Requests["storage"] = oldPvc.Spec.Resources.Requests["storage"] // +k8s:verify-mutation:reason=clone
> + 		}
> + 
> + 		oldSize := oldPvc.Spec.Resources.Requests["storage"]
> +@@ -2317,13 +2317,13 @@ func GetVolumeMountMap(mounts []core.VolumeMount) map[string]string {
> + }
> + 
> + func GetVolumeDeviceMap(devices []core.VolumeDevice) map[string]string {
> +-	voldevices := make(map[string]string)
> ++	volDevices := make(map[string]string)
> + 
> + 	for _, dev := range devices {
> +-		voldevices[dev.Name] = dev.DevicePath
> ++		volDevices[dev.Name] = dev.DevicePath
> + 	}
> + 
> +-	return voldevices
> ++	return volDevices
> + }
> + 
> + func ValidateVolumeMounts(mounts []core.VolumeMount, voldevices map[string]string, volumes map[string]core.VolumeSource, container *core.Container, fldPath *field.Path) field.ErrorList {
> +diff --git a/staging/src/k8s.io/apiextensions-apiserver/pkg/apis/apiextensions/validation/validation.go b/staging/src/k8s.io/apiextensions-apiserver/pkg/apis/apiextensions/validation/validation.go
> +index f570dd82a4b..2bc72643c85 100644
> +--- a/src/import/staging/src/k8s.io/apiextensions-apiserver/pkg/apis/apiextensions/validation/validation.go
> ++++ b/src/import/staging/src/k8s.io/apiextensions-apiserver/pkg/apis/apiextensions/validation/validation.go
> +@@ -1304,7 +1304,7 @@ func validateAPIApproval(newCRD, oldCRD *apiextensions.CustomResourceDefinition,
> + 	var oldApprovalState *apihelpers.APIApprovalState
> + 	if oldCRD != nil {
> + 		t, _ := apihelpers.GetAPIApprovalState(oldCRD.Annotations)
> +-		oldApprovalState = &t
> ++		oldApprovalState = &t // +k8s:verify-mutation:reason=clone
> + 	}
> + 	newApprovalState, reason := apihelpers.GetAPIApprovalState(newCRD.Annotations)
> + 
> +-- 
> +2.25.1
> +
> +
> +From 0b8dcbecdc093829aaccee7bf541ef8cae7f3848 Mon Sep 17 00:00:00 2001
> +From: David Eads <deads@redhat.com>
> +Date: Mon, 15 Feb 2021 17:33:34 -0500
> +Subject: [PATCH 5/8] remove pod toleration toleration seconds mutation
> +
> +---
> + pkg/apis/core/validation/validation.go | 16 ++++++++--------
> + 1 file changed, 8 insertions(+), 8 deletions(-)
> +
> +diff --git a/pkg/apis/core/validation/validation.go b/pkg/apis/core/validation/validation.go
> +index 6f634db468e..4226047775b 100644
> +--- a/src/import/pkg/apis/core/validation/validation.go
> ++++ b/src/import/pkg/apis/core/validation/validation.go
> +@@ -2967,10 +2967,11 @@ func validateOnlyAddedTolerations(newTolerations []core.Toleration, oldToleratio
> + 	allErrs := field.ErrorList{}
> + 	for _, old := range oldTolerations {
> + 		found := false
> +-		old.TolerationSeconds = nil
> +-		for _, new := range newTolerations {
> +-			new.TolerationSeconds = nil
> +-			if reflect.DeepEqual(old, new) {
> ++		oldTolerationClone := old.DeepCopy()
> ++		for _, newToleration := range newTolerations {
> ++			// assign to our clone before doing a deep equal so we can allow tolerationseconds to change.
> ++			oldTolerationClone.TolerationSeconds = newToleration.TolerationSeconds // +k8s:verify-mutation:reason=clone
> ++			if reflect.DeepEqual(*oldTolerationClone, newToleration) {
> + 				found = true
> + 				break
> + 			}
> +@@ -3730,6 +3731,9 @@ func ValidatePodUpdate(newPod, oldPod *core.Pod) field.ErrorList {
> + 		allErrs = append(allErrs, field.Invalid(specPath.Child("activeDeadlineSeconds"), newPod.Spec.ActiveDeadlineSeconds, "must not update from a positive integer to nil value"))
> + 	}
> + 
> ++	// Allow only additions to tolerations updates.
> ++	allErrs = append(allErrs, validateOnlyAddedTolerations(newPod.Spec.Tolerations, oldPod.Spec.Tolerations, specPath.Child("tolerations"))...)
> ++
> + 	// handle updateable fields by munging those fields prior to deep equal comparison.
> + 	mungedPod := *newPod
> + 	// munge spec.containers[*].image
> +@@ -3753,10 +3757,6 @@ func ValidatePodUpdate(newPod, oldPod *core.Pod) field.ErrorList {
> + 		mungedPod.Spec.ActiveDeadlineSeconds = &activeDeadlineSeconds
> + 	}
> + 
> +-	// Allow only additions to tolerations updates.
> +-	mungedPod.Spec.Tolerations = oldPod.Spec.Tolerations
> +-	allErrs = append(allErrs, validateOnlyAddedTolerations(newPod.Spec.Tolerations, oldPod.Spec.Tolerations, specPath.Child("tolerations"))...)
> +-
> + 	if !apiequality.Semantic.DeepEqual(mungedPod.Spec, oldPod.Spec) {
> + 		// This diff isn't perfect, but it's a helluva lot better an "I'm not going to tell you what the difference is".
> + 		//TODO: Pinpoint the specific field that causes the invalid error after we have strategic merge diff
> +-- 
> +2.25.1
> +
> +
> +From db5696ebe654a487c0216bd0646ffb9872bac39a Mon Sep 17 00:00:00 2001
> +From: David Eads <deads@redhat.com>
> +Date: Mon, 15 Feb 2021 17:43:57 -0500
> +Subject: [PATCH 6/8] full deepcopy on munged pod spec
> +
> +---
> + pkg/apis/core/validation/validation.go | 30 ++++++++++++++++----------
> + 1 file changed, 19 insertions(+), 11 deletions(-)
> +
> +diff --git a/pkg/apis/core/validation/validation.go b/pkg/apis/core/validation/validation.go
> +index 4226047775b..d6eb9fe56f4 100644
> +--- a/src/import/pkg/apis/core/validation/validation.go
> ++++ b/src/import/pkg/apis/core/validation/validation.go
> +@@ -3734,33 +3734,41 @@ func ValidatePodUpdate(newPod, oldPod *core.Pod) field.ErrorList {
> + 	// Allow only additions to tolerations updates.
> + 	allErrs = append(allErrs, validateOnlyAddedTolerations(newPod.Spec.Tolerations, oldPod.Spec.Tolerations, specPath.Child("tolerations"))...)
> + 
> ++	// the last thing to check is pod spec equality.  If the pod specs are equal, then we can simply return the errors we have
> ++	// so far and save the cost of a deep copy.
> ++	if apiequality.Semantic.DeepEqual(newPod.Spec, oldPod.Spec) {
> ++		return allErrs
> ++	}
> ++
> + 	// handle updateable fields by munging those fields prior to deep equal comparison.
> +-	mungedPod := *newPod
> ++	mungedPodSpec := *newPod.Spec.DeepCopy()
> + 	// munge spec.containers[*].image
> + 	var newContainers []core.Container
> +-	for ix, container := range mungedPod.Spec.Containers {
> +-		container.Image = oldPod.Spec.Containers[ix].Image
> ++	for ix, container := range mungedPodSpec.Containers {
> ++		container.Image = oldPod.Spec.Containers[ix].Image // +k8s:verify-mutation:reason=clone
> + 		newContainers = append(newContainers, container)
> + 	}
> +-	mungedPod.Spec.Containers = newContainers
> ++	mungedPodSpec.Containers = newContainers
> + 	// munge spec.initContainers[*].image
> + 	var newInitContainers []core.Container
> +-	for ix, container := range mungedPod.Spec.InitContainers {
> +-		container.Image = oldPod.Spec.InitContainers[ix].Image
> ++	for ix, container := range mungedPodSpec.InitContainers {
> ++		container.Image = oldPod.Spec.InitContainers[ix].Image // +k8s:verify-mutation:reason=clone
> + 		newInitContainers = append(newInitContainers, container)
> + 	}
> +-	mungedPod.Spec.InitContainers = newInitContainers
> ++	mungedPodSpec.InitContainers = newInitContainers
> + 	// munge spec.activeDeadlineSeconds
> +-	mungedPod.Spec.ActiveDeadlineSeconds = nil
> ++	mungedPodSpec.ActiveDeadlineSeconds = nil
> + 	if oldPod.Spec.ActiveDeadlineSeconds != nil {
> + 		activeDeadlineSeconds := *oldPod.Spec.ActiveDeadlineSeconds
> +-		mungedPod.Spec.ActiveDeadlineSeconds = &activeDeadlineSeconds
> ++		mungedPodSpec.ActiveDeadlineSeconds = &activeDeadlineSeconds
> + 	}
> ++	// tolerations are checked before the deep copy, so munge those too
> ++	mungedPodSpec.Tolerations = oldPod.Spec.Tolerations // +k8s:verify-mutation:reason=clone
> + 
> +-	if !apiequality.Semantic.DeepEqual(mungedPod.Spec, oldPod.Spec) {
> ++	if !apiequality.Semantic.DeepEqual(mungedPodSpec, oldPod.Spec) {
> + 		// This diff isn't perfect, but it's a helluva lot better an "I'm not going to tell you what the difference is".
> + 		//TODO: Pinpoint the specific field that causes the invalid error after we have strategic merge diff
> +-		specDiff := diff.ObjectDiff(mungedPod.Spec, oldPod.Spec)
> ++		specDiff := diff.ObjectDiff(mungedPodSpec, oldPod.Spec)
> + 		allErrs = append(allErrs, field.Forbidden(specPath, fmt.Sprintf("pod updates may not change fields other than `spec.containers[*].image`, `spec.initContainers[*].image`, `spec.activeDeadlineSeconds` or `spec.tolerations` (only additions to existing tolerations)\n%v", specDiff)))
> + 	}
> + 
> +-- 
> +2.25.1
> +
> +
> +From 888666d4d5b96328f7e9d96c0946e9d7c8222f81 Mon Sep 17 00:00:00 2001
> +From: David Eads <deads@redhat.com>
> +Date: Wed, 17 Feb 2021 10:51:38 -0500
> +Subject: [PATCH 7/8] deepcopy statefulsets
> +
> +---
> + pkg/apis/apps/validation/validation.go | 20 +++++++-------------
> + 1 file changed, 7 insertions(+), 13 deletions(-)
> +
> +diff --git a/pkg/apis/apps/validation/validation.go b/pkg/apis/apps/validation/validation.go
> +index 6ac73cb6b7e..03e0d2024dd 100644
> +--- a/src/import/pkg/apis/apps/validation/validation.go
> ++++ b/src/import/pkg/apis/apps/validation/validation.go
> +@@ -144,21 +144,15 @@ func ValidateStatefulSet(statefulSet *apps.StatefulSet) field.ErrorList {
> + func ValidateStatefulSetUpdate(statefulSet, oldStatefulSet *apps.StatefulSet) field.ErrorList {
> + 	allErrs := apivalidation.ValidateObjectMetaUpdate(&statefulSet.ObjectMeta, &oldStatefulSet.ObjectMeta, field.NewPath("metadata"))
> + 
> +-	restoreReplicas := statefulSet.Spec.Replicas
> +-	statefulSet.Spec.Replicas = oldStatefulSet.Spec.Replicas
> +-
> +-	restoreTemplate := statefulSet.Spec.Template
> +-	statefulSet.Spec.Template = oldStatefulSet.Spec.Template
> +-
> +-	restoreStrategy := statefulSet.Spec.UpdateStrategy
> +-	statefulSet.Spec.UpdateStrategy = oldStatefulSet.Spec.UpdateStrategy
> +-
> +-	if !apiequality.Semantic.DeepEqual(statefulSet.Spec, oldStatefulSet.Spec) {
> ++	// statefulset updates aren't super common and general updates are likely to be touching spec, so we'll do this
> ++	// deep copy right away.  This avoids mutating our inputs
> ++	newStatefulSetClone := statefulSet.DeepCopy()
> ++	newStatefulSetClone.Spec.Replicas = oldStatefulSet.Spec.Replicas             // +k8s:verify-mutation:reason=clone
> ++	newStatefulSetClone.Spec.Template = oldStatefulSet.Spec.Template             // +k8s:verify-mutation:reason=clone
> ++	newStatefulSetClone.Spec.UpdateStrategy = oldStatefulSet.Spec.UpdateStrategy // +k8s:verify-mutation:reason=clone
> ++	if !apiequality.Semantic.DeepEqual(newStatefulSetClone.Spec, oldStatefulSet.Spec) {
> + 		allErrs = append(allErrs, field.Forbidden(field.NewPath("spec"), "updates to statefulset spec for fields other than 'replicas', 'template', and 'updateStrategy' are forbidden"))
> + 	}
> +-	statefulSet.Spec.Replicas = restoreReplicas
> +-	statefulSet.Spec.Template = restoreTemplate
> +-	statefulSet.Spec.UpdateStrategy = restoreStrategy
> + 
> + 	allErrs = append(allErrs, apivalidation.ValidateNonnegativeField(int64(statefulSet.Spec.Replicas), field.NewPath("spec", "replicas"))...)
> + 	return allErrs
> +-- 
> +2.25.1
> +
> +
> +From bfbe634654ae1ac86033b69703ed78ade5d605ea Mon Sep 17 00:00:00 2001
> +From: David Eads <deads@redhat.com>
> +Date: Wed, 17 Mar 2021 09:12:42 -0400
> +Subject: [PATCH 8/8] bazel
> +
> +---
> + pkg/apis/core/validation/BUILD | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/pkg/apis/core/validation/BUILD b/pkg/apis/core/validation/BUILD
> +index 2db631180e6..00649a3a52c 100644
> +--- a/src/import/pkg/apis/core/validation/BUILD
> ++++ b/src/import/pkg/apis/core/validation/BUILD
> +@@ -40,7 +40,6 @@ go_library(
> +         "//staging/src/k8s.io/apimachinery/pkg/util/validation:go_default_library",
> +         "//staging/src/k8s.io/apimachinery/pkg/util/validation/field:go_default_library",
> +         "//staging/src/k8s.io/apiserver/pkg/util/feature:go_default_library",
> +-        "//vendor/k8s.io/klog:go_default_library",
> +         "//vendor/k8s.io/utils/net:go_default_library",
> +     ],
> + )
> +-- 
> +2.25.1
> +
> diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2021-25737.patch b/recipes-containers/kubernetes/kubernetes/CVE-2021-25737.patch
> new file mode 100644
> index 00000000..d1a97971
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/CVE-2021-25737.patch
> @@ -0,0 +1,128 @@
> +From 901e8e07e1f031456ecd7fefce965aaa05916825 Mon Sep 17 00:00:00 2001
> +From: Rob Scott <robertjscott@google.com>
> +Date: Fri, 9 Apr 2021 15:24:17 -0700
> +Subject: [PATCH] Updating EndpointSlice validation to match Endpoints
> + validation
> +
> +Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/commit/901e8e07e1f031456ecd7fefce965aaa05916825]
> +CVE: CVE-2021-25737
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + pkg/apis/core/validation/validation.go        | 18 ++++++----
> + pkg/apis/discovery/validation/validation.go   |  2 ++
> + .../discovery/validation/validation_test.go   | 34 +++++++++++++++++--
> + 3 files changed, 45 insertions(+), 9 deletions(-)
> +
> +diff --git a/pkg/apis/core/validation/validation.go b/pkg/apis/core/validation/validation.go
> +index 3daeb139d590d..c65cdd40f9061 100644
> +--- a/src/import/pkg/apis/core/validation/validation.go
> ++++ b/src/import/pkg/apis/core/validation/validation.go
> +@@ -4014,7 +4014,7 @@ func ValidateService(service *core.Service, allowAppProtocol bool) field.ErrorLi
> + 				allErrs = append(allErrs, field.Invalid(idxPath, ip, msgs[i]))
> + 			}
> + 		} else {
> +-			allErrs = append(allErrs, validateNonSpecialIP(ip, idxPath)...)
> ++			allErrs = append(allErrs, ValidateNonSpecialIP(ip, idxPath)...)
> + 		}
> + 	}
> + 
> +@@ -5572,15 +5572,19 @@ func validateEndpointAddress(address *core.EndpointAddress, fldPath *field.Path)
> + 			allErrs = append(allErrs, field.Invalid(fldPath.Child("nodeName"), *address.NodeName, msg))
> + 		}
> + 	}
> +-	allErrs = append(allErrs, validateNonSpecialIP(address.IP, fldPath.Child("ip"))...)
> ++	allErrs = append(allErrs, ValidateNonSpecialIP(address.IP, fldPath.Child("ip"))...)
> + 	return allErrs
> + }
> + 
> +-func validateNonSpecialIP(ipAddress string, fldPath *field.Path) field.ErrorList {
> +-	// We disallow some IPs as endpoints or external-ips.  Specifically,
> +-	// unspecified and loopback addresses are nonsensical and link-local
> +-	// addresses tend to be used for node-centric purposes (e.g. metadata
> +-	// service).
> ++// ValidateNonSpecialIP is used to validate Endpoints, EndpointSlices, and
> ++// external IPs. Specifically, this disallows unspecified and loopback addresses
> ++// are nonsensical and link-local addresses tend to be used for node-centric
> ++// purposes (e.g. metadata service).
> ++//
> ++// IPv6 references
> ++// - https://www.iana.org/assignments/iana-ipv6-special-registry/iana-ipv6-special-registry.xhtml
> ++// - https://www.iana.org/assignments/ipv6-multicast-addresses/ipv6-multicast-addresses.xhtml
> ++func ValidateNonSpecialIP(ipAddress string, fldPath *field.Path) field.ErrorList {
> + 	allErrs := field.ErrorList{}
> + 	ip := net.ParseIP(ipAddress)
> + 	if ip == nil {
> +diff --git a/pkg/apis/discovery/validation/validation.go b/pkg/apis/discovery/validation/validation.go
> +index 810f2ca124d57..3aa5128359d7f 100644
> +--- a/src/import/pkg/apis/discovery/validation/validation.go
> ++++ b/src/import/pkg/apis/discovery/validation/validation.go
> +@@ -103,8 +103,10 @@ func validateEndpoints(endpoints []discovery.Endpoint, addrType discovery.Addres
> + 				}
> + 			case discovery.AddressTypeIPv4:
> + 				allErrs = append(allErrs, validation.IsValidIPv4Address(addressPath.Index(i), address)...)
> ++				allErrs = append(allErrs, apivalidation.ValidateNonSpecialIP(address, addressPath.Index(i))...)
> + 			case discovery.AddressTypeIPv6:
> + 				allErrs = append(allErrs, validation.IsValidIPv6Address(addressPath.Index(i), address)...)
> ++				allErrs = append(allErrs, apivalidation.ValidateNonSpecialIP(address, addressPath.Index(i))...)
> + 			case discovery.AddressTypeFQDN:
> + 				allErrs = append(allErrs, validation.IsFullyQualifiedDomainName(addressPath.Index(i), address)...)
> + 			}
> +diff --git a/pkg/apis/discovery/validation/validation_test.go b/pkg/apis/discovery/validation/validation_test.go
> +index 060545f93ab31..3c8a5465128a9 100644
> +--- a/src/import/pkg/apis/discovery/validation/validation_test.go
> ++++ b/src/import/pkg/apis/discovery/validation/validation_test.go
> +@@ -390,7 +390,7 @@ func TestValidateEndpointSlice(t *testing.T) {
> + 			},
> + 		},
> + 		"bad-ipv4": {
> +-			expectedErrors: 2,
> ++			expectedErrors: 3,
> + 			endpointSlice: &discovery.EndpointSlice{
> + 				ObjectMeta:  standardMeta,
> + 				AddressType: discovery.AddressTypeIPv4,
> +@@ -405,7 +405,7 @@ func TestValidateEndpointSlice(t *testing.T) {
> + 			},
> + 		},
> + 		"bad-ipv6": {
> +-			expectedErrors: 2,
> ++			expectedErrors: 4,
> + 			endpointSlice: &discovery.EndpointSlice{
> + 				ObjectMeta:  standardMeta,
> + 				AddressType: discovery.AddressTypeIPv6,
> +@@ -454,6 +454,36 @@ func TestValidateEndpointSlice(t *testing.T) {
> + 			expectedErrors: 3,
> + 			endpointSlice:  &discovery.EndpointSlice{},
> + 		},
> ++		"special-ipv4": {
> ++			expectedErrors: 1,
> ++			endpointSlice: &discovery.EndpointSlice{
> ++				ObjectMeta:  standardMeta,
> ++				AddressType: discovery.AddressTypeIPv4,
> ++				Ports: []discovery.EndpointPort{{
> ++					Name:     utilpointer.StringPtr("http"),
> ++					Protocol: protocolPtr(api.ProtocolTCP),
> ++				}},
> ++				Endpoints: []discovery.Endpoint{{
> ++					Addresses: []string{"127.0.0.1"},
> ++					Hostname:  utilpointer.StringPtr("valid-123"),
> ++				}},
> ++			},
> ++		},
> ++		"special-ipv6": {
> ++			expectedErrors: 1,
> ++			endpointSlice: &discovery.EndpointSlice{
> ++				ObjectMeta:  standardMeta,
> ++				AddressType: discovery.AddressTypeIPv6,
> ++				Ports: []discovery.EndpointPort{{
> ++					Name:     utilpointer.StringPtr("http"),
> ++					Protocol: protocolPtr(api.ProtocolTCP),
> ++				}},
> ++				Endpoints: []discovery.Endpoint{{
> ++					Addresses: []string{"fe80::9656:d028:8652:66b6"},
> ++					Hostname:  utilpointer.StringPtr("valid-123"),
> ++				}},
> ++			},
> ++		},
> + 	}
> + 
> + 	for name, testCase := range testCases {
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index 2b0bfb7a..be3d7dbe 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -14,6 +14,9 @@ SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.17;name=k
>             file://CVE-2020-8564.patch \
>             file://CVE-2020-8565.patch \
>             file://CVE-2020-8566.patch \
> +           file://CVE-2021-25735-pre1.patch \
> +           file://CVE-2021-25735.patch \
> +           file://CVE-2021-25737.patch \
>            "
>  
>  DEPENDS += "rsync-native \
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8326): https://lists.yoctoproject.org/g/meta-virtualization/message/8326
> Mute This Topic: https://lists.yoctoproject.org/mt/101614699/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDE1C04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 06:18:43 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.34356.1715926714584646368
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 May 2024 23:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RN1RYumy;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e45c0a8360so2583171fa.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 May 2024 23:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715926712; x=1716531512; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlTpoMUVxUragFmhOeS2mPiD00z3ZvfpABocXbPJsog=;
        b=RN1RYumykoawqVfrBKSI92hhuwu/b3c3jE6zHPJvK//UvwyEOlGAiSFG+W8Gcr4bag
         vR7uP7TQkFm8WKGPHpfK663XSqp0e9d65pjbPxKOHfUz/cZ+9BKYV1NvJmw1U3WIDfjj
         Cw1YtS+PnzmdNFRC/u2DT0Zb9L7Wyc4Mzp1tiPKB0xCb+fHez1vF9DmQvP4UIlUhCRFd
         LpaIqDBhoRGEhJsMgWuo1ofXPk4Zr704Kz8F9Md21sMG6meuUgT2L288hC5l93MECTn3
         EXDCDolpyHYTKSW8oiWgCyGY9Hn8m59lJ1OiKHVqArJ9ilD12L6CJm7HUr7Vy+rvNbJg
         ay1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715926712; x=1716531512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UlTpoMUVxUragFmhOeS2mPiD00z3ZvfpABocXbPJsog=;
        b=b6HRu+CZhhfcfd/+lK5B4wwMJEwdrzCDf3ZVbLCjAmIZ3AYaDZE0JC6iQvm+TBnHY0
         lKMWOwrtW/67ETzyok+jfM2i2PJKd9MuYuuUCc6itORyRfO+BwY4RT+qvQyqwtJew0yY
         /Sb1UuHzODKMoV6b6Ijvk9YE1Oxxnv+bUZGkS9qvkPzRxhSQ53RBAg9keNIe7gaSEIDN
         2xDYIGEFnuJ5MJpm8X/T4CWCB9IG/oUDBEGr8LBCjOImclyLFky/jz8CuYlJ7mwL2JyT
         t+/UZDbKHXuj+my42VsV7n6fIO0FznG0PwIMVfX3t9ewZjHl+xQ3IKA15XnEHCKtgwbe
         ID8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYKyJmFaq6Dg+SBLSG5QLQLBIkY6QQWAB7nXMBgYvRbDrhjVRHomMkMPE01+J6bduqiyw8elwrY6YAL7s8gjJwPFk0KAApQJMaoFZtNfiBc720+tfn5NadjvA=
X-Gm-Message-State: AOJu0YyKCGc106PXdiULvEj1pKu4+1rP8x8C0cKmZm3h1Kuzr0S+CJq4
	eVzocGBUQkuE82k2WdWiMk2INg+riUW9uQt6DEk+W3aGjBBgwEa+cfWrTiiXaGEColVW6fk7Bkp
	tCTskO/vZ3gZZMo20Yi1qKHTjWpw=
X-Google-Smtp-Source: AGHT+IF2AgvYmZWrcC28z/jM0hFAq9kVqHDEEICX5WIAt+HtH7UHHdPpi1uKhO8rmPCB50Bxig0TvGlh2RlclPIaYyE=
X-Received: by 2002:a2e:80a:0:b0:2e6:cb01:aef8 with SMTP id
 38308e7fff4ca-2e6cb01b165mr69075491fa.36.1715926712010; Thu, 16 May 2024
 23:18:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240503034953.8903-1-asharma@mvista.com> <ZkLMO/fg1d5Skn4B@gmail.com>
In-Reply-To: <ZkLMO/fg1d5Skn4B@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 17 May 2024 08:18:16 +0200
Message-ID: <CA+chaQc4Ma_dBzhuRSR2VBWT=+sEVxJ6hWFU1L=d_Q9sSDXsQA@mail.gmail.com>
Subject: Re: [meta-virtualization][kirkstone][PATCH] kubernetes: Backport fix
 for CVE-2024-3177
To: bruce.ashfield@gmail.com
Cc: asharma@mvista.com, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 May 2024 06:18:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8729

The .patch file doesn't apply on the v1.23.17 version currently in kirkston=
e.

recipe-sysroot-native/etc/quiltrc push', 0, "stdout: Applying patch
CVE-2024-3177.patch
can't find file to patch at input line 20
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From 3f0922513d235d8bdebe79f0d07da769c04211b8 Mon Sep 17 00:00:00 2001
|From: Rita Zhang <rita.z.zhang@gmail.com>
|Date: Mon, 25 Mar 2024 10:33:41 -0700
|Subject: [PATCH] Add envFrom to serviceaccount admission plugin
|
|Signed-off-by: Rita Zhang <rita.z.zhang@gmail.com>
|
|Upstream-Status: Backport
[https://github.com/kubernetes/kubernetes/pull/124325/commits/3f0922513d235=
d8bdebe79f0d07da769c04211b8]
|CVE: CVE-2024-3177
|Signed-off-by: Ashish Sharma <asharma@mvista.com>
|
| .../pkg/admission/serviceaccount/admission.go |  21 +++
| .../serviceaccount/admission_test.go          | 122 ++++++++++++++++--
| 2 files changed, 132 insertions(+), 11 deletions(-)
|
|diff --git a/plugin/pkg/admission/serviceaccount/admission.go
b/plugin/pkg/admission/serviceaccount/admission.go
|index c844a051c24b..3f4338128e53 100644
|--- a/plugin/pkg/admission/serviceaccount/admission.go
|+++ b/plugin/pkg/admission/serviceaccount/admission.go
--------------------------
No file to patch.  Skipping patch.
3 out of 3 hunks ignored
can't find file to patch at input line 66
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|diff --git a/plugin/pkg/admission/serviceaccount/admission_test.go
b/plugin/pkg/admission/serviceaccount/admission_test.go
|index bf15f870d75a..4dba6cd8b13e 100644
|--- a/plugin/pkg/admission/serviceaccount/admission_test.go
|+++ b/plugin/pkg/admission/serviceaccount/admission_test.go
--------------------------
No file to patch.  Skipping patch.
6 out of 6 hunks ignored
Patch CVE-2024-3177.patch does not apply (enforce with -f)

stderr: ")

It would need to be applied in src/import subdirectory as other .patch
files here are. Will send a fix, but the original submitter should do
a better test before sending.

On Tue, May 14, 2024 at 4:28=E2=80=AFAM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> merged to kirkstone
>
> Bruce
>
> In message: [meta-virtualization][kirkstone][PATCH] kubernetes: Backport =
fix for CVE-2024-3177
> on 03/05/2024 Ashish Sharma via lists.yoctoproject.org wrote:
>
> > Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/pul=
l/124325/commits/3f0922513d235d8bdebe79f0d07da769c04211b8]
> >
> > Signed-off-by: Ashish Sharma <asharma@mvista.com>
> > ---
> >  .../kubernetes/kubernetes/CVE-2024-3177.patch | 237 ++++++++++++++++++
> >  .../kubernetes/kubernetes_git.bb              |   1 +
> >  2 files changed, 238 insertions(+)
> >  create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2024-3=
177.patch
> >
> > diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2024-3177.pat=
ch b/recipes-containers/kubernetes/kubernetes/CVE-2024-3177.patch
> > new file mode 100644
> > index 00000000..20b2ea8a
> > --- /dev/null
> > +++ b/recipes-containers/kubernetes/kubernetes/CVE-2024-3177.patch
> > @@ -0,0 +1,237 @@
> > +From 3f0922513d235d8bdebe79f0d07da769c04211b8 Mon Sep 17 00:00:00 2001
> > +From: Rita Zhang <rita.z.zhang@gmail.com>
> > +Date: Mon, 25 Mar 2024 10:33:41 -0700
> > +Subject: [PATCH] Add envFrom to serviceaccount admission plugin
> > +
> > +Signed-off-by: Rita Zhang <rita.z.zhang@gmail.com>
> > +
> > +Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/pu=
ll/124325/commits/3f0922513d235d8bdebe79f0d07da769c04211b8]
> > +CVE: CVE-2024-3177
> > +Signed-off-by: Ashish Sharma <asharma@mvista.com>
> > +
> > + .../pkg/admission/serviceaccount/admission.go |  21 +++
> > + .../serviceaccount/admission_test.go          | 122 ++++++++++++++++-=
-
> > + 2 files changed, 132 insertions(+), 11 deletions(-)
> > +
> > +diff --git a/plugin/pkg/admission/serviceaccount/admission.go b/plugin=
/pkg/admission/serviceaccount/admission.go
> > +index c844a051c24b..3f4338128e53 100644
> > +--- a/plugin/pkg/admission/serviceaccount/admission.go
> > ++++ b/plugin/pkg/admission/serviceaccount/admission.go
> > +@@ -337,6 +337,13 @@ func (s *Plugin) limitSecretReferences(serviceAcc=
ount *corev1.ServiceAccount, po
> > +                             }
> > +                     }
> > +             }
> > ++            for _, envFrom :=3D range container.EnvFrom {
> > ++                    if envFrom.SecretRef !=3D nil {
> > ++                            if !mountableSecrets.Has(envFrom.SecretRe=
f.Name) {
> > ++                                    return fmt.Errorf("init container=
 %s with envFrom referencing secret.secretName=3D\"%s\" is not allowed beca=
use service account %s does not reference that secret", container.Name, env=
From.SecretRef.Name, serviceAccount.Name)
> > ++                            }
> > ++                    }
> > ++            }
> > +     }
> > +
> > +     for _, container :=3D range pod.Spec.Containers {
> > +@@ -347,6 +354,13 @@ func (s *Plugin) limitSecretReferences(serviceAcc=
ount *corev1.ServiceAccount, po
> > +                             }
> > +                     }
> > +             }
> > ++            for _, envFrom :=3D range container.EnvFrom {
> > ++                    if envFrom.SecretRef !=3D nil {
> > ++                            if !mountableSecrets.Has(envFrom.SecretRe=
f.Name) {
> > ++                                    return fmt.Errorf("container %s w=
ith envFrom referencing secret.secretName=3D\"%s\" is not allowed because s=
ervice account %s does not reference that secret", container.Name, envFrom.=
SecretRef.Name, serviceAccount.Name)
> > ++                            }
> > ++                    }
> > ++            }
> > +     }
> > +
> > +     // limit pull secret references as well
> > +@@ -388,6 +402,13 @@ func (s *Plugin) limitEphemeralContainerSecretRef=
erences(pod *api.Pod, a admissi
> > +                             }
> > +                     }
> > +             }
> > ++            for _, envFrom :=3D range container.EnvFrom {
> > ++                    if envFrom.SecretRef !=3D nil {
> > ++                            if !mountableSecrets.Has(envFrom.SecretRe=
f.Name) {
> > ++                                    return fmt.Errorf("ephemeral cont=
ainer %s with envFrom referencing secret.secretName=3D\"%s\" is not allowed=
 because service account %s does not reference that secret", container.Name=
, envFrom.SecretRef.Name, serviceAccount.Name)
> > ++                            }
> > ++                    }
> > ++            }
> > +     }
> > +     return nil
> > + }
> > +diff --git a/plugin/pkg/admission/serviceaccount/admission_test.go b/p=
lugin/pkg/admission/serviceaccount/admission_test.go
> > +index bf15f870d75a..4dba6cd8b13e 100644
> > +--- a/plugin/pkg/admission/serviceaccount/admission_test.go
> > ++++ b/plugin/pkg/admission/serviceaccount/admission_test.go
> > +@@ -521,6 +521,25 @@ func TestAllowsReferencedSecret(t *testing.T) {
> > +             t.Errorf("Unexpected error: %v", err)
> > +     }
> > +
> > ++    pod2 =3D &api.Pod{
> > ++            Spec: api.PodSpec{
> > ++                    Containers: []api.Container{
> > ++                            {
> > ++                                    Name: "container-1",
> > ++                                    EnvFrom: []api.EnvFromSource{
> > ++                                            {
> > ++                                                    SecretRef: &api.S=
ecretEnvSource{
> > ++                                                            LocalObje=
ctReference: api.LocalObjectReference{
> > ++                                                                    N=
ame: "foo"}}}},
> > ++                            },
> > ++                    },
> > ++            },
> > ++    }
> > ++    attrs =3D admission.NewAttributesRecord(pod2, nil, api.Kind("Pod"=
).WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("v=
ersion"), "", admission.Create, &metav1.CreateOptions{}, false, nil)
> > ++    if err :=3D admissiontesting.WithReinvocationTesting(t, admit).Ad=
mit(context.TODO(), attrs, nil); err !=3D nil {
> > ++            t.Errorf("Unexpected error: %v", err)
> > ++    }
> > ++
> > +     pod2 =3D &api.Pod{
> > +             Spec: api.PodSpec{
> > +                     InitContainers: []api.Container{
> > +@@ -545,6 +564,25 @@ func TestAllowsReferencedSecret(t *testing.T) {
> > +             t.Errorf("Unexpected error: %v", err)
> > +     }
> > +
> > ++    pod2 =3D &api.Pod{
> > ++            Spec: api.PodSpec{
> > ++                    InitContainers: []api.Container{
> > ++                            {
> > ++                                    Name: "container-1",
> > ++                                    EnvFrom: []api.EnvFromSource{
> > ++                                            {
> > ++                                                    SecretRef: &api.S=
ecretEnvSource{
> > ++                                                            LocalObje=
ctReference: api.LocalObjectReference{
> > ++                                                                    N=
ame: "foo"}}}},
> > ++                            },
> > ++                    },
> > ++            },
> > ++    }
> > ++    attrs =3D admission.NewAttributesRecord(pod2, nil, api.Kind("Pod"=
).WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("v=
ersion"), "", admission.Create, &metav1.CreateOptions{}, false, nil)
> > ++    if err :=3D admissiontesting.WithReinvocationTesting(t, admit).Ad=
mit(context.TODO(), attrs, nil); err !=3D nil {
> > ++            t.Errorf("Unexpected error: %v", err)
> > ++    }
> > ++
> > +     pod2 =3D &api.Pod{
> > +             Spec: api.PodSpec{
> > +                     ServiceAccountName: DefaultServiceAccountName,
> > +@@ -572,6 +610,28 @@ func TestAllowsReferencedSecret(t *testing.T) {
> > +     if err :=3D admit.Validate(context.TODO(), attrs, nil); err !=3D =
nil {
> > +             t.Errorf("Unexpected error: %v", err)
> > +     }
> > ++
> > ++    pod2 =3D &api.Pod{
> > ++            Spec: api.PodSpec{
> > ++                    ServiceAccountName: DefaultServiceAccountName,
> > ++                    EphemeralContainers: []api.EphemeralContainer{
> > ++                            {
> > ++                                    EphemeralContainerCommon: api.Eph=
emeralContainerCommon{
> > ++                                            Name: "container-2",
> > ++                                            EnvFrom: []api.EnvFromSou=
rce{{
> > ++                                                    SecretRef: &api.S=
ecretEnvSource{
> > ++                                                            LocalObje=
ctReference: api.LocalObjectReference{
> > ++                                                                    N=
ame: "foo"}}}},
> > ++                                    },
> > ++                            },
> > ++                    },
> > ++            },
> > ++    }
> > ++    // validate enforces restrictions on secret mounts when operation=
=3D=3Dupdate and subresource=3D=3Dephemeralcontainers"
> > ++    attrs =3D admission.NewAttributesRecord(pod2, nil, api.Kind("Pod"=
).WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("v=
ersion"), "ephemeralcontainers", admission.Update, &metav1.UpdateOptions{},=
 false, nil)
> > ++    if err :=3D admit.Validate(context.TODO(), attrs, nil); err !=3D =
nil {
> > ++            t.Errorf("Unexpected error: %v", err)
> > ++    }
> > + }
> > +
> > + func TestRejectsUnreferencedSecretVolumes(t *testing.T) {
> > +@@ -628,25 +688,20 @@ func TestRejectsUnreferencedSecretVolumes(t *tes=
ting.T) {
> > +
> > +     pod2 =3D &api.Pod{
> > +             Spec: api.PodSpec{
> > +-                    InitContainers: []api.Container{
> > ++                    Containers: []api.Container{
> > +                             {
> > +                                     Name: "container-1",
> > +-                                    Env: []api.EnvVar{
> > ++                                    EnvFrom: []api.EnvFromSource{
> > +                                             {
> > +-                                                    Name: "env-1",
> > +-                                                    ValueFrom: &api.E=
nvVarSource{
> > +-                                                            SecretKey=
Ref: &api.SecretKeySelector{
> > +-                                                                    L=
ocalObjectReference: api.LocalObjectReference{Name: "foo"},
> > +-                                                            },
> > +-                                                    },
> > +-                                            },
> > +-                                    },
> > ++                                                    SecretRef: &api.S=
ecretEnvSource{
> > ++                                                            LocalObje=
ctReference: api.LocalObjectReference{
> > ++                                                                    N=
ame: "foo"}}}},
> > +                             },
> > +                     },
> > +             },
> > +     }
> > +     attrs =3D admission.NewAttributesRecord(pod2, nil, api.Kind("Pod"=
).WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("v=
ersion"), "", admission.Create, &metav1.CreateOptions{}, false, nil)
> > +-    if err :=3D admissiontesting.WithReinvocationTesting(t, admit).Ad=
mit(context.TODO(), attrs, nil); err =3D=3D nil || !strings.Contains(err.Er=
ror(), "with envVar") {
> > ++    if err :=3D admissiontesting.WithReinvocationTesting(t, admit).Ad=
mit(context.TODO(), attrs, nil); err =3D=3D nil || !strings.Contains(err.Er=
ror(), "with envFrom") {
> > +             t.Errorf("Unexpected error: %v", err)
> > +     }
> > +
> > +@@ -679,6 +734,30 @@ func TestRejectsUnreferencedSecretVolumes(t *test=
ing.T) {
> > +             t.Errorf("validate only enforces restrictions on secret m=
ounts when operation=3D=3Dcreate and subresource=3D=3D''. Unexpected error:=
 %v", err)
> > +     }
> > +
> > ++    pod2 =3D &api.Pod{
> > ++            Spec: api.PodSpec{
> > ++                    ServiceAccountName: DefaultServiceAccountName,
> > ++                    InitContainers: []api.Container{
> > ++                            {
> > ++                                    Name: "container-1",
> > ++                                    EnvFrom: []api.EnvFromSource{
> > ++                                            {
> > ++                                                    SecretRef: &api.S=
ecretEnvSource{
> > ++                                                            LocalObje=
ctReference: api.LocalObjectReference{
> > ++                                                                    N=
ame: "foo"}}}},
> > ++                            },
> > ++                    },
> > ++            },
> > ++    }
> > ++    attrs =3D admission.NewAttributesRecord(pod2, nil, api.Kind("Pod"=
).WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("v=
ersion"), "", admission.Update, &metav1.UpdateOptions{}, false, nil)
> > ++    if err :=3D admissiontesting.WithReinvocationTesting(t, admit).Ad=
mit(context.TODO(), attrs, nil); err !=3D nil {
> > ++            t.Errorf("admit only enforces restrictions on secret moun=
ts when operation=3D=3Dcreate. Unexpected error: %v", err)
> > ++    }
> > ++    attrs =3D admission.NewAttributesRecord(pod2, nil, api.Kind("Pod"=
).WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("v=
ersion"), "", admission.Create, &metav1.CreateOptions{}, false, nil)
> > ++    if err :=3D admit.Validate(context.TODO(), attrs, nil); err =3D=
=3D nil || !strings.Contains(err.Error(), "with envFrom") {
> > ++            t.Errorf("validate only enforces restrictions on secret m=
ounts when operation=3D=3Dcreate and subresource=3D=3D''. Unexpected error:=
 %v", err)
> > ++    }
> > ++
> > +     pod2 =3D &api.Pod{
> > +             Spec: api.PodSpec{
> > +                     ServiceAccountName: DefaultServiceAccountName,
> > +@@ -709,6 +788,27 @@ func TestRejectsUnreferencedSecretVolumes(t *test=
ing.T) {
> > +     if err :=3D admit.Validate(context.TODO(), attrs, nil); err =3D=
=3D nil || !strings.Contains(err.Error(), "with envVar") {
> > +             t.Errorf("validate enforces restrictions on secret mounts=
 when operation=3D=3Dupdate and subresource=3D=3Dephemeralcontainers. Unexp=
ected error: %v", err)
> > +     }
> > ++
> > ++    pod2 =3D &api.Pod{
> > ++            Spec: api.PodSpec{
> > ++                    ServiceAccountName: DefaultServiceAccountName,
> > ++                    EphemeralContainers: []api.EphemeralContainer{
> > ++                            {
> > ++                                    EphemeralContainerCommon: api.Eph=
emeralContainerCommon{
> > ++                                            Name: "container-2",
> > ++                                            EnvFrom: []api.EnvFromSou=
rce{{
> > ++                                                    SecretRef: &api.S=
ecretEnvSource{
> > ++                                                            LocalObje=
ctReference: api.LocalObjectReference{
> > ++                                                                    N=
ame: "foo"}}}},
> > ++                                    },
> > ++                            },
> > ++                    },
> > ++            },
> > ++    }
> > ++    attrs =3D admission.NewAttributesRecord(pod2, nil, api.Kind("Pod"=
).WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("v=
ersion"), "ephemeralcontainers", admission.Update, &metav1.UpdateOptions{},=
 false, nil)
> > ++    if err :=3D admit.Validate(context.TODO(), attrs, nil); err =3D=
=3D nil || !strings.Contains(err.Error(), "with envFrom") {
> > ++            t.Errorf("validate enforces restrictions on secret mounts=
 when operation=3D=3Dupdate and subresource=3D=3Dephemeralcontainers. Unexp=
ected error: %v", err)
> > ++    }
> > + }
> > +
> > + func TestAllowUnreferencedSecretVolumesForPermissiveSAs(t *testing.T)=
 {
> > diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-=
containers/kubernetes/kubernetes_git.bb
> > index b0c87c47..78d1cd2a 100644
> > --- a/recipes-containers/kubernetes/kubernetes_git.bb
> > +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> > @@ -35,6 +35,7 @@ SRC_URI:append =3D " \
> >             file://cni-containerd-net.conflist \
> >             file://k8s-init \
> >             file://99-kubernetes.conf \
> > +           file://CVE-2024-3177.patch \
> >            "
> >
> >  DEPENDS +=3D "rsync-native \
> > --
> > 2.35.7
> >
>
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8720): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8720
> Mute This Topic: https://lists.yoctoproject.org/mt/105882014/3617156
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


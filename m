Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5388CD5BC9
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 13:14:48 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15572.1779714881727355451
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 May 2026 06:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QJ/jgTRH;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c827313dac0so4737414a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 06:14:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779714881; cv=none;
        d=google.com; s=arc-20240605;
        b=T1+lfpLpTXndrpO5Be8uQdO9DSvOnfKSM+pbqYZZDndfvwdvkO1tmBAtJdt+32lFe0
         1hPwErDRaA01YvJp34g+Gtgdn7bAeUgbumX4adrGCI2HR4ewREqC6ORWPdAKRJnW8okw
         K9eJotoe4G50GtrGbt+ppDQ4SisEXpzaSQ8U2vilc5OGkssMcayy3yCwhc4sKpAo9NlM
         RkWhMqRcffWxQSu7vW+DUv5COnmKVe8BzngIO1IsG/lvr01aFpgByFzSb1uNGG++VG/6
         +z/qo5SyR5VE745YDyWhDdRh6bibQz5krHTjamQJWG+jiPvVeHgJktvaPC4XkXRlqf//
         23ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dRY1yHVP7oV7YsCFO8aNchM3oxxuBxY5wedXDK5W5YY=;
        fh=T1fsFJFZd3expnPhH4HQBhUXgCpxpAql7h9peGDMJdM=;
        b=YwmFuoeKsrCr0BApXU3qSarLrzd8RxF42UsRdcT34iD8LTFb1u4p/kUDJb4uBZyLg3
         nzsrdp0j70/SDvvSTw2MqCJzgX3FvPbVHECRRDsZ058kxKi8q2kZz+91vvgrYLYc8rED
         GjHnZxjdT/KVCum5CCo6ahfgS917Xs+wg+X0v2IVT6K+g0+WqTT3gy5vXNFwci9U6FwE
         /9sEhHErdqya1HWQgn3btPvDnJiFCvlmZHq9GyP57wto1buvMxffNMYP9J9zygIICsHe
         IRGNDVXKonXyERPElf16tanxx5NOF5a4KI3EvJaN3Lf8gMF2Jh0/zfovi4tSh9C4bPeY
         zFAA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779714881; x=1780319681; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dRY1yHVP7oV7YsCFO8aNchM3oxxuBxY5wedXDK5W5YY=;
        b=QJ/jgTRHeke+9GakOV9IZdLW+23tsPJFdHvq7vJ/DO6MepwY1qy/uyTrYu9qs++3aw
         zgab7DGbo/j5qEvLL4Q2LOBEB1xz4LLumBFMe7EVx0V/f1ZPIYYm7PrYTnGSmfSXMfgH
         kPyzffKVgeanCUuSPSIigjAOO4NzgSr+RqOW8XPbl74S2cx8AiL7A5i95hfn8BkVKePZ
         lmoLm7ihVMxUoqcv7o3iI7Ofa59hxqjLSCKP9UYItyBx0N7X+CRZShcekqau9c7zHBwT
         dDHAYa229P4jfOI+bNqps0n1pqrJZbVRUs1BcNc8cWYWpQED22GUOSH0jUirNx9YPoMY
         +yFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779714881; x=1780319681;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRY1yHVP7oV7YsCFO8aNchM3oxxuBxY5wedXDK5W5YY=;
        b=OdOFzVdUTqiImiHBrQ9jX9uiYrmVXBoJarJzGx83Q9s4Li3AiJAiKHa/KIAf2VAox6
         ZnggIwtRa25KpVYLTLAyDFTZmsVCwgy8ncmMLt9mHw6G8IApBvVpun7aBHX3yAbLpf9f
         6IeHidDhaIpMBwXQ4LX2V6ZXZ/dYWyOx4FYcu7DZ+oAXglwpzt5nx/BzULBcP09uWZjc
         oPfMcI2zUmOmKJ7ejHXyc3rgqOmL8qTTLhvtuakQhSMBdg2G+jFNz2/i49GSSwnGxJdf
         ZYl2pUkrPjih4XjabvGErHJr1dKzcuRCLXOdhik4gBn6eAjsxIMTXPV5zeLtcRe4QvDp
         zgNA==
X-Gm-Message-State: AOJu0YwtWfgu3AuF3mToVOLZPdecANT5pVVGSjExs1sXhDd2rWw2eMbT
	La9cCYC668C9y0Z8IvA4dMC9o2l7lUzknrSvaVUEpo2MvY2djVAWT4ggGPo/QOSYe3+bq12LWh+
	LOh8C+UiCQsklpeVsBtTzteLu5byKfjE=
X-Gm-Gg: Acq92OHPvsqjk6XqpXJZ8a1qkrPlu8BKO2PcPYpDQOybXEpT2EhiYcpigDj17jTe6j8
	K0c6A0YnPQb/exrFuGJ3+j+zSQe7YOflN5BqlFoPrYsNwyLfI638+qYSd/Bq1ECaLRzvJ3jpejF
	DwFQvWdLMVuzZs8BwqRNVUm/tAi6GcEHHxea8ZNmp3luswkPow/+Ih8kb49itdLT8fGQsnmmrPN
	tNTqKM+fIb5lJJer4R6+dDM19szFXagSHyr03gRsNf6NrstoOdW+kbDckF6bZzrkwQGfbrjfUzn
	6665vOUMAq5TtuOKkbjOE9RwxvxwsrDOcCQcmshJgh9sT/dzpmCrOk7V8oRksmLAmrA3B0nEm/5
	qkW94JAG0uwztnTfJCC4TcyBMpA==
X-Received: by 2002:a17:902:d50c:b0:2be:9e09:463 with SMTP id
 d9443c01a7336-2bea23c6713mr168100785ad.23.1779714880890; Mon, 25 May 2026
 06:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260525130349.3963929-1-zhixiong.chi@windriver.com>
In-Reply-To: <20260525130349.3963929-1-zhixiong.chi@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 25 May 2026 09:14:29 -0400
X-Gm-Features: AVHnY4K2hhhmoXx_VVDeoZ2MfNhbtZTc1gk-MlMcqjanJR2SGvRsgtA7dfjE6n8
Message-ID: <CADkTA4Mg3CXSGZpoYu=GC+SEmPMkF5x05UxGyT+rHT0XR4i5FA@mail.gmail.com>
Subject: Re: [meta-virtualization][wrynose][PATCH] kubernetes: upgrade to 1.35.5
To: zhixiong.chi@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000046eac90652a429db"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 13:14:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9814

--00000000000046eac90652a429db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 9:03=E2=80=AFAM Zhixiong Chi via lists.yoctoproject=
.org
<zhixiong.chi=3Dwindriver.com@lists.yoctoproject.org> wrote:

> Bumping to version 1.35.5, which comprises the following commits:
>
>     6636cbce3bb Release commit for Kubernetes v1.35.5
>     b9ffe7c06a9 kubeadm: use dedicated ClusterRole for apiserver kubelet
> client
>     7909267f8b4 kubeadm: skip LocalAPIEndpoint defaulting on worker join
>     f79279632e9 kubeadm: use the localAPIEndpoint for all API calls in
> 'init'
>     faa81128567 kube-proxy: don't do full periodic syncs on large cluster
> mode
>     943d9419438 Delete remote endpoint if it has same ip as local endpoin=
t
> in the system.
>     d550d458d34 Delete remote endpoint if it has same ip as local endpoin=
t
> in the system.
>     6d314b2fd9a Add a (*Client) addEndpoint method
>     feb7fa11123 Evaluate etcd cluster health using quorum
>     1a7f0b3dec6 Escape path inside the container
>     6953afbad16 scheduler: address recreated pod review feedback
>     bf14155eb41 scheduler: skip requeueing recreated pods on scheduling
> failure
>     55f12e8477a scheduler: fix inFlightPods leak when pod is recreated
> during scheduling failure
>     31d47ca373f Update CHANGELOG/CHANGELOG-1.35.md for v1.35.4
>     7b8c6cf0edd Release commit for Kubernetes v1.35.4
>     1687aa8c94e Update github.com/moby/spdystream from v0.5.0 to v0.5.1
>     e87f6b927bf update go.opentelemetry.io/otel to v1.41.0
>     97ccbdf2ee8 Bump images and versions to go 1.25.9 and distroless
> iptables
>     69dd59d5b4f podStartSLOduration excludes init container runtime and
> image pulling time, includes only stateless and immediately schedulable p=
ods
>     46ba1c3c279 Deflake TestPodSubresourceAuth by waiting for effective
> permissions before testing
>     1d5e94efa21 podresources: filter out inactive pods in Get()
>     91a1e8b2db6 e2e: node: podresources: fix expectations for Get() and
> terminated pods
>     9d8bbea593e Fix device plugin admission failure after container resta=
rt
>     d8a562b6476 Fix backport differences for 1.35 (remove WithOrigin and
> MarkAlpha)
>     b6ee759d8ea Add slice and map union member support with tests
>     3d39627cd98 Use IsZero instead of IsNil for union ratcheting check
>     7b708cc7c64 Add DRA test for device attribute with no value set
>     863ed56ac0e Add nil OldValue test coverage for union doc_tests
>     9a39e5c49fa Fix union validation ratcheting when oldObj is nil
>     b0ec348c24d KEP-961: demote maxUnavailable feature in statefulset to
> off by default
>     570f471d7cb kubelet: fix sidecar restart after kubelet restart
>     4c0429295c7 Update CHANGELOG/CHANGELOG-1.35.md for v1.35.3
>     6c1cd99aef0 Release commit for Kubernetes v1.35.3
>     93de120edff pkg/proxy/nftables: fix kube-proxy crash with newer
> nftables versions
>     6b5673451a8 Update knftables to v0.0.21
>     38378d5df7c Bugfix: calculate request latency properly in audit log
> filter
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  recipes-containers/kubernetes/kubernetes_git.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb
> b/recipes-containers/kubernetes/kubernetes_git.bb
> index 03243605..0d33925e 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -5,9 +5,9 @@ applications across multiple hosts, providing basic
> mechanisms for deployment, \
>  maintenance, and scaling of applications. \
>  "
>
> -PV =3D "1.35.2+git"
> -CVE_VERSION =3D "1.35.2"
>

This one is eligible, and I've queued it for testing.

Bruce


> -SRCREV_kubernetes =3D "b6f632ba56e937dad484d5ac99d5ff51e7073dfe"
> +PV =3D "1.35.5+git"
> +CVE_VERSION =3D "1.35.5"
> +SRCREV_kubernetes =3D "6636cbce3bbef91ff61d36658757179426f9e1b2"
>  SRCREV_kubernetes-release =3D "21382abdbfa8e6a43fd417306fa649cb651cc06e"
>  PE =3D "1"
>
> @@ -19,7 +19,7 @@ SRC_URI:class-devupstream =3D "git://
> github.com/kubernetes/kubernetes.git;branch=3Dr
>                              "
>  SRCREV_kubernetes:class-devupstream =3D
> "b6f632ba56e937dad484d5ac99d5ff51e7073dfe"
>  SRCREV_kubernetes-release:class-devupstream =3D
> "21382abdbfa8e6a43fd417306fa649cb651cc06e"
> -PV:class-devupstream =3D "1.35.2+git${SRCREV_kubernetes}"
> +PV:class-devupstream =3D "1.35.5+git${SRCREV_kubernetes}"
>
>  SRCREV_FORMAT ?=3D "kubernetes_release"
>
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9812):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9812
> Mute This Topic: https://lists.yoctoproject.org/mt/119480103/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000046eac90652a429db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 25, 2026 at 9:03=
=E2=80=AFAM Zhixiong Chi via <a href=3D"http://lists.yoctoproject.org">list=
s.yoctoproject.org</a> &lt;zhixiong.chi=3D<a href=3D"mailto:windriver.com@l=
ists.yoctoproject.org">windriver.com@lists.yoctoproject.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Bumping to versi=
on 1.35.5, which comprises the following commits:<br>
<br>
=C2=A0 =C2=A0 6636cbce3bb Release commit for Kubernetes v1.35.5<br>
=C2=A0 =C2=A0 b9ffe7c06a9 kubeadm: use dedicated ClusterRole for apiserver =
kubelet client<br>
=C2=A0 =C2=A0 7909267f8b4 kubeadm: skip LocalAPIEndpoint defaulting on work=
er join<br>
=C2=A0 =C2=A0 f79279632e9 kubeadm: use the localAPIEndpoint for all API cal=
ls in &#39;init&#39;<br>
=C2=A0 =C2=A0 faa81128567 kube-proxy: don&#39;t do full periodic syncs on l=
arge cluster mode<br>
=C2=A0 =C2=A0 943d9419438 Delete remote endpoint if it has same ip as local=
 endpoint in the system.<br>
=C2=A0 =C2=A0 d550d458d34 Delete remote endpoint if it has same ip as local=
 endpoint in the system.<br>
=C2=A0 =C2=A0 6d314b2fd9a Add a (*Client) addEndpoint method<br>
=C2=A0 =C2=A0 feb7fa11123 Evaluate etcd cluster health using quorum<br>
=C2=A0 =C2=A0 1a7f0b3dec6 Escape path inside the container<br>
=C2=A0 =C2=A0 6953afbad16 scheduler: address recreated pod review feedback<=
br>
=C2=A0 =C2=A0 bf14155eb41 scheduler: skip requeueing recreated pods on sche=
duling failure<br>
=C2=A0 =C2=A0 55f12e8477a scheduler: fix inFlightPods leak when pod is recr=
eated during scheduling failure<br>
=C2=A0 =C2=A0 31d47ca373f Update CHANGELOG/<a href=3D"http://CHANGELOG-1.35=
.md" rel=3D"noreferrer" target=3D"_blank">CHANGELOG-1.35.md</a> for v1.35.4=
<br>
=C2=A0 =C2=A0 7b8c6cf0edd Release commit for Kubernetes v1.35.4<br>
=C2=A0 =C2=A0 1687aa8c94e Update <a href=3D"http://github.com/moby/spdystre=
am" rel=3D"noreferrer" target=3D"_blank">github.com/moby/spdystream</a> fro=
m v0.5.0 to v0.5.1<br>
=C2=A0 =C2=A0 e87f6b927bf update <a href=3D"http://go.opentelemetry.io/otel=
" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/otel</a> to v1.4=
1.0<br>
=C2=A0 =C2=A0 97ccbdf2ee8 Bump images and versions to go 1.25.9 and distrol=
ess iptables<br>
=C2=A0 =C2=A0 69dd59d5b4f podStartSLOduration excludes init container runti=
me and image pulling time, includes only stateless and immediately schedula=
ble pods<br>
=C2=A0 =C2=A0 46ba1c3c279 Deflake TestPodSubresourceAuth by waiting for eff=
ective permissions before testing<br>
=C2=A0 =C2=A0 1d5e94efa21 podresources: filter out inactive pods in Get()<b=
r>
=C2=A0 =C2=A0 91a1e8b2db6 e2e: node: podresources: fix expectations for Get=
() and terminated pods<br>
=C2=A0 =C2=A0 9d8bbea593e Fix device plugin admission failure after contain=
er restart<br>
=C2=A0 =C2=A0 d8a562b6476 Fix backport differences for 1.35 (remove WithOri=
gin and MarkAlpha)<br>
=C2=A0 =C2=A0 b6ee759d8ea Add slice and map union member support with tests=
<br>
=C2=A0 =C2=A0 3d39627cd98 Use IsZero instead of IsNil for union ratcheting =
check<br>
=C2=A0 =C2=A0 7b708cc7c64 Add DRA test for device attribute with no value s=
et<br>
=C2=A0 =C2=A0 863ed56ac0e Add nil OldValue test coverage for union doc_test=
s<br>
=C2=A0 =C2=A0 9a39e5c49fa Fix union validation ratcheting when oldObj is ni=
l<br>
=C2=A0 =C2=A0 b0ec348c24d KEP-961: demote maxUnavailable feature in statefu=
lset to off by default<br>
=C2=A0 =C2=A0 570f471d7cb kubelet: fix sidecar restart after kubelet restar=
t<br>
=C2=A0 =C2=A0 4c0429295c7 Update CHANGELOG/<a href=3D"http://CHANGELOG-1.35=
.md" rel=3D"noreferrer" target=3D"_blank">CHANGELOG-1.35.md</a> for v1.35.3=
<br>
=C2=A0 =C2=A0 6c1cd99aef0 Release commit for Kubernetes v1.35.3<br>
=C2=A0 =C2=A0 93de120edff pkg/proxy/nftables: fix kube-proxy crash with new=
er nftables versions<br>
=C2=A0 =C2=A0 6b5673451a8 Update knftables to v0.0.21<br>
=C2=A0 =C2=A0 38378d5df7c Bugfix: calculate request latency properly in aud=
it log filter<br>
<br>
Signed-off-by: Zhixiong Chi &lt;<a href=3D"mailto:zhixiong.chi@windriver.co=
m" target=3D"_blank">zhixiong.chi@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/kubernetes/<a href=3D"http://kubernetes_git.bb" re=
l=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a> | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/recipes-containers/kubernetes/<a href=3D"http://kubernetes_git=
.bb" rel=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a> b/recipes-c=
ontainers/kubernetes/<a href=3D"http://kubernetes_git.bb" rel=3D"noreferrer=
" target=3D"_blank">kubernetes_git.bb</a><br>
index 03243605..0d33925e 100644<br>
--- a/recipes-containers/kubernetes/<a href=3D"http://kubernetes_git.bb" re=
l=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a><br>
+++ b/recipes-containers/kubernetes/<a href=3D"http://kubernetes_git.bb" re=
l=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a><br>
@@ -5,9 +5,9 @@ applications across multiple hosts, providing basic mechani=
sms for deployment, \<br>
=C2=A0maintenance, and scaling of applications. \<br>
=C2=A0&quot;<br>
<br>
-PV =3D &quot;1.35.2+git&quot;<br>
-CVE_VERSION =3D &quot;1.35.2&quot;<br></blockquote><div><br></div><div><di=
v class=3D"gmail_default" style=3D"font-size:small">This one is eligible, a=
nd I&#39;ve queued it for testing.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Bruce</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
-SRCREV_kubernetes =3D &quot;b6f632ba56e937dad484d5ac99d5ff51e7073dfe&quot;=
<br>
+PV =3D &quot;1.35.5+git&quot;<br>
+CVE_VERSION =3D &quot;1.35.5&quot;<br>
+SRCREV_kubernetes =3D &quot;6636cbce3bbef91ff61d36658757179426f9e1b2&quot;=
<br>
=C2=A0SRCREV_kubernetes-release =3D &quot;21382abdbfa8e6a43fd417306fa649cb6=
51cc06e&quot;<br>
=C2=A0PE =3D &quot;1&quot;<br>
<br>
@@ -19,7 +19,7 @@ SRC_URI:class-devupstream =3D &quot;git://<a href=3D"http=
://github.com/kubernetes/kubernetes.git;branch=3Dr" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/kubernetes/kubernetes.git;branch=3Dr</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0SRCREV_kubernetes:class-devupstream =3D &quot;b6f632ba56e937dad484d5a=
c99d5ff51e7073dfe&quot;<br>
=C2=A0SRCREV_kubernetes-release:class-devupstream =3D &quot;21382abdbfa8e6a=
43fd417306fa649cb651cc06e&quot;<br>
-PV:class-devupstream =3D &quot;1.35.2+git${SRCREV_kubernetes}&quot;<br>
+PV:class-devupstream =3D &quot;1.35.5+git${SRCREV_kubernetes}&quot;<br>
<br>
=C2=A0SRCREV_FORMAT ?=3D &quot;kubernetes_release&quot;<br>
<br>
-- <br>
2.53.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9812): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9812" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9812</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/119480103/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/119480103/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000046eac90652a429db--


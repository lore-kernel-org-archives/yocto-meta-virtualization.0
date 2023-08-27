Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6348FC83F11
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 13:33:43 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.27122.1693143221580032031
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 27 Aug 2023 06:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=IPcfngec;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-76da819edc7so143250285a.1
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 27 Aug 2023 06:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693143220; x=1693748020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bJzNImKT0hSSnYxw1MO2xYMUaN0oYMo8e8A7HzxKMEY=;
        b=IPcfngecQMP740Kjh4iJVVr9lAq3KgemPf4fdRNKQQ2NPgqEMm0NnKRvmHiOCvAE8u
         7lUz/aJJYpIXnn/hgH9C5lVg1rwAtJOKn8JJvtzFxNSoztAJAZIMtxMDC1k1C5JluOzw
         4d4mKAG9vPerEcrW7DDMoVYhKs/FbPSGE7hR4ZxCOi6+s/yEvCLKBPriE9NJDZkSX+VY
         O89AT8LsdI/r+sqrdNfwbPHn5KFOTHwFdNTD4jeGg9tEe9NB4gsNLd+1PAGVzRHKqwRD
         PwGaXMS3eqpYpUs/AfmdoHm5EYpZYkDVnoQyRrQ2iYlw5GyeZcgwOUn6j6fKGN9G0TNA
         AEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693143220; x=1693748020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJzNImKT0hSSnYxw1MO2xYMUaN0oYMo8e8A7HzxKMEY=;
        b=Xz0ezTzLQyEYTAVBOoGM68xxiA6QNmXh3RplgUGrJcRSi/hilnJAsubrQWlIoEwVDd
         nIAjrBP4H7gRcV6aP9/8jRYtDbWc0o67Kjz0v9F/R7UDkcHNAZcsq+E2J4gtckRT10D4
         xDzcL1596Z4wJOpuBfYYOchFr2fuCRV8T1IkaquuzWgvzkE/pfHADxg1DE+QPBhyipJH
         5YSEishxNkrxHBs76S9Tgzlo1wOKDxkgEUhSL/X7NzM7k0n3iho7SfbjL6on2LjzbUbh
         Wsieg/rpfsatF+cyZWPVKQTcWCqIn4dwlJbOeGUVmP9gpTljSwDt2QQ3cvxeYxByzKqc
         hPTg==
X-Gm-Message-State: AOJu0YyyjiMTrJB5vaD3aAsWbc/uVEqbpbX0cFsSoSvKoTtm5n8tD5H/
	egP+/K9Ney/bciV/9kG7m21IciGXd94=
X-Google-Smtp-Source: AGHT+IEaM23pCbwkh3ulLWvHy0at77FhdNHDI3zM31+MrlqQ6VFNDbJWa3gzpou1fRZHLHJvebIMCQ==
X-Received: by 2002:a0c:f551:0:b0:636:1d3f:3d77 with SMTP id p17-20020a0cf551000000b006361d3f3d77mr27837774qvm.14.1693143220489;
        Sun, 27 Aug 2023 06:33:40 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id t19-20020a0cde13000000b0064f5aeda9ddsm1882912qvk.29.2023.08.27.06.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:33:29 -0700 (PDT)
Date: Sun, 27 Aug 2023 13:32:59 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Vijay Anusuri <vanusuri@mvista.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][dunfell][PATCH] kubernetes: Backport fix
 for CVE-2020-8565 & CVE-2020-8566
Message-ID: <ZOtQi1eu9VMlMrzX@gmail.com>
References: <20230822082752.121479-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822082752.121479-1-vanusuri@mvista.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 27 Aug 2023 13:33:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8241

merged to dunfell.

Bruce


In message: [meta-virtualization][dunfell][PATCH] kubernetes: Backport fix for CVE-2020-8565 & CVE-2020-8566
on 22/08/2023 Vijay Anusuri wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
> 
> Upstream-commit:https://github.com/kubernetes/kubernetes/commit/f0f52255412cbc6834bd225a59608ebb4a0d399b
> & https://github.com/kubernetes/kubernetes/commit/e91ec4fad3366d2dee020919f7c2a0d7b52fd3ea
> 
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../kubernetes/kubernetes/CVE-2020-8565.patch | 24 +++++++
>  .../kubernetes/kubernetes/CVE-2020-8566.patch | 67 +++++++++++++++++++
>  .../kubernetes/kubernetes_git.bb              |  2 +
>  3 files changed, 93 insertions(+)
>  create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2020-8565.patch
>  create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2020-8566.patch
> 
> diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2020-8565.patch b/recipes-containers/kubernetes/kubernetes/CVE-2020-8565.patch
> new file mode 100644
> index 0000000..c3772e9
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/CVE-2020-8565.patch
> @@ -0,0 +1,24 @@
> +From f0f52255412cbc6834bd225a59608ebb4a0d399b Mon Sep 17 00:00:00 2001
> +From: Sam Fowler <sfowler@redhat.com>
> +Date: Tue, 6 Oct 2020 11:10:38 +1000
> +Subject: [PATCH] Mask bearer token in logs when logLevel >= 9
> +
> +Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/commit/f0f52255412cbc6834bd225a59608ebb4a0d399b]
> +CVE: CVE-2020-8565
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + staging/src/k8s.io/client-go/transport/round_trippers.go | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/staging/src/k8s.io/client-go/transport/round_trippers.go b/staging/src/k8s.io/client-go/transport/round_trippers.go
> +index a05208d924d3b..f4cfadbd3da8e 100644
> +--- a/src/import/staging/src/k8s.io/client-go/transport/round_trippers.go
> ++++ b/src/import/staging/src/k8s.io/client-go/transport/round_trippers.go
> +@@ -340,6 +340,7 @@ func (r *requestInfo) toCurl() string {
> + 	headers := ""
> + 	for key, values := range r.RequestHeaders {
> + 		for _, value := range values {
> ++			value = maskValue(key, value)
> + 			headers += fmt.Sprintf(` -H %q`, fmt.Sprintf("%s: %s", key, value))
> + 		}
> + 	}
> diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2020-8566.patch b/recipes-containers/kubernetes/kubernetes/CVE-2020-8566.patch
> new file mode 100644
> index 0000000..7ed812d
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/CVE-2020-8566.patch
> @@ -0,0 +1,67 @@
> +From e91ec4fad3366d2dee020919f7c2a0d7b52fd3ea Mon Sep 17 00:00:00 2001
> +From: Sam Fowler <sfowler@redhat.com>
> +Date: Fri, 2 Oct 2020 10:48:11 +1000
> +Subject: [PATCH] Mask Ceph RBD adminSecrets in logs when logLevel >= 4
> +
> +Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/commit/e91ec4fad3366d2dee020919f7c2a0d7b52fd3ea]
> +CVE: CVE-2020-8566
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + pkg/volume/rbd/rbd_util.go | 12 ++++++------
> + 1 file changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/pkg/volume/rbd/rbd_util.go b/pkg/volume/rbd/rbd_util.go
> +index 85044e85fde..9593348de37 100644
> +--- a/src/import/pkg/volume/rbd/rbd_util.go
> ++++ b/src/import/pkg/volume/rbd/rbd_util.go
> +@@ -592,9 +592,9 @@ func (util *RBDUtil) CreateImage(p *rbdVolumeProvisioner) (r *v1.RBDPersistentVo
> + 	volSz := fmt.Sprintf("%d", sz)
> + 	mon := util.kernelRBDMonitorsOpt(p.Mon)
> + 	if p.rbdMounter.imageFormat == rbdImageFormat2 {
> +-		klog.V(4).Infof("rbd: create %s size %s format %s (features: %s) using mon %s, pool %s id %s key %s", p.rbdMounter.Image, volSz, p.rbdMounter.imageFormat, p.rbdMounter.imageFeatures, mon, p.rbdMounter.Pool, p.rbdMounter.adminId, p.rbdMounter.adminSecret)
> ++		klog.V(4).Infof("rbd: create %s size %s format %s (features: %s) using mon %s, pool %s id %s key <masked>", p.rbdMounter.Image, volSz, p.rbdMounter.imageFormat, p.rbdMounter.imageFeatures, mon, p.rbdMounter.Pool, p.rbdMounter.adminId)
> + 	} else {
> +-		klog.V(4).Infof("rbd: create %s size %s format %s using mon %s, pool %s id %s key %s", p.rbdMounter.Image, volSz, p.rbdMounter.imageFormat, mon, p.rbdMounter.Pool, p.rbdMounter.adminId, p.rbdMounter.adminSecret)
> ++		klog.V(4).Infof("rbd: create %s size %s format %s using mon %s, pool %s id %s key <masked>", p.rbdMounter.Image, volSz, p.rbdMounter.imageFormat, mon, p.rbdMounter.Pool, p.rbdMounter.adminId)
> + 	}
> + 	args := []string{"create", p.rbdMounter.Image, "--size", volSz, "--pool", p.rbdMounter.Pool, "--id", p.rbdMounter.adminId, "-m", mon, "--key=" + p.rbdMounter.adminSecret, "--image-format", p.rbdMounter.imageFormat}
> + 	if p.rbdMounter.imageFormat == rbdImageFormat2 {
> +@@ -629,7 +629,7 @@ func (util *RBDUtil) DeleteImage(p *rbdVolumeDeleter) error {
> + 	}
> + 	// rbd rm.
> + 	mon := util.kernelRBDMonitorsOpt(p.rbdMounter.Mon)
> +-	klog.V(4).Infof("rbd: rm %s using mon %s, pool %s id %s key %s", p.rbdMounter.Image, mon, p.rbdMounter.Pool, p.rbdMounter.adminId, p.rbdMounter.adminSecret)
> ++	klog.V(4).Infof("rbd: rm %s using mon %s, pool %s id %s key <masked>", p.rbdMounter.Image, mon, p.rbdMounter.Pool, p.rbdMounter.adminId)
> + 	output, err = p.exec.Command("rbd",
> + 		"rm", p.rbdMounter.Image, "--pool", p.rbdMounter.Pool, "--id", p.rbdMounter.adminId, "-m", mon, "--key="+p.rbdMounter.adminSecret).CombinedOutput()
> + 	if err == nil {
> +@@ -661,7 +661,7 @@ func (util *RBDUtil) ExpandImage(rbdExpander *rbdVolumeExpander, oldSize resourc
> + 
> + 	// rbd resize.
> + 	mon := util.kernelRBDMonitorsOpt(rbdExpander.rbdMounter.Mon)
> +-	klog.V(4).Infof("rbd: resize %s using mon %s, pool %s id %s key %s", rbdExpander.rbdMounter.Image, mon, rbdExpander.rbdMounter.Pool, rbdExpander.rbdMounter.adminId, rbdExpander.rbdMounter.adminSecret)
> ++	klog.V(4).Infof("rbd: resize %s using mon %s, pool %s id %s key <masked>", rbdExpander.rbdMounter.Image, mon, rbdExpander.rbdMounter.Pool, rbdExpander.rbdMounter.adminId)
> + 	output, err = rbdExpander.exec.Command("rbd",
> + 		"resize", rbdExpander.rbdMounter.Image, "--size", newVolSz, "--pool", rbdExpander.rbdMounter.Pool, "--id", rbdExpander.rbdMounter.adminId, "-m", mon, "--key="+rbdExpander.rbdMounter.adminSecret).CombinedOutput()
> + 	if err == nil {
> +@@ -703,7 +703,7 @@ func (util *RBDUtil) rbdInfo(b *rbdMounter) (int, error) {
> + 	// # image does not exist (exit=2)
> + 	// rbd: error opening image 1234: (2) No such file or directory
> + 	//
> +-	klog.V(4).Infof("rbd: info %s using mon %s, pool %s id %s key %s", b.Image, mon, b.Pool, id, secret)
> ++	klog.V(4).Infof("rbd: info %s using mon %s, pool %s id %s key <masked>", b.Image, mon, b.Pool, id)
> + 	output, err = b.exec.Command("rbd",
> + 		"info", b.Image, "--pool", b.Pool, "-m", mon, "--id", id, "--key="+secret, "-k=/dev/null", "--format=json").CombinedOutput()
> + 
> +@@ -766,7 +766,7 @@ func (util *RBDUtil) rbdStatus(b *rbdMounter) (bool, string, error) {
> + 	// # image does not exist (exit=2)
> + 	// rbd: error opening image kubernetes-dynamic-pvc-<UUID>: (2) No such file or directory
> + 	//
> +-	klog.V(4).Infof("rbd: status %s using mon %s, pool %s id %s key %s", b.Image, mon, b.Pool, id, secret)
> ++	klog.V(4).Infof("rbd: status %s using mon %s, pool %s id %s key <masked>", b.Image, mon, b.Pool, id)
> + 	cmd, err = b.exec.Command("rbd",
> + 		"status", b.Image, "--pool", b.Pool, "-m", mon, "--id", id, "--key="+secret).CombinedOutput()
> + 	output = string(cmd)
> +-- 
> +2.25.1
> +
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index c73f988..2b0bfb7 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -12,6 +12,8 @@ SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.17;name=k
>             file://0001-hack-lib-golang.sh-use-CC-from-environment.patch \
>             file://0001-cross-don-t-build-tests-by-default.patch \
>             file://CVE-2020-8564.patch \
> +           file://CVE-2020-8565.patch \
> +           file://CVE-2020-8566.patch \
>            "
>  
>  DEPENDS += "rsync-native \
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8218): https://lists.yoctoproject.org/g/meta-virtualization/message/8218
> Mute This Topic: https://lists.yoctoproject.org/mt/100890412/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



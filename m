Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 048F4C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 13:19:28 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web09.11773.1660051167205302966
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 06:19:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HgCSOcyk;
 spf=pass (domain: gmail.com, ip: 209.85.167.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id s199so7949201oie.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 06:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=aDoYLM4GKWdTDhFk4dFfH3xhnrKAgEJxjAajbprcKag=;
        b=HgCSOcykm5ecKig4S4bjAKPsPywqAeFL2huq8SJ4x4lvaaJs0P9BQ3E6u2VG4Vo24x
         tDtPIx7UKbI6tkmNL8SZxDl+yxSae9N29BXLQghquPBH/sOw1PL//7dRr9kFsSFW/5nY
         iAYdypgMCZpENgGxn28+tptGFokuL6vHPuilBItKSP0Bb/WtMWr50GVP+XmgUTcWXIGm
         lDtt1Hi/DX89LXZ9WTAl05VnOzxtMiwxpg91eDIwBedORLe29DFlw4BwkPKu8zKrus8i
         3+Wkz1crxSimEAnpLkEFYU+u+at6iSa7kQCCfab5ajp+6EDMIzsIk4xb+GHtgFzuL7Nx
         B8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=aDoYLM4GKWdTDhFk4dFfH3xhnrKAgEJxjAajbprcKag=;
        b=a5Mk7HmF4zLGwySXEaKHGUicH0fUTD7LZEpeRLIRB+8eM6jRmwhgo8ibh7wkCCP34+
         aFE5qALrJNxWBtUIlWFTcZQXaNm9OINygYUapTP/V2Op7llldVZnPqpq/er+MXO9KEc8
         AeK3eL5Frcbi1kzhi+/RefbYt8HxHZzgqcrIU8TmWj4TrxXnr/3m7BiDso6MzeoiRbqz
         /tXmn+i1BDqoPrzvksg6SHHfyNVrxtr+S0kuvfztpGi/i7SmhxBLi3H7MHL9HQargynf
         dMnZuOmz9+a48dvWZ4fGGcIaNL/LberHAowCsQM5NZAXib12H7D/Xl8I7sMViTNRiP0C
         S2QA==
X-Gm-Message-State: ACgBeo04uOMnbwHuFxyFhLHLTUvLhFhbrJC6Z7ZBvyKggB7cA2InVnSX
	713UGYpKn0L7WW56Jmp3JRGP7Grmk4/2V+PdJuTA5EwetbM=
X-Google-Smtp-Source: 
 AA6agR4599yFzqCY0rzx9FSZx3SOcwYGigdJeZKSMl2l+Apd3rYBzgXmuebW881mj/vRuVjvcjfTFvJMQi/oPvY7+E4=
X-Received: by 2002:a05:6808:1312:b0:341:cbcd:5387 with SMTP id
 y18-20020a056808131200b00341cbcd5387mr12283288oiv.175.1660051166493; Tue, 09
 Aug 2022 06:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220809121619.32258-1-jose.quaresma@foundries.io>
 <20220809121619.32258-2-jose.quaresma@foundries.io>
In-Reply-To: <20220809121619.32258-2-jose.quaresma@foundries.io>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 9 Aug 2022 09:19:14 -0400
Message-ID: 
 <CADkTA4OGLGXrRWaEVJMpUKs_X3F3nJf1Y7LUQP4SziXXPaBJ2g@mail.gmail.com>
Subject: Re: [meta-virtualization][kirkstone][master][PATCH 2/4] kubernetes:
 install the binaries in OE standard places
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Aug 2022 13:19:28 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7500

You must have something different in your environment, I'm not seeing
any of these same issues.

Cheers,

Bruce

On Tue, Aug 9, 2022 at 8:16 AM Jose Quaresma <quaresma.jose@gmail.com> wrote:
>
> - The env BIN_PREFIX is there from the beginning but there are no references to it,
> also fix a fatal QA errors installed-vs-shipped.
>
> ERROR: kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d5456df6771aa9b5-r0 do_package: QA Issue: kubernetes: Files/directories were installed but not shipped in any package:
>   /bin
>   /bin/k8s-init
> Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
> kubernetes: 2 installed and not shipped files. [installed-vs-shipped]
> ERROR: kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d5456df6771aa9b5-r0 do_package: Fatal QA errors were found, failing task.
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  recipes-containers/kubernetes/kubernetes_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index e9460d4..82b75b1 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -103,8 +103,8 @@ do_install() {
>      install -m 0644 ${WORKDIR}/git/release/cmd/kubepkg/templates/latest/deb/kubeadm/10-kubeadm.conf  ${D}${systemd_unitdir}/system/kubelet.service.d/
>
>      if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> -       install -d "${D}${BIN_PREFIX}/bin"
> -       install -m 755 "${WORKDIR}/k8s-init" "${D}${BIN_PREFIX}/bin"
> +       install -d ${D}${bindir}
> +       install -m 755 ${WORKDIR}/k8s-init ${D}${bindir}
>
>         install -d ${D}${sysconfdir}/sysctl.d
>         install -m 0644 "${WORKDIR}/99-kubernetes.conf" "${D}${sysconfdir}/sysctl.d"
> @@ -141,7 +141,7 @@ FILES:kube-proxy = "${bindir}/kube-proxy"
>  FILES:${PN}-misc = "${bindir} ${sysconfdir}/sysctl.d"
>
>  ALLOW_EMPTY:${PN}-host = "1"
> -FILE:${PN}-host = "${BIN_PREFIX}/bin/k8s-init"
> +FILE:${PN}-host = "${bindir}/k8s-init"
>  RDEPENDS:${PN}-host = "${PN}"
>
>  RRECOMMENDS:${PN} = "\
> --
> 2.37.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7496): https://lists.yoctoproject.org/g/meta-virtualization/message/7496
> Mute This Topic: https://lists.yoctoproject.org/mt/92913426/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


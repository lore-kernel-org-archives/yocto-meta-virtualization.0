Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF43E674AE
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 13:08:52 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.79712.1766408931363431776
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 22 Dec 2025 05:08:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PUVzSgRI;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo4485378b3a.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Dec 2025 05:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766408931; x=1767013731; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVqI8KoRypBK7gojEY43pwtjJN9JoU1kNTNCdlR7Lk4=;
        b=PUVzSgRIPOL5AUKlRmRRS/zUcIjUGvsMGwDk+hE9UOSn9ZDgmlgaCv2aLVBt3d3+5H
         W6Rl1bhcrb4YqslZAZFt7YEilFFctyFA0a9T6Gezy5PrMaz8GE9KdidZF6kPkvFXH6wE
         j/N1n0HGlcvd6sFHHWBf9rmCMts6pUJcIYn93JHoyg2cgsWexkZgnvSvKWbtVcjIPbcT
         k+DGZ5rnRpgB6wfoPKQVrbZS7nJyN6J/pNk1lUZ51sUqVpzLsrvOaFQ401G9jMJ/OYMl
         RwB1LnctsChWhqDzHvZovH9ozalY8hiw5gQ0SVZOqMXvGgEP2a4BRulHIOqneB8lKpZx
         RDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408931; x=1767013731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aVqI8KoRypBK7gojEY43pwtjJN9JoU1kNTNCdlR7Lk4=;
        b=fXrVgViaqMbS+VeIj+2DdWlT2a08YjZIk1Ea7533Ve1biQhMqp8kPNMxFPCiP92aO9
         0eWvM4FwI0lnGy9r7b5p+mykEVncSam8C5IOy430+nDGmQp/8kH57IriHnZfqvnfzadJ
         QkZPqnrvKW4hwIOhCgXMj3P02gGiulrPrQyFD2lD18hadU07hcZqB5fpllcjbaikkUW6
         imuPlBiDn6H36T5D5+GqDz9SWioSZhAhivEpnnz3teRNG3iDC//VkKrFofZjPdmQdHrV
         4uYLFPlgpoPhEkQ6auP2sb8wV5aQPB50xTMCyVLa4m4/eKzCEOiE8O6ZFEjoAQbDY2KN
         L6Zw==
X-Gm-Message-State: AOJu0Ywo51JgOL+YHxTXR2fga4c+5GZYCkHbqYu5icUcEujnjNcjuDTd
	1gPNznj54S1p7hkGLIw/UoEPzjIHPmHgECMXuoijaOv3v/yzKKO5UL7SXw5laCNgu7iJLpmciUX
	B1aSJxvalGNwz9FlagYCayj8BJvYod7k=
X-Gm-Gg: AY/fxX4uD5/af8zGYeyZaFcuvSHgYamR9cPI5rvAEyJLxdCZ7Q3ZK/CKDoEsMuNZIpc
	Zdx/wqtrboG0wr4jyuuT1DI13GciHmkdxmzso+kvSKhm3I0AG/j+aBzu57YleQjfV+gUbVf7xWe
	0Mv7UQIgM7JCWyMDu/awHJ+WRAffzCBXhInNcym5FUxz1Y8ajCoFeE3yxUmheXacchyL7J0zWEo
	lerNicSs6URlR5MzUB4KKRShJvXPo8QLNaglfe+gWTl/ysTornl2NxH8zJSWjIMvjjUth5u
X-Google-Smtp-Source: AGHT+IGo7FVCRJA4UlXb3qSmnhY077Tk+xOIRpCN3KDIKibf5NknN/3Jgm4/HufD9PnOs7hiMNnnr0nfYduBPB3h20I=
X-Received: by 2002:a05:6a20:430f:b0:364:13ab:d4c5 with SMTP id
 adf61e73a8af0-376a8eb7985mr11530409637.26.1766408930627; Mon, 22 Dec 2025
 05:08:50 -0800 (PST)
MIME-Version: 1.0
References: <20251204064329.568898-1-vudupa@qti.qualcomm.com> <PH0PR02MB879642E5EB65B35A4CE40540F1B4A@PH0PR02MB8796.namprd02.prod.outlook.com>
In-Reply-To: <PH0PR02MB879642E5EB65B35A4CE40540F1B4A@PH0PR02MB8796.namprd02.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 22 Dec 2025 08:08:39 -0500
X-Gm-Features: AQt7F2r8UIaeCwvlPnjlTv0TaHlwPY0DHs83Ognz1GI38vdUxnMf32gLJI2pBkE
Message-ID: <CADkTA4MozuAMZbtmtBZNEau2gSnzH29DLyOopmh9jXPDuxTt-A@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH v2] lxc: delete empty lxc state directory
To: vudupa@qti.qualcomm.com
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	"anuj.mittal@oss.qualcomm.com" <anuj.mittal@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Dec 2025 13:08:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9497

On Mon, Dec 22, 2025 at 1:18=E2=80=AFAM Vishwas Udupa via
lists.yoctoproject.org
<vudupa=3Dqti.qualcomm.com@lists.yoctoproject.org> wrote:
>
> Is there any feedback on this patch?

Not yet, or you would have gotten an email ;)

> Could you please merge this.

This part of the message is not needed, it comes across not as
a question, but a demand.

I'm working on some final release items (and had to get the 6.18
kernel into OEcore). I expect to have them done in the next few
days.

After that work is done, I'll return to the queue and finish
pending reviews and merges

Cheers,

Bruce

>
> regards,
> Vishwas
>
> ________________________________
> From: Vishwas Udupa <vudupa@qti.qualcomm.com>
> Sent: Thursday, December 04, 2025 12:13 PM
> To: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists=
.yoctoproject.org>
> Cc: anuj.mittal@oss.qualcomm.com <anuj.mittal@oss.qualcomm.com>; Vishwas =
Udupa <vudupa@qti.qualcomm.com>
> Subject: [PATCH v2] lxc: delete empty lxc state directory
>
> lxc systemd service [1] defines a StateDirectory to ensure that
> the /var/lib/lxc directory is automatically created and managed
> by systemd during service startup.
> Do not create lxc directory at build time for systemd.
>
> [1] https://github.com/lxc/lxc/blob/f9ff9ea2a92653a823edf25e8e28c9dab08b3=
090/config/init/systemd/lxc.service.in#L16
>
> Signed-off-by: Vishwas Udupa <vudupa@qti.qualcomm.com>
> ---
>  recipes-containers/lxc/lxc_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/l=
xc_git.bb
> index d6f137d3..542134db 100644
> --- a/recipes-containers/lxc/lxc_git.bb
> +++ b/recipes-containers/lxc/lxc_git.bb
> @@ -141,7 +141,7 @@ do_install:append() {
>
>          if "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', '=
false', d)}"; then
>              # nothing special for systemd at the moment
> -           true
> +           (cd ${D}${localstatedir}; [ -d lib/lxc ] && rmdir -v --parent=
s lib/lxc)
>          else
>              # with meson, these aren't built unless sysvinit is the enab=
led
>              # init system.
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9496): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/9496
> Mute This Topic: https://lists.yoctoproject.org/mt/116608759/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


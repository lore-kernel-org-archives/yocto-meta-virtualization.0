Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E14C44516
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 23:17:19 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.700.1784330235110849708
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Jul 2026 16:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fQzMGIj7;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-845c92bc464so4752709b3a.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Jul 2026 16:17:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784330234; cv=none;
        d=google.com; s=arc-20260327;
        b=osUtqqWSz9a178Is2L4asVK7cIzVyHqu+DH1gNm0flK4nwKK+aQA+Ut83KOStHZqo7
         iVQAgOCsVtkL1kKsUJM4MAnJwvKpa5ZrgfCxJFBlHurNIB25qtfJwIByJrZMHrYa08AW
         xzyM9NNmhkE1o9+oz6y/bv9LI2PMidP9QITe+q8GaXf+LJlQAVT1B4oKtWJhK0wyA2ci
         GKrCDCpOw4d1Irt1ps2r819ruEeN7U/okY3iw0V6Pro+s6ArfvB/BFpF6Iu2foO4COFD
         Jl1Ne3jdWoHX3GaKZFu/B4RyHmui9FQU3CINQ/dqH1ecoZoEI8rQbYKnmJDlO9i2hhQD
         UbkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YNV9Fx2dcMujwHb3GNQz0r0iczQqo4U5Z8VcN2/0CM8=;
        fh=Bmjc5AD2zSnSs3TEk9my45olU1WXqaz7lg7VOwso468=;
        b=sZevV4aJc/orCyVPwQtBSzdvHUGV/lgrnkPOigV4Pthy9+5nVVDlPpGc1K/YV0JQab
         PCMisGTgXywy1ktwWOEYi1RRKORCtw4iq1/1urF1n/pqj+s2DW6K6ZZsn/jQfR6blUX7
         rFLoATWTOPiAtYJ7DlCYgmbFPSwZnDkwhkY9wed/ysOOnY3anbGB4PYEWAzjQT/CxbQd
         mccE2XGMrQv1wPApjAls59yCw9UXLfYaj610kjNnkK67FJV0eelbOfVEAXMZ/zBlKp9F
         7nokyOWNfb5/RtTFVg/YPMAyw8cl7CSNpjdeJce6FGZQb7+rH6tEEknOVxp1f26JmI0a
         +XIQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784330234; x=1784935034; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YNV9Fx2dcMujwHb3GNQz0r0iczQqo4U5Z8VcN2/0CM8=;
        b=fQzMGIj7rCckV0wRGQgen8zfo9a43wwqqP5AE9UZOj0dCOon+WHQZulqRo2iOm5128
         mgJk5zpQSv8veXl9P0H6EoElJibH0KfiGg6nfRUeWAV2Uu6O95m3vT9TK0Bp3D8BBppx
         bKgPfEucGic9ngt4HYgdN4Q2j109w/3sD8Aq55dL4Ah+6gZA4fWK/rC3ptU3TbZGC4Y9
         tKRZbWu0pLw/5qEx5Go5gLx8LBErGgZWWd1qvafhiCei1TgqkWPJ9RvVtF6T1F5tqPIx
         SJ1kAuO4MACksCboaDhCXzrBeOahxDbyrq9ZWQbM41+5AisCNwBZTSAPUVx0QpJh5i6f
         JzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784330234; x=1784935034;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YNV9Fx2dcMujwHb3GNQz0r0iczQqo4U5Z8VcN2/0CM8=;
        b=UOx3I1RLGJOcmOA0hDLXszGh/GfeSBx1Yu4Wnw6DUFno63BChwya39biN7LmperZ9R
         TtbjmU83p+a3Tb+OnB3pMN4z+zwnIjApqOn9Y2vFxdZa0CKsXVuzvpbweX4E1y9p5vI4
         FUIS+m19eBT1U9jFKior+BEWRIYfPrtZtZn2KwK620ha5+gdN4W9oVh+xsSt1e1Ep7mN
         Y6hWVTMYupF+CcCp6+sjieX0k3QbFIprOtbj0kfwRvTHMLwQFWjW/GVxuol3aLom6PLk
         e/t6S8vyi4xfudmTj+aLzhAbUCmwAbvV09PZ3lcjOd0wH4MzC3BS/+Da8HqbfTA3u6f9
         dDxQ==
X-Gm-Message-State: AOJu0Yy4oG1SGJni+ih1lqoFyKUANyZZ/9QE4bdDrcfXQj/q/tZpUAeL
	0Rrv997+BTWqNAf7mglH3iKFqBku/W55KoJU9Pkc6FCiSn6arZQgYUvmkfXGcKmkDkeEABD6s4s
	filTwi4Efob/jbn8sxAFA+xYqf2jvTa6lTNWK
X-Gm-Gg: AfdE7cm0+vTU9ezAlfR3cMGwSVkHHlVrfzJ0Dj/WkNnVebGvXfEF6HzEeQyr5eorzAY
	ME8xAu9F1gLUzUc1xq9bYxCQ3skMxa7MsASvxIuG1kAlHAPVpZs8RZQJkjMJMHBvhXOfnL2K2mz
	GY1Tt+4LGYZiS9kIcqGHDYW62UHw7T8QN/UjUteJNJxAU0NKw2hHiTJQTh+rbRRYwhbpCK5GY7S
	Fbl6xIkaXr1WLFmLX9CD+twXg/gqsUzh+E7G+L/sUlGlMg6UGW4J2r5RzpOeLUVPl3Q6PU36DR6
	AZZ/qSBKgarqvoHB5gdycGO2uQ5/tnBK7O/0vxJ2A7X9p/JmYzG9mL1MgPumq4RoampB6Bufl1U
	PlHXc
X-Received: by 2002:a05:6a20:c70b:b0:3b4:cd6:88b with SMTP id
 adf61e73a8af0-3c3ada1e7d0mr5228244637.46.1784330234298; Fri, 17 Jul 2026
 16:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260717200521.3747191-1-kris.gavvala@windriver.com>
In-Reply-To: <20260717200521.3747191-1-kris.gavvala@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 17 Jul 2026 19:17:03 -0400
X-Gm-Features: AUfX_my2ovagyCmEaMSP3UBhuWdy_HRte0mvVJe-QIsGShWHpQ5yDOUCQnn8COo
Message-ID: <CADkTA4PEAiLJZ1b1PDpF0PRe-Xk+W1Rq0vcs8tP-UJ7CQrixEw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] libvirt: fix typo messon -> meson in
 patch filename
To: Kris.Gavvala@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Jul 2026 23:17:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9956

On Fri, Jul 17, 2026 at 4:05=E2=80=AFPM Gavvala, Kris via
lists.yoctoproject.org
<Kris.Gavvala=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
> Fixed a typo in a patch filename (messon instead of meson).
> Its a minor issue, but could cause some confusion while seaching.
>
> The patch is not being referenced anywhere so nothing else needs
> updating.

If it's not being referenced, we should just delete it.

Bruce

>
> Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
> ---
>  ...001-meson.build-remove-build-path-information-to-avoid-.patch} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename recipes-extended/libvirt/libvirt/{0001-messon.build-remove-build-=
path-information-to-avoid-.patch =3D> 0001-meson.build-remove-build-path-in=
formation-to-avoid-.patch} (100%)
>
> diff --git a/recipes-extended/libvirt/libvirt/0001-messon.build-remove-bu=
ild-path-information-to-avoid-.patch b/recipes-extended/libvirt/libvirt/000=
1-meson.build-remove-build-path-information-to-avoid-.patch
> similarity index 100%
> rename from recipes-extended/libvirt/libvirt/0001-messon.build-remove-bui=
ld-path-information-to-avoid-.patch
> rename to recipes-extended/libvirt/libvirt/0001-meson.build-remove-build-=
path-information-to-avoid-.patch
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9955): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/9955
> Mute This Topic: https://lists.yoctoproject.org/mt/120321751/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


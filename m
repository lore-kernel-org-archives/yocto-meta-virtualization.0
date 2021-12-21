Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 141C3C433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 04:39:27 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web10.2248.1640061566051290077
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Dec 2021 20:39:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nK3auiX7;
 spf=pass (domain: gmail.com, ip: 209.85.221.177,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id b77so2021235vka.11
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Dec 2021 20:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jX6XlrRwWcNpYCO3tskRaDf23qqastjYwIDiKil4hQ4=;
        b=nK3auiX7F9Zj6GW7U+0EgaZkFXhf/Qj7ecg/K9hCCPfqABVDcgRiWmEWCd8S0THx8Z
         Vc0tv3JIOTqWPHhru5huvTo0ieT/vXkIrDr/vTeXwY1lqknZv8MVkLQQKlHv2cN6nQkW
         LDHhSJ/cgF5qFidfqwe6JC0QPiTPJF6EWA236KG8IBotVvqatQos/k7ooQj98FjT0iuA
         tM3xNptRMSO32K7XOxjlNP1OswIcKCJdJ116YQweoPtK6XDC4liztpg9k1da0t1mvoyE
         E17KG0aRSjWuVW8SlDPIZw3JggIBQDxu6nZ0MtCVer2y6nnC/sjumRJnmV4jFe65wOeI
         QBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jX6XlrRwWcNpYCO3tskRaDf23qqastjYwIDiKil4hQ4=;
        b=j4IexXLPw3NBszku6JZAba5a2NXzZ+jEg9P3IXBvYgg66wJurJNcU2fcd+I0EEAD7E
         sykN5KwF72zHkapcbvpb/bkoijgpAT42ucn6hFD7H3sLPFJUAobtWO2BBPM4upfnpfBC
         rAsn8Z2F6Brfrp/Xo+o3B2EuEr5MuELBXlA5+zohi859vfnUrUiv8aWDvCyy6sQp4IFm
         zfAF4zo5LPf9CCbfCLAoTSLHTesAnKWUfjQlqf8wVIzHSdJWwRBV/zXCpqTDhMmUS2Af
         OnZJFl5CBPuqqtxSlw45cogHCaA1xYW1lpxgMzUN6/SAyVTtanKh0aqco+s9ALqKK1Wf
         6KeQ==
X-Gm-Message-State: AOAM5334/sEtFOuhMCURyWXOC9Ay5AGtZ8x+vpKLDYUXJrZ0fQq/cpHP
	2jm75bNLXGiOhV/GmIaJxbGOIhSftGYsR1FwJ1c=
X-Google-Smtp-Source: 
 ABdhPJyaf0R86WGxvV6zSA6tr45jEs6HPbocvECuikK0eylCBfAAaGcy9C75o8YDEWV8oA9WNoTldcmYNp7izYqDsC0=
X-Received: by 2002:a1f:ff0a:: with SMTP id p10mr445297vki.1.1640061565098;
 Mon, 20 Dec 2021 20:39:25 -0800 (PST)
MIME-Version: 1.0
References: <20211209135752.6872-1-kamil.dziezyk@arm.com>
 <20211209135752.6872-2-kamil.dziezyk@arm.com>
In-Reply-To: <20211209135752.6872-2-kamil.dziezyk@arm.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Mon, 20 Dec 2021 20:39:14 -0800
Message-ID: 
 <CACMJ4GZTTz9L1_+8Ldd8_4x6EUOfJeps_K11UP9stjdxBBKjmg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2 2/3] xen: Clear TUNE_CCARGS for
 Xen build for aarch64 machines
To: Kamil Dziezyk <kamil.dziezyk@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd <nd@arm.com>,
	Doug Goldstein <cardoe@gentoo.org>
Content-Type: multipart/alternative; boundary="000000000000ff5fb205d3a096db"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Dec 2021 04:39:27 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/6984

--000000000000ff5fb205d3a096db
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 9, 2021 at 5:59 AM Kamil Dziezyk <kamil.dziezyk@arm.com> wrote:

> Xen build may fail for arm machines that have enabled extra flags,
> that can be enabled only for specific architecture version, e.g. armv8-2a.
>

Apologies for being slow to review this one.

From looking at "bitbake -e xen" for an example Raspberry Pi 4 aarch64
build configuration, the major variables that this affects looks like: CPP,
CXX and EXTRA_CFLAGS_XEN_TOOLS.
So is it the xen recipe or the xen-tools recipe that this patch is intended
to fix the build for? (or both?)

I can't immediately tell what compilation this fixes, but: I think that
this change is probably OK for the hypervisor case, since TUNE_CCARGS is
already excluded from the definition of CC for aarch64 for the hypervisor
build, but for the tools it will affect the compiler flags, so:

Do you really intend to drop all "-mcpu" and "-march" C compiler flags from
the Xen tools build, for any aarch64 MACHINEs? Should your MACHINEs
actually populate TUNE_CCARGS with those flags if they are not wanted for
userspace software? -- or is there a problem that is specifically being
encountered with the Xen tools software build? If so, I'd like to know a
bit more about that -- and then this workaround may be OK if we can confirm
that it doesn't negatively affect the MACHINEs that we care about, which
include QemuArm64 and the Rpi4 as a reference platform.

As an aside, I would like to remove the similar x86 logic from this recipe
where TUNE_CCARGS is cleared to address the hvmloader build, and fix that
in a better way. (That will be separate to this work.)

The comment that is being added refers to "HVM-mode": is that term still
accurate for Xen on Arm?

The subject line for this patch should indicate both "xen" and "xen-tools",
since this modifies xen.inc which is included by both recipes. I would
encourage you to CC both myself and Doug on future posts of Xen-related
patches, please.

thanks

Christopher



>
> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
> ---
>  recipes-extended/xen/xen.inc | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index d3c7a7d..9ac82ef 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -102,6 +102,11 @@ EXTRA_CFLAGS_XEN_CORE="${DEBUG_PREFIX_MAP}"
>  #   EXTRA_CFLAGS_XEN_TOOLS: so clear TUNE_CCARGS on x86 to prevent that.
>  TUNE_CCARGS:x86-64=""
>
> +# - The Xen build for aarch64 systems with HVM-mode enabled may include
> +#   architecture specific flags '-march=*' which causes build failure, so
> clear
> +#   TUNE_CCARGS on aarch64 to prevent that.
> +TUNE_CCARGS:aarch64=""
> +
>  # - Yocto supplies the _FORTIFY_SOURCE flag via CC/CPP/CXX but then
> passes the
>  #   optimization -O via C*FLAGS which is problematic when the CFLAGS are
> cleared
>  #   within the build because compilation fails with the compiler stating
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6973):
> https://lists.yoctoproject.org/g/meta-virtualization/message/6973
> Mute This Topic: https://lists.yoctoproject.org/mt/87611981/3619036
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> christopher.w.clark+meta-virt@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000ff5fb205d3a096db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Dec 9, 2021 at 5:59 AM Kamil Dzie=
zyk &lt;<a href=3D"mailto:kamil.dziezyk@arm.com">kamil.dziezyk@arm.com</a>&=
gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Xen build may fail for arm machines that have enabled=
 extra flags,<br>
that can be enabled only for specific architecture version, e.g. armv8-2a.<=
br></blockquote><div><br></div><div>Apologies for being slow to review this=
 one.</div><div><br></div><div><div>From looking at &quot;bitbake -e xen&qu=
ot; for an example Raspberry Pi 4 aarch64 build configuration, the major va=
riables that this affects looks like: CPP, CXX and=C2=A0EXTRA_CFLAGS_XEN_TO=
OLS.</div><div>So is it the xen recipe or the xen-tools recipe that this pa=
tch is intended to fix the build for? (or both?)<br></div></div><div><br></=
div><div>I can&#39;t immediately tell what compilation this fixes, but: I t=
hink that this change is probably OK for the hypervisor case, since TUNE_CC=
ARGS is already excluded from the definition of CC for aarch64 for the hype=
rvisor build, but for the tools it will affect the compiler flags, so:</div=
><div><br></div><div>Do you really intend to drop all &quot;-mcpu&quot; and=
 &quot;-march&quot; C compiler flags from the Xen tools build, for any aarc=
h64 MACHINEs? Should your MACHINEs actually populate TUNE_CCARGS with those=
 flags if they are not wanted for userspace software? -- or is there a prob=
lem that is specifically being encountered with the Xen tools software buil=
d? If so, I&#39;d like to know a bit more about that -- and then this worka=
round may be OK if we can confirm that it doesn&#39;t negatively affect the=
 MACHINEs that we care about, which include QemuArm64 and the Rpi4 as a ref=
erence platform.</div><div><br></div><div><div>As an aside, I would like to=
 remove the similar x86 logic from this recipe where TUNE_CCARGS is cleared=
 to address the hvmloader build, and fix that in a better way. (That will b=
e separate to this work.)</div></div><div><br></div><div>The comment that i=
s being added refers to &quot;HVM-mode&quot;: is that term still accurate f=
or Xen on Arm?</div><div><br></div><div><div><div>The subject line for this=
 patch should indicate both &quot;xen&quot; and &quot;xen-tools&quot;, sinc=
e this modifies xen.inc which is included by both recipes. I would encourag=
e you to CC both myself and Doug on future posts of Xen-related patches, pl=
ease.</div></div></div><div><br></div><div>thanks</div><div><br></div><div>=
Christopher</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
Signed-off-by: Kamil Dziezyk &lt;<a href=3D"mailto:kamil.dziezyk@arm.com" t=
arget=3D"_blank">kamil.dziezyk@arm.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/xen/xen.inc | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index d3c7a7d..9ac82ef 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -102,6 +102,11 @@ EXTRA_CFLAGS_XEN_CORE=3D&quot;${DEBUG_PREFIX_MAP}&quot=
;<br>
=C2=A0#=C2=A0 =C2=A0EXTRA_CFLAGS_XEN_TOOLS: so clear TUNE_CCARGS on x86 to =
prevent that.<br>
=C2=A0TUNE_CCARGS:x86-64=3D&quot;&quot;<br>
<br>
+# - The Xen build for aarch64 systems with HVM-mode enabled may include<br=
>
+#=C2=A0 =C2=A0architecture specific flags &#39;-march=3D*&#39; which cause=
s build failure, so clear<br>
+#=C2=A0 =C2=A0TUNE_CCARGS on aarch64 to prevent that.<br>
+TUNE_CCARGS:aarch64=3D&quot;&quot;<br>
+<br>
=C2=A0# - Yocto supplies the _FORTIFY_SOURCE flag via CC/CPP/CXX but then p=
asses the<br>
=C2=A0#=C2=A0 =C2=A0optimization -O via C*FLAGS which is problematic when t=
he CFLAGS are cleared<br>
=C2=A0#=C2=A0 =C2=A0within the build because compilation fails with the com=
piler stating<br>
-- <br>
2.17.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#6973): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/6973" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/6973</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/87611981/3619=
036" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/87611981/3619036</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:christopher.w.clark%2B=
meta-virt@gmail.com" target=3D"_blank">christopher.w.clark+meta-virt@gmail.=
com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000ff5fb205d3a096db--


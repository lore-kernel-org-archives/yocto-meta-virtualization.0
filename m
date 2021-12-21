Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CDBEC433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 04:52:53 +0000 (UTC)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
 [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.web11.2317.1640062372506520521
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Dec 2021 20:52:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YyBjvdi2;
 spf=pass (domain: gmail.com, ip: 209.85.221.172,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-vk1-f172.google.com with SMTP id m185so7453268vkm.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Dec 2021 20:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=btzgZmUj7fOiqh6N1JGHMuOKEoMoHZbVmNS8tNnqGg0=;
        b=YyBjvdi2qbXA66rlfmHtjUG4ix6tqfrLX1kjGo7jmK4jUab1BH3SzYKsNeCBxNJ0pJ
         4vlZ+ijT9qTZ1LYYktgI4PNMKEQZ6FcjrG/CxCjEp9AMgMMD+SIqfJnR0kX0944KKnne
         WvSRaegY6JlKbz1Gd4Z3RgH23p92IU5NRLnz32TfgI28a6tTtx0igPHJy1LNrZCl9eaT
         zXQK/2DM3Vlj3rXvgvU9CN2k7F2C/gnAduBVcBv1n30Tz0n1v/DkcAVrcGwyNFLW6Jt0
         Hm8hU/GljijcAu41JeARyc17cnIfGMd/dIcCOgVS+mukm83L3vdtUceK/5TpLR+vvlI8
         yp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=btzgZmUj7fOiqh6N1JGHMuOKEoMoHZbVmNS8tNnqGg0=;
        b=qq5d0CQuBI8gK3lFHBOZfVmEvUyCRd1eLrHDEtT+BkJ5i8+rpXzKcg/ASEZ1PvLpxw
         o7nY5V2kTvB4OQyAFGolWsrRMbwAfTNz59b0oUq1p3Nv5vhiDY7VzGuiRIKuSLBuVqZ9
         xSRcLd2zTa6tcti9JsBSElrKXJAzyuu0v2iEN78S3/ovult/fBlUx9u2pTwinx8sNFTc
         dJQlAqPwuoZgf72VLiZwrVROKYOIIqAH/24vidSxr2rrHfA09YOxTa4ubi+eri5DGw8V
         4RdZ7xqeqXFQBBVOpnCdSRru8Zn0U83MoeZSw2KKBChA+SimDhRZoiczsh9UXqiDrLyn
         gMPA==
X-Gm-Message-State: AOAM531aTfrmnRXeUjvUK5j4s5Ck1i/bTQs0ac9rrz4cLqWrJ2XVXCkF
	MttYKs3ecnYI7DgV3jK69KqFZ94EPy1A9AtzsTo=
X-Google-Smtp-Source: 
 ABdhPJxUqJOjUij+f2R3dT6E0HzHsjU2yTfhdMMV9zDQ0n5FvKGyBpGksZQ54x3lra9RuUQjB5okOdk2wySO/nssk+0=
X-Received: by 2002:a05:6122:1687:: with SMTP id 7mr635929vkl.5.1640062371682;
 Mon, 20 Dec 2021 20:52:51 -0800 (PST)
MIME-Version: 1.0
References: <20211209135752.6872-1-kamil.dziezyk@arm.com>
 <20211209135752.6872-3-kamil.dziezyk@arm.com>
In-Reply-To: <20211209135752.6872-3-kamil.dziezyk@arm.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Mon, 20 Dec 2021 20:52:40 -0800
Message-ID: 
 <CACMJ4GZTYOUMZcuVgB16ureKef2J2hfFJqVJ8SW+hjArYf2W1w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2 3/3] grub-efi: Add xen_boot
 support when 'xen' is in DISTRO_FEATURES for aarch64
To: Kamil Dziezyk <kamil.dziezyk@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd <nd@arm.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>, Doug Goldstein <cardoe@gentoo.org>
Content-Type: multipart/alternative; boundary="00000000000012dd1d05d3a0c792"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Dec 2021 04:52:53 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/6985

--00000000000012dd1d05d3a0c792
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 9, 2021 at 5:59 AM Kamil Dziezyk <kamil.dziezyk@arm.com> wrote:

> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
>

I think this might be better changed in the grub-efi recipe in OE core
instead, where the GRUB recipe maintainer can review it?

Should this xen_boot build-in feature be enabled for more architectures
than just aarch64?

Christopher


> ---
>  recipes-bsp/grub/grub-efi_%.bbappend | 1 +
>  recipes-bsp/grub/grub-efi_xen.inc    | 1 +
>  2 files changed, 2 insertions(+)
>  create mode 100644 recipes-bsp/grub/grub-efi_%.bbappend
>  create mode 100644 recipes-bsp/grub/grub-efi_xen.inc
>
> diff --git a/recipes-bsp/grub/grub-efi_%.bbappend
> b/recipes-bsp/grub/grub-efi_%.bbappend
> new file mode 100644
> index 0000000..df2b688
> --- /dev/null
> +++ b/recipes-bsp/grub/grub-efi_%.bbappend
> @@ -0,0 +1 @@
> +require ${@bb.utils.contains('DISTRO_FEATURES', 'xen', '${BPN}_xen.inc',
> '', d)}
> diff --git a/recipes-bsp/grub/grub-efi_xen.inc
> b/recipes-bsp/grub/grub-efi_xen.inc
> new file mode 100644
> index 0000000..5aa0958
> --- /dev/null
> +++ b/recipes-bsp/grub/grub-efi_xen.inc
> @@ -0,0 +1 @@
> +GRUB_BUILDIN:append:aarch64 = "${@bb.utils.contains('DISTRO_FEATURES',
> 'xen', ' xen_boot', '', d)}"
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6974):
> https://lists.yoctoproject.org/g/meta-virtualization/message/6974
> Mute This Topic: https://lists.yoctoproject.org/mt/87611988/3619037
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> christopher.w.clark@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000012dd1d05d3a0c792
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Dec 9, 2021 at 5:59 AM Kamil Dzie=
zyk &lt;<a href=3D"mailto:kamil.dziezyk@arm.com">kamil.dziezyk@arm.com</a>&=
gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Signed-off-by: Kamil Dziezyk &lt;<a href=3D"mailto:ka=
mil.dziezyk@arm.com" target=3D"_blank">kamil.dziezyk@arm.com</a>&gt;<br></b=
lockquote><div><br></div><div>I think this might be better changed in the g=
rub-efi recipe in OE core instead, where the GRUB recipe maintainer can rev=
iew it?</div><div><br></div><div>Should this xen_boot build-in feature be e=
nabled for more architectures than just aarch64?</div><div><br></div><div>C=
hristopher</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
---<br>
=C2=A0recipes-bsp/grub/grub-efi_%.bbappend | 1 +<br>
=C2=A0recipes-bsp/grub/grub-efi_xen.inc=C2=A0 =C2=A0 | 1 +<br>
=C2=A02 files changed, 2 insertions(+)<br>
=C2=A0create mode 100644 recipes-bsp/grub/grub-efi_%.bbappend<br>
=C2=A0create mode 100644 recipes-bsp/grub/grub-efi_xen.inc<br>
<br>
diff --git a/recipes-bsp/grub/grub-efi_%.bbappend b/recipes-bsp/grub/grub-e=
fi_%.bbappend<br>
new file mode 100644<br>
index 0000000..df2b688<br>
--- /dev/null<br>
+++ b/recipes-bsp/grub/grub-efi_%.bbappend<br>
@@ -0,0 +1 @@<br>
+require ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;xen&#39;, &#3=
9;${BPN}_xen.inc&#39;, &#39;&#39;, d)}<br>
diff --git a/recipes-bsp/grub/grub-efi_xen.inc b/recipes-bsp/grub/grub-efi_=
xen.inc<br>
new file mode 100644<br>
index 0000000..5aa0958<br>
--- /dev/null<br>
+++ b/recipes-bsp/grub/grub-efi_xen.inc<br>
@@ -0,0 +1 @@<br>
+GRUB_BUILDIN:append:aarch64 =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEA=
TURES&#39;, &#39;xen&#39;, &#39; xen_boot&#39;, &#39;&#39;, d)}&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#6974): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/6974" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/6974</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/87611988/3619=
037" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/87611988/3619037</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:christopher.w.clark@gm=
ail.com" target=3D"_blank">christopher.w.clark@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000012dd1d05d3a0c792--


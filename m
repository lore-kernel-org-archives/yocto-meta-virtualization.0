Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB1BF53D96
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 20:21:53 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.60619.1773692510889192328
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 13:21:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nSPf41Re;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82989744ee0so4648129b3a.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Mar 2026 13:21:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773692510; cv=none;
        d=google.com; s=arc-20240605;
        b=fTgZwird/Z1iEaX8RZuag6InOcNVP4vPhwWNE+/03/XPhJWCoWFaK7V5+rorJ8YZiO
         FBnHlQPJLiQqXaLOy6Wd337gI5JiQhJLMb21kLzAyAb4p9IuDlnXJ2qf9iABm+npec8V
         i23l0FwCj7gYJEN0rg8Ybnit2h28wzIfn7v/A1mpXiNMA8ZPqOsAcF6UVeUSF8kBefhy
         2HEl7QEO3jrF6saILGb9UoB3NkS9W3+xgkk8MrrobM/M1DHqit3mY5zn3tl70wexoYq3
         RfElx19rQytY32N288FmIweZwKvh6zUwBiZQte463dH4rpFDLlxDT20Fhy+rkqD44i+b
         thWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FKT/xN6WXw4IGM5I0/l7BMDcOX8/uTEGunumoKiZqys=;
        fh=fTQRBvfGgCVEWvAyLJ5HlJYoVgoPpIYl/OcAVnGPDaI=;
        b=bzTEaHhYiCaL9dPWJ5bR9J7oKvzjJPDtSeIoqI0qdoyfNxjJ6E0JsTAdfedCWQRvpb
         UDSRbN3Vdvzoo3OxGQ/b5Sf005Obb58hjGok6UUpUGfH002YBKZbLyJMzmZZE2Y+4C/W
         0YxKOHY7EN/LZ+aBQRCk5/97/O7d3pTWDqGn2ESFFeiIXv4w69pyKK9CKI9dPfx/EtY9
         zAGKq6eS4u2knG6zW4xEYGD6Wa3m51enXBdbIQ18u40tEulQKDKVFmh97+PoZjqzb6P9
         EFFDgSkIvZKQ2aXtfftxPXHjpml9Em3vsHtWc+mG5Ur6Sx16i/ejjUIn6vRWO1mTggJu
         R2Jw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773692510; x=1774297310; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FKT/xN6WXw4IGM5I0/l7BMDcOX8/uTEGunumoKiZqys=;
        b=nSPf41ReivcoJvZzuz1QL7NitJC/yVwrUwJ10SGVGq+pI0F13YT2YZvF0c2/ecqgPe
         7Gqhq6yY3CojInfw9iHmlJWTVqmyuKyCXFiXWQonnUJuiF82kIhDiQ7+YeuXI8XmPj0O
         USXjundoFXEhTxPAGKBsKNwMsRp0MnBQ8p8LxRtgh8ObLxF9TR9hJ81OGkdEN0WuXqd+
         ZRjvCPiQdXhJzaaA/06vnMJV5T6OSL4BUzjujPVObbiaaXLroee4vGO9N58C927mxX6z
         Ctlg1noiUr7wnDxTguWETtQxQTjebtbE0XURww+FzJ+gvYwocZzATVL5Bjm928vT+JFn
         YqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773692510; x=1774297310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKT/xN6WXw4IGM5I0/l7BMDcOX8/uTEGunumoKiZqys=;
        b=jOMrMvneMjTXU8Ca2UpEzTbP1enRCG7ESM6+4b2+ZNcFipK/vR1ylORo6ZaA4IGuPY
         7kZdKU/e2WRWheGo4iGvLhF67fO801Xrx5xHfvaO7R33pbOeldlSFs0kh2x5qs3aG8Me
         wFsEnPpaw67fLruOIbsWQpS/6mWiHXvHQSj7uzfbB4dxONzHJbm41DIDsbxqUkDOQygw
         TESnlx+Q/c+36bVA59flAbSmuAMIRmn0mFJQm5NnYTaZzfMzxRThA2wS16iKvi9sABN5
         omAxfLaor4JbtjiV6hR4dGtcHrzK+7buyYl4JGD3aIYJ1u6IV0jAIJxDg02Q4kJzPXKc
         Z9jA==
X-Gm-Message-State: AOJu0Ywu1RLLd/i0OGdlLzG2xUw4rEywxogmIFwymXcUr3UHKZVdY/iO
	703b5vU6K8RCvrklOR++iWv55udBoj1LJmk4IH+1tmdMa+sqBRwn7PYYKO9JT3YeJeN2rOmTKdD
	QFxdajkDlsyhVapqSBl9gFeG5GBg3LQE=
X-Gm-Gg: ATEYQzzAKHuhtDvoB7A8qVUnGz3bK10k9xBoPxtxOiH9NGBICwX8X06m6Xsv6xp1GaP
	lgAxHmMkwpt0OJiV/5PZ1upgUhSt5un6u3O/IqyTyvWIsj3KR5nsZeT7u6pA9dEt8ueFDYOo5v/
	ObYbOPgugoW2gxJOG9W8jxMeNW+7fzRiBtBbdgqAZ6nG4gHFzRmO4YEF4Fb08fJ3xFLN+mKHCx1
	kUaxuaEtigDryplVh2cs89C4JuUj3eEXAsdtiyNAO04R50PKsOCTbQJduNj0wqPZflPxWX8Xyyc
	0Wbej0xmDhSUxNTi4VvhbpyXexBylkTohVd7ZbdK
X-Received: by 2002:a05:6a00:1594:b0:82a:778:cd73 with SMTP id
 d2e1a72fcca58-82a1992c45amr10169211b3a.51.1773692510086; Mon, 16 Mar 2026
 13:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <586528399.23310.1773677692552@app.mailbox.org> <1942784541.31638.1773686536467@app.mailbox.org>
In-Reply-To: <1942784541.31638.1773686536467@app.mailbox.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 16 Mar 2026 16:21:38 -0400
X-Gm-Features: AaiRm53-_Rapendac3kRzdgZDuF9Se_jWwU6HiW0akaPf9KiT2Se1H8ofgGoKps
Message-ID: <CADkTA4NqcFRuOHu5d96T+mhOQTrR5aQv9BCHi2iBpdKq2dgGCQ@mail.gmail.com>
Subject: Re: [meta-virtualization] possible regression with: image-oci-unmoci:
 preserve file modes
To: patrick.vogelaar.dev@mailbox.org
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000012b48064d29f8c3"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Mar 2026 20:21:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9664

--000000000000012b48064d29f8c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 2:42=E2=80=AFPM Patrick Vogelaar via lists.yoctopro=
ject.org
<patrick.vogelaar.dev=3Dmailbox.org@lists.yoctoproject.org> wrote:

> Hi all,
>
> [0] caused a regression on my site. I am installing a recipe into the
> container that sets ACLs with setfacl in pkg_postinst. To my understandin=
g
> those xattr were not preserved before anyways so wouldn't it be better to
> change it to:
>
> Hmm. The -a has been around for over a  year in master, so we need to
dig into this more.

My recollection and quick check is that -a should be copying the xattrs
from our source to the umoci layer structure.

The bbclass operates on the fully assembled image, so anything you've
put in place for ACLs, etc, should be preserved.

Rather than dropping -a, I'd extend it with --preserve=3Dxattr if we are
missing
something in a binutils -> filesystem -> or something else combination.

If you had specific examples, I could comment further.

Bruce




> cp -r --preserve=3Dmode,timestamps,links ${IMAGE_ROOTFS}/*
> $image_bundle_name/rootfs
>
> Could also be that I am doing something wrong in my recipe when setting
> the ACLs.
>
> [0] https://git.yoctoproject.org/meta-virtualization/commit/?h=3Dscarthga=
p
>
> Best Regards
> Patrick
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9663):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9663
> Mute This Topic: https://lists.yoctoproject.org/mt/118351110/1050810
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

--000000000000012b48064d29f8c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 16, 2026 at 2:42=E2=80=
=AFPM Patrick Vogelaar via <a href=3D"http://lists.yoctoproject.org" target=
=3D"_blank">lists.yoctoproject.org</a> &lt;<a href=3D"http://patrick.vogela=
ar.dev" target=3D"_blank">patrick.vogelaar.dev</a>=3D<a href=3D"mailto:mail=
box.org@lists.yoctoproject.org" target=3D"_blank">mailbox.org@lists.yoctopr=
oject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi all,<br>
<br>
[0] caused a regression on my site. I am installing a recipe into the conta=
iner that sets ACLs with setfacl in pkg_postinst. To my understanding those=
 xattr were not preserved before anyways so wouldn&#39;t it be better to ch=
ange it to:<br>
<br></blockquote><div><div class=3D"gmail_default" style=3D"font-size:small=
"></div><div class=3D"gmail_default" style=3D"font-size:small">Hmm. The -a =
has been around for over a=C2=A0 year in master, so we need to</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">dig into this more.</div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">My recollection and quick chec=
k is that -a should be copying the xattrs</div><div class=3D"gmail_default"=
 style=3D"font-size:small">from our source to the umoci layer structure.</d=
iv><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Th=
e bbclass operates on the fully assembled image, so anything you&#39;ve</di=
v><div class=3D"gmail_default" style=3D"font-size:small">put in place for A=
CLs, etc, should be preserved.</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">Rather than dropping -a, I&#39;d extend it with=C2=A0--preserve=3Dxat=
tr if we are missing</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">something in a binutils -&gt; filesystem -&gt; or something else comb=
ination.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">If you had speci=
fic examples, I could comment further.</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">Bruce</div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
cp -r --preserve=3Dmode,timestamps,links ${IMAGE_ROOTFS}/* $image_bundle_na=
me/rootfs<br>
<br>
Could also be that I am doing something wrong in my recipe when setting the=
 ACLs. <br>
<br>
[0] <a href=3D"https://git.yoctoproject.org/meta-virtualization/commit/?h=
=3Dscarthgap" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject=
.org/meta-virtualization/commit/?h=3Dscarthgap</a><br>
<br>
Best Regards<br>
Patrick<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9663): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9663" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9663</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/118351110/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/118351110/1050810</a><br>
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
</div>

--000000000000012b48064d29f8c3--


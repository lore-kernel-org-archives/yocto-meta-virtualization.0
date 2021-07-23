Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web08.4076.1627012994266188622
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Jul 2021 21:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mgMTU8mX;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: krussell7711@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id x15so512224oic.9
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Jul 2021 21:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=D1BnIEAPKD+z/LAas3czoCRR0VGaXndpzkJcuo/myQs=;
        b=mgMTU8mXR3kX+zi9m7SJInBCjsRO6iyxaIfgoCAf5uH3SduwDRuZzDB+BupRmyMtdy
         Hlt/2aPlPkSEAE68NQNuHUrjq8CR184DToxEqg6q6WmnRRy8Z+KyCmqaEZc9LC+NsWSe
         W1A1ZLmw93vkjlv3Las4liEX2SVpGDnxQ/NXuCsJBDD8JvVqg3SoRPEsgoIq26DCNGIW
         mfPkZTAKjq/EFoUsAuNKqF9S3wL+ViO42QPK5PpmJ7pO5aflq7hsuEeR7HzszO+xMofq
         SbtvA9lA0VLFO65zRXNhXEXij3g2SydwBvlFMQLTpeoE1k3MmQ/N3YMPIR4Sje1QU+LM
         wl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=D1BnIEAPKD+z/LAas3czoCRR0VGaXndpzkJcuo/myQs=;
        b=H6a595n02A4d5M61yBkvrHVALxTMNFrasmZfrDpzAJ4O5ahDL9ERVoWie3vc1GQG0N
         LixtF0rPPjhK1wsvwIV0pE2iS5P7ckCRynDAYNH8Icq7MY5lBQXnyysTc+e+k0VFMU61
         h/sGGZRhuEdwQwLinbGhVuOzVJP5Yn1KCIsqjSOQ1yxnFq3GVM/lDptrBhEFmFfBoTdb
         oydIsI02qnGSoiMWa8ntZeykDGS5ELzPGhssARdWeWoLFqnpeHRFNBRsOCJyQKq5jl9K
         fsXIvBzrt9UK0iGnxJOQAS29GmnHQmOcVE+tECP1rFk7qKKm4N/bJ6CNiZAntURKb1TK
         vtzA==
X-Gm-Message-State: AOAM5321UVR7TqW1JgZkPbRyMs3w/Wl5SdG+EPcI9cE39tEHMUbG08qv
	BGyayWIgJvBJxANzykvd/UtcS48RYXaEciS+r5mlbApMq64=
X-Google-Smtp-Source: ABdhPJxkSqli9qE2lpIg+g62453wL1uRnPkavdi7sxz4OKXPjvIUS90FsOajvD2CTe4ArLWlKknWjOSq0RT08Baak6A=
X-Received: by 2002:aca:a98f:: with SMTP id s137mr1982184oie.122.1627012993296;
 Thu, 22 Jul 2021 21:03:13 -0700 (PDT)
MIME-Version: 1.0
From: "Kyle Russell" <bkylerussell@gmail.com>
Date: Fri, 23 Jul 2021 00:03:02 -0400
Message-ID: <CAFrQVPN-a-5DPmxe3A9-o6U=bwsdGQForwQ-qYUPXsJS1pgdCw@mail.gmail.com>
Subject: linux-yocto virtualization requires virtio.scc from yocto-kernel-cache
To: meta-virtualization@lists.yoctoproject.org
Cc: Wes Lindauer <wesley.lindauer@gmail.com>, bruce.ashfield@gmail.com
Content-Type: multipart/alternative; boundary="00000000000082ac6405c7c27b4f"

--00000000000082ac6405c7c27b4f
Content-Type: text/plain; charset="UTF-8"

Hello,

meta-virtualization's linux-yocto_virtualization.inc includes
cfg/virtio.scc in KERNEL_FEATURES, which is a dependency from
yocto-kernel-cache.  However, we do not use yocto-kernel-cache with our
custom linux-* recipe, so we're hitting a metadata error because of a
missing virtio.scc.  It seems like the creation of linux-%.bbappend (in
f2f36a8061c600b35b5f0ce1599d59f1d144a3aa) was intentional to match kernel
recipes other than linux-yocto*, which we could benefit from, but the lack
of yocto-kernel-cache is problematic with virtio.scc.

Can meta-virtualization provide virtio.scc like it does for the other
kernel features to allow decoupling from yocto-kernel-cache?

meta-virtualization used to allow this decoupling by configuring the virtio
feature without the yocto-kernel-cache in
f1c03f390e95b63d5c2dfba9140d1b07c4d17acf, but that was restructured in
21d8bcdb791a1ea766a3e7e7663c7b6d49bc861a.  The dependency was not required
unless you were using linux-yocto, but as of f2f36a8061c60 is now required
for all linux-% recipes.  (We just now noticed because our linux recipe has
recently been updated to match a kernel version supported by
meta-virtualization.

Thanks,

Kyle

--00000000000082ac6405c7c27b4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br><div>meta-virtualization&#39;s linux-yocto_v=
irtualization.inc=20
includes cfg/virtio.scc in KERNEL_FEATURES, which is a dependency from=20
yocto-kernel-cache.=C2=A0 However, we do not use yocto-kernel-cache with ou=
r=20
custom linux-* recipe, so we&#39;re hitting a metadata error because of a=
=20
missing virtio.scc.=C2=A0 It seems like the creation of linux-%.bbappend (i=
n=20
f2f36a8061c600b35b5f0ce1599d59f1d144a3aa) was intentional to match=20
kernel recipes other than linux-yocto*, which we could benefit from, but
 the lack of yocto-kernel-cache is problematic with virtio.scc.</div><div><=
br></div><div>Can=20
meta-virtualization provide virtio.scc like it does for the other kernel fe=
atures to allow decoupling from yocto-kernel-cache?</div><div><br></div><di=
v>meta-virtualization used to allow this decoupling by configuring the virt=
io feature without the yocto-kernel-cache in f1c03f390e95b63d5c2dfba9140d1b=
07c4d17acf, but that was restructured in 21d8bcdb791a1ea766a3e7e7663c7b6d49=
bc861a.=C2=A0 The dependency was not required unless you were using linux-y=
octo, but as of f2f36a8061c60 is now required for all linux-% recipes.=C2=
=A0 (We just now noticed because our linux recipe has recently been updated=
 to match a kernel version supported by meta-virtualization.<br></div><br><=
div>Thanks,</div><div><br></div><div>Kyle<br></div></div>

--00000000000082ac6405c7c27b4f--

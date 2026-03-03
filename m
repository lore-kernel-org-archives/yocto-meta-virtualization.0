Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC7CEFD006E
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 04:04:14 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11005.1772510646494520569
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 20:04:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EreGG/XF;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a8fba3f769so23824725ad.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 02 Mar 2026 20:04:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772510646; cv=none;
        d=google.com; s=arc-20240605;
        b=Ybcr3Fk/PsavyyF8sCuYpkW1UlyAkHQbhNzKuNEFfzcZePeAfNVwb0nRMk0BD+YaFq
         Z+4HOKFc48rR9MaP2r1bM6mo/R5PP3ozf3jJBpNXfTGYlWQvJD3Hr9r3lEs5ddPt52J5
         oITfS7nQSv1WiMr+/Dy5v+egfNWUk8/PNjkQ4ladAXTw/u32AEarOHt86kjxn8uy2+ci
         2/ApWY4oQP4lnjk4kgOEUgX2+1rFyug2Zow885FUInEE6xxdkehC10uap+sp9U1XJt03
         mvh8R/igL6Ax5p7JuoDxyF9QYRgGVdSxKdBbHoNs8WQsB2UZ3NGzqIyapuHEIlTqjars
         Z4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BWSdDPy+nUeYFOXOLpi8/kXRAzcrvXGTuEzi1zlXsO4=;
        fh=OClHZqodWSNbeHsUYFR0FyVz9DAVa4a7109tpdSIGh0=;
        b=EuMFEbF1/YCsUSU5mv8wpn2p7WPX+gv/RI0ey0GmAI5TlJ9Tq9gBw7viv9zyfu1i9g
         Ti8pDZq2PAJm37z9Pf2Ethn/7maodLuZj1JXTxJWlkK9cGHgvBMznsK7Xyu02GcDo6JL
         pweTk1jEfPgXF68zogxy2e6Jqmst/MAbkkzz1DY3CQddpjMVqNIZzBTqmTVQgPUOpjk7
         qYjcBCe5MvjHhlbwzmDBBfLxVQuaw3WOZZrBjKC06rEtDOViLn/u8qwmv0ihzfCFSvZD
         1JfwFhuVhoRHmMhSrLU+0F4Cy8Gb/OdMKQ/4kGlKMSbzPt959l3YjKh80IjeZ7VdB3uq
         BxCQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772510646; x=1773115446; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BWSdDPy+nUeYFOXOLpi8/kXRAzcrvXGTuEzi1zlXsO4=;
        b=EreGG/XFQp1y6pnCuFrW6OGyLRluzxL7LxoTj5z98v4SO2RYs772127eCC3uNPSqQN
         fm0dq20ByHz9BNRrU0q80sMwNIa8d/soUeXegOFbOCg/ztC9LfOA/fpoHZX2+bG+18Gr
         Z9zWq7wTDS3NaxQvviwFf82MbKIWV9IBN+0uarBDp8Z1BEVgSH4rqP2GDXdEMDgzxDvm
         le0na83t/35J226SlokkVVNgg0k+RQmJbr9IlGGp2euqbAuaNf82Tf1Zcqc4DcIgmBk8
         fzMEhf+597IBibUHbqsJEtXDCW/labWSPnKlOzffg17C5UNkfZqUYBsdxttnGAvNUam+
         W40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772510646; x=1773115446;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWSdDPy+nUeYFOXOLpi8/kXRAzcrvXGTuEzi1zlXsO4=;
        b=P5AfVwvJu4e3kdulaT/9pFKMKyc8YSsF/ksFjdL342IOsUZ1zXj7jZH/ZgCQU50tnr
         tQ8UF4BhxqgoXeHdYXY2pbiX7AZ6/SjEnM3QpPI4Oqgibfbo85s9hC1PdBQl8OujV95z
         oV82xpfyrhEk8h/PDeVkyZQvGjsNJ4MKn1iv1F6PCYeuFvPJTF75VDZ7ODBuc5mbT9iX
         RpGcw/HLyoMzkDWyE7XfBz/qk5GqFYj3IYnp6SgxipEYFM6iYONfYNCPbHQeB1HLE2Nc
         DcMznA8U1ndy79NPaQpp0qZhNkp3XYBF9ULEIFzqy3kUUsGjp5rWpKQuo4VEgNg31ubs
         jCWQ==
X-Gm-Message-State: AOJu0YyxOVwSTGWMhyPJ0qd1AeekNoEvta2eB/udv3HfMDY7kihv1/wy
	VTsF6SrETRtcjXMtzY5mX+1P29mJ1YoqIoy9EnPd1EspPtUcwduu6INmAqUQ/ymZnsMRJIDPj7C
	8WDbQWfl0gvCz354bS8ojZgqvBIZGXaw=
X-Gm-Gg: ATEYQzwEFRzRvJQgEPFipZvgGcfCmnoHaIiuWRRjahvDPwPBHHMMAwkgCb/soHGzd27
	i1bUKwWpFPVbqHraBrmRdIXV7rhb4yTwsLPL3FBjckrJco9O7KW7m++SqDNH+UTdh/kBdt4lkhj
	mn010EMsWQmPfjUeN0ZnrcPHLomCJdxQGLmZMRyz/dwmdPq5nOzR0mXMoKTWD4PtVRKDxLD5kwn
	Snl8OEqhr5AnARWtXFJ3clAQCmWm2vrB78Cax0c03KdsJJvlRW0RWZ8F4WFiQE2N3ccJqxyhUrY
	8AabsL3BbzBXWOSs9emPcr5RfQ8Fx5BEmngTEelTpD+n3h9Ap6Y=
X-Received: by 2002:a17:903:3804:b0:2ae:3b36:23e7 with SMTP id
 d9443c01a7336-2ae3b3629c3mr104072635ad.16.1772510645635; Mon, 02 Mar 2026
 20:04:05 -0800 (PST)
MIME-Version: 1.0
References: <TY3PR01MB10110B39C744E9FAC050B99299B7FA@TY3PR01MB10110.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB10110B39C744E9FAC050B99299B7FA@TY3PR01MB10110.jpnprd01.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 2 Mar 2026 23:03:54 -0500
X-Gm-Features: AaiRm5060bnYlqmTmdTsZQGw4vnLO3Xn2OHVDGFIaJ1nU6AzXMYrjC46mMLqX7k
Message-ID: <CADkTA4NbsbipNiJTxSM_hr29ovgrEHGTBCrJrk6OFbhMS9dPKA@mail.gmail.com>
Subject: Re: [meta-virtualization] image-oci.bbclass: description of usage of
 oci image
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000064cb31064c16cbbd"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Mar 2026 04:04:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9614

--00000000000064cb31064c16cbbd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 9:52=E2=80=AFPM Yiding Liu (Fujitsu) <liuyd.fnst@fuj=
itsu.com>
wrote:

> Hi Bruce
>     1.  I follow the step of running oci image in  image-oci.bbclass but
> it has error in runc.
>
>     # tar -xvf container-base-latest-oci-dir.tar
>     # oci-image-tool create --ref name=3Dlatest
> container-base-qemux86-64.rootfs-20260302090735.rootfs-oci
> container-base-oci-bundle
>
    # runc run -b container-base-oci-bundle ctr-build
> ERRO[0000] runc run failed: unable to start container process: error
> during container init: open /dev/pts/ptmx: no such file or directory
>
>   2. Then I follow the comment in image-oci-umoci.inc using two methods
> which can run container successfully
>     # make a tar version of the image direcotry
>     #  1) image_name.tar: compatible with oci tar format, blobs and rootf=
s
>     #     are at the top level. Can load directly from something like
> podman
>     #  2)image_name-dir.ta: original format from meta-virt, is just a tar=
'd
>     #     up oci image directory (compatible with skopeo :dir format)
>
>    2.1 Method 1 for image_name.tar
> # podman load -i container-base-latest-oci.tar
>
> # podman images | grep localhost/latest
> localhost/latest                           latest      1d603a1041c5  14
> years ago   5.58 MB
>
> # podman run -it 1d603a1041c5
> / # ls
> bin    boot   dev    etc    home   lib    media  mnt    proc   root   run
>    sbin   sys    tmp    usr    var
>
>     2.2  Method 2 for image_name-dir.tar
> # tar xvf container-base-latest-oci-dir.tar
> # skopeo copy
> oci:container-base-qemux86-64.rootfs-20260302090735.rootfs-oci:latest
> containers-storage:container-base-qemux86-64:1.0
> # podman images | grep container-base-qemux86-64
> docker.io/library/container-base-qemux86-64  1.0         1d603a1041c5  14
> years ago   5.58 MB
>
> # podman run --rm -it 1d603a1041c5
> / # ls
> bin    boot   dev    etc    home   lib    media  mnt    proc   root   run
>    sbin   sys    tmp    usr    var
>
>        Based on this phenomenon, I think we can modify the  description o=
f
> usage of oci image in image-oci.bbclass to use the  two methods above.
>
>        What do you think about my suggestion=EF=BC=9F
>

When I wrote that comment, oci-image-tools were capable of creating a
bundle that runc could directly execute.

I'm actually in the process of upgrading bare bundles + runc to work with
the new architecture that I've created for bundling docker and podman
containers (something called vrunc), but that isn't quite ready yet.

So yes, I'd say that we could remove the oci-image-tool reference and just
update it to suggest umnoci like the  image-oci-umoci.inc

When I have bare runc working again, I can update the headers will those
details as well.

Bruce


>
> Liu
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000064cb31064c16cbbd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 2, 20=
26 at 9:52=E2=80=AFPM Yiding Liu (Fujitsu) &lt;<a href=3D"mailto:liuyd.fnst=
@fujitsu.com" target=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div>




<div dir=3D"ltr">
<div style=3D"text-align:left;text-indent:0px;background-color:white;margin=
:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helve=
tica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
Hi Bruce=C2=A0</div>
<div style=3D"text-align:left;text-indent:0px;background-color:white;margin=
:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helve=
tica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
=C2=A0 =C2=A0 1.=C2=A0 I follow the step of running oci image in =C2=A0imag=
e-oci.bbclass but it has error in runc.</div>
<div style=3D"text-align:left;text-indent:0px;background-color:white;margin=
:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helve=
tica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
<br>
</div>
<div style=3D"text-align:left;text-indent:0px;background-color:white;margin=
:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helve=
tica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
=C2=A0 =C2=A0 # tar -xvf container-base-latest-oci-dir.tar=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=
=80=82=E2=80=82</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
=C2=A0 =C2=A0 # oci-image-tool create --ref name=3Dlatest container-base-qe=
mux86-64.rootfs-20260302090735.rootfs-oci container-base-oci-bundle=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82</div></div></div></blockquote><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div><div dir=3D"ltr"><div style=3D"tex=
t-align:left;text-indent:0px;background-color:rgb(255,255,255);margin:0px;f=
ont-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,s=
ans-serif,serif,EmojiFont;font-size:12pt;color:black">=C2=A0 =C2=A0 # runc =
run -b container-base-oci-bundle ctr-build=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=
=80=82</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
ERRO[0000] runc run failed: unable to start container process: error during=
 container init: open /dev/pts/ptmx: no such file or directory=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82</div>
<div style=3D"text-align:left;text-indent:0px;background-color:white;margin=
:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helve=
tica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
<br>
</div>
<div style=3D"text-align:left;text-indent:0px;background-color:white;margin=
:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helve=
tica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
=C2=A0 2. Then I follow the comment in image-oci-umoci.inc using two method=
s which can run container successfully</div>
<div style=3D"text-align:left;text-indent:0px;background-color:white;margin=
:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helve=
tica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
=C2=A0 =C2=A0 # make a tar version of the image direcotry</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
=C2=A0 =C2=A0 # =C2=A01) image_name.tar: compatible with oci tar format, bl=
obs and rootfs</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
=C2=A0 =C2=A0 # =C2=A0 =C2=A0 are at the top level. Can load directly from =
something like podman</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
=C2=A0 =C2=A0 # =C2=A02)image_name-dir.ta: original format from meta-virt, =
is just a tar&#39;d</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
=C2=A0 =C2=A0 # =C2=A0 =C2=A0 up oci image directory (compatible with skope=
o :dir format)</div>
<div style=3D"text-align:left;text-indent:0px;background-color:white;margin=
:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helve=
tica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</div>
<div style=3D"text-align:left;text-indent:0px;background-color:white;margin=
:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helve=
tica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
=C2=A0 =C2=A02.1 Method 1 for image_name.tar</div>
<div style=3D"text-align:left;text-indent:0px;background-color:white;margin=
:0px 0px 0px 40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
# podman load -i container-base-latest-oci.tar</div>
<div style=3D"text-align:left;text-indent:0px;background-color:white;margin=
:0px 0px 0px 40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
<br>
</div>
<div style=3D"text-align:left;text-indent:0px;background-color:white;margin=
:0px 0px 0px 40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
# podman images | grep localhost/latest</div>
<div style=3D"text-align:left;text-indent:0px;background-color:white;margin=
:0px 0px 0px 40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
localhost/latest =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 latest =C2=A0 =C2=A0 =C2=A01d603a1041c5 =
=C2=A014 years ago =C2=A0 5.58 MB</div>
<div style=3D"text-align:left;text-indent:0px;background-color:white;margin=
:0px 0px 0px 40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
<br>
</div>
<div style=3D"text-align:left;text-indent:0px;background-color:white;margin=
:0px 0px 0px 40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
# podman run -it 1d603a1041c5</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px 0px 0px 40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSF=
ontService,Calibri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;colo=
r:black">
/ # ls</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px 0px 0px 40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSF=
ontService,Calibri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;colo=
r:black">
bin =C2=A0 =C2=A0boot =C2=A0 dev =C2=A0 =C2=A0etc =C2=A0 =C2=A0home =C2=A0 =
lib =C2=A0 =C2=A0media =C2=A0mnt =C2=A0 =C2=A0proc =C2=A0 root =C2=A0 run =
=C2=A0 =C2=A0sbin =C2=A0 sys =C2=A0 =C2=A0tmp =C2=A0 =C2=A0usr =C2=A0 =C2=
=A0var</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px 0px 0px 40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSF=
ontService,Calibri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;colo=
r:black">
<br>
</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
=C2=A0 =C2=A0 2.2=C2=A0 Method 2=C2=A0for image_name-dir.tar</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px 0px 0px 40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSF=
ontService,Calibri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;colo=
r:black">
# tar xvf container-base-latest-oci-dir.tar</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px 0px 0px 40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSF=
ontService,Calibri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;colo=
r:black">
# skopeo copy oci:container-base-qemux86-64.rootfs-20260302090735.rootfs-oc=
i:latest containers-storage:container-base-qemux86-64:1.0</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px 0px 0px 40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSF=
ontService,Calibri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;colo=
r:black">
# podman images | grep container-base-qemux86-64</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px 0px 0px 40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSF=
ontService,Calibri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;colo=
r:black">
<a href=3D"http://docker.io/library/container-base-qemux86-64" target=3D"_b=
lank">docker.io/library/container-base-qemux86-64</a> =C2=A01.0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 1d603a1041c5 =C2=A014 years ago =C2=A0 5.58 MB</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px 0px 0px 40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSF=
ontService,Calibri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;colo=
r:black">
<br>
</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px 0px 0px 40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSF=
ontService,Calibri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;colo=
r:black">
# podman run --rm -it 1d603a1041c5</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px 0px 0px 40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSF=
ontService,Calibri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;colo=
r:black">
/ #=C2=A0ls</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px 0px 0px 40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSF=
ontService,Calibri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;colo=
r:black">
bin =C2=A0 =C2=A0boot =C2=A0 dev =C2=A0 =C2=A0etc =C2=A0 =C2=A0home =C2=A0 =
lib =C2=A0 =C2=A0media =C2=A0mnt =C2=A0 =C2=A0proc =C2=A0 root =C2=A0 run =
=C2=A0 =C2=A0sbin =C2=A0 sys =C2=A0 =C2=A0tmp =C2=A0 =C2=A0usr =C2=A0 =C2=
=A0var</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-size:15px;color:rgb(36,36,36)">
<br>
</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
=C2=A0 =C2=A0 =C2=A0 =C2=A0Based on this phenomenon, I think we can modify =
the=C2=A0 description of usage of oci image in image-oci.bbclass to use the=
 =C2=A0two methods above.</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
=C2=A0 =C2=A0 =C2=A0 =C2=A0</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
=C2=A0 =C2=A0 =C2=A0 =C2=A0What do you think about my suggestion=EF=BC=9F</=
div></div></div></blockquote><div><br></div><div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">When I wrote that comment, oci-image-tools wer=
e capable of creating a bundle that runc could directly execute.<br><br>I&#=
39;m actually in the process of upgrading bare bundles=C2=A0+ runc to work =
with the new architecture that I&#39;ve created for bundling docker and pod=
man containers (something called vrunc), but that isn&#39;t quite ready yet=
.<br><br>So yes, I&#39;d say that we could remove the oci-image-tool refere=
nce and just update it to suggest umnoci like the=C2=A0 image-oci-umoci.inc=
<br><br>When I have bare runc working again, I can update the headers will =
those details as well.<br><br>Bruce<br>=C2=A0</div></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div><div dir=3D"ltr">
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
<br>
</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
Liu</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature">- Thou shalt not follow the NULL pointer, for chaos and madn=
ess await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br><br></div></div>
</div>
</div>

--00000000000064cb31064c16cbbd--


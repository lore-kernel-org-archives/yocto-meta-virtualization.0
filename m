Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A14CE7D1A
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 20:29:32 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.92376.1727814564001063083
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Oct 2024 13:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XWnBbPoK;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6ddfdeed0c9so47347667b3.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Oct 2024 13:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727814563; x=1728419363; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c21QZpaX6LEXWVOpAD0i2kVgQ9lsQJaPwaAYuDlLZBU=;
        b=XWnBbPoK6TwYmEe+y1bCo0glokKNYsBmKjs4BUPKgt1dIBqiF0wwslILenKsHcWeJW
         wxhBlJVUkf6TVOTGEfH6eCzN2mXa8pOxd8J1ryM39KnVB+8IAQEC6MuEDmXRLv6pZcxn
         YbR16IsaZKeSizcb3jzqurBNd7lhlvoVv7mV4MEDVM1E6vnGTOrXGlNUWFb12jOLYmPZ
         LXtXeIZRoiAMXg/9NEXC+NtuzA8oEXVODcn9zTavZAFsO9I4xUGHSl+iT1jRcY55UbkE
         98rQwVBHFr1bqx25kXHlcjrepd8JqQ3+AgEFuQPFi155MLqx1AHkSdnwu9SmpTXLo2CO
         ODFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727814563; x=1728419363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c21QZpaX6LEXWVOpAD0i2kVgQ9lsQJaPwaAYuDlLZBU=;
        b=XQpiu4zMzYQRBvYLg6VYANaJtEXAakFAph4BWiJddUahU8TqS9QvPlb3Z+nunJCrBR
         sAbfkKVMAjdcT5KUN/kd5UiADyB/+Y6ijXRfR7yieUtZCGNfNyYS1M1sun7+Q+m9uZBv
         WS0mQP6w1N2f6Sjpt/XqHj1ZJ39jipmc2lZz+LKsh5PZuaT1SR4f2whl1TAe48uBhWNr
         poC+GGYK9nKb8c9+NtdUHGa2gcW3cM5LHa9ZesHfOAAx5vsa904VNmuaksegUr4wSm6i
         IY+ffPff8y3RG2pUlJ3V3tTBj9rwhi53nQYZRU8/yBsXdMiMB/V+Vb5FTCr/UOMNqL6E
         HYPQ==
X-Gm-Message-State: AOJu0YzT2pYTTR37fw1M2NrpBqqu6QaEW6lLbtOyl2VQ5MOYHhdN+hmz
	/qlIa3FYrIxl6XbEtA3dUVz6f5aFXAadEqI3V2IrqkdstwpZktOwBb7s4dyj0Gtbbb+B4DGF4Uk
	WgjeSbHIfAUQAr2kyiLt6pRmhaNo=
X-Google-Smtp-Source: AGHT+IEJ0evyWYFTRPpWq9qdT/fYpPj3FGgvAUSuRC3Y8syZDbBRC5sovRH9jXSrBk2EITTYyrnDD1+FXOpBcgDrHRg=
X-Received: by 2002:a05:690c:6ac8:b0:650:859b:ec8d with SMTP id
 00721157ae682-6e2a2ba44dcmr12896927b3.10.1727814563061; Tue, 01 Oct 2024
 13:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240928000622.586832-1-sandeep.gundlupet-raju@amd.com>
 <ZvrxRiQoiRmJCVmx@gmail.com> <969828a4-706a-4377-9de6-8c2d7d3b7297@amd.com>
In-Reply-To: <969828a4-706a-4377-9de6-8c2d7d3b7297@amd.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 1 Oct 2024 16:29:11 -0400
Message-ID: <CADkTA4OFw6g6AivmyweQ_1vhkUvDZuPXDEyeWQ+30iKazf+6rA@mail.gmail.com>
Subject: Re: [meta-virtualization][master][scathgap][PATCH] device-tree:
 Rename EXTRA_OVERLAYS to EXTRA_DT_INCLUDE_FILES
To: sandeep.gundlupet-raju@amd.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Oct 2024 20:29:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8906

On Tue, Oct 1, 2024 at 3:45=E2=80=AFPM Sandeep Gundlupet Raju via
lists.yoctoproject.org
<sandeep.gundlupet-raju=3Damd.com@lists.yoctoproject.org> wrote:
>
>
> On 9/30/2024 12:43 PM, Bruce Ashfield via lists.yoctoproject.org wrote:
> > In message: [meta-virtualization][master][scathgap][PATCH] device-tree:=
 Rename EXTRA_OVERLAYS to EXTRA_DT_INCLUDE_FILES
> > on 27/09/2024 Sandeep Gundlupet Raju wrote:
> >
> >> Rename EXTRA_OVERLAYS to EXTRA_DT_INCLUDE_FILES as these variables
> >> are renamed in device-tree recipe.
> > Which device tree recipe is that ? We should include a link to that
> > base recipe in this commit, so that others will know which one we
> > are tracking.
> >
> > I checked meta-virt and OE-core and didn't see any variable renames.
> [Sandeep]: device-tree recipe is in meta-xilinx
> https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recipe=
s-bsp/device-tree/device-tree.bb

Sure, but my point is that needs to be explained in the commit
message, and be resent as a v2 of the patch.

Bruce

> >
> > Other than that, no concerns with this patch.
> >
> > Bruce
> >
> >> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
> >> ---
> >>   .../device-tree/device-tree.bbappend          | 20 +++++++++--------=
--
> >>   1 file changed, 10 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree=
.bbappend b/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbapp=
end
> >> index e235826..813c08f 100644
> >> --- a/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappe=
nd
> >> +++ b/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappe=
nd
> >> @@ -3,17 +3,17 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
> >>   ENABLE_XEN_DTSI ?=3D ""
> >>   ENABLE_XEN_QEMU_DTSI ?=3D ""
> >>
> >> -XEN_EXTRA_OVERLAYS =3D ""
> >> -XEN_EXTRA_QEMU_OVERLAYS =3D ""
> >> +XEN_EXTRA_DT_INCLUDE_FILES =3D ""
> >> +XEN_EXTRA_QEMU_DT_INCLUDE_FILES =3D ""
> >>
> >> -XEN_EXTRA_OVERLAYS:zynqmp =3D "zynqmp-xen.dtsi"
> >> -XEN_EXTRA_QEMU_OVERLAYS:zynqmp =3D "zynqmp-xen.dtsi zynqmp-xen-qemu.d=
tsi"
> >> +XEN_EXTRA_DT_INCLUDE_FILES:zynqmp =3D "zynqmp-xen.dtsi"
> >> +XEN_EXTRA_QEMU_DT_INCLUDE_FILES:zynqmp =3D "zynqmp-xen.dtsi zynqmp-xe=
n-qemu.dtsi"
> >>
> >> -XEN_EXTRA_OVERLAYS:versal =3D "versal-xen.dtsi"
> >> -XEN_EXTRA_QEMU_OVERLAYS:versal =3D "versal-xen.dtsi versal-xen-qemu.d=
tsi"
> >> +XEN_EXTRA_DT_INCLUDE_FILES:versal =3D "versal-xen.dtsi"
> >> +XEN_EXTRA_QEMU_DT_INCLUDE_FILES:versal =3D "versal-xen.dtsi versal-xe=
n-qemu.dtsi"
> >>
> >> -XEN_EXTRA_OVERLAYS:versal-net =3D "versal-net-xen.dtsi"
> >> -XEN_EXTRA_QEMU_OVERLAYS:versal-net =3D "versal-net-xen.dtsi versal-ne=
t-xen-qemu.dtsi"
> >> +XEN_EXTRA_DT_INCLUDE_FILES:versal-net =3D "versal-net-xen.dtsi"
> >> +XEN_EXTRA_QEMU_DT_INCLUDE_FILES:versal-net =3D "versal-net-xen.dtsi v=
ersal-net-xen-qemu.dtsi"
> >>
> >> -EXTRA_OVERLAYS:append =3D "${@' ${XEN_EXTRA_OVERLAYS}' if d.getVar('E=
NABLE_XEN_DTSI') =3D=3D '1' else ''}"
> >> -EXTRA_OVERLAYS:append =3D "${@' ${XEN_EXTRA_QEMU_OVERLAYS}' if d.getV=
ar('ENABLE_XEN_QEMU_DTSI') =3D=3D '1' else ''}"
> >> +EXTRA_DT_INCLUDE_FILES:append =3D "${@' ${XEN_EXTRA_DT_INCLUDE_FILES}=
' if d.getVar('ENABLE_XEN_DTSI') =3D=3D '1' else ''}"
> >> +EXTRA_DT_INCLUDE_FILES:append =3D "${@' ${XEN_EXTRA_QEMU_DT_INCLUDE_F=
ILES}' if d.getVar('ENABLE_XEN_QEMU_DTSI') =3D=3D '1' else ''}"
> >> --
> >> 2.34.1
> >>
> >>
> >>
> >>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8905): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8905
> Mute This Topic: https://lists.yoctoproject.org/mt/108696924/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


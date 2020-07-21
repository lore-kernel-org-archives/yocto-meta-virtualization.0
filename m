Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
 by mx.groups.io with SMTP id smtpd.web11.2186.1595356871307850689
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Jul 2020 11:41:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aFsYGwcM;
 spf=pass (domain: gmail.com, ip: 209.85.167.196, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oi1-f196.google.com with SMTP id k22so18134515oib.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jul 2020 11:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aWpvFLBkRY6V0uSD5I7WJSmLBkhHmitwCac6AoTtB48=;
        b=aFsYGwcM3fy9oIli/7yFTtVC2d21XbJehuNiHAQEo3ILd3lLIMkSJJvDnI2ZW+Vb1H
         QgQijDuFeN5BEfUH7m0DenOJk2x2a9WLvRGrG3xQ8S2WRGfAQC7SC/CXn1gKA4K6+amO
         xZsJSKmdaHNMu0Bg/D0uOsPRTA4/kZ+VLLbYP1IU1BfQZLU0MoAuOpP86PlRx7Jqz9PA
         tFTKrSDAEvQ54PNW0DPOrwxSjaO7+7yJrCtPM4jUREFAdpTMSvrMmhOpwWPj2OFurUi4
         RKB9JCuP1M7+RHmTTMfx8LKFqXyJLM+6YmAfqhKMgHFl+OKpHd15KoeJmyezJ79WxrM0
         0bpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aWpvFLBkRY6V0uSD5I7WJSmLBkhHmitwCac6AoTtB48=;
        b=n+UbkiymOUVTc7GRzVwajxIrx8Q3o4pPcJtMHSQQQZl+URnfMcwX8GtWTI8cRHEBlC
         YsWeKtJHaklqyNS1WQOz1E9u50uEi+nRi/9rvgEjGIsOqfcaBwjPG4qgHIkaKk+wuMfz
         /1IV3qa/GEwAznAYMk64TrOLQ59nYipXI53nAx3REVxs/WKciL4lvxWWDLlb612B69cF
         Qq4C6r/aPPx4M8iAK/7jl8iSX3wxnS4eiIbCEF9RFELghiS4uajQlh2yq8fjlD1Xi3Ze
         8oLAXs65QlBLiZS5sIr/SrtFbDI7626GYjPuibNzXqYnBZU0g5IqjsFu9Rwpc4eiabnQ
         +NYg==
X-Gm-Message-State: AOAM5301wmv4as5ZsS8c2mLi5Ep3KNAUC3OwGlSU0xHo/LGesJPjUueh
	62c0PUB2zNaKh2ijpJZquTCjcT9puapZaMmb6Ck=
X-Google-Smtp-Source: ABdhPJx1PjPJyszZ3O3vnkBVWXXpNxT1Tb5MuwkLpDOMLNuKwiuGlebVo02SyEp0dU4PzxFQm4tzBZn/D9BC89ari+M=
X-Received: by 2002:aca:72ca:: with SMTP id p193mr4041450oic.20.1595356870593;
 Tue, 21 Jul 2020 11:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <X89b.1595249396548095111.cJFu@lists.yoctoproject.org>
In-Reply-To: <X89b.1595249396548095111.cJFu@lists.yoctoproject.org>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Tue, 21 Jul 2020 11:40:59 -0700
Message-ID: <CACMJ4Ga4Cr=GuCKQvJbkoHch_Msm_FgxVCDL4btVyJchxTkwRA@mail.gmail.com>
Subject: Re: [meta-virtualization] Starting Xen guest on Raspberry-Pi4. #meta-virtualization #yocto
To: Siddhartha V <Siddhuvgowda.18695@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2020 at 5:49 AM Siddhartha V
<Siddhuvgowda.18695@gmail.com> wrote:
>
> Hello @Christopher Sir,
>
>          As you suggested I have created the Xen image for RPI4  Thank y=
ou so much. Later I did the below steps:
>
> 1. I used "sudo dd if=3Dtmp/deploy/images/raspberrypi4-64/xen-image-mini=
mal-raspberrypi4-64.rpi-sdimg of=3D/dev/sdb bs=3D4M" command to write theim=
age to the SDcard and then the RPI4 board booted well. And I used few comma=
nds ("Referred the pptx that shared during the yocto dev-day") and things w=
ent well. Thank you so much.

Excellent.

> Now I am trying to start the guest now. But I am facing some issues:
>
> I have built the guest image successfully.

That is good too.

> Before going to issue, I have one question sir, What is my understanding=
 is this:::
>
>   The two files 1. xen-guest-image-minimal-raspberrypi4-64.ext3 and 2. I=
mage should be copied to the /home/root/ directory of the Dom-0. Here first=
 I should copy them to the USB pendrive and then connecting that to the boa=
rd I should copy them to the board later should create the .config file net=
work related settings to be completed to run the guest.  Is my understandin=
g correct sir?

I'm not quite sure. You have two files from your guest image build,
and you should put a copy of each of those into the /home/root/
directory of your running Raspberry Pi.

It sounds like you're trying to use a USB pendrive to do that, which
may be OK. An alternative option could be to copy the ext3 and Image
files over a network, using a command line tool such as scp.

> Now below is the issue that I am facing:
>
> 1. I am trying to copy the "xen-guest-image-minimal-raspberrypi4-64.ext3=
" from "../build/tmp/work/raspberrypi4_64-poky-linux/xen-guest-image-minima=
l/1.0-r0/deploy-xen-guest-image-minimal-image-complete/" directory to the U=
SB pendrive but getting "Filesystem does not support symbolic links" error.

Instead of copying the symbolic link (or "shortcut thing"), inspect it
to find which file it is linking to, and copy that file instead.

You may need to rename it once it has been transferred into /home/root
on the Pi, so that it has the same filename as the link had, to match
the instructions in the presentation.

> 2. Also next I am trying to copy the "Image" from the "../build/tmp/work=
/raspberrypi4_64-poky-linux/linux-raspberrypi/1_4.19.126+gitAUTOINC+f6b3ac2=
8f0-r0/deploy-linux-raspberrypi/ " directory. But here There is no actual i=
mage but I have a shortcut thing (as shown in the below screenshot). But an=
other file I have "Image-1-4.19.126+git0+f6b3ac28f0-r0-raspberrypi4-64-2020=
0624123806.bin" which  I can copy that (not sure if I am doing right).

Hmm. You seem to have built a 4.19 Linux kernel, which doesn't match
the expected version 5.4 Linux kernel that you should have, so I'm not
sure that you are building with all the correct pieces yet.

Christopher

>
> Below is the screenshot for the image that I have in that directory.
>
> Kindly suggest me if I have missed anything or doing anything wrong. Ple=
ase.
>
>
> @Ashish sir, Please suggest me if you have any idea on this.
> --
> --
> Best Regards,
> Siddhartha V
>=20

Return-Path: <pauloasherring@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74EACC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 15:52:35 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.11852.1647964353831390479
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 08:52:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A290fN/z;
 spf=pass (domain: gmail.com, ip: 209.85.167.47,
 mailfrom: pauloasherring@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id w27so30538053lfa.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 08:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=w7fvCMu7QtG+gqgyQZ6NLkCNxlCmjEgKksyJq8oy6HM=;
        b=A290fN/zNcV+5kSyfEU16Loe6C7owV7Li3tUUgZUjjiP769MVd0j74YP2cu5yGVuQf
         uOlTY0E0BlIS0yGARrPM6Fotkhc5SZj3wlJV1psk6oUF9gxYrLeiFRFv4slOBv3c9/YQ
         +P2kXScQCvGKW5M4F5K0jlQnd9xACtNHqAuNauWuTzKeZihZkfDBswCkvnIU/gcBs/kD
         bSKcOX0LNYljWls+F/n/yie8Qzc5ifDpwlovNWo/GWhnGjf/eJXaKRxTImPnVBPwZVoS
         0iKhk41ddqMUc3sw73rlfQU7JgRqSpceLcjpWHFkgVi/SYU0DiId4TaAfCv4NXp0vg7y
         rF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=w7fvCMu7QtG+gqgyQZ6NLkCNxlCmjEgKksyJq8oy6HM=;
        b=GBX8tnaea9eDZnf3du9prs9Q/rODGgkcBBkW7Gvnu+6nMqIpvxDrjvE04FoNF1JaJr
         VxZ/48KHZjGT9wLnhQjBXd11+ui7bPZ6vT/YTkqQpSC80OuYI5cagJXUbXIY5cPolB47
         N7F1Ofcl+436y8wKGhUSsgGFiEp03+o1cvWfwgYkm8R4ALSKL1lFvgadfIYtAjSQZABE
         KHIxH5deBkc83uOTAM8PBsVIGIFGcIsVl9KtLm/ELorRKYgaVX67z1KqUuj6L7lxZgDz
         VGsOuQi0eW+kVnxeUFLeNLo5fJWo0hBS5KhJYIuhTnAY9NoaJK8Eh/1hor5kKwgywYS1
         jJ9A==
X-Gm-Message-State: AOAM531oxHStt8km6MGyU5gn0sqXPmhFxHoDqbpdsyd8IODyWFRcpAhj
	RgnSjQPEWIl5UfEKjhgOLdfBVpzDnR8qPqvji5I=
X-Google-Smtp-Source: 
 ABdhPJyr+wquV08mHUJY91kqfZfSErw+5dpp1Dzg58Z4/ph2Z4W/mFKtpAYPr+OYDDGot56DtP6YvL3SbuZ7zMR8bHs=
X-Received: by 2002:ac2:4c04:0:b0:443:ac94:3de5 with SMTP id
 t4-20020ac24c04000000b00443ac943de5mr18745058lfq.329.1647964351948; Tue, 22
 Mar 2022 08:52:31 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAG9RwPKYyH0QQGoN3E+x_J66C1jsNdNm3CbfBAJHO=U24QXC3Q@mail.gmail.com>
 <3336072A-2629-42A6-AB37-5999A2098157@arm.com>
 <CAG9RwPKUk+cY4wOStyFqHchmm9vJYrFZxtjpC0V9iwrQ+9XdYw@mail.gmail.com>
 <E80D57C8-590D-4B2C-9A6A-5C4F5BEEA24E@arm.com>
 <CAG9RwPL2adysD-Wyu7eN2jmo85b-Ufx6TWoSe82dJ-XQRr02EQ@mail.gmail.com>
 <D673A4B9-BB22-41AA-A13C-E19F1EC52BCF@arm.com>
 <CAG9RwPKbpORfL3FkARJuT=fAM5PZGY-Lkv+PQ-rEjt1+j9qVeQ@mail.gmail.com>
 <26959151-CAA8-4FDC-808D-51F58228EC06@arm.com>
 <AM6PR08MB34615752123840EC55863F2492179@AM6PR08MB3461.eurprd08.prod.outlook.com>
In-Reply-To: 
 <AM6PR08MB34615752123840EC55863F2492179@AM6PR08MB3461.eurprd08.prod.outlook.com>
From: Paulo Sherring <pauloasherring@gmail.com>
Date: Tue, 22 Mar 2022 15:52:20 +0000
Message-ID: 
 <CAG9RwP+_FzmRwL9O7wMuGPOtVDjh30Z=UZNfeav4ELxga=8n5A@mail.gmail.com>
Subject: Re: [meta-virtualization] Loading the module xen-gntdev on boot
To: Diego Sueiro <Diego.Sueiro@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Mar 2022 15:52:35 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7103

Hello Diego, Bertrand,
Just confirmed that by bringing these changes into hardknott, the
modules get correctly probed on bootup.

The xen.conf content, just for completeness:
xen-evtchn
xen-gntdev
xen-gntalloc
xen-blkback
xen-netback
xen-pciback
evtchn
gntdev
netbk
blkbk
xen-scsibk
usbbk
pciback

Thanks for the support :)
Kind regards, Paulo.

On Tue, Mar 22, 2022 at 3:30 PM Diego Sueiro <Diego.Sueiro@arm.com> wrote:
>
> The xen modules load from systemd was fixed in master as https://git.yoct=
oproject.org/meta-virtualization/commit/?id=3D44dad5105d408e7b6217600eba367=
2e72db0f42f and honister as https://git.yoctoproject.org/meta-virtualizatio=
n/commit/?h=3Dhonister&id=3D6cde8f2ccbde5ecc9997cf727939a0ae5e0fe11d.
>
> You might need to backport this to hardknott as well.
>
> --
> Diego Sueiro
> Staff Software Developer - Automotive and Industrial Solutions (CE-OSS)
>
> >-----Original Message-----
> >From: meta-virtualization@lists.yoctoproject.org <meta-
> >virtualization@lists.yoctoproject.org> On Behalf Of Bertrand Marquis via
> >lists.yoctoproject.org
> >Sent: 22 March 2022 15:23
> >To: Paulo Sherring <pauloasherring@gmail.com>
> >Cc: meta-virtualization@lists.yoctoproject.org; nd <nd@arm.com>; Bruce
> >Ashfield <bruce.ashfield@gmail.com>
> >Subject: Re: [meta-virtualization] Loading the module xen-gntdev on boot
> >
> >Hi Paulo,
> >
> >> On 22 Mar 2022, at 16:01, Paulo Sherring <pauloasherring@gmail.com>
> >wrote:
> >>
> >> Hi Bertrand,
> >> One very important piece of information I missed to disclose: I am not
> >> using runqemu, as it was not being properly set by the resulting
> >> bitbake build (the resulting image was pointing to the kernel instead
> >> of the xen binary).
> >
> >This should not impact the module loading.
> >
> >>
> >> So, I am launching it "by hand":
> >>
> >> ./tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-nativ
> >> e/usr/bin/qemu-system-aarch64
> >> \
> >> -nographic  \
> >> -machine virt,gic-version=3D3 \
> >> -machine virtualization=3Dtrue \
> >> -cpu cortex-a57 -smp 4 -m 4G -machine type=3Dvirt \ -bios
> >> ./tmp/deploy/images/qemuarm64/u-boot-qemuarm64.bin \ -device
> >> loader,file=3D./tmp/deploy/images/qemuarm64/xen-
> >qemuarm64,addr=3D0x4500000
> >> 0
> >> \
> >> -device
> >> loader,file=3D./tmp/deploy/images/qemuarm64/Image--
> >5.10.103+git0+792f127
> >> 2dd_3aab5bb12b-r0-qemuarm64-20220317212819.bin,addr=3D0x46000000
> >> \
> >> -device
> >> loader,file=3D./tmp/deploy/images/qemuarm64/Image--
> >5.10.103+git0+792f127
> >> 2dd_3aab5bb12b-r0-qemuarm64-20220317212819.bin,addr=3D0x48000000
> >> \
> >> -device loader,file=3D./virt.dtb,addr=3D0x44000000 \ -drive
> >> id=3Ddisk0,file=3D./tmp/deploy/images/qemuarm64/xen-image-minimal-
> >qemuarm6
> >> 4.ext4,if=3Dnone,index=3D0,format=3Draw
> >> \
> >> -device virtio-blk-device,drive=3Ddisk0 \
> >>
> >> And then stop it on u-boot, and setup the fdt:
> >> ## Dom0 only:
> >> fdt addr 0x44000000
> >> fdt resize
> >> fdt set /chosen \#address-cells <1>
> >> fdt set /chosen \#size-cells <1>
> >> fdt set /chosen xen,xen-bootargs "dom0_mem=3D512M"
> >> fdt mknod /chosen module@0
> >> fdt set /chosen/module@0 compatible "xen,linux-zimage" "xen,multiboot-
> >module"
> >> fdt set /chosen/module@0 reg <0x46000000 0x1373a00> fdt set
> >> /chosen/module@0 bootargs "dom0_mem=3D512M root=3D/dev/vda rw
> >> earlyprintk=3Dserial,ttyAMA0 console=3DttyAMA0,115200n8 earlycon=3Dxen=
boot"
> >> booti 0x45000000 - 0x44000000
> >>
> >> Please find also some more information below:
> >>
> >> On Tue, Mar 22, 2022 at 12:59 PM Bertrand Marquis
> >> <Bertrand.Marquis@arm.com> wrote:
> >>>
> >>> Hi Paulo,
> >>>
> >>> Hardknott is long term while honister is not but both are stable rele=
ases.
> >>>
> >>> I am not quite sure I get your 4.14 pulling 4.16. The 4.14 recipe is =
building
> >the latest 4.14 version of Xen.
> >>>
> >> That was just me being silly. I was looking into xen_git.bb which
> >> clearly is not the preferred provider. I am in fact using Xen 4.14, as
> >> you pointed out. Sorry for the mistake.
> >>> From what I see modules to load are in a xen.conf in modules-load.d
> >generated by Xen tools compilation.
> >>> Gntdev is properly listed in the current xen source tree as one of th=
e
> >default modules to actually load on boot.
> >>>
> >>> Can you check the content of modules-load.d/xen.conf (somewhere in /e=
tc
> >in your dom0 roots) ?
> >>>
> >> I have nothing there. But, I did have two hits when searching the root=
fs:
> >> /etc/tmpfiles.d/xen.conf
> >> /lib/systemd/modules-load.d/xen.conf
> >
> >This is the interesting file.
> >It shall be used by systemd on boot to load the modules required by Xen.
> >Please check if gntdev is listed there.
> >
> >If yes then this is a systemd issue, if not this is a Xen issue which ap=
pear to be
> >solved in xen master and I will have to check in the 4.14 version used b=
y Yocto
> >LTS.
> >
> >
> >> Not sure if there there is some sort of startup script that was
> >> supposed to move around these files or even if
> >> systemd-modules-load.service would be supposed to be looking
> >> elsewhere.
> >
> >No the lib one is the right one for systemd.
> >
> >Cheers
> >Bertrand
> >>
> >>> It could be that this was actually missing in the xen release you are=
 building
> >or that systemd is not actually loading modules listed there.
> >>>
> >>> Cheers
> >>> Bertrand
> >> Cheers, Paulo.
> >
>


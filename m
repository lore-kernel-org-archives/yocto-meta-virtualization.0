Return-Path: <pauloasherring@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295EBC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 15:01:48 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web08.11002.1647961306802448455
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 08:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dlxm0t8y;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: pauloasherring@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id l20so30208578lfg.12
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 08:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ytO4rBjnCGyF8KJXIVhk41N3i1yaTPan12t4FekdIrw=;
        b=dlxm0t8yLmLGM8HFmmonBsn7olfJIRtt1xo76tPwiIkxfMvCoxU1ha7TcqpLPlvMed
         CA6UCHgkN6xebKwV2nrAdis04sQuotyUMj/9SAcsdQKw3kMroY5l6dMpm0P+tE+80aaL
         melaWs+WdOfu5fKk/fzZzN7mVqJholLCQGai+CBccczMUzpLB27KLP0gSx7waDW2T0A4
         efiL9YoTOpW4kja8WH++Y0S7otlB6ffWeF9/vH/A4nHVbvcmQZetEqLqLq/fo9paGajS
         KhANJntGmthQ6+I+n1zCsktlmBC79uiz6ALRbZYB0AfjnChACsP507LCtIkZbFRMbd8C
         GrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ytO4rBjnCGyF8KJXIVhk41N3i1yaTPan12t4FekdIrw=;
        b=18syXNQR6RtaRe4lCWh4x/ixhgiEpO6vFDKpocXHcERxgSqBXHHIw8jMNcHhrf4rgt
         QX9HpqK0V+cZ4Ir7IwKKcBHokOchJEjU+quInquP4jfI8Nf6I47B+qChFZ3E23+0rik0
         9ED9CSWay3uu6HdfzfIEgWaj6ML1k9zP3vPXbmE03Gg8VxnEb2zaZ1kDXdMSem3Zf96a
         wfIXr8c7wldlEF9VZBCaNlofPRoekrK5xoWBHN1ebdl4zDW81dBdWAdWtlRHGewHgvDV
         1LdOspMlHl9jvt70SGTW+3euBvp1V4d3IS6k6iFxKuxcI8XYekrvibFmH75XgQQB+KuL
         r1cA==
X-Gm-Message-State: AOAM533vcM3HfHJSe2bhzRvudT83JuoMJnSN50cRT4Btyqp7F5Clo6gU
	3aQiog/AI393SpCCXkPqtjerWErWlx5HntDb1js=
X-Google-Smtp-Source: 
 ABdhPJyZDGDd5m0bRt38+2IhuujZbdH4PZlHX5vDxru3SKjlsy+pAC26WTFdHNPBeeDmUGfBV2d4OzNoiPVdoII3z94=
X-Received: by 2002:ac2:4315:0:b0:448:2bb9:f11d with SMTP id
 l21-20020ac24315000000b004482bb9f11dmr18270833lfh.212.1647961303508; Tue, 22
 Mar 2022 08:01:43 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAG9RwPKYyH0QQGoN3E+x_J66C1jsNdNm3CbfBAJHO=U24QXC3Q@mail.gmail.com>
 <3336072A-2629-42A6-AB37-5999A2098157@arm.com>
 <CAG9RwPKUk+cY4wOStyFqHchmm9vJYrFZxtjpC0V9iwrQ+9XdYw@mail.gmail.com>
 <E80D57C8-590D-4B2C-9A6A-5C4F5BEEA24E@arm.com>
 <CAG9RwPL2adysD-Wyu7eN2jmo85b-Ufx6TWoSe82dJ-XQRr02EQ@mail.gmail.com>
 <D673A4B9-BB22-41AA-A13C-E19F1EC52BCF@arm.com>
In-Reply-To: <D673A4B9-BB22-41AA-A13C-E19F1EC52BCF@arm.com>
From: Paulo Sherring <pauloasherring@gmail.com>
Date: Tue, 22 Mar 2022 15:01:32 +0000
Message-ID: 
 <CAG9RwPKbpORfL3FkARJuT=fAM5PZGY-Lkv+PQ-rEjt1+j9qVeQ@mail.gmail.com>
Subject: Re: [meta-virtualization] Loading the module xen-gntdev on boot
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Mar 2022 15:01:48 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7100

Hi Bertrand,
One very important piece of information I missed to disclose: I am not
using runqemu,
as it was not being properly set by the resulting bitbake build (the
resulting image was
pointing to the kernel instead of the xen binary).

So, I am launching it "by hand":

./tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/qemu-system-aarch64
\
-nographic  \
-machine virt,gic-version=3 \
-machine virtualization=true \
-cpu cortex-a57 -smp 4 -m 4G -machine type=virt \
-bios ./tmp/deploy/images/qemuarm64/u-boot-qemuarm64.bin \
-device loader,file=./tmp/deploy/images/qemuarm64/xen-qemuarm64,addr=0x45000000
\
-device loader,file=./tmp/deploy/images/qemuarm64/Image--5.10.103+git0+792f1272dd_3aab5bb12b-r0-qemuarm64-20220317212819.bin,addr=0x46000000
\
-device loader,file=./tmp/deploy/images/qemuarm64/Image--5.10.103+git0+792f1272dd_3aab5bb12b-r0-qemuarm64-20220317212819.bin,addr=0x48000000
\
-device loader,file=./virt.dtb,addr=0x44000000 \
-drive id=disk0,file=./tmp/deploy/images/qemuarm64/xen-image-minimal-qemuarm64.ext4,if=none,index=0,format=raw
\
-device virtio-blk-device,drive=disk0 \

And then stop it on u-boot, and setup the fdt:
## Dom0 only:
fdt addr 0x44000000
fdt resize
fdt set /chosen \#address-cells <1>
fdt set /chosen \#size-cells <1>
fdt set /chosen xen,xen-bootargs "dom0_mem=512M"
fdt mknod /chosen module@0
fdt set /chosen/module@0 compatible "xen,linux-zimage" "xen,multiboot-module"
fdt set /chosen/module@0 reg <0x46000000 0x1373a00>
fdt set /chosen/module@0 bootargs "dom0_mem=512M root=/dev/vda rw
earlyprintk=serial,ttyAMA0 console=ttyAMA0,115200n8 earlycon=xenboot"
booti 0x45000000 - 0x44000000

Please find also some more information below:

On Tue, Mar 22, 2022 at 12:59 PM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Paulo,
>
> Hardknott is long term while honister is not but both are stable releases.
>
> I am not quite sure I get your 4.14 pulling 4.16. The 4.14 recipe is building the latest 4.14 version of Xen.
>
That was just me being silly. I was looking into xen_git.bb which
clearly is not the preferred provider. I am in fact using Xen 4.14, as
you pointed out. Sorry for the mistake.
> From what I see modules to load are in a xen.conf in modules-load.d generated by Xen tools compilation.
> Gntdev is properly listed in the current xen source tree as one of the default modules to actually load on boot.
>
> Can you check the content of modules-load.d/xen.conf (somewhere in /etc in your dom0 roots) ?
>
I have nothing there. But, I did have two hits when searching the rootfs:
/etc/tmpfiles.d/xen.conf
/lib/systemd/modules-load.d/xen.conf
Not sure if there there is some sort of startup script that was
supposed to move around these files
or even if systemd-modules-load.service would be supposed to be
looking elsewhere.

> It could be that this was actually missing in the xen release you are building or that systemd is not actually loading modules listed there.
>
> Cheers
> Bertrand
Cheers, Paulo.

____

> > On 22 Mar 2022, at 13:38, Paulo Sherring <pauloasherring@gmail.com> wrote:
> >
> > Hello Bertrand,
> >
> > On Tue, Mar 22, 2022 at 12:28 PM Bertrand Marquis
> > <Bertrand.Marquis@arm.com> wrote:
> >>
> >> Hi Paulo,
> >>
> >> Please always keep the mailing list in as me asking the questions does not mean I will necessarily be the one working on this.
> >>
> > Oops, my mistake, sorry.
> >
> >> Please see some questions here after.
> >>
> >>> On 22 Mar 2022, at 12:03, Paulo Sherring <pauloasherring@gmail.com> wrote:
> >>>
> >>> Hello Bertrand,
> >>>
> >>> On Tue, Mar 22, 2022 at 10:44 AM Bertrand Marquis
> >>> <Bertrand.Marquis@arm.com> wrote:
> >>>>
> >>>> Hi Paulo,
> >>>>
> >>>>> On 22 Mar 2022, at 11:33, Paulo Sherring via lists.yoctoproject.org <pauloasherring=gmail.com@lists.yoctoproject.org> wrote:
> >>>>>
> >>>>> Hello all,
> >>>>> I am a bit new to meta-virtualization and to the Xen project And to
> >>>>> virtualizations, so please bear with me :)
> >>>>> I've been trying to make use of the xen project, currently targeting
> >>>>> qemu (and later on, rpi4). After messing around, I was able to boot
> >>>>> dom0 and a domU.
> >>>>> But, I had to add the xen-gntdev to the `modules-load.d,` because
> >>>>> `xenstored` was failing to start, due to some missing connection,
> >>>>> probably brought up by xen-gntdev module.
> >>>>>
> >>>>> As I am new to all this, I was just wondering if this is by design, or
> >>>>> this is an issue (and therefore, I should/could submit a patch).
> >>>>
> >>>> No problem at all and thanks a lot for the feedback.
> >>>> This should not happen and should be fixed.
> >>>>
> >>>> Could you tell us what you are building (which image) and what parameters did you set in your local.conf ?
> >>>>
> >>>
> >>> - Baseline is hardknott.
> >>
> >> Any reason not to use honester ?
> >>
> > The main reason was that hardknott is tagged as a stable release and
> > it already includes xen 4.14 or latest (it is actually pulling 4.16),
> > which I wanted/will need for RPi4 support.
>
>


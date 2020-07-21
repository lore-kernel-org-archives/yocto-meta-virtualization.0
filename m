Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.4200.1595362668094828065
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Jul 2020 13:17:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s6MGDaoS;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id k6so18328528oij.11
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jul 2020 13:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EullJONJKLO1FQqZo6fCXXuLpA+S4GXRCYK6r/9xn7g=;
        b=s6MGDaoSURkq8JJveYUi8EVYEu6Mwilaswlr3t+hzjICgd23at9fiEjI+bueMw1BoU
         c9x1Uk0GSoI9ZUOrPn7OBQiwnm4CsDdBjkMspF3MLjFoc13esoYyyzwUDj9MOI4PyYs9
         yzz0B/QWDXPmMjDsBC3s4LwvgCYiyudIrajcN/FMobUDkrN/83EYR1VoSe3qPluwli52
         +KFClFHNO+QzQ/bYENouYuVolaUovTdq6Xy6kLAR8ZxzvgqXWPpLr4YMI9THG8lcDUFQ
         Mqa0M0ir1BEV3WDB09ucxowZQ87xsx0054xcvKdxxICp8KmnFP19kw/kX8N43zgrDkQK
         Gt+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EullJONJKLO1FQqZo6fCXXuLpA+S4GXRCYK6r/9xn7g=;
        b=NHkW4wUAkkNfNq5BRrxR+btxzkJ3WIrrvRTE/f9vQ6x2sz6oV61TjdtyK+892EwyER
         GfOT/dz9S8LvX7rMKs4wN6BirVkDWn/fdHJ7ZWroDpQELZatcGyRBRLHujfIxIIDXgWG
         5c0Tlq1gBaQz1EG6SNPNMpn5DVkHnfugqLpPU3keqU49LWjN4AIbnCuN5YULTtvw8Q9K
         LbEDtQF44TdmNliTHyYpBjQQXrphTH4i6KMT0tssjQg6Hm9vv5vdQdZGiwLa2aXt1+is
         rPwNrgv+Fv+Bi3r74DEYE/BgUq+laVYP4f7c4L0RkqWDStJ0XcbEZ0RWvwPeNmYCqrUI
         snoA==
X-Gm-Message-State: AOAM533vJml3lm7XTEl1rHbIaRpJ8Ao0ctUgIb8K9mOuRDACtX1fov9U
	XW6mlC9be6JHaOq8HHP+9+4wEAKRD5EAYd3H/Fw=
X-Google-Smtp-Source: ABdhPJwwjOxkEZ9eVHWX5Va9f0qxtZ1bLPugT7w09ugOdVBcvu3gdTZ5x4MtuJdVjHuj/f07z8dLyHnBje2ZTdsHYrY=
X-Received: by 2002:aca:fc87:: with SMTP id a129mr4626017oii.28.1595362667362;
 Tue, 21 Jul 2020 13:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <X89b.1595249396548095111.cJFu@lists.yoctoproject.org>
 <CACMJ4Ga4Cr=GuCKQvJbkoHch_Msm_FgxVCDL4btVyJchxTkwRA@mail.gmail.com> <CAEkELtDWJDE93omLuq3cevYnP7d5m73fTzeqZ-0vjuRHCi3wBA@mail.gmail.com>
In-Reply-To: <CAEkELtDWJDE93omLuq3cevYnP7d5m73fTzeqZ-0vjuRHCi3wBA@mail.gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Tue, 21 Jul 2020 13:17:35 -0700
Message-ID: <CACMJ4GZZqfhe679iaGj3H3SWUjHTnhSEXzJoaj7D4K7BQ0tWmw@mail.gmail.com>
Subject: Re: [meta-virtualization] Starting Xen guest on Raspberry-Pi4. #meta-virtualization #yocto
To: siddhartha v <siddhuvgowda.18695@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2020 at 11:46 AM siddhartha v
<siddhuvgowda.18695@gmail.com> wrote:
>
> Yes sir it built using kernel 4.19.
>
> How can i upgrade it to 5.4 now. Is there any ways? Please suggest ms si=
r.

If you are building with the latest version of meta-virtualization and
'xen' is present in DISTRO_FEATURES in your local.conf file, then your
build configuration should automatically have set kernel version to
5.4 as the preferred version. You should just be able to build with
the current versions of the source code, and then use a SD card
populated with the new image and new binaries for your guest VM.

The Raspberry Pi kernel, linux-raspberrypi, is set as the preferred
kernel in meta-raspberrypi when you select the raspberrypi4-64 as
MACHINE in local.conf, by this:
./include/rpi-default-providers.inc:PREFERRED_PROVIDER_virtual/kernel
?=3D "linux-raspberrypi"

The preferred kernel version for that kernel is set by this line in
meta-virtualization/conf/distro/include/meta-virt-xen.inc :
PREFERRED_VERSION_linux-raspberrypi ?=3D "5.4.%"

and the meta-virt-xen.inc file gets included via meta-virtualization's
layer.conf:
META_VIRT_XEN_CONFIG_PATH =3D "${LAYERDIR}/conf/distro/include/meta-virt-x=
en.inc"
USER_CLASSES_append =3D " meta-virt-xen-cfg"

Have you overridden the USER_CLASSES variable, or
PREFERRED_PROVIDER_virtual/kernel or anything related to the above in
your build configuration files?

Christopher

>
>
> Regards,
> Siddhartha V
>
>
> On Wed, 22 Jul, 2020, 12:11 AM Christopher Clark, <christopher.w.clark@g=
mail.com> wrote:
>>
>> On Mon, Jul 20, 2020 at 5:49 AM Siddhartha V
>> <Siddhuvgowda.18695@gmail.com> wrote:
>> >
>> > Hello @Christopher Sir,
>> >
>> >          As you suggested I have created the Xen image for RPI4  Than=
k you so much. Later I did the below steps:
>> >
>> > 1. I used "sudo dd if=3Dtmp/deploy/images/raspberrypi4-64/xen-image-m=
inimal-raspberrypi4-64.rpi-sdimg of=3D/dev/sdb bs=3D4M" command to write th=
eimage to the SDcard and then the RPI4 board booted well. And I used few co=
mmands ("Referred the pptx that shared during the yocto dev-day") and thing=
s went well. Thank you so much.
>>
>> Excellent.
>>
>> > Now I am trying to start the guest now. But I am facing some issues:
>> >
>> > I have built the guest image successfully.
>>
>> That is good too.
>>
>> > Before going to issue, I have one question sir, What is my understand=
ing is this:::
>> >
>> >   The two files 1. xen-guest-image-minimal-raspberrypi4-64.ext3 and 2=
. Image should be copied to the /home/root/ directory of the Dom-0. Here fi=
rst I should copy them to the USB pendrive and then connecting that to the =
board I should copy them to the board later should create the .config file =
network related settings to be completed to run the guest.  Is my understan=
ding correct sir?
>>
>> I'm not quite sure. You have two files from your guest image build,
>> and you should put a copy of each of those into the /home/root/
>> directory of your running Raspberry Pi.
>>
>> It sounds like you're trying to use a USB pendrive to do that, which
>> may be OK. An alternative option could be to copy the ext3 and Image
>> files over a network, using a command line tool such as scp.
>>
>> > Now below is the issue that I am facing:
>> >
>> > 1. I am trying to copy the "xen-guest-image-minimal-raspberrypi4-64.e=
xt3" from "../build/tmp/work/raspberrypi4_64-poky-linux/xen-guest-image-min=
imal/1.0-r0/deploy-xen-guest-image-minimal-image-complete/" directory to th=
e USB pendrive but getting "Filesystem does not support symbolic links" err=
or.
>>
>> Instead of copying the symbolic link (or "shortcut thing"), inspect it
>> to find which file it is linking to, and copy that file instead.
>>
>> You may need to rename it once it has been transferred into /home/root
>> on the Pi, so that it has the same filename as the link had, to match
>> the instructions in the presentation.
>>
>> > 2. Also next I am trying to copy the "Image" from the "../build/tmp/w=
ork/raspberrypi4_64-poky-linux/linux-raspberrypi/1_4.19.126+gitAUTOINC+f6b3=
ac28f0-r0/deploy-linux-raspberrypi/ " directory. But here There is no actua=
l image but I have a shortcut thing (as shown in the below screenshot). But=
 another file I have "Image-1-4.19.126+git0+f6b3ac28f0-r0-raspberrypi4-64-2=
0200624123806.bin" which  I can copy that (not sure if I am doing right).
>>
>> Hmm. You seem to have built a 4.19 Linux kernel, which doesn't match
>> the expected version 5.4 Linux kernel that you should have, so I'm not
>> sure that you are building with all the correct pieces yet.
>>
>> Christopher
>>
>> >
>> > Below is the screenshot for the image that I have in that directory.
>> >
>> > Kindly suggest me if I have missed anything or doing anything wrong. =
Please.
>> >
>> >
>> > @Ashish sir, Please suggest me if you have any idea on this.
>> > --
>> > --
>> > Best Regards,
>> > Siddhartha V
>> >=20

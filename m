Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD662EDEBEC
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 19:36:43 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1152.1772566600306509400
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 11:36:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CYAairIf;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c70b4a0cda5so2232161a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Mar 2026 11:36:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772566600; cv=none;
        d=google.com; s=arc-20240605;
        b=ZILlB+BJ8gv7WCVNZDbW5SiLD33nBxlT6Lu8qUfBiPOKR96ImWOVJUj5bJHixxTtBH
         P69FHZOrs4iTE9aGcf8le+SmtqT4cnxQcIbO8DwruO9aOKaRYC1j+CwJwPZG2pQboBlE
         QYvb8pRwhATIqyf7bqfa4QYvQ9ZjR+DeJSjIwTIB3RFGw3ZJgqiCHaR4x3RhEFwAzmLE
         Sd9M/Fg9Mugq2lYzbLJeifoAo9r3BHmh3xEHoXwfwppVQ+Pt0/FbOlCJ+9i3m9G5PW8C
         z8lKUbSqhicKtNS7HhpARe4lw4DkyCDr21hlsBAQHp49OL/UBrxyHXybzytIcHtK9uKk
         WowQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F942+ZAKnhWZFDWwDTZMMxM3Vl5BASLPTNaV8y40ocg=;
        fh=G4U9asDac4MoLMSCULd4REICRzGMxWxRwV+uFuq2w9k=;
        b=CcoA++7Ho2WbV8eJeBlYSc3lyJl+0irPRVx3g06Vcb+fREYl5E5XfyU4Bp5w4XbJV8
         MFh/eE6C8FRU25Dzf03i8K45EEJVBTXGYjRy/+cocFJklhMoA9In2YpNHNev1M6Xkqy/
         uuZptTtWvss6wi9al/4RD2UWFev7XytucPbs4Cg9WekUbqu0gE4Y9q+P0utVxvTiM6rl
         65FLQuhM13nLbMKsEOB5aOMHCJz0LNctuPthZgppwck8sf3LqXPv8k1+PAPKd9sWBeAH
         UPjCkEQNDJ2exj8TcJyeukpWhOahCdSCrS5/tC93eYyKkKVbvAkh49lclM022CbDlxgw
         e3Ng==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772566600; x=1773171400; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F942+ZAKnhWZFDWwDTZMMxM3Vl5BASLPTNaV8y40ocg=;
        b=CYAairIf8olxAIA/noh9djLeLNo995KO0AzcIn313kfDrqKrX2LwnYjmV0uO5pRjE+
         v+8BAwy7gITVZKpcYpsbLv6wirVoqL4ScgghMDhGf/JbupXXC8eSXRTrLvnYa6usikMt
         a+B3F39zvX7igSCqOJw7nYBp6tORGf5LtATYHUJgSryW7joh/oHYgqvPqHNUr8ysV4gT
         Qsgml5FQpEZ8jISmkmC/+GQv6ZDazYMOH78fj+kS12YwLZh4qbEae3o28duQhXhbzuVm
         bhiK3qbbtlfz1PnMhNH+jODxNNZl8Mw2Aa92vR1PzDAnNr9xzlMDlPLzniXx9Z9dz89M
         M1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772566600; x=1773171400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F942+ZAKnhWZFDWwDTZMMxM3Vl5BASLPTNaV8y40ocg=;
        b=KBpETHQeAc8vRJ7emaBcN658Wu79yxZ6wdOKe7aKMd+XFDA5CMziwLAivYMSTYiUH1
         HCEB34JoFRhTGTG+BgvocrLOkSO0YRwrAtP316nBnyPDh0ejD8U/SBw5w+xFRzTb/TGp
         8S+voAOJp/h+rALtmLZVM/TCnONIbIcB/MFEuIDmC5H+bC247S9fdYwhssKJt21JMkcO
         wYTrdFRU0Azi7DM5EDWNj1xlxbholqHq84d/GibSY7+knYDlpQCA9G6WPGgHQI3HkPQ4
         LVEBl8mPNQRyy35E2i0qnvsnNv+3e1Hy0qHHKTgGUpTuwKC00QH+g6N81W0/Qeo9tHoT
         jf+g==
X-Forwarded-Encrypted: i=1; AJvYcCXzVDKoBgLyuaT/TckZkjm8+QTFy0XWaaRPJK9q/rjgkKob9q9eQoHdBlW3KFNAwbr4zWJeIsTLCxOKmPLedp5TY+uc@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Ywlpy2Nm4ODX9lyHDNhqN00gXPo3N0BHaCmokQoHcCdfCL7dEqb
	qFnT+fww9zs9b6pRnR+/Ju82YqSpEjLa9dlfK9X0gGmIk6qobjAdxyhXesRZBKJ5mI0QbvaLAXI
	lapd3I7dybHzxKIuDVgvNZC+1iH5fZxg=
X-Gm-Gg: ATEYQzxV1zauhc6HGIdEHPrwAatusZgx0HXZv9hHNj4z3dxyqx4lxqMrDytPLdvCJIV
	5Ho3drQZwB0eB7RSOt/4G2dT+FAaR0oO1c6Uze46740gL8C8N3Jya43QgHa6/Zf7wZMTzwyqdrg
	2NqIyrwL5+VinRP3jXjc7G1mH4Pjtu8+EYYQE3kPtOKEv+1LVvduBBRhtDBb/wE2+Y3kurAIe0u
	ukTXGVCPAa/Og503WcukkWMwpVu4JNlrMaXJ1P70LMe59LUa1M8s3xrKHipnbmGOebRczq/JQqf
	rHtMvJPUEIrk1x+ONDjg1ng7gHWupnK+Bc3Jent4
X-Received: by 2002:a17:90b:1344:b0:352:be45:1063 with SMTP id
 98e67ed59e1d1-3599ceb539cmr2454332a91.10.1772566599446; Tue, 03 Mar 2026
 11:36:39 -0800 (PST)
MIME-Version: 1.0
References: <TY3PR01MB10110B39C744E9FAC050B99299B7FA@TY3PR01MB10110.jpnprd01.prod.outlook.com>
 <1899390ABCE6BA2D.918325@lists.yoctoproject.org> <18994118E0699BAE.918325@lists.yoctoproject.org>
In-Reply-To: <18994118E0699BAE.918325@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Mar 2026 14:36:33 -0500
X-Gm-Features: AaiRm53hYPSiJE6xYF79sb2G1ZipaDWoH7WC9DXr1bkC3rPC5wceZRMGMseFYmo
Message-ID: <CADkTA4Ngct8hOnCTobY=Ep8cJWSmgAqrc-Np0GuiZiWJHAg2dA@mail.gmail.com>
Subject: Re: [meta-virtualization] image-oci.bbclass: description of usage of
 oci image
To: bruce.ashfield@gmail.com
Cc: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000080341e064c23d22e"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Mar 2026 19:36:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9617

--00000000000080341e064c23d22e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 1:31=E2=80=AFAM Bruce Ashfield via lists.yoctoprojec=
t.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:

>
>
> On Mon, Mar 2, 2026 at 11:04=E2=80=AFPM Bruce Ashfield via lists.yoctopro=
ject.org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
>>
>>
>> On Mon, Mar 2, 2026 at 9:52=E2=80=AFPM Yiding Liu (Fujitsu) <
>> liuyd.fnst@fujitsu.com> wrote:
>>
>>> Hi Bruce
>>>     1.  I follow the step of running oci image in  image-oci.bbclass bu=
t
>>> it has error in runc.
>>>
>>>     # tar -xvf container-base-latest-oci-dir.tar
>>>     # oci-image-tool create --ref name=3Dlatest
>>> container-base-qemux86-64.rootfs-20260302090735.rootfs-oci
>>> container-base-oci-bundle
>>>
>>     # runc run -b container-base-oci-bundle ctr-build
>>> ERRO[0000] runc run failed: unable to start container process: error
>>> during container init: open /dev/pts/ptmx: no such file or directory
>>>
>>>   2. Then I follow the comment in image-oci-umoci.inc using two methods
>>> which can run container successfully
>>>     # make a tar version of the image direcotry
>>>     #  1) image_name.tar: compatible with oci tar format, blobs and
>>> rootfs
>>>     #     are at the top level. Can load directly from something like
>>> podman
>>>     #  2)image_name-dir.ta: original format from meta-virt, is just a
>>> tar'd
>>>     #     up oci image directory (compatible with skopeo :dir format)
>>>
>>>    2.1 Method 1 for image_name.tar
>>> # podman load -i container-base-latest-oci.tar
>>>
>>> # podman images | grep localhost/latest
>>> localhost/latest                           latest      1d603a1041c5  14
>>> years ago   5.58 MB
>>>
>>> # podman run -it 1d603a1041c5
>>> / # ls
>>> bin    boot   dev    etc    home   lib    media  mnt    proc   root
>>> run    sbin   sys    tmp    usr    var
>>>
>>>     2.2  Method 2 for image_name-dir.tar
>>> # tar xvf container-base-latest-oci-dir.tar
>>> # skopeo copy
>>> oci:container-base-qemux86-64.rootfs-20260302090735.rootfs-oci:latest
>>> containers-storage:container-base-qemux86-64:1.0
>>> # podman images | grep container-base-qemux86-64
>>> docker.io/library/container-base-qemux86-64  1.0         1d603a1041c5
>>>  14 years ago   5.58 MB
>>>
>>> # podman run --rm -it 1d603a1041c5
>>> / # ls
>>> bin    boot   dev    etc    home   lib    media  mnt    proc   root
>>> run    sbin   sys    tmp    usr    var
>>>
>>>        Based on this phenomenon, I think we can modify the  description
>>> of usage of oci image in image-oci.bbclass to use the  two methods abov=
e.
>>>
>>>        What do you think about my suggestion=EF=BC=9F
>>>
>>
>> When I wrote that comment, oci-image-tools were capable of creating a
>> bundle that runc could directly execute.
>>
>> I'm actually in the process of upgrading bare bundles + runc to work wit=
h
>> the new architecture that I've created for bundling docker and podman
>> containers (something called vrunc), but that isn't quite ready yet.
>>
>> So yes, I'd say that we could remove the oci-image-tool reference and
>> just update it to suggest umnoci like the  image-oci-umoci.inc
>>
>> When I have bare runc working again, I can update the headers will those
>> details as well.
>>
>
> Here's what I ended up doing in my work to update for just "runc"
> execution:
>
> > mkdir t; cd t
> > tar xvf ../container-base-latest-oci.tar
> ./
> ./blobs/
> ./blobs/sha256/
>
> ./blobs/sha256/9c865925ea89ca977d07df924f6dcb46f0e8e605aaac9f326fdbdb1d60=
25179a
>
> ./blobs/sha256/abcca458983fe432ab53fed222d30fb40ba5ffebd966a31312aa57672c=
c22365
>
> ./blobs/sha256/26a875ac118866f5f5d9d0e81504c2d013e7dd59dcfb4f556656608a3b=
78e64c
>
> ./blobs/sha256/97957e8c0e5ae4f1f05097c17d89348a3e3d4133b58b46979975280694=
3bce91
>
> ./blobs/sha256/7ab75280a05b336e98e4d8100e15e562fefaed17bf91957b408ad52f8e=
e2523c
>
> ./blobs/sha256/561858046f0d0bec4c5e9441f7c8fe712a787149cab37a62da0cf20271=
87cdda
>
> ./blobs/sha256/55e338157da42fa767d8f133ebf9d1324e1ed3ebf34f10aa9d630048c3=
9500cb
>
> ./blobs/sha256/788385c41c0ff5f824b392c4719d820e267ae86e174cb4a76ce4c9c893=
80292d
>
> ./blobs/sha256/9e60bcc8bff0c2b33a8063612d23d6bd0ba721f63a50213c295840c9ec=
cc57a3
>
> ./blobs/sha256/60bac006254f0dc3e49ebbb007e0144bb95229c215cf3d4c8c64dc1055=
5c1fc4
>
> ./blobs/sha256/61813b4d501970740bedb007fcd41e34117fdaea8761ae0fd3230effcf=
c5fd95
>
> ./blobs/sha256/e503c33223590248dc2e15806120a04fbd75dcdbdaf597807f10d25324=
bb8f77
>
> ./blobs/sha256/0c62a8d0deedfe296fc5180e512d296618d615146face55342707f3e49=
359937
>
> ./blobs/sha256/b3dcd199b033d226d32289cfeadc894ba94af762dc48dfe07bda97e6c2=
57bf3d
>
> ./blobs/sha256/1b3615a1e71b8ef260a22c8300eb2e40122ac244a15a01d3f53699ae4f=
a3c916
>
> ./blobs/sha256/aff80661b33e7fa0e4778f5d01179f082860c8c7f0dc16b49158668297=
b8769c
>
> ./blobs/sha256/4234f83392f7dfb358ef6ff4de282548338d5fbe724c150ebb41065fd3=
2685c6
> ./index.json
> ./oci-layout
> > cd ..
> > oci-image-tool create --ref name=3Dlatest t container-base-oci-bundle
> > cd container-base-oci-bundle
> > cp config.json config.image.json
> > rm -f config.json
> > XDG_RUNTIME_DIR=3D/tmp runc spec
> > jq -s '
>     .[0] as $img | .[1] as $base |
>     $base
>     | .root.path =3D ($img.root.path // "rootfs")
>     | .process.args =3D ($img.process.args // $base.process.args)
>     | .process.cwd =3D ($img.process.cwd // $base.process.cwd)
>     | .process.user =3D ($img.process.user // $base.process.user)
>     | .process.env =3D (($base.process.env // []) + ($img.process.env // =
[])
> | unique)
>   ' config.image.json config.json > config.merged.json && mv
> config.merged.json config.json
> > cd ..
> > sudo runc run -b container-base-oci-bundle ctr-build
> / # ls
> bin    boot   dev    etc    home   lib    media  mnt    proc   root   run
>    sbin   sys    tmp    usr    var
>
> ------------------------
>
> Fundamentally, we need the runc spec, not what the outdated
> oci-image-tools create.
>
> So rather than go directly to the more complex tools, I'd update the clas=
s
> to indicate steps
> similar to those.
>

I updated the header with those steps, as they seem to work with me. I
pushed the changes
by mistake, but they are still valid. We can modify them more as needed.

Bruce



>
> Bruce
>
>
>
>>
>> Bruce
>>
>>
>>>
>>> Liu
>>>
>>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>>
>>
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9616):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9616
> Mute This Topic: https://lists.yoctoproject.org/mt/118107901/1050810
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

--00000000000080341e064c23d22e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 3, 2026 at 1:31=
=E2=80=AFAM Bruce Ashfield via <a href=3D"http://lists.yoctoproject.org">li=
sts.yoctoproject.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@l=
ists.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v dir=3D"ltr"><div style=3D"font-size:small"><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 2, 2026 =
at 11:04=E2=80=AFPM Bruce Ashfield via <a href=3D"http://lists.yoctoproject=
.org" target=3D"_blank">lists.yoctoproject.org</a> &lt;bruce.ashfield=3D<a =
href=3D"mailto:gmail.com@lists.yoctoproject.org" target=3D"_blank">gmail.co=
m@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">=
<div dir=3D"ltr"><div style=3D"font-size:small"><br></div></div><br><div cl=
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
div></div></div></blockquote><div><br></div><div><div style=3D"font-size:sm=
all">When I wrote that comment, oci-image-tools were capable of creating a =
bundle that runc could directly execute.<br><br>I&#39;m actually in the pro=
cess of upgrading bare bundles=C2=A0+ runc to work with the new architectur=
e that I&#39;ve created for bundling docker and podman containers (somethin=
g called vrunc), but that isn&#39;t quite ready yet.<br><br>So yes, I&#39;d=
 say that we could remove the oci-image-tool reference and just update it t=
o suggest umnoci like the=C2=A0 image-oci-umoci.inc<br><br>When I have bare=
 runc working again, I can update the headers will those details as well.<b=
r></div></div></div></div></div></div></blockquote><div><br></div><div><div=
 style=3D"font-size:small">Here&#39;s what I ended up doing in my work to u=
pdate for just &quot;runc&quot; execution:<br><br></div></div><div style=3D=
"font-size:small">&gt; mkdir t; cd t</div>&gt; tar xvf ../container-base-la=
test-oci.tar<br>./<br>./blobs/<br>./blobs/sha256/<br>./blobs/sha256/9c86592=
5ea89ca977d07df924f6dcb46f0e8e605aaac9f326fdbdb1d6025179a<br>./blobs/sha256=
/abcca458983fe432ab53fed222d30fb40ba5ffebd966a31312aa57672cc22365<br>./blob=
s/sha256/26a875ac118866f5f5d9d0e81504c2d013e7dd59dcfb4f556656608a3b78e64c<b=
r>./blobs/sha256/97957e8c0e5ae4f1f05097c17d89348a3e3d4133b58b46979975280694=
3bce91<br>./blobs/sha256/7ab75280a05b336e98e4d8100e15e562fefaed17bf91957b40=
8ad52f8ee2523c<br>./blobs/sha256/561858046f0d0bec4c5e9441f7c8fe712a787149ca=
b37a62da0cf2027187cdda<br>./blobs/sha256/55e338157da42fa767d8f133ebf9d1324e=
1ed3ebf34f10aa9d630048c39500cb<br>./blobs/sha256/788385c41c0ff5f824b392c471=
9d820e267ae86e174cb4a76ce4c9c89380292d<br>./blobs/sha256/9e60bcc8bff0c2b33a=
8063612d23d6bd0ba721f63a50213c295840c9eccc57a3<br>./blobs/sha256/60bac00625=
4f0dc3e49ebbb007e0144bb95229c215cf3d4c8c64dc10555c1fc4<br>./blobs/sha256/61=
813b4d501970740bedb007fcd41e34117fdaea8761ae0fd3230effcfc5fd95<br>./blobs/s=
ha256/e503c33223590248dc2e15806120a04fbd75dcdbdaf597807f10d25324bb8f77<br>.=
/blobs/sha256/0c62a8d0deedfe296fc5180e512d296618d615146face55342707f3e49359=
937<br>./blobs/sha256/b3dcd199b033d226d32289cfeadc894ba94af762dc48dfe07bda9=
7e6c257bf3d<br>./blobs/sha256/1b3615a1e71b8ef260a22c8300eb2e40122ac244a15a0=
1d3f53699ae4fa3c916<br>./blobs/sha256/aff80661b33e7fa0e4778f5d01179f082860c=
8c7f0dc16b49158668297b8769c<br>./blobs/sha256/4234f83392f7dfb358ef6ff4de282=
548338d5fbe724c150ebb41065fd32685c6<br>./index.json<br>./oci-layout<br>&gt;=
 cd ..<br><div style=3D"font-size:small"><span class=3D"gmail_default">&gt;=
</span>=C2=A0oci-image-tool create --ref name=3Dlatest t container-base-oci=
-bundle</div>&gt; cd container-base-oci-bundle<br>&gt; cp config.json confi=
g.image.json<br>&gt; rm -f config.json<br>&gt; XDG_RUNTIME_DIR=3D/tmp runc =
spec<br>&gt; jq -s &#39;<br>=C2=A0 =C2=A0 .[0] as $img | .[1] as $base |<br=
>=C2=A0 =C2=A0 $base<br>=C2=A0 =C2=A0 | .root.path =3D ($img.root.path // &=
quot;rootfs&quot;)<br>=C2=A0 =C2=A0 | .process.args =3D ($img.process.args =
// $base.process.args)<br>=C2=A0 =C2=A0 | .process.cwd =3D ($img.process.cw=
d // $base.process.cwd)<br>=C2=A0 =C2=A0 | .process.user =3D ($img.process.=
user // $base.process.user)<br>=C2=A0 =C2=A0 | .process.env =3D (($base.pro=
cess.env // []) + ($img.process.env // []) | unique)<br>=C2=A0 &#39; config=
.image.json config.json &gt; config.merged.json &amp;&amp; mv config.merged=
.json config.json<br>&gt; cd ..<br>&gt; sudo runc run -b container-base-oci=
-bundle ctr-build<br>/ # ls<br>bin =C2=A0 =C2=A0boot =C2=A0 dev =C2=A0 =C2=
=A0etc =C2=A0 =C2=A0home =C2=A0 lib =C2=A0 =C2=A0media =C2=A0mnt =C2=A0 =C2=
=A0proc =C2=A0 root =C2=A0 run =C2=A0 =C2=A0sbin =C2=A0 sys =C2=A0 =C2=A0tm=
p =C2=A0 =C2=A0usr =C2=A0 =C2=A0var<br><div><br><div style=3D"font-size:sma=
ll">------------------------</div><br><div style=3D"font-size:small">Fundam=
entally, we need the runc spec, not what the outdated oci-image-tools creat=
e.<br><br>So rather than go directly to the more complex tools, I&#39;d upd=
ate the class to indicate steps</div><div style=3D"font-size:small">similar=
 to those.</div></div></div></div></blockquote><div><br></div><div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">I updated the header with th=
ose steps, as they seem to work with me. I pushed the changes</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">by mistake, but they are sti=
ll valid. We can modify them more as needed.</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quot=
e"><div><div style=3D"font-size:small"><br></div><div style=3D"font-size:sm=
all">Bruce</div><br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gma=
il_quote"><div><div style=3D"font-size:small"><br>Bruce<br>=C2=A0</div></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div dir=3D"ltr">
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
<br>
<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9616): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9616" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9616</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/118107901/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/118107901/1050810</a><br>
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

--00000000000080341e064c23d22e--


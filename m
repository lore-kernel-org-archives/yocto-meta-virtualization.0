Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F65CE67A70
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 06:31:45 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12450.1772519503326035268
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 22:31:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lE/RqVeQ;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2be26d11b95so142796eec.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 02 Mar 2026 22:31:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772519503; cv=none;
        d=google.com; s=arc-20240605;
        b=lsT1RoSv+TnBZiD6mZxcYVs9OgYf0I0tvHIYbraUC4fWrmMlvFnYnWZ8rpjgxZsnDr
         tj+7IkCle0Z80L6XXtwxyEi/GRe6i2TtVRh2DyniN7gBzWAf2wBi0yyV8y0TJqOZwVZI
         XG7md5de06SpHiztFn4l3zhY5ZqHpNlGu28Pk7wI8gwRlotvkUkVS58A8E7zCL11zNej
         oEU7ijTfYkqS4Qzno/hCtrUD6P7/tXgoExEoek7CUto+zqpgWzsE+MjPUciHqLYcczmP
         08P4Fz4b5s6XLHrP4EHc4GWBFcmEjap/Jl1kcW8JV6RKEqKwiIBIc/Vpq53bl+PAtsrI
         P+ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3SX4XwQ5JJe1CcATY7qo+ezXfdB9lf4XFPD+MDFS9jI=;
        fh=wT5512h/80zbb32rlHeHJ8AmYTwuiWFnmco4UkjZUSA=;
        b=fJfX6lrC7y3OtgbfppAWqiMjMdnbZaEUR6jEKpajkcbCU0qpWKA4uR3hKdN7hAhUK/
         uaGx12pHRVET2W78GecnPSSWjVNaL69PHW5gW775f2QGpoXd5svx5pZpcLA//aZauEGZ
         0ParxLHPe3XuYJ6IuyntM8R3u/LnyCnKj8UUL4E4EEHY+pZR3Km5VZUHSaW9X53Ck0kL
         2OoQs45SHVIym6BEzhmGs+AQBJkbtFdRdLLQY6Kh3xWNVbH4OXYfpCQFIAcDhVh/YwzR
         PRjilwtnQArFpvABdNWODC7/XnaeIxlkCSDs6qGwHkySDXjQN7q2a6Pb/dpTx2gy1S9g
         gQcQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772519503; x=1773124303; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3SX4XwQ5JJe1CcATY7qo+ezXfdB9lf4XFPD+MDFS9jI=;
        b=lE/RqVeQcIQUTI7PXhJ3ZrsbN4MZPvbesi+pXAXtT3VpuUcM7VBQn+aYvKfj5pX1zI
         IhtJWcyjmY64ICOYe0bwlJY1lBUh20ZqO+MA/jolV9kvWaSmXBgUTrj/GdhBajp8HBST
         jxGWJbQe3WDMQV/Dt0xcnE5yqhK7Cl8EQcH9jf99v/JIs+vUAAXAWuqFxmv315AQt/OA
         VwvQjgkJKh9Ei2SSwsWGhx3VXBWfCuOpAb2XQkFWXasZYaiy1ysBp0bvhtj1KbocQXJ3
         WngC0QcPfBlxfAwY8iaEpH8odve84QLj1EUSEovEnN/OXJ+1TL1FvQM97wmnDzT2Tv0E
         mQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772519503; x=1773124303;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SX4XwQ5JJe1CcATY7qo+ezXfdB9lf4XFPD+MDFS9jI=;
        b=Zqvfi53mFk74eIzwd7uTfIcLQi4jQvZXP25bRGnrpXBjXjacimx7js44rvl20E+LJR
         RIiwFgIgDXFuCmTKKf0fAKRG/avIGyXoZN0J/Ua6r3wyBUQTTi89/+lyvmWn1NUz83DN
         tpRPv6nbbspwKK3WjNdUc3qEUymIx6CdO0AOVGpehqRaJ5xhOAtGtKcVhdb77w1/uHf2
         CF9ABIoBI5qvyiYXWwm/B77CqdGJQ89+vfBqYBw/Ot2jBzy2OPryHgsmK83XMp6ukD9n
         RWCzjQEgBoixH0+Kg4YuXXRebJAUqZLMiAlYKVfqaEhB8kMUSK61d/7dHyxzRZk0W+rK
         wh9w==
X-Forwarded-Encrypted: i=1; AJvYcCW/QNOCJ0JsaYV/auhk5i2mgmB91krUlsiReKO0Wb5p3n5GrkrJIzyZXtqbUN7GNaETGR296ZOOpWsofp+V9c1K/0OS@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwxX+YXW4wdAexxfhTSyKl6nUQYNo4V6fVFL2FDfHqozC2f6djD
	39uHHEAR5jUuq8lXXQhInOjCJHFqB+sWE+duZ7ZeulVYiipNH9C9i7U/m+RkOb+QRtbGmUQpIeu
	oLJEXoFS2lJbbBPU/Rqfqjy2lhHxPlZKM17LGzuCwlw==
X-Gm-Gg: ATEYQzxrJfJPfaO0joSHCgpFZgwMW762b5HgxzShljE2STlqLAGE+y96tKlmuHGxz7E
	1CPTwvpWyqApDnlulXGu/2D13vwmb0vMMMWx9CV60Ao7mKohv6hTGSxLS7TXdCaXcT2hFiJslML
	PCUeggZP4pKVip7K3QzPPzPtuDFZc8xEfNmWPD04S6kxAWrrzOBwFp35GpKYsYtB3fCc0liSHqv
	jdH2Eeyzs1pfvkaY0XE7Da60Rfwp93evxy+EI8Hw3cYaFQ9J7E9gVd080pc4PiVsSdUQWmmkvU4
	50hvMgqAZNu8GxB89z/8lA8Ijf46/1kyVqPjCSjJ
X-Received: by 2002:a17:90b:2b44:b0:359:8c9a:fdf6 with SMTP id
 98e67ed59e1d1-3598c9b004bmr4883435a91.6.1772511739854; Mon, 02 Mar 2026
 20:22:19 -0800 (PST)
MIME-Version: 1.0
References: <TY3PR01MB10110B39C744E9FAC050B99299B7FA@TY3PR01MB10110.jpnprd01.prod.outlook.com>
 <1899390ABCE6BA2D.918325@lists.yoctoproject.org>
In-Reply-To: <1899390ABCE6BA2D.918325@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 2 Mar 2026 23:22:08 -0500
X-Gm-Features: AaiRm50aAw_htlc1J3waG8nQ6g8TqJvGbNx6NXF4WF7PoMETYkV9yKlrorCU95E
Message-ID: <CADkTA4NHOsdRh4rpGyVGX9oTJPuw5P4dL_Fv_ze-PPr0MBc73g@mail.gmail.com>
Subject: Re: [meta-virtualization] image-oci.bbclass: description of usage of
 oci image
To: bruce.ashfield@gmail.com
Cc: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000009d4150064c170cd6"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Mar 2026 06:31:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9616

--0000000000009d4150064c170cd6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 11:04=E2=80=AFPM Bruce Ashfield via lists.yoctoproje=
ct.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:

>
>
> On Mon, Mar 2, 2026 at 9:52=E2=80=AFPM Yiding Liu (Fujitsu) <
> liuyd.fnst@fujitsu.com> wrote:
>
>> Hi Bruce
>>     1.  I follow the step of running oci image in  image-oci.bbclass but
>> it has error in runc.
>>
>>     # tar -xvf container-base-latest-oci-dir.tar
>>     # oci-image-tool create --ref name=3Dlatest
>> container-base-qemux86-64.rootfs-20260302090735.rootfs-oci
>> container-base-oci-bundle
>>
>     # runc run -b container-base-oci-bundle ctr-build
>> ERRO[0000] runc run failed: unable to start container process: error
>> during container init: open /dev/pts/ptmx: no such file or directory
>>
>>   2. Then I follow the comment in image-oci-umoci.inc using two methods
>> which can run container successfully
>>     # make a tar version of the image direcotry
>>     #  1) image_name.tar: compatible with oci tar format, blobs and root=
fs
>>     #     are at the top level. Can load directly from something like
>> podman
>>     #  2)image_name-dir.ta: original format from meta-virt, is just a
>> tar'd
>>     #     up oci image directory (compatible with skopeo :dir format)
>>
>>    2.1 Method 1 for image_name.tar
>> # podman load -i container-base-latest-oci.tar
>>
>> # podman images | grep localhost/latest
>> localhost/latest                           latest      1d603a1041c5  14
>> years ago   5.58 MB
>>
>> # podman run -it 1d603a1041c5
>> / # ls
>> bin    boot   dev    etc    home   lib    media  mnt    proc   root   ru=
n
>>    sbin   sys    tmp    usr    var
>>
>>     2.2  Method 2 for image_name-dir.tar
>> # tar xvf container-base-latest-oci-dir.tar
>> # skopeo copy
>> oci:container-base-qemux86-64.rootfs-20260302090735.rootfs-oci:latest
>> containers-storage:container-base-qemux86-64:1.0
>> # podman images | grep container-base-qemux86-64
>> docker.io/library/container-base-qemux86-64  1.0         1d603a1041c5
>>  14 years ago   5.58 MB
>>
>> # podman run --rm -it 1d603a1041c5
>> / # ls
>> bin    boot   dev    etc    home   lib    media  mnt    proc   root   ru=
n
>>    sbin   sys    tmp    usr    var
>>
>>        Based on this phenomenon, I think we can modify the  description
>> of usage of oci image in image-oci.bbclass to use the  two methods above=
.
>>
>>        What do you think about my suggestion=EF=BC=9F
>>
>
> When I wrote that comment, oci-image-tools were capable of creating a
> bundle that runc could directly execute.
>
> I'm actually in the process of upgrading bare bundles + runc to work with
> the new architecture that I've created for bundling docker and podman
> containers (something called vrunc), but that isn't quite ready yet.
>
> So yes, I'd say that we could remove the oci-image-tool reference and jus=
t
> update it to suggest umnoci like the  image-oci-umoci.inc
>
> When I have bare runc working again, I can update the headers will those
> details as well.
>

Here's what I ended up doing in my work to update for just "runc" execution=
:

> mkdir t; cd t
> tar xvf ../container-base-latest-oci.tar
./
./blobs/
./blobs/sha256/
./blobs/sha256/9c865925ea89ca977d07df924f6dcb46f0e8e605aaac9f326fdbdb1d6025=
179a
./blobs/sha256/abcca458983fe432ab53fed222d30fb40ba5ffebd966a31312aa57672cc2=
2365
./blobs/sha256/26a875ac118866f5f5d9d0e81504c2d013e7dd59dcfb4f556656608a3b78=
e64c
./blobs/sha256/97957e8c0e5ae4f1f05097c17d89348a3e3d4133b58b469799752806943b=
ce91
./blobs/sha256/7ab75280a05b336e98e4d8100e15e562fefaed17bf91957b408ad52f8ee2=
523c
./blobs/sha256/561858046f0d0bec4c5e9441f7c8fe712a787149cab37a62da0cf2027187=
cdda
./blobs/sha256/55e338157da42fa767d8f133ebf9d1324e1ed3ebf34f10aa9d630048c395=
00cb
./blobs/sha256/788385c41c0ff5f824b392c4719d820e267ae86e174cb4a76ce4c9c89380=
292d
./blobs/sha256/9e60bcc8bff0c2b33a8063612d23d6bd0ba721f63a50213c295840c9eccc=
57a3
./blobs/sha256/60bac006254f0dc3e49ebbb007e0144bb95229c215cf3d4c8c64dc10555c=
1fc4
./blobs/sha256/61813b4d501970740bedb007fcd41e34117fdaea8761ae0fd3230effcfc5=
fd95
./blobs/sha256/e503c33223590248dc2e15806120a04fbd75dcdbdaf597807f10d25324bb=
8f77
./blobs/sha256/0c62a8d0deedfe296fc5180e512d296618d615146face55342707f3e4935=
9937
./blobs/sha256/b3dcd199b033d226d32289cfeadc894ba94af762dc48dfe07bda97e6c257=
bf3d
./blobs/sha256/1b3615a1e71b8ef260a22c8300eb2e40122ac244a15a01d3f53699ae4fa3=
c916
./blobs/sha256/aff80661b33e7fa0e4778f5d01179f082860c8c7f0dc16b49158668297b8=
769c
./blobs/sha256/4234f83392f7dfb358ef6ff4de282548338d5fbe724c150ebb41065fd326=
85c6
./index.json
./oci-layout
> cd ..
> oci-image-tool create --ref name=3Dlatest t container-base-oci-bundle
> cd container-base-oci-bundle
> cp config.json config.image.json
> rm -f config.json
> XDG_RUNTIME_DIR=3D/tmp runc spec
> jq -s '
    .[0] as $img | .[1] as $base |
    $base
    | .root.path =3D ($img.root.path // "rootfs")
    | .process.args =3D ($img.process.args // $base.process.args)
    | .process.cwd =3D ($img.process.cwd // $base.process.cwd)
    | .process.user =3D ($img.process.user // $base.process.user)
    | .process.env =3D (($base.process.env // []) + ($img.process.env // []=
)
| unique)
  ' config.image.json config.json > config.merged.json && mv
config.merged.json config.json
> cd ..
> sudo runc run -b container-base-oci-bundle ctr-build
/ # ls
bin    boot   dev    etc    home   lib    media  mnt    proc   root   run
 sbin   sys    tmp    usr    var

------------------------

Fundamentally, we need the runc spec, not what the outdated oci-image-tools
create.

So rather than go directly to the more complex tools, I'd update the class
to indicate steps
similar to those.

Bruce



>
> Bruce
>
>
>>
>> Liu
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
> View/Reply Online (#9614):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9614
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

--0000000000009d4150064c170cd6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 2, 2026 at 11:04=
=E2=80=AFPM Bruce Ashfield via <a href=3D"http://lists.yoctoproject.org">li=
sts.yoctoproject.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@l=
ists.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:sma=
ll"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Mar 2, 2026 at 9:52=E2=80=AFPM Yiding Liu (Fujitsu)=
 &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" target=3D"_blank">liuyd.fnst=
@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div>




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
 class=3D"gmail_default" style=3D"font-size:small">Here&#39;s what I ended =
up doing in my work to update for just &quot;runc&quot; execution:<br><br><=
/div></div><div class=3D"gmail_default" style=3D"font-size:small">&gt; mkdi=
r t; cd t</div>&gt; tar xvf ../container-base-latest-oci.tar<br>./<br>./blo=
bs/<br>./blobs/sha256/<br>./blobs/sha256/9c865925ea89ca977d07df924f6dcb46f0=
e8e605aaac9f326fdbdb1d6025179a<br>./blobs/sha256/abcca458983fe432ab53fed222=
d30fb40ba5ffebd966a31312aa57672cc22365<br>./blobs/sha256/26a875ac118866f5f5=
d9d0e81504c2d013e7dd59dcfb4f556656608a3b78e64c<br>./blobs/sha256/97957e8c0e=
5ae4f1f05097c17d89348a3e3d4133b58b469799752806943bce91<br>./blobs/sha256/7a=
b75280a05b336e98e4d8100e15e562fefaed17bf91957b408ad52f8ee2523c<br>./blobs/s=
ha256/561858046f0d0bec4c5e9441f7c8fe712a787149cab37a62da0cf2027187cdda<br>.=
/blobs/sha256/55e338157da42fa767d8f133ebf9d1324e1ed3ebf34f10aa9d630048c3950=
0cb<br>./blobs/sha256/788385c41c0ff5f824b392c4719d820e267ae86e174cb4a76ce4c=
9c89380292d<br>./blobs/sha256/9e60bcc8bff0c2b33a8063612d23d6bd0ba721f63a502=
13c295840c9eccc57a3<br>./blobs/sha256/60bac006254f0dc3e49ebbb007e0144bb9522=
9c215cf3d4c8c64dc10555c1fc4<br>./blobs/sha256/61813b4d501970740bedb007fcd41=
e34117fdaea8761ae0fd3230effcfc5fd95<br>./blobs/sha256/e503c33223590248dc2e1=
5806120a04fbd75dcdbdaf597807f10d25324bb8f77<br>./blobs/sha256/0c62a8d0deedf=
e296fc5180e512d296618d615146face55342707f3e49359937<br>./blobs/sha256/b3dcd=
199b033d226d32289cfeadc894ba94af762dc48dfe07bda97e6c257bf3d<br>./blobs/sha2=
56/1b3615a1e71b8ef260a22c8300eb2e40122ac244a15a01d3f53699ae4fa3c916<br>./bl=
obs/sha256/aff80661b33e7fa0e4778f5d01179f082860c8c7f0dc16b49158668297b8769c=
<br>./blobs/sha256/4234f83392f7dfb358ef6ff4de282548338d5fbe724c150ebb41065f=
d32685c6<br>./index.json<br>./oci-layout<br>&gt; cd ..<br><div class=3D"gma=
il_default" style=3D"font-size:small"><span class=3D"gmail_default">&gt;</s=
pan>=C2=A0oci-image-tool create --ref name=3Dlatest t container-base-oci-bu=
ndle</div>&gt; cd container-base-oci-bundle<br>&gt; cp config.json config.i=
mage.json<br>&gt; rm -f config.json<br>&gt; XDG_RUNTIME_DIR=3D/tmp runc spe=
c<br>&gt; jq -s &#39;<br>=C2=A0 =C2=A0 .[0] as $img | .[1] as $base |<br>=
=C2=A0 =C2=A0 $base<br>=C2=A0 =C2=A0 | .root.path =3D ($img.root.path // &q=
uot;rootfs&quot;)<br>=C2=A0 =C2=A0 | .process.args =3D ($img.process.args /=
/ $base.process.args)<br>=C2=A0 =C2=A0 | .process.cwd =3D ($img.process.cwd=
 // $base.process.cwd)<br>=C2=A0 =C2=A0 | .process.user =3D ($img.process.u=
ser // $base.process.user)<br>=C2=A0 =C2=A0 | .process.env =3D (($base.proc=
ess.env // []) + ($img.process.env // []) | unique)<br>=C2=A0 &#39; config.=
image.json config.json &gt; config.merged.json &amp;&amp; mv config.merged.=
json config.json<br>&gt; cd ..<br>&gt; sudo runc run -b container-base-oci-=
bundle ctr-build<br>/ # ls<br>bin =C2=A0 =C2=A0boot =C2=A0 dev =C2=A0 =C2=
=A0etc =C2=A0 =C2=A0home =C2=A0 lib =C2=A0 =C2=A0media =C2=A0mnt =C2=A0 =C2=
=A0proc =C2=A0 root =C2=A0 run =C2=A0 =C2=A0sbin =C2=A0 sys =C2=A0 =C2=A0tm=
p =C2=A0 =C2=A0usr =C2=A0 =C2=A0var<br><div><br><div class=3D"gmail_default=
" style=3D"font-size:small">------------------------</div><br><div class=3D=
"gmail_default" style=3D"font-size:small">Fundamentally, we need the runc s=
pec, not what the outdated oci-image-tools create.<br><br>So rather than go=
 directly to the more complex tools, I&#39;d update the class to indicate s=
teps</div><div class=3D"gmail_default" style=3D"font-size:small">similar to=
 those.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><div =
style=3D"font-size:small"><br>Bruce<br>=C2=A0</div></div><blockquote class=
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
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9614): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9614" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9614</a><br>
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

--0000000000009d4150064c170cd6--


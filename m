Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB1CCD80D2
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 13:37:19 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web10.91698.1696945038464863737
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Oct 2023 06:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D69T1+i/;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-79faf4210b2so214375939f.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Oct 2023 06:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696945037; x=1697549837; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N3tzPcuh8nzu9J6Ncff/Zsxl/2xmlvrzecZBORbjeUY=;
        b=D69T1+i/StVafQZRFv/C5S8z2KhcItaqfC0FXiao8AFU3A6eKE9YIE5KlRXdYYR9wg
         7voJ/ZNCJ3GqwS/8F49rrlWtxrdZvUI5HeDtZBSL8BRtPo/8EMPA+d0cXo+1LvrmYE+S
         FWdd6E9EUO5erGm12mMXucKf3jW+uKPuyI1kw8mjPi70kfpWapgraGitZyL0/E/1S1i7
         M/b5UyaB6fe5y5vP2Pt/tSFYyDCl2i57Mvwjq5HNW2DsU7CGQPa1NkgOq/djrbg65AvA
         u7GckuV6Pk2B+yJwusmUUOSOc6nEt/64z+GBvHaYDy/VLbu6oa5ApLh89HU2wGIGxRTC
         G1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696945037; x=1697549837;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N3tzPcuh8nzu9J6Ncff/Zsxl/2xmlvrzecZBORbjeUY=;
        b=IA74yZdqI9Cw9RVcJBZuXZUNRyY6YSYfcKDQLthsykUIwk4kNDC65m8dF4iOQNMuKn
         xxSFku8uM0gMq0VMT0g4uXZud8xr0tPsF7oqmdGUEh2n2K7nmVEkxeRAyggC3P+/gV+J
         CicxV/hU5LuO8aFeO2oQ7sJvZRQ0x9V9pCTLCNT13AnWKcr/Excb3yD0uAX6byqUsZee
         WrIWNX/sAWC83vaGBP29A2bWFczNNd3iHUsjphEHUJmeK4sGw3bjndGeGF5DmZfAOnSc
         EuHSVu6gxMWaqn4Hl+wDzD7ri4ny0qyGMMuzuhgdPtCFgd6ARuavrguRHjba8V/Bqk9k
         SlQw==
X-Gm-Message-State: AOJu0YxcMVCKdWxA5MGa7TNqGFPQQy8VB/+RuqWcBSesAOOygqp8V1u8
	YXNrXldSj3kJ6hFWaX9AbkS4cCKTMhKdTY5+pORkO0ks6nQ=
X-Google-Smtp-Source: AGHT+IHpAnmlKpTHC/OFepL6nNRy/bn7okMOc8HwQYOI3BsJfqpbORgkPy3bwuwY09kfj1YMDWl7FxmyVBggU5Dnc/A=
X-Received: by 2002:a6b:919:0:b0:790:6629:b222 with SMTP id
 t25-20020a6b0919000000b007906629b222mr19812374ioi.5.1696945037552; Tue, 10
 Oct 2023 06:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAAfyv36CATBWC1vL6Bucq-JsJW4djFK50-kRHX6MxwizV9m2+g@mail.gmail.com>
In-Reply-To: <CAAfyv36CATBWC1vL6Bucq-JsJW4djFK50-kRHX6MxwizV9m2+g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Oct 2023 09:37:06 -0400
Message-ID: <CADkTA4NfPeSYpr7e+3ysgkidE3uN991GuxozOCwy-ANW-mN4Gg@mail.gmail.com>
Subject: Re: [meta-virtualization] backporting netavark from master to kirkstone
To: Marek Belisko <marek.belisko@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000002ab07206075cce2c"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Oct 2023 13:37:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8345

--0000000000002ab07206075cce2c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 9:17=E2=80=AFAM Marek Belisko <marek.belisko@gmail.=
com>
wrote:

> Hi,
>
> I'm trying to backport netavark recipe 1.8.0 to kirkstone (where is 1.1.0
> present) but facing some issues. I've used cargo bitbake to generate reci=
pe
> but when run build it fails with:
> | DEBUG: Executing shell function do_compile
> | NOTE: cargo =3D
> /data/projects/test/project/build/tmp/work/cortexa53-crypto-poky-linux/ne=
tavark/1.8.0-r0/recipe-sysroot-native/usr/bin/cargo
> | NOTE: rustc =3D
> | NOTE: cargo build -v --target aarch64-poky-linux --release
> --manifest-path=3D/data/projects/test/project/build/tmp/work/cortexa53-cr=
ypto-poky-linux/netavark/1.8.0-r0/git//Cargo.toml
> | error: failed to get `anyhow` as a dependency of package `netavark
> v1.8.0
> (/data/projects/test/project/build/tmp/work/cortexa53-crypto-poky-linux/n=
etavark/1.8.0-r0/git)`
> |
> | Caused by:
> |   failed to load source for dependency `anyhow`
> |
> | Caused by:
> |   Unable to update registry `crates-io`
> |
> | Caused by:
> |   failed to update replaced source registry `crates-io`
> |
> | Caused by:
> |   failed to parse manifest at
> `/data/projects/test/project/build/tmp/work/cortexa53-crypto-poky-linux/n=
etavark/1.8.0-r0/cargo_home/bitbake/regex-1.9.5/Cargo.toml`
> |
> | Caused by:
> |   namespaced features with the `dep:` prefix are only allowed on the
> nightly channel and requires the `-Z namespaced-features` flag on the
> command-line
> | WARNING: exit code 101 from a shell command.
>
>
> Does that mean I would also need to backport new cargo or so to compile
> it? Is is even possible please?
>

You'd probably get a better answer by finding the cargo-bitbake maintainers
and seeing if they've run into a similar situation or have any advice.

We definitely use the tool to generate the crates for meta-virt, but that
unfortunately doesn't give much insight into the rust or cargo inner
workings. It is similar with golang .. it is extensively used in meta-virt
for recipes, etc, but that doesn't mean there's a lot of expert advice on
internals of golang.

Perhaps the submitter of the recipe will have advice (maybe they used it on
the older release as well), but otherwise, I do suggest trying oe-core
and/or the cargo-bitbake maintainers.

Bruce



>
> Thanks and BR,
>
> marek
>
> --
> as simple and primitive as possible
> -------------------------------------------------
> Marek Belisko - OPEN-NANDRA
> Freelance Developer
>
> Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
> Tel: +421 915 052 184
> skype: marekwhite
> twitter: #opennandra
> web: http://open-nandra.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8344):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8344
> Mute This Topic: https://lists.yoctoproject.org/mt/101874620/1050810
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

--0000000000002ab07206075cce2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Oct 10, 2023 at 9:17=E2=80=AFAM Marek Belis=
ko &lt;<a href=3D"mailto:marek.belisko@gmail.com">marek.belisko@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr">Hi,<div><br></div><div>I&#39;m trying to backport netavark r=
ecipe 1.8.0 to kirkstone (where is 1.1.0 present) but facing some issues. I=
&#39;ve used cargo bitbake to generate recipe but when run build it fails w=
ith:<br>| DEBUG: Executing shell function do_compile<br>| NOTE: cargo =3D /=
data/projects/test/project/build/tmp/work/cortexa53-crypto-poky-linux/netav=
ark/1.8.0-r0/recipe-sysroot-native/usr/bin/cargo<br>| NOTE: rustc =3D<br>| =
NOTE: cargo build -v --target aarch64-poky-linux --release --manifest-path=
=3D/data/projects/test/project/build/tmp/work/cortexa53-crypto-poky-linux/n=
etavark/1.8.0-r0/git//Cargo.toml<br>| error: failed to get `anyhow` as a de=
pendency of package `netavark v1.8.0 (/data/projects/test/project/build/tmp=
/work/cortexa53-crypto-poky-linux/netavark/1.8.0-r0/git)`<br>| <br>| Caused=
 by:<br>| =C2=A0 failed to load source for dependency `anyhow`<br>| <br>| C=
aused by:<br>| =C2=A0 Unable to update registry `crates-io`<br>| <br>| Caus=
ed by:<br>| =C2=A0 failed to update replaced source registry `crates-io`<br=
>| <br>| Caused by:<br>| =C2=A0 failed to parse manifest at `/data/projects=
/test/project/build/tmp/work/cortexa53-crypto-poky-linux/netavark/1.8.0-r0/=
cargo_home/bitbake/regex-1.9.5/Cargo.toml`<br>| <br>| Caused by:<br>| =C2=
=A0 namespaced features with the `dep:` prefix are only allowed on the nigh=
tly channel and requires the `-Z namespaced-features` flag on the command-l=
ine<br>| WARNING: exit code 101 from a shell command.<br><div><br></div><di=
v><br></div><div>Does that mean I would also need to backport new cargo or =
so to compile it? Is is even possible please?</div></div></div></blockquote=
><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small"=
>You&#39;d probably get a better answer by finding the cargo-bitbake mainta=
iners and seeing if they&#39;ve run into a similar situation or have any ad=
vice.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">We definitely use t=
he tool to generate the crates for meta-virt, but that unfortunately doesn&=
#39;t give much insight into the rust or cargo inner workings. It is simila=
r with golang .. it is extensively used in meta-virt for recipes, etc, but =
that doesn&#39;t mean there&#39;s a lot of expert advice on internals of go=
lang.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">Perhaps the submitt=
er of the recipe will have advice (maybe they used it on the older release =
as well), but otherwise, I do suggest trying oe-core and/or the cargo-bitba=
ke maintainers.</div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</di=
v><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr"><div><div><br></div><div>Thanks and BR,</div><div><br>=
</div><div>marek</div><div><br></div><span class=3D"gmail_signature_prefix"=
>-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">as simple and pri=
mitive as possible<br>-------------------------------------------------<br>=
Marek Belisko - OPEN-NANDRA<br>Freelance Developer<br><br>Ruska Nova Ves 21=
9 | Presov, 08005 Slovak Republic<br>Tel: +421 915 052 184<br>skype: marekw=
hite<br>twitter: #opennandra<br>web: <a href=3D"http://open-nandra.com" tar=
get=3D"_blank">http://open-nandra.com</a></div></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8344): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8344" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8344</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/101874620/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/101874620/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--0000000000002ab07206075cce2c--


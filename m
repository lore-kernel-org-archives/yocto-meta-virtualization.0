Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web11.17577.1593595648919606568
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 02:27:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZWzm7SMM;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id lx13so5128188ejb.4
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Jul 2020 02:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=resent-from:resent-date:resent-message-id:resent-to:mime-version
         :date:references:in-reply-to:message-id:subject:from:to:cc;
        bh=RmTjEFqXvj3wuvATSeIqbuTCdTIgtmuL76hxzH9ukHU=;
        b=ZWzm7SMMPAph7tgeihC1xxOh6Mjl0IePistP1wZ/oUmG2E9AJUMuMlwCu2HG+6lzMl
         Fdpb6uftoUups6cnjXJ0vHEqW2ezrKt8LEB2ZhNWJkJQHG+/35OGeoX8EspJra6MkBGA
         jnJl0MloDznkz573BHoxR6/7QUg4XXxvftq31xfd8NozObA5sOCJhHTLn51j51efvlLE
         VqaV0qth5YsxSz8xkSKpVnGSPAlOOw8ENAQWDfFVVVLo6sbbOJnDKwhgGxgRNCrryA8f
         9xR91B2g4Y4zoAc8RoZMN48r8CwT0lBk/mOSwMU/7XAFDMx/uAtLJA7iL+KwWsUPKsMt
         FtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:resent-from:resent-date:resent-message-id
         :resent-to:mime-version:date:references:in-reply-to:message-id
         :subject:from:to:cc;
        bh=RmTjEFqXvj3wuvATSeIqbuTCdTIgtmuL76hxzH9ukHU=;
        b=a4X4stKG1fAv+BM4TU+ciqhYXQnLC9bTf8Y2mHuFsatw1P4xNXn71YFvRTy5VMama7
         XcahYtnz/+Wj74uzKmL2HfjrHi+NhdmlsfKlQlAGNldOPI6nR2rbEABrJvENIOqNfrhT
         R39XvdkA+A96tPdiVlkmr+STHL45c0ShIcSU5iUoRCSxk1dR1w7U4VcMvLxxL9vuZv3y
         7De6byNOppbjd2xEsQILujMOahNeLaOkp5WSQnjlBCi6/4WwVT2Dmx733SSo9af+61Qb
         WFpCURs4hxVNsU3Sa/HawmfKRFBCTzzTXseL8INksVSm8s79oGFe/1ZYTYtsPZoyBlC2
         JPwA==
X-Gm-Message-State: AOAM530753Fh/19NFk1gbgBhh504xMAxu/e3/QKQU2U31gnJ0dGbZHIy
	Gb9BeyTjL9CaHBzPkh8TFOaogiyO
X-Google-Smtp-Source: ABdhPJxMpE1QFmZSVdH5brKNjCy1MGbb/XtZgkzRUwjv1qv2Yl+GADL1AFgi/VwB535uv/2bw5KlWw==
X-Received: by 2002:a17:907:2094:: with SMTP id pv20mr17424938ejb.512.1593595647239;
        Wed, 01 Jul 2020 02:27:27 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id o14sm4217762eja.121.2020.07.01.02.27.27
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 02:27:27 -0700 (PDT)
Resent-From: Martin Jansa <Martin.Jansa@gmail.com>
Resent-Date: Wed, 1 Jul 2020 11:27:26 +0200
Resent-Message-ID: <20200701092726.eirp3nwhqxgyn6oz@jama>
Resent-To: meta-virtualization@lists.yoctoproject.org
MIME-Version: 1.0
Date: Tue, 30 Jun 2020 14:44:03 +0200
References: <20200626161705.32600-1-liu.ming50@gmail.com>
	<CA+chaQei6WPUNkN0OOkk+MxEsWmnPSkTBAnrUq9KLbXmx87y1g@mail.gmail.com>
	<161C28A10F0C0173.4849@lists.yoctoproject.org>
	<CADkTA4NCh2F1=-aX7zwOaZvEC1as-r7=s=+C3HoWNr7MwyGh=A@mail.gmail.com>
	<CA+chaQemwGtgKjGqbdnaeEVG7st0QoM3o1JwppiVFY=2Hx6D4A@mail.gmail.com>
	<161C29D35303F5F1.8018@lists.yoctoproject.org>
	<CADkTA4OGYEC2=wuMfY4adbn2V4oyH02oac_=TqCURZUuY=pkTA@mail.gmail.com>
	<CA+chaQejB_++EQN4SX_R1PfXGOb=HSpQy9EtOPQe4SxVDXDSUA@mail.gmail.com>
	<CADkTA4OfHD+tV1d920bkY0pp=+ArRVDUmBhAejySHOmmb7Zs9A@mail.gmail.com>
	<619B9396-3C30-422E-ADF6-06A05B7EB2F9@arm.com>
	<CADkTA4PDkvqZcktkx1+RY--zV5JWK1WmspuJdWQ_js+jjuOVRA@mail.gmail.com>
	<CADkTA4M7kUqBGW52YWSK4+gQoH7n5P1Rdwd3RRENJXv_2YiVtA@mail.gmail.com>
In-Reply-To: <CADkTA4M7kUqBGW52YWSK4+gQoH7n5P1Rdwd3RRENJXv_2YiVtA@mail.gmail.com>
Message-ID: <CA+chaQdAqpF=uOCdnXVqUghMRtNj9NtweLf+NwPZG5vaq+PfLw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker-moby: update to v19.03.12
From: "Martin Jansa" <Martin.Jansa@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>, Ming Liu <liu.ming50@gmail.com>, 
	Stefan Agner <stefan.agner@toradex.com>, Ming Liu <ming.liu@toradex.com>
X-TUID: CqdtfAtXS4XP
Content-Type: multipart/alternative; boundary="000000000000bf7b0505a94c87d7"

--000000000000bf7b0505a94c87d7
Content-Type: text/plain; charset="UTF-8"

Hi,

thanks for working on this. I'm still don't know anything about golang in
OE, but from earlier post from Ross:
https://lists.openembedded.org/g/openembedded-core/message/139437?p=,,,20,0,0,0::Created,,go,20,2,40,74838027
it sounds like these recipes shouldn't be using go-native-binary, but
go-cross-${TUNE_PKGARCH} which isn't prebuilt and will probably point to
the right header files in OE sysroot.

Regards,

On Tue, Jun 30, 2020 at 2:37 PM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Mon, Jun 29, 2020 at 8:30 AM Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
> >
> > On Mon, Jun 29, 2020 at 4:38 AM Ross Burton <Ross.Burton@arm.com> wrote:
> > >
> > > On 29/06/2020, 03:48, "Bruce Ashfield" <bruce.ashfield@gmail.com>
> wrote:
> > > >     Indeed that was the thing I was missing.
> > > >
> > > >     I've reproduced the error, and it is where I thought it was.
> I'll poke
> > > >     away at a fix while I listen to ELC during the day on Monday.
> > >
> > > Thanks Bruce.  Did I break anything, or did I just expose historical
> breakage?
> >
> > As far as I can tell, a bit of both :D
> >
> > It shouldn't have broken it, but yet it did, without mass breakage
> > everywhere else .. which means there's something funky with the
> > structure of the recipes in meta-virt.
>
> I wasn't able to put my finger on exactly what is the problem, but it
> looks like the go-native-binary is somehow not able to find the
> sysroot components and/or is making a different tune decision than the
> one we build.
>
> For example, I can find no evidence of the gnu/stubs-soft.h it is
> looking for, all of the CC defines and tunes we have for the builds
> are hard-fp, but yet it wanders off looking for that include. If I
> specify hard-fp, it claims that the model/soc has no fpu .. and insert
> a lot of different combinations after those attempts where you play
> whack a mole with various other missing headers files.
>
> I did find a thread on the mender support forum, that has the exact
> same problem, with the same diagnosis:
>
>
> https://hub.mender.io/t/go-error-occurred-by-attempting-to-build-mender-master-branch-via-cross-compiling/1849/15
>
> Does anyone have thoughts on this ?
>
> Could we just blacklist 32 bit ARM and these recipes (docker and friends) ?
>
> I will continue working on this, but I also won't hold the pending
> upgrades much longer if I don't get a better understanding of why it
> is going wrong today. (I was poking at the docker build itself since
> it happily clobbers some of our settings and that could be why some of
> my recipe changes aren't making it through).
>
> Cheers,
>
> Bruce
>
> >
> > Bruce
> >
> > >
> > > Cheers,
> > > Ross
> > >
> > > IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy the
> information in any medium. Thank you.
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--000000000000bf7b0505a94c87d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>thanks for working on this. I&#39;m=
 still don&#39;t know anything about golang in OE, but from earlier post fr=
om Ross:</div><div><a href=3D"https://lists.openembedded.org/g/openembedded=
-core/message/139437?p=3D,,,20,0,0,0::Created,,go,20,2,40,74838027">https:/=
/lists.openembedded.org/g/openembedded-core/message/139437?p=3D,,,20,0,0,0:=
:Created,,go,20,2,40,74838027</a><br></div><div>it sounds like these recipe=
s shouldn&#39;t be using go-native-binary, but go-cross-${TUNE_PKGARCH} whi=
ch isn&#39;t prebuilt and will probably point to the right header files in =
OE sysroot.</div><div><br></div><div>Regards,</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 30, 2020 at =
2:37 PM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruc=
e.ashfield@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Mon, Jun 29, 2020 at 8:30 AM Bruce Ashfield &lt;<a h=
ref=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gm=
ail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, Jun 29, 2020 at 4:38 AM Ross Burton &lt;<a href=3D"mailto:Ross=
.Burton@arm.com" target=3D"_blank">Ross.Burton@arm.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On 29/06/2020, 03:48, &quot;Bruce Ashfield&quot; &lt;<a href=3D"m=
ailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com<=
/a>&gt; wrote:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Indeed that was the thing I was missing.<=
br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0I&#39;ve reproduced the error, and it is =
where I thought it was. I&#39;ll poke<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0away at a fix while I listen to ELC durin=
g the day on Monday.<br>
&gt; &gt;<br>
&gt; &gt; Thanks Bruce.=C2=A0 Did I break anything, or did I just expose hi=
storical breakage?<br>
&gt;<br>
&gt; As far as I can tell, a bit of both :D<br>
&gt;<br>
&gt; It shouldn&#39;t have broken it, but yet it did, without mass breakage=
<br>
&gt; everywhere else .. which means there&#39;s something funky with the<br=
>
&gt; structure of the recipes in meta-virt.<br>
<br>
I wasn&#39;t able to put my finger on exactly what is the problem, but it<b=
r>
looks like the go-native-binary is somehow not able to find the<br>
sysroot components and/or is making a different tune decision than the<br>
one we build.<br>
<br>
For example, I can find no evidence of the gnu/stubs-soft.h it is<br>
looking for, all of the CC defines and tunes we have for the builds<br>
are hard-fp, but yet it wanders off looking for that include. If I<br>
specify hard-fp, it claims that the model/soc has no fpu .. and insert<br>
a lot of different combinations after those attempts where you play<br>
whack a mole with various other missing headers files.<br>
<br>
I did find a thread on the mender support forum, that has the exact<br>
same problem, with the same diagnosis:<br>
<br>
<a href=3D"https://hub.mender.io/t/go-error-occurred-by-attempting-to-build=
-mender-master-branch-via-cross-compiling/1849/15" rel=3D"noreferrer" targe=
t=3D"_blank">https://hub.mender.io/t/go-error-occurred-by-attempting-to-bui=
ld-mender-master-branch-via-cross-compiling/1849/15</a><br>
<br>
Does anyone have thoughts on this ?<br>
<br>
Could we just blacklist 32 bit ARM and these recipes (docker and friends) ?=
<br>
<br>
I will continue working on this, but I also won&#39;t hold the pending<br>
upgrades much longer if I don&#39;t get a better understanding of why it<br=
>
is going wrong today. (I was poking at the docker build itself since<br>
it happily clobbers some of our settings and that could be why some of<br>
my recipe changes aren&#39;t making it through).<br>
<br>
Cheers,<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Cheers,<br>
&gt; &gt; Ross<br>
&gt; &gt;<br>
&gt; &gt; IMPORTANT NOTICE: The contents of this email and any attachments =
are confidential and may also be privileged. If you are not the intended re=
cipient, please notify the sender immediately and do not disclose the conte=
nts to any other person, use it for any purpose, or store or copy the infor=
mation in any medium. Thank you.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await<=
br>
&gt; thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--000000000000bf7b0505a94c87d7--

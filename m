Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.12232.1585145507539354016
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 Mar 2020 07:11:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sixsq-com.20150623.gappssmtp.com header.s=20150623 header.b=LgFXYh23;
 spf=pass (domain: sixsq.com, ip: 209.85.219.65, mailfrom: cristovao.cordeiro@sixsq.com)
Received: by mail-qv1-f65.google.com with SMTP id c28so1072540qvb.10
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 25 Mar 2020 07:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sixsq-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5H+GJ2ClDrGCTIuwAIdKOREENXGc1ErQbFTOEgRuQFw=;
        b=LgFXYh23H6nPgfsDr2tQVP/uZDeNDV6TJulwU6PjJKdQe6jjn24Bj8Z9kfgabj6nuk
         bHCYUvsMsQt76pNx6bE1ljH9g54VlJ7lngPVa6UENfY0gXLpL9MBbq/ZiQzNBiDzyf/p
         xECOqz4oXCJudbMtN6r9bPD48/2g77Rf0Zy4xRzd4veqH3QPO2mwJA9yvnxS+LDB84WO
         aeIRum+GyzA+FQ8pZ2JSnw66kIvoW9Vc5KwdXC4x1Hyxef1jUmgmcUphO8ZG+FXjUbQu
         d984bbyWVOEW+RdRr5qHfsBRqZaZTVh4QV7k0ASj6oq6Gt/CXtCUTI4TtshIOaxUVP9B
         sGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5H+GJ2ClDrGCTIuwAIdKOREENXGc1ErQbFTOEgRuQFw=;
        b=cCCQMXfxxzRVwHdDybgDMIigkt/fwiBKfalf4cVVr7w2ZABmV8Xqb3Onxx874o2FDK
         S5CqxQNTeH6C5Qhhgf/xk9IwA9uwR0oCCSsf9uZ3i5CoMSXT1mpzfScAIIHKdfQlwdh1
         eus6VRBKCJTOjY3j8YwRvMJTnoLVYJh7o+tK8iZ+lxM6TXbf5vY/rFj36cvHNtbt56w+
         Abm27WcPzlBN43ug2bupmp7hcqfGlBGV5mklo5CsHXxu+0DJNjxp9PCEwdYBnPXFHzVs
         Ue/nEbzlYohEyB6Zw07qT2gdEp1d/5H5cgIpfcyE1/vXQbKMwz2d7sFgTvYa+L+0EDvo
         gn6g==
X-Gm-Message-State: ANhLgQ3+wsG6aTHAirh3PXNVSFXgqFWReXhUE7wKcbPneYaTIW8VQnSa
	yLVRrdloaixIRG1Eov/848z12Reda0rEeZzldU9zow==
X-Google-Smtp-Source: ADFU+vvslXiItE1GToJ1wrZxqirZMh2Tfek8ToovW0SjvgzkCzC8NbOv/WOE46NlU5wHgvHGLQqpXyV6yRayq3QItoM=
X-Received: by 2002:ad4:49cc:: with SMTP id j12mr3248870qvy.94.1585145506726;
 Wed, 25 Mar 2020 07:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAE5JARmTU0siEsyQxW601h=A2e=aY64ZqnYCsN=OD0kupeeR1Q@mail.gmail.com>
 <CAE5JARkEA_NQnOL3ukKg4RA_AofQTA7JZ3MZhK7gb1F0cGEdeA@mail.gmail.com> <CADkTA4PiUe-jotSZqq2_pE+WzDE_Ak3RCrsH7Oc9Y8cEVw7=6A@mail.gmail.com>
In-Reply-To: <CADkTA4PiUe-jotSZqq2_pE+WzDE_Ak3RCrsH7Oc9Y8cEVw7=6A@mail.gmail.com>
From: =?UTF-8?B?Q3Jpc3TDs3bDo28gQ29yZGVpcm8=?= <cristovao.cordeiro@sixsq.com>
Date: Wed, 25 Mar 2020 15:11:20 +0100
Message-ID: <CAE5JAR=g6o71ffdKLEnjm0iEGo7tccD3uJtTs3AJWWxm8gVnJQ@mail.gmail.com>
Subject: Re: [meta-virtualization] consistency clarification for INITSCRIPT_NAME in docker-ce recipe
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000d8993205a1ae72af"

--000000000000d8993205a1ae72af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

yes dropping sysvinit completely would help.
Just because DISTRO_FEATURES_BACKFILL_CONSIDERED isn't really mandatory
according to the docs, so if you have both, this inconsistency will show u=
p.

I don't need both, and thus I'm now using the
DISTRO_FEATURES_BACKFILL_CONSIDERED,
but figured this was worth mentioning, even if it is a very niche corner
case.
Thanks

Best regards,

*Crist=C3=B3v=C3=A3o Cordeiro*
R&D Project Manager
*LinkedIn <https://www.linkedin.com/in/cristovaocordeiro/>*

*SixSq*
*267 Route de Meyrin*
*1217 Meyrin*
*Geneva*
*Switzerland*


On Wed, 25 Mar 2020 at 14:09, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Wed, Mar 25, 2020 at 7:41 AM Crist=C3=B3v=C3=A3o Cordeiro
> <cristovao.cordeiro@sixsq.com> wrote:
> >
> > Dear Bruce,
> >
> > I've been trying to build docker-ce with the meta-rapsberrrypi layer.
> I've appended "systemd" distro to my build. When doing `bitbake docker-c=
e`
> I get an error about
> >
> >
> > update-rc.d:
> /home/ubuntu/os-raspberrypi/tmp/work/raspberrypi3-poky-linux-gnueabi/cor=
e-image-base/1.0-r0/rootfs/etc/init.d/docker.init:
> file does not
> >
> >  exist
> >
> >
> > After digging for a bit, I've traced this to the following lines:
> >
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/reci=
pes-containers/docker/docker-ce_git.bb?h=3Dzeus#n105
> , where it states that docker.init shall not be installed if systemd in
> DISTRO. That's ok.
> >
> > But then, in
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/reci=
pes-containers/docker/docker.inc?h=3Dzeus#n56
> , INITSCRIPT_NAME is set to docker.init cause sysvinit is also in DISTRO=
.
> >
> > Isn't this an inconsistency? Those two conditions should be similar IM=
O.
> The only way to bypass this is to add DISTRO_FEATURES_BACKFILL_CONSIDERE=
D =3D
> "sysvinit" to the build.
> >
>
> Last I checked, you need to have DISTRO_FEATURES_BACKFILL_CONSIDERED =3D
> "sysvinit" to enable systemd. It still is in the example .conf files
> that I see in master.  But it is possible, I missed a change that it
> is no longer required.
>
> So what you've ended up is with both init systems active at the same
> time, and yes, I'm sure that it causing trouble. The check in question
> has been there for some time, without issue, so there's definitely
> something different in your config than most of the current users
>
> FWIW: I don't know of many (any) sysvinit users and docker, so I'm
> considering dropping the support completely.
>
> Bruce
>
>
> > Best regards,
> >
> > Cristovao
> >=20
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--000000000000d8993205a1ae72af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>yes dropping sysvinit completely wo=
uld help.</div><div>Just because DISTRO_FEATURES_BACKFILL_CONSIDERED isn&#3=
9;t really mandatory according to the docs, so if you have both, this incon=
sistency will show up.</div><div><br></div><div>I don&#39;t need both, and =
thus I&#39;m now using the=C2=A0<span style=3D"color:rgb(51,51,51)">DISTRO_=
FEATURES_BACKFILL_CONSIDERED, but figured this was worth mentioning, even i=
f it is a very niche corner case.</span></div><div><font color=3D"#333333">=
Thanks</font></div><div><font color=3D"#333333"><br></font><span style=3D"c=
olor:rgb(51,51,51)"></span><div><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><=
div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=
=
=3D"ltr">Best regards,<div><i style=3D"font-size:12.8px"><br></i></div><di=
v><div style=3D"font-size:12.8px"><b style=3D"font-size:12.8px"><font face=
=3D"arial black, sans-serif">Crist=C3=B3v=C3=A3o Cordeiro</font></b></div>=
<div><div style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">R&amp=
;D Project Manager</span></div><div><i><a href=3D"https://www.linkedin.com/=
in/cristovaocordeiro/" target=3D"_blank">LinkedIn</a></i></div><div><i><br>=
</i></div></div></div><div><b><font size=3D"2"><i>SixSq</i></font></b></div=
><div><div style=3D"color:rgb(0,0,0);font-family:Helvetica;font-size:12px">=
<div><i>267 Route de Meyrin</i></div><div><i>1217 Meyrin</i></div></div><di=
v style=3D"color:rgb(0,0,0);font-family:Helvetica;font-size:12px"><i>Geneva=
</i></div><div style=3D"color:rgb(0,0,0);font-family:Helvetica;font-size:12=
px"><i>Switzerland</i></div></div></div></div></div></div></div></div></div=
></div></div></div><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, 25 Mar 2020 at 14:09, Bruce Ashfield=
 &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 Wed, Mar 25, 2020 at 7:41 AM Crist=C3=B3v=C3=A3o Cordeiro<br>
&lt;<a href=3D"mailto:cristovao.cordeiro@sixsq.com" target=3D"_blank">cris=
tovao.cordeiro@sixsq.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Dear Bruce,<br>
&gt;<br>
&gt; I&#39;ve been trying to build docker-ce with the meta-rapsberrrypi la=
yer. I&#39;ve appended &quot;systemd&quot; distro to my build. When doing `=
bitbake docker-ce` I get an error about<br>
&gt;<br>
&gt;<br>
&gt; update-rc.d: /home/ubuntu/os-raspberrypi/tmp/work/raspberrypi3-poky-l=
inux-gnueabi/core-image-base/1.0-r0/rootfs/etc/init.d/docker.init: file doe=
s not<br>
&gt;<br>
&gt;=C2=A0 exist<br>
&gt;<br>
&gt;<br>
&gt; After digging for a bit, I&#39;ve traced this to the following lines:=
<br>
&gt; <a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualiza=
tion/tree/recipes-containers/docker/docker-ce_git.bb?h=3Dzeus#n105" rel=3D"=
noreferrer" target=3D"_blank">https://git.yoctoproject.org/cgit/cgit.cgi/me=
ta-virtualization/tree/recipes-containers/docker/docker-ce_git.bb?h=3Dzeus#=
n105</a> , where it states that docker.init shall not be installed if syste=
md in DISTRO. That&#39;s ok.<br>
&gt;<br>
&gt; But then, in <a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/me=
ta-virtualization/tree/recipes-containers/docker/docker.inc?h=3Dzeus#n56" r=
el=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/cgit/cgit.=
cgi/meta-virtualization/tree/recipes-containers/docker/docker.inc?h=3Dzeus#=
n56</a> , INITSCRIPT_NAME is set to docker.init cause sysvinit is also in D=
ISTRO.<br>
&gt;<br>
&gt; Isn&#39;t this an inconsistency? Those two conditions should be simil=
ar IMO. The only way to bypass this is to add DISTRO_FEATURES_BACKFILL_CONS=
IDERED =3D &quot;sysvinit&quot; to the build.<br>
&gt;<br>
<br>
Last I checked, you need to have DISTRO_FEATURES_BACKFILL_CONSIDERED =3D<b=
r>
&quot;sysvinit&quot; to enable systemd. It still is in the example .conf f=
iles<br>
that I see in master.=C2=A0 But it is possible, I missed a change that it<=
br>
is no longer required.<br>
<br>
So what you&#39;ve ended up is with both init systems active at the same<b=
r>
time, and yes, I&#39;m sure that it causing trouble. The check in question=
<br>
has been there for some time, without issue, so there&#39;s definitely<br>
something different in your config than most of the current users<br>
<br>
FWIW: I don&#39;t know of many (any) sysvinit users and docker, so I&#39;m=
<br>
considering dropping the support completely.<br>
<br>
Bruce<br>
<br>
<br>
&gt; Best regards,<br>
&gt;<br>
&gt; Cristovao<br>
&gt; <br>
<br>
<br>
<br>
--<br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--000000000000d8993205a1ae72af--

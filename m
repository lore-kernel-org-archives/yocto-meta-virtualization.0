Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55BEAC4345F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 02:30:07 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.3592.1714530601132742002
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 19:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U23LPeE3;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6eced6fd98aso5706854b3a.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Apr 2024 19:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714530600; x=1715135400; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kdl8HT7F5tVt67e71N0o5ph51L6pZgRPrq007/CzlSY=;
        b=U23LPeE3EC75JgMW/MqSstD4XPPaLo1EXCWf1bN4LoTK5lRZmuHkOpWIOyqZnpwSuP
         JIt/2mpXpcYONoEZnnPzgIXcuHIO6b8ztjip6sm/ndJxVNM/246+Wkj1cjMAAq5BvwP/
         fSqfl1r5seuSg/roKApXH+D93WguaVWQPQTPNcCcg9bwtz61T/eTXNE/XvKCTGrXmdK8
         WSKErzaWDqYWyFdbuoVkF66+w04AyNO/6gMiOaTzdfyzKKDP277Q2puSCsHBAGMq8Y8K
         qYQNylzeno6QNcOc/PhHZDea4xftjls5h3u4Q4nvye+NGqAOtojekxP8u2P39RMLpMKu
         0TYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714530600; x=1715135400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kdl8HT7F5tVt67e71N0o5ph51L6pZgRPrq007/CzlSY=;
        b=AZTQn8IUzOJzCXdZKeTpYYSeMqqlLcrxlPZEwnlpH721FqRcSeCnHQwTlNz9zYgT/e
         u8uza8dHGOGYY9+vCMheju1bSS2aATBNHz2sODyFg+NO8pLEFzxOrhIgV7YOe6qZdXfc
         6JAPN9bctaOnMzr7x3dqQSGHl9Rf0sV4Rx4IxjeAV0e1YCuzm3ESKDqwWFXnP8Jzm8CZ
         EXHquqAYWtICE3bJr9eDh0r47YoViuthOKsBsXEIcd2uBtLdhyzll450EApXI86iFOd5
         8ZVvW/5/wdv+JeDsH9FW1EzaCvYeRR6aqc4k+lcYOAtwehORQ3ZcwabCU3Xe4xspEo8m
         FxPw==
X-Forwarded-Encrypted: i=1; AJvYcCVISYUPeoTbriecSGQA1bnH9ih33rL/R/90k5UAhqj1nr6lJgB30ug3Ss1Bl4Y2RYUcufXhP8SV+n3FNhemNqGdyluDfu5H8hQULn/5UUaHy8QU6ZVetKB/ecM=
X-Gm-Message-State: AOJu0YzQbq2t/CuiSaRzQKWZfnPL54EnVhzyG9m25Txgc4nbKyrWl06Z
	fbFweV4qwXA7/I/TYcqegptg+2LiHw0McrCkl+LA/l+SsxbySy92fzw95jqqak8Bsma1ViiWVxN
	LNVc4KM7B4ysjlnDK/79120fygms=
X-Google-Smtp-Source: AGHT+IE7pCOHXtpTh6O+VFMG6xrGiYtYrANUxqYbduZbI39KthDRyB9LIubdF3Gk1cay9/7tYvjUnm8UKW2JNNs8ywM=
X-Received: by 2002:a05:6a21:2706:b0:1ae:426a:b53b with SMTP id
 rm6-20020a056a21270600b001ae426ab53bmr1895866pzb.1.1714530600027; Tue, 30 Apr
 2024 19:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240416225615.165473-1-lukasz.czechowski@thaumatec.com>
 <ZiZ8UpRSfDbkzocJ@gmail.com> <CAFMvBt0fxFbmJwnXr1LSCyK2o+DK=tmBzfzQNQ8qiROaiXb-VQ@mail.gmail.com>
In-Reply-To: <CAFMvBt0fxFbmJwnXr1LSCyK2o+DK=tmBzfzQNQ8qiROaiXb-VQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 30 Apr 2024 22:29:47 -0400
Message-ID: <CADkTA4Pre5J9Zu-mj6_9jNP=4DMCuxch-YMe5E4Fh8JGUFNucQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] podman: fix location of user
 systemd service units
To: "Theodore A. Roth" <troth@openavr.org>
Cc: lukasz.czechowski@thaumatec.com, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000005f0e5606175b43f4"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 01 May 2024 02:30:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8708

--0000000000005f0e5606175b43f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 10:45=E2=80=AFAM Theodore A. Roth <troth@openavr.or=
g> wrote:

>
>
> On Mon, Apr 22, 2024 at 9:03=E2=80=AFAM Bruce Ashfield via lists.yoctopro=
ject.org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
>> merged to master and scarthgap.
>>
>> Bruce
>>
>> In message: [meta-virtualization][PATCH v2] podman: fix location of user
>> systemd service units
>> on 17/04/2024 lukasz.czechowski@thaumatec.com wrote:
>>
>> > From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
>> >
>> > The value of USERSYSTEMDDIR is currently set to
>> > ${systemd_unitdir}/user, which might not be present in user unit
>> > search path.
>> > Use dedicated bitbake variable ${systemd_user_unitdir} instead.
>> >
>> > Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
>> > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
>> > ---
>> >  recipes-containers/podman/podman_git.bb | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/recipes-containers/podman/podman_git.bb
>> b/recipes-containers/podman/podman_git.bb
>> > index 3eadd202..f69dec16 100644
>> > --- a/recipes-containers/podman/podman_git.bb
>> > +++ b/recipes-containers/podman/podman_git.bb
>> > @@ -62,7 +62,7 @@ do_configure[noexec] =3D "1"
>> >  EXTRA_OEMAKE =3D " \
>> >       PREFIX=3D${prefix} BINDIR=3D${bindir} LIBEXECDIR=3D${libexecdir}=
 \
>> >       ETCDIR=3D${sysconfdir} TMPFILESDIR=3D${nonarch_libdir}/tmpfiles.=
d \
>> > -     SYSTEMDDIR=3D${systemd_unitdir}/system
>> USERSYSTEMDDIR=3D${systemd_unitdir}/user \
>> > +     SYSTEMDDIR=3D${systemd_unitdir}/system
>> USERSYSTEMDDIR=3D${systemd_user_unitdir} \
>> >  "
>> >
>> >  # remove 'docker' from the packageconfig if you don't want podman to
>> > @@ -134,7 +134,7 @@ do_install_ptest () {
>> >  FILES:${PN} +=3D " \
>> >      ${systemd_unitdir}/system/* \
>> >      ${nonarch_libdir}/systemd/* \
>> > -    ${systemd_unitdir}/user/* \
>> > +    ${systemd_user_unitdir/* \
>>
>
> Just noticed that this is missing the closing brace. This typo is on
> master and scarthgap branches.
>
> Would you like me to send a patch?
>
>
Sure! I'm doing some other major package additions and updates right now,
so a patch is easier for me.

Bruce



> Ted Roth
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000005f0e5606175b43f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Apr 30, 2024 at 10:45=E2=80=AFAM Theodore A=
. Roth &lt;<a href=3D"mailto:troth@openavr.org">troth@openavr.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Apr 22, 2024 at 9:03=E2=80=AFAM Bruce=
 Ashfield via <a href=3D"http://lists.yoctoproject.org" target=3D"_blank">l=
ists.yoctoproject.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@=
lists.yoctoproject.org" target=3D"_blank">gmail.com@lists.yoctoproject.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">m=
erged to master and scarthgap.<br>
<br>
Bruce<br>
<br>
In message: [meta-virtualization][PATCH v2] podman: fix location of user sy=
stemd service units<br>
on 17/04/2024 <a href=3D"mailto:lukasz.czechowski@thaumatec.com" target=3D"=
_blank">lukasz.czechowski@thaumatec.com</a> wrote:<br>
<br>
&gt; From: Lukasz Czechowski &lt;<a href=3D"mailto:lukasz.czechowski@thauma=
tec.com" target=3D"_blank">lukasz.czechowski@thaumatec.com</a>&gt;<br>
&gt; <br>
&gt; The value of USERSYSTEMDDIR is currently set to<br>
&gt; ${systemd_unitdir}/user, which might not be present in user unit<br>
&gt; search path.<br>
&gt; Use dedicated bitbake variable ${systemd_user_unitdir} instead.<br>
&gt; <br>
&gt; Signed-off-by: Lukasz Czechowski &lt;<a href=3D"mailto:lukasz.czechows=
ki@thaumatec.com" target=3D"_blank">lukasz.czechowski@thaumatec.com</a>&gt;=
<br>
&gt; Cc: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" tar=
get=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=
=3D"noreferrer" target=3D"_blank">podman_git.bb</a> | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/recipes-containers/podman/<a href=3D"http://podman_git.bb=
" rel=3D"noreferrer" target=3D"_blank">podman_git.bb</a> b/recipes-containe=
rs/podman/<a href=3D"http://podman_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">podman_git.bb</a><br>
&gt; index 3eadd202..f69dec16 100644<br>
&gt; --- a/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=
=3D"noreferrer" target=3D"_blank">podman_git.bb</a><br>
&gt; +++ b/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=
=3D"noreferrer" target=3D"_blank">podman_git.bb</a><br>
&gt; @@ -62,7 +62,7 @@ do_configure[noexec] =3D &quot;1&quot;<br>
&gt;=C2=A0 EXTRA_OEMAKE =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PREFIX=3D${prefix} BINDIR=3D${bindir} LIBEXE=
CDIR=3D${libexecdir} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ETCDIR=3D${sysconfdir} TMPFILESDIR=3D${nonar=
ch_libdir}/tmpfiles.d \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0SYSTEMDDIR=3D${systemd_unitdir}/system USERSYSTEM=
DDIR=3D${systemd_unitdir}/user \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SYSTEMDDIR=3D${systemd_unitdir}/system USERSYSTEM=
DDIR=3D${systemd_user_unitdir} \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # remove &#39;docker&#39; from the packageconfig if you don&#39;=
t want podman to<br>
&gt; @@ -134,7 +134,7 @@ do_install_ptest () {<br>
&gt;=C2=A0 FILES:${PN} +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${systemd_unitdir}/system/* \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${nonarch_libdir}/systemd/* \<br>
&gt; -=C2=A0 =C2=A0 ${systemd_unitdir}/user/* \<br>
&gt; +=C2=A0 =C2=A0 ${systemd_user_unitdir/* \<br></blockquote><div><br></d=
iv><div>Just noticed that this is missing the closing brace. This typo is o=
n master and scarthgap branches.</div><div><br></div><div>Would you like me=
 to send a patch?<br></div><div><br></div></div></div></blockquote><div><br=
></div><div><div class=3D"gmail_default" style=3D"font-size:small">Sure! I&=
#39;m doing some other major package additions and updates right now, so a =
patch is easier for me.</div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">B=
ruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div></div><div>Ted=
 Roth<br></div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--0000000000005f0e5606175b43f4--


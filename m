Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.10469.1574770058296421323
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Nov 2019 04:07:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=muCWrjeE;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: liu.ming50@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DD334E00EB4; Tue, 26 Nov 2019 04:07:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,FREEMAIL_REPLY,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (liu.ming50[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.221.49 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  1.0 FREEMAIL_REPLY From and body contain different freemails
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60EF0E00E8F
	for <meta-virtualization@yoctoproject.org>; Tue, 26 Nov 2019 04:07:34 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id z10so22068533wrs.12
        for <meta-virtualization@yoctoproject.org>; Tue, 26 Nov 2019 04:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kxiNxA0ibi7489qqShYVmk55e9RVA46IPBYzN9E9RBc=;
        b=muCWrjeEYHKd9GeP4Ljr/s2CMOGYB/psmPwlUYAYdGaIf/6EqQoFDShvLhsZI9oTKq
         r68WBYKpx+CAVpTzB48Jd/Si4Y7Y7P4jmm7Geqtf2KvREr98G/pYGTpBjw48+KDokbXi
         y45Cp0MhvvG6f9pe78x8QDpjPYNyvzt2Di27KdjL0+1U2SH5uSsQY1jguz8cyY0chQwa
         X2I8jDoIPs14xPzQzpbfwvFnAWTo/hT1lW4sZthKhGNIeMpmOTZEXFGhn9GaEfNX1vys
         rU9+PKJSGQWuceNrkWWX18C0Kyvn1OPs+1iNv4MiOEuRoIDmsKGMlA58MuVbojjSpzJb
         ZTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kxiNxA0ibi7489qqShYVmk55e9RVA46IPBYzN9E9RBc=;
        b=WJx+yPn+qsW0sGaQLPAy4lbd+7RjtYnXKGGGCYLDo8HZrNd22TMAtLzq183TeFsSfv
         ky4SX12dbOq/D2xMP50og6RoC/gZB7gOW8t9ZyQzZuSqVPXb9e9cHkLn+Wdu17w8kzWA
         I/Frwq8oZvR25Gfw8XNWfqYXlB67n2KsorqaeffvSGS07WGKPO11s4ui/L4IZgX4PWFQ
         oi/vedcTG2xoRiDJZ0yKfBPE+QfWRLIG/0Y5kaw8hzVZlCq4XIkOxZ7QfRuk+GoJKF5X
         oUmb813EeRE1YqKd/ngArSowU80puQ1zhADoX8K/QAogo2kzqIly0rqzLAERkYt4ZSMi
         Nzbw==
X-Gm-Message-State: APjAAAX9NMGjkDtOvFWbUIzgurnlbrCZQ7Jrea3mKAlMNnywyQF2inEw
	wQzxKu9Iwy6GgnAgVbJjV02ZyvcpZdPaoy3sH+6gyYNd
X-Google-Smtp-Source: APXvYqz4gwVGa3XJIIwRrigj0ACVrzKBNPDo5xmqODSUYLEdu/brzP68DPZ3AfGAAV7cE5gkBJyEbItLs82jpvgbDZ4=
X-Received: by 2002:a5d:5273:: with SMTP id l19mr36740299wrc.175.1574770053379;
 Tue, 26 Nov 2019 04:07:33 -0800 (PST)
MIME-Version: 1.0
References: <20191122074510.1992-1-Qi.Chen@windriver.com> <20191125211220.GA28355@gmail.com>
 <d18614ca-6630-2c7a-dc24-f6708a4b144e@windriver.com> <CADkTA4OqP2s1CiVV2cRtGQnU6KosHm_BJhBu4uEgGvY+WEV04A@mail.gmail.com>
In-Reply-To: <CADkTA4OqP2s1CiVV2cRtGQnU6KosHm_BJhBu4uEgGvY+WEV04A@mail.gmail.com>
From: "Ming Liu" <liu.ming50@gmail.com>
Date: Tue, 26 Nov 2019 13:07:22 +0100
Message-ID: <CALatG=6izNBPBWC5u5pa5bppJ1HK2SwmzxNz29Vn9YS=AfXZGw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] python3-docker-compose: remove maximum version requirements
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: ChenQi <Qi.Chen@windriver.com>, 
	meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000a279fb05983eb914"

--000000000000a279fb05983eb914
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Chen Qi:

Arha, good point, will rebase my patch and also add some change logs in
commit as Bruce requested, thanks.

the best,
thank you

Bruce Ashfield <bruce.ashfield@gmail.com> =E6=96=BC 2019=E5=B9=B411=E6=9C=
=8826=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=882:21=E5=AF=AB=E9=81=93=
=EF=BC=9A

> On Mon, Nov 25, 2019 at 8:17 PM ChenQi <Qi.Chen@windriver.com> wrote:
> >
> > On 11/26/2019 05:12 AM, Bruce Ashfield wrote:
> >
> > In message: [meta-virtualization][PATCH] python3-docker-compose: remove
> maximum version requirements
> > on 22/11/2019 Chen Qi wrote:
> >
> > Remove maximum version requirements for docker-compose so that it
> > does not require old version recipes.
> >
> > Which oe-core versions of the packages are newer than the maximum value=
s
> > listed in docer compose ?
> >
> > I'd like to log that in this commit log .. since that is the
> justification
> > for the patch.
> >
> > Bruce
> >
> >
> > Hi Bruce,
> >
> > I've sent out V2 adding the information. Totally, it's 5 old recipes
> that are needed.
> >
> > @Ming, I hope your upgrade to 1.25 could also rebase on this patch if
> it's merged.
> > Because meta-python usually upgrades the packages to latest versions,
> and we will soon meet the same problem.
> >
> > Bruce, I have communicated with docker-compose upstream, they have
> confirmed that they will not remove the maximum version constraints. See
> https://github.com/docker/compose/issues/7024.
> >
>
> thanks for the link, and the effort to get it resolved upstream!
>
> I'll merge v2 shortly.
>
> Bruce
>
> > Best Regards,
> > Chen Qi
> >
> > The current one has been tested against
> https://docs.docker.com/compose/gettingstarted/.
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  ...upport-newer-minor-version-of-reques.patch | 44 --------------
> >  ...-remove-maximum-version-requirements.patch | 58 +++++++++++++++++++
> >  .../python3-docker-compose_1.21.2.bb          |  2 +-
> >  3 files changed, 59 insertions(+), 45 deletions(-)
> >  delete mode 100644
> recipes-containers/docker-compose/files/0001-docker-compose-support-newer=
-minor-version-of-reques.patch
> >  create mode 100644
> recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-vers=
ion-requirements.patch
> >
> > diff --git
> a/recipes-containers/docker-compose/files/0001-docker-compose-support-new=
er-minor-version-of-reques.patch
> b/recipes-containers/docker-compose/files/0001-docker-compose-support-new=
er-minor-version-of-reques.patch
> > deleted file mode 100644
> > index 48a6f25..0000000
> > ---
> a/recipes-containers/docker-compose/files/0001-docker-compose-support-new=
er-minor-version-of-reques.patch
> > +++ /dev/null
> > @@ -1,44 +0,0 @@
> > -From b4655b5e7f1e5b87a758dfd7af01a49a40ed148a Mon Sep 17 00:00:00 2001
> > -From: Li Zhou <li.zhou@windriver.com>
> > -Date: Thu, 10 Oct 2019 15:46:20 +0800
> > -Subject: [PATCH] docker-compose: support newer minor version of reques=
ts
> > -
> > -Signed-off-by: Ofek Lev <ofekmeister@gmail.com>
> > -
> > -Upstream-Status: Backport
> > -
> > -Signed-off-by: Li Zhou <li.zhou@windriver.com>
> > ----
> > - requirements.txt | 2 +-
> > - setup.py         | 2 +-
> > - 2 files changed, 2 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/requirements.txt b/requirements.txt
> > -index 93a0cce..42bde41 100644
> > ---- a/requirements.txt
> > -+++ b/requirements.txt
> > -@@ -16,7 +16,7 @@ pypiwin32=3D=3D219; sys_platform =3D=3D 'win32' and
> python_version < '3.6'
> > - pypiwin32=3D=3D220; sys_platform =3D=3D 'win32' and python_version >=
=3D '3.6'
> > - PySocks=3D=3D1.6.7
> > - PyYAML=3D=3D3.12
> > --requests=3D=3D2.18.4
> > -+requests=3D=3D2.19.1
> > - six=3D=3D1.10.0
> > - texttable=3D=3D0.9.1
> > - urllib3=3D=3D1.21.1
> > -diff --git a/setup.py b/setup.py
> > -index 422ba54..a74ee0f 100644
> > ---- a/setup.py
> > -+++ b/setup.py
> > -@@ -33,7 +33,7 @@ install_requires =3D [
> > -     'cached-property >=3D 1.2.0, < 2',
> > -     'docopt >=3D 0.6.1, < 0.7',
> > -     'PyYAML >=3D 3.10, < 4',
> > --    'requests >=3D 2.6.1, !=3D 2.11.0, !=3D 2.12.2, !=3D 2.18.0, < 2.=
19',
> > -+    'requests >=3D 2.6.1, !=3D 2.11.0, !=3D 2.12.2, !=3D 2.18.0, < 2.=
20',
> > -     'texttable >=3D 0.9.0, < 0.10',
> > -     'websocket-client >=3D 0.32.0, < 1.0',
> > -     'docker >=3D 3.3.0, < 4.0',
> > ---
> > -1.9.1
> > -
> > diff --git
> a/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-ve=
rsion-requirements.patch
> b/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-ve=
rsion-requirements.patch
> > new file mode 100644
> > index 0000000..54835ff
> > --- /dev/null
> > +++
> b/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-ve=
rsion-requirements.patch
> > @@ -0,0 +1,58 @@
> > +From 2685716409c560cdf94aee6262ed8c32ad137133 Mon Sep 17 00:00:00 2001
> > +From: Chen Qi <Qi.Chen@windriver.com>
> > +Date: Fri, 22 Nov 2019 09:24:58 +0800
> > +Subject: [PATCH] setup.py: remove maximum version requirements
> > +
> > +Remove maximum version requirements so that docker-compose will not
> > +require old version recipes.
> > +
> > +Upstream-Status: Inappropriate [OE Specific]
> > +
> > +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > +---
> > + setup.py | 22 +++++++++++-----------
> > + 1 file changed, 11 insertions(+), 11 deletions(-)
> > +
> > +diff --git a/setup.py b/setup.py
> > +index 422ba54..c2b4556 100644
> > +--- a/setup.py
> > ++++ b/setup.py
> > +@@ -30,16 +30,16 @@ def find_version(*file_paths):
> > +
> > +
> > + install_requires =3D [
> > +-    'cached-property >=3D 1.2.0, < 2',
> > +-    'docopt >=3D 0.6.1, < 0.7',
> > +-    'PyYAML >=3D 3.10, < 4',
> > +-    'requests >=3D 2.6.1, !=3D 2.11.0, !=3D 2.12.2, !=3D 2.18.0, < 2.=
19',
> > +-    'texttable >=3D 0.9.0, < 0.10',
> > +-    'websocket-client >=3D 0.32.0, < 1.0',
> > +-    'docker >=3D 3.3.0, < 4.0',
> > +-    'dockerpty >=3D 0.4.1, < 0.5',
> > +-    'six >=3D 1.3.0, < 2',
> > +-    'jsonschema >=3D 2.5.1, < 3',
> > ++    'cached-property >=3D 1.2.0',
> > ++    'docopt >=3D 0.6.1',
> > ++    'PyYAML >=3D 3.10',
> > ++    'requests >=3D 2.6.1, !=3D 2.11.0, !=3D 2.12.2, !=3D 2.18.0',
> > ++    'texttable >=3D 0.9.0',
> > ++    'websocket-client >=3D 0.32.0',
> > ++    'docker >=3D 3.3.0',
> > ++    'dockerpty >=3D 0.4.1',
> > ++    'six >=3D 1.3.0',
> > ++    'jsonschema >=3D 2.5.1',
> > + ]
> > +
> > +
> > +@@ -56,7 +56,7 @@ extras_require =3D {
> > +     ':python_version < "3.5"': ['backports.ssl_match_hostname >=3D 3.=
5'],
> > +     ':python_version < "3.3"': ['ipaddress >=3D 1.0.16'],
> > +     ':sys_platform =3D=3D "win32"': ['colorama >=3D 0.3.9, < 0.4'],
> > +-    'socks': ['PySocks >=3D 1.5.6, !=3D 1.5.7, < 2'],
> > ++    'socks': ['PySocks >=3D 1.5.6, !=3D 1.5.7'],
> > + }
> > +
> > +
> > +--
> > +2.17.1
> > +
> > diff --git a/recipes-containers/docker-compose/
> python3-docker-compose_1.21.2.bb b/recipes-containers/docker-compose/
> python3-docker-compose_1.21.2.bb
> > index a7f7b1c..a895005 100644
> > --- a/recipes-containers/docker-compose/python3-docker-compose_1.21.2.b=
b
> > +++ b/recipes-containers/docker-compose/python3-docker-compose_1.21.2.b=
b
> > @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://www.docker.com/"
> >  LICENSE =3D "Apache-2.0"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D435b266b3899aa8a959f17d41c5=
6def8"
> >
> > -SRC_URI +=3D
> "file://0001-docker-compose-support-newer-minor-version-of-reques.patch"
> > +SRC_URI +=3D
> "file://0001-setup.py-remove-maximum-version-requirements.patch"
> >
> >  inherit pypi setuptools3
> >
> > --
> > 2.17.1
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> >
> > View/Reply Online (#4733):
> https://lists.yoctoproject.org/g/meta-virtualization/message/4733
> > Mute This Topic: https://lists.yoctoproject.org/mt/61564429/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> >
> > View/Reply Online (#4745):
> https://lists.yoctoproject.org/g/meta-virtualization/message/4745
> > Mute This Topic: https://lists.yoctoproject.org/mt/61564429/3618072
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [Qi.Chen@windriver.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--000000000000a279fb05983eb914
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Chen Qi:<div><br></div><div>Arha, good point, will reb=
ase my patch and also add some change logs in commit as Bruce requested, th=
anks.</div><div><br></div><div>the best,</div><div>thank you</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Bruce Ash=
field &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.=
com</a>&gt; =E6=96=BC 2019=E5=B9=B411=E6=9C=8826=E6=97=A5 =E9=80=B1=E4=BA=
=8C =E4=B8=8A=E5=8D=882:21=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Mon, Nov 25, 2019 at 8:17 PM ChenQ=
i &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@wi=
ndriver.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 11/26/2019 05:12 AM, Bruce Ashfield wrote:<br>
&gt;<br>
&gt; In message: [meta-virtualization][PATCH] python3-docker-compose: remov=
e maximum version requirements<br>
&gt; on 22/11/2019 Chen Qi wrote:<br>
&gt;<br>
&gt; Remove maximum version requirements for docker-compose so that it<br>
&gt; does not require old version recipes.<br>
&gt;<br>
&gt; Which oe-core versions of the packages are newer than the maximum valu=
es<br>
&gt; listed in docer compose ?<br>
&gt;<br>
&gt; I&#39;d like to log that in this commit log .. since that is the justi=
fication<br>
&gt; for the patch.<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;<br>
&gt; Hi Bruce,<br>
&gt;<br>
&gt; I&#39;ve sent out V2 adding the information. Totally, it&#39;s 5 old r=
ecipes that are needed.<br>
&gt;<br>
&gt; @Ming, I hope your upgrade to 1.25 could also rebase on this patch if =
it&#39;s merged.<br>
&gt; Because meta-python usually upgrades the packages to latest versions, =
and we will soon meet the same problem.<br>
&gt;<br>
&gt; Bruce, I have communicated with docker-compose upstream, they have con=
firmed that they will not remove the maximum version constraints. See <a hr=
ef=3D"https://github.com/docker/compose/issues/7024" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/docker/compose/issues/7024</a>.<br>
&gt;<br>
<br>
thanks for the link, and the effort to get it resolved upstream!<br>
<br>
I&#39;ll merge v2 shortly.<br>
<br>
Bruce<br>
<br>
&gt; Best Regards,<br>
&gt; Chen Qi<br>
&gt;<br>
&gt; The current one has been tested against <a href=3D"https://docs.docker=
.com/compose/gettingstarted/" rel=3D"noreferrer" target=3D"_blank">https://=
docs.docker.com/compose/gettingstarted/</a>.<br>
&gt;<br>
&gt; Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" ta=
rget=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...upport-newer-minor-version-of-reques.patch | 44 -------------=
-<br>
&gt;=C2=A0 ...-remove-maximum-version-requirements.patch | 58 +++++++++++++=
++++++<br>
&gt;=C2=A0 .../<a href=3D"http://python3-docker-compose_1.21.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-docker-compose_1.21.2.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 3 files changed, 59 insertions(+), 45 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 recipes-containers/docker-compose/files/0001-=
docker-compose-support-newer-minor-version-of-reques.patch<br>
&gt;=C2=A0 create mode 100644 recipes-containers/docker-compose/files/0001-=
setup.py-remove-maximum-version-requirements.patch<br>
&gt;<br>
&gt; diff --git a/recipes-containers/docker-compose/files/0001-docker-compo=
se-support-newer-minor-version-of-reques.patch b/recipes-containers/docker-=
compose/files/0001-docker-compose-support-newer-minor-version-of-reques.pat=
ch<br>
&gt; deleted file mode 100644<br>
&gt; index 48a6f25..0000000<br>
&gt; --- a/recipes-containers/docker-compose/files/0001-docker-compose-supp=
ort-newer-minor-version-of-reques.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,44 +0,0 @@<br>
&gt; -From b4655b5e7f1e5b87a758dfd7af01a49a40ed148a Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Li Zhou &lt;<a href=3D"mailto:li.zhou@windriver.com" target=3D"=
_blank">li.zhou@windriver.com</a>&gt;<br>
&gt; -Date: Thu, 10 Oct 2019 15:46:20 +0800<br>
&gt; -Subject: [PATCH] docker-compose: support newer minor version of reque=
sts<br>
&gt; -<br>
&gt; -Signed-off-by: Ofek Lev &lt;<a href=3D"mailto:ofekmeister@gmail.com" =
target=3D"_blank">ofekmeister@gmail.com</a>&gt;<br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -<br>
&gt; -Signed-off-by: Li Zhou &lt;<a href=3D"mailto:li.zhou@windriver.com" t=
arget=3D"_blank">li.zhou@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - requirements.txt | 2 +-<br>
&gt; - setup.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt; - 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/requirements.txt b/requirements.txt<br>
&gt; -index 93a0cce..42bde41 100644<br>
&gt; ---- a/requirements.txt<br>
&gt; -+++ b/requirements.txt<br>
&gt; -@@ -16,7 +16,7 @@ pypiwin32=3D=3D219; sys_platform =3D=3D &#39;win32&=
#39; and python_version &lt; &#39;3.6&#39;<br>
&gt; - pypiwin32=3D=3D220; sys_platform =3D=3D &#39;win32&#39; and python_v=
ersion &gt;=3D &#39;3.6&#39;<br>
&gt; - PySocks=3D=3D1.6.7<br>
&gt; - PyYAML=3D=3D3.12<br>
&gt; --requests=3D=3D2.18.4<br>
&gt; -+requests=3D=3D2.19.1<br>
&gt; - six=3D=3D1.10.0<br>
&gt; - texttable=3D=3D0.9.1<br>
&gt; - urllib3=3D=3D1.21.1<br>
&gt; -diff --git a/setup.py b/setup.py<br>
&gt; -index 422ba54..a74ee0f 100644<br>
&gt; ---- a/setup.py<br>
&gt; -+++ b/setup.py<br>
&gt; -@@ -33,7 +33,7 @@ install_requires =3D [<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&#39;cached-property &gt;=3D 1.2.0, &lt; 2&#39;,<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0&#39;docopt &gt;=3D 0.6.1, &lt; 0.7&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&#39;PyYAML &gt;=3D 3.10, &lt; 4&#39;,<br>
&gt; --=C2=A0 =C2=A0 &#39;requests &gt;=3D 2.6.1, !=3D 2.11.0, !=3D 2.12.2,=
 !=3D 2.18.0, &lt; 2.19&#39;,<br>
&gt; -+=C2=A0 =C2=A0 &#39;requests &gt;=3D 2.6.1, !=3D 2.11.0, !=3D 2.12.2,=
 !=3D 2.18.0, &lt; 2.20&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&#39;texttable &gt;=3D 0.9.0, &lt; 0.10&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&#39;websocket-client &gt;=3D 0.32.0, &lt; 1.0&#3=
9;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&#39;docker &gt;=3D 3.3.0, &lt; 4.0&#39;,<br>
&gt; ---<br>
&gt; -1.9.1<br>
&gt; -<br>
&gt; diff --git a/recipes-containers/docker-compose/files/0001-setup.py-rem=
ove-maximum-version-requirements.patch b/recipes-containers/docker-compose/=
files/0001-setup.py-remove-maximum-version-requirements.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..54835ff<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-containers/docker-compose/files/0001-setup.py-remove-max=
imum-version-requirements.patch<br>
&gt; @@ -0,0 +1,58 @@<br>
&gt; +From 2685716409c560cdf94aee6262ed8c32ad137133 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"=
_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; +Date: Fri, 22 Nov 2019 09:24:58 +0800<br>
&gt; +Subject: [PATCH] setup.py: remove maximum version requirements<br>
&gt; +<br>
&gt; +Remove maximum version requirements so that docker-compose will not<b=
r>
&gt; +require old version recipes.<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [OE Specific]<br>
&gt; +<br>
&gt; +Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" t=
arget=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; +---<br>
&gt; + setup.py | 22 +++++++++++-----------<br>
&gt; + 1 file changed, 11 insertions(+), 11 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/setup.py b/setup.py<br>
&gt; +index 422ba54..c2b4556 100644<br>
&gt; +--- a/setup.py<br>
&gt; ++++ b/setup.py<br>
&gt; +@@ -30,16 +30,16 @@ def find_version(*file_paths):<br>
&gt; +<br>
&gt; +<br>
&gt; + install_requires =3D [<br>
&gt; +-=C2=A0 =C2=A0 &#39;cached-property &gt;=3D 1.2.0, &lt; 2&#39;,<br>
&gt; +-=C2=A0 =C2=A0 &#39;docopt &gt;=3D 0.6.1, &lt; 0.7&#39;,<br>
&gt; +-=C2=A0 =C2=A0 &#39;PyYAML &gt;=3D 3.10, &lt; 4&#39;,<br>
&gt; +-=C2=A0 =C2=A0 &#39;requests &gt;=3D 2.6.1, !=3D 2.11.0, !=3D 2.12.2,=
 !=3D 2.18.0, &lt; 2.19&#39;,<br>
&gt; +-=C2=A0 =C2=A0 &#39;texttable &gt;=3D 0.9.0, &lt; 0.10&#39;,<br>
&gt; +-=C2=A0 =C2=A0 &#39;websocket-client &gt;=3D 0.32.0, &lt; 1.0&#39;,<b=
r>
&gt; +-=C2=A0 =C2=A0 &#39;docker &gt;=3D 3.3.0, &lt; 4.0&#39;,<br>
&gt; +-=C2=A0 =C2=A0 &#39;dockerpty &gt;=3D 0.4.1, &lt; 0.5&#39;,<br>
&gt; +-=C2=A0 =C2=A0 &#39;six &gt;=3D 1.3.0, &lt; 2&#39;,<br>
&gt; +-=C2=A0 =C2=A0 &#39;jsonschema &gt;=3D 2.5.1, &lt; 3&#39;,<br>
&gt; ++=C2=A0 =C2=A0 &#39;cached-property &gt;=3D 1.2.0&#39;,<br>
&gt; ++=C2=A0 =C2=A0 &#39;docopt &gt;=3D 0.6.1&#39;,<br>
&gt; ++=C2=A0 =C2=A0 &#39;PyYAML &gt;=3D 3.10&#39;,<br>
&gt; ++=C2=A0 =C2=A0 &#39;requests &gt;=3D 2.6.1, !=3D 2.11.0, !=3D 2.12.2,=
 !=3D 2.18.0&#39;,<br>
&gt; ++=C2=A0 =C2=A0 &#39;texttable &gt;=3D 0.9.0&#39;,<br>
&gt; ++=C2=A0 =C2=A0 &#39;websocket-client &gt;=3D 0.32.0&#39;,<br>
&gt; ++=C2=A0 =C2=A0 &#39;docker &gt;=3D 3.3.0&#39;,<br>
&gt; ++=C2=A0 =C2=A0 &#39;dockerpty &gt;=3D 0.4.1&#39;,<br>
&gt; ++=C2=A0 =C2=A0 &#39;six &gt;=3D 1.3.0&#39;,<br>
&gt; ++=C2=A0 =C2=A0 &#39;jsonschema &gt;=3D 2.5.1&#39;,<br>
&gt; + ]<br>
&gt; +<br>
&gt; +<br>
&gt; +@@ -56,7 +56,7 @@ extras_require =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&#39;:python_version &lt; &quot;3.5&quot;&#39;: [=
&#39;backports.ssl_match_hostname &gt;=3D 3.5&#39;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&#39;:python_version &lt; &quot;3.3&quot;&#39;: [=
&#39;ipaddress &gt;=3D 1.0.16&#39;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&#39;:sys_platform =3D=3D &quot;win32&quot;&#39;:=
 [&#39;colorama &gt;=3D 0.3.9, &lt; 0.4&#39;],<br>
&gt; +-=C2=A0 =C2=A0 &#39;socks&#39;: [&#39;PySocks &gt;=3D 1.5.6, !=3D 1.5=
.7, &lt; 2&#39;],<br>
&gt; ++=C2=A0 =C2=A0 &#39;socks&#39;: [&#39;PySocks &gt;=3D 1.5.6, !=3D 1.5=
.7&#39;],<br>
&gt; + }<br>
&gt; +<br>
&gt; +<br>
&gt; +--<br>
&gt; +2.17.1<br>
&gt; +<br>
&gt; diff --git a/recipes-containers/docker-compose/<a href=3D"http://pytho=
n3-docker-compose_1.21.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-d=
ocker-compose_1.21.2.bb</a> b/recipes-containers/docker-compose/<a href=3D"=
http://python3-docker-compose_1.21.2.bb" rel=3D"noreferrer" target=3D"_blan=
k">python3-docker-compose_1.21.2.bb</a><br>
&gt; index a7f7b1c..a895005 100644<br>
&gt; --- a/recipes-containers/docker-compose/<a href=3D"http://python3-dock=
er-compose_1.21.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-docker-c=
ompose_1.21.2.bb</a><br>
&gt; +++ b/recipes-containers/docker-compose/<a href=3D"http://python3-dock=
er-compose_1.21.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-docker-c=
ompose_1.21.2.bb</a><br>
&gt; @@ -3,7 +3,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://www.docker.com/"=
 rel=3D"noreferrer" target=3D"_blank">https://www.docker.com/</a>&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D435b266b3899aa8a=
959f17d41c56def8&quot;<br>
&gt;<br>
&gt; -SRC_URI +=3D &quot;file://0001-docker-compose-support-newer-minor-ver=
sion-of-reques.patch&quot;<br>
&gt; +SRC_URI +=3D &quot;file://0001-setup.py-remove-maximum-version-requir=
ements.patch&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit pypi setuptools3<br>
&gt;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt;<br>
&gt; View/Reply Online (#4733): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/4733" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/4733</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/61564429=
/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/mt/61564429/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a>=C2=A0 [<a href=3D"mailto:bruce.ashfi=
eld@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt;<br>
&gt; View/Reply Online (#4745): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/4745" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/4745</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/61564429=
/3618072" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/mt/61564429/3618072</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a>=C2=A0 [<a href=3D"mailto:Qi.Chen@win=
driver.com" target=3D"_blank">Qi.Chen@windriver.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--000000000000a279fb05983eb914--

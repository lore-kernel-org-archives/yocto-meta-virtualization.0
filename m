Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0422AE00DA3; Tue, 13 Aug 2019 05:44:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.68 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0A5AE0090E
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Aug 2019 05:44:57 -0700 (PDT)
Received: by mail-lf1-f68.google.com with SMTP id p197so76609669lfa.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Aug 2019 05:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Yd9A0HzSWvI9Cz7gLc+DZdSacnbII6vIYfLoQGgUlCI=;
	b=mqJMi4ulGBrh5sqCZSm12dnwqF1zZzuHOWCfOtU/qP/Wwy0Upx9Eozj119GsXE/nfi
	q1O9NMUSz4xo0AjqvIulkmTY9BvR1wIS3b5N8OFdQh5Ads6V4MS2ZiWpqabpNItHV9b1
	H74H6z/Mb+5E7abpGFvaGsbwFeNFvaFvuGNe9JncDAg56shrQIg0vpuyr1WeTaCrtYSM
	P4Sb9utO7ZXBghZ3OLCsqL8ffikT7NY4IXyXQQfizIRitaa6HWxrGFIzHvjQrItgA55T
	k5d6v9t0JOKgsm4OX3/0pVHJZw13dwIVwAA5836x4PZIl5uIOM+VGEAJN46k7GYsNNPb
	8Rfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Yd9A0HzSWvI9Cz7gLc+DZdSacnbII6vIYfLoQGgUlCI=;
	b=flklE4hOpzm5ZoKYYVTXES3VWVCC+4zecg5ggYJqX3IZzDaT6KMTwsp3VUy730rQEN
	4th3don40Sb9+09iDsDH6I3vaqh3xe5xeXhMU1O+lohN3ow9chmH3zIeXfFiyjHhxpVU
	w3qbQ1cD8dUONLGgSmsvz5rMjJd+piBJQkTy2nrKYBmlSQBeQlCGwzVmIZ7r9ChgUsON
	ljCnyiQiwyLoXtDi+yztC3E2UrX+QaIrexbWbhSS9QjLYBE/tuOGrLlS0E/KeKnNNXTK
	ltc61OYcWlL8QQ+bRoSf0hp0lGkNmBGXrLHJ7m3soGTdLAdGq0LuvtKJ6meWGljFIf8g
	Kp0g==
X-Gm-Message-State: APjAAAXvw0kQIH+0eAVfG/LovwAeswPsK1zyQjTHkf1LYCsmDCpyAsFR
	XhwmEH3fzS+c3X2y5ShpeQhnUjPQ4GUlhT8fCRA=
X-Google-Smtp-Source: APXvYqyrDGI610baJ+wOqP/qYoNJ7a0+lzVhZtDWAh9Urr5kvezvQe6cJfKZ7PrCoIo662d5QEsc5qzXbY/srrlOUUM=
X-Received: by 2002:a19:110:: with SMTP id 16mr23070063lfb.63.1565700296590;
	Tue, 13 Aug 2019 05:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190813075136.6248-1-Qi.Chen@windriver.com>
	<20190813075136.6248-3-Qi.Chen@windriver.com>
	<CADkTA4M74K_xPSiCnJYFdqSsEkGD0mXXL-BaF4mAs6Y7cieUGw@mail.gmail.com>
In-Reply-To: <CADkTA4M74K_xPSiCnJYFdqSsEkGD0mXXL-BaF4mAs6Y7cieUGw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 13 Aug 2019 08:44:45 -0400
Message-ID: <CADkTA4P_NoNWNq=WPS0mrtMyjsutW-mZekKsD6aKP8tYRi7b=w@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 3/4] cni: upgrade git version to latest master
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Aug 2019 12:44:59 -0000
Content-Type: multipart/alternative; boundary="00000000000000cc7a058fff02ed"

--00000000000000cc7a058fff02ed
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 13, 2019 at 8:30 AM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Tue, Aug 13, 2019 at 3:51 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
>> Upgrade the git version to latest master to make the recipe
>> truly serve its purpose.
>>
>
> That's  not a good reason to do the uprev, this is a git recipe because it
> makes sense for it to be git .. not because it is tracking the tip of
> master all the time.
>
> What *actual* functionality are we getting from this ? How was it tested ?
>

Ignore this comment, since I was reviewing the patches in order, and I saw
the locked version split after writing this comment.

But the comment I made to the other patches still stands. We don't want
extra/double maintenance, so just uprev the recipe to where it works with
k8s (preferably the latest version at the time, since that is what I always
do), and we'll support that.

Since it is a _git recipe, it is trivial for people to bump it for local
testing, there's no need for the two variants.

Bruce



>
> Bruce
>
>
>
>>
>> This upgrades both cni and plugins repos.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>  recipes-networking/cni/cni_git.bb | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/
>> cni_git.bb
>> index 06b37a4..60c39f1 100644
>> --- a/recipes-networking/cni/cni_git.bb
>> +++ b/recipes-networking/cni/cni_git.bb
>> @@ -1,10 +1,10 @@
>>  # This cni version is supposed to track latest upstream.
>>  require cni.inc
>>
>> -SRCREV_cni = "dc71cd2ba60c452c56a0a259f2a23d2afe42b688"
>> -SRCREV_plugins = "0eddc554c0747200b7b112ce5322dcfa525298cf"
>> +SRCREV_cni = "8c6c47d1c7fcf51c8d0c939d2af06dd108f876da"
>> +SRCREV_plugins = "2d6d4b260a98973a206fde18bdde4f2511c72c60"
>>  SRC_URI = "\
>>         git://github.com/containernetworking/cni.git;nobranch=1;name=cni
>> \
>>          git://
>> github.com/containernetworking/plugins.git;nobranch=1;destsuffix=plugins;name=plugins
>> \
>>         "
>> -PV = "0.7.0+git${SRCREV_cni}"
>> +PV = "0.7.1+git${SRCREV_cni}"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000000cc7a058fff02ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Aug 13, 2019 at 8:30 AM Bruce Ashfield &lt;=
<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small"><br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue,=
 Aug 13, 2019 at 3:51 AM Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.co=
m" target=3D"_blank">Qi.Chen@windriver.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Upgrade the git version to latest=
 master to make the recipe<br>
truly serve its purpose.<br></blockquote><div><br></div><div><div style=3D"=
font-size:small">That&#39;s=C2=A0 not a good reason to do the uprev, this i=
s a git recipe because it makes sense for it to be git .. not because it is=
 tracking the tip of master all the time.</div><div style=3D"font-size:smal=
l"><br></div><div style=3D"font-size:small">What *actual* functionality are=
 we getting from this ? How was it tested ?</div></div></div></div></blockq=
uote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sm=
all">Ignore this comment, since I was reviewing the patches in order, and I=
 saw the locked version split after writing this comment.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">But the comment I made to the other patc=
hes still stands. We don&#39;t want extra/double maintenance, so just uprev=
 the recipe to where it works with k8s (preferably the latest version at th=
e time, since that is what I always do), and we&#39;ll support that.</div><=
div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Since it is a _git recipe, it =
is trivial for people to bump it for local testing, there&#39;s no need for=
 the two variants.</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce<=
br></div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><div style=3D"f=
ont-size:small"><br></div><div style=3D"font-size:small">Bruce</div><br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
This upgrades both cni and plugins repos.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"noreferre=
r" target=3D"_blank">cni_git.bb</a> | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"no=
referrer" target=3D"_blank">cni_git.bb</a> b/recipes-networking/cni/<a href=
=3D"http://cni_git.bb" rel=3D"noreferrer" target=3D"_blank">cni_git.bb</a><=
br>
index 06b37a4..60c39f1 100644<br>
--- a/recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"noreferre=
r" target=3D"_blank">cni_git.bb</a><br>
+++ b/recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"noreferre=
r" target=3D"_blank">cni_git.bb</a><br>
@@ -1,10 +1,10 @@<br>
=C2=A0# This cni version is supposed to track latest upstream.<br>
=C2=A0require cni.inc<br>
<br>
-SRCREV_cni =3D &quot;dc71cd2ba60c452c56a0a259f2a23d2afe42b688&quot;<br>
-SRCREV_plugins =3D &quot;0eddc554c0747200b7b112ce5322dcfa525298cf&quot;<br=
>
+SRCREV_cni =3D &quot;8c6c47d1c7fcf51c8d0c939d2af06dd108f876da&quot;<br>
+SRCREV_plugins =3D &quot;2d6d4b260a98973a206fde18bdde4f2511c72c60&quot;<br=
>
=C2=A0SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/containernet=
working/cni.git;nobranch=3D1;name=3Dcni" rel=3D"noreferrer" target=3D"_blan=
k">github.com/containernetworking/cni.git;nobranch=3D1;name=3Dcni</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/contai=
nernetworking/plugins.git;nobranch=3D1;destsuffix=3Dplugins;name=3Dplugins"=
 rel=3D"noreferrer" target=3D"_blank">github.com/containernetworking/plugin=
s.git;nobranch=3D1;destsuffix=3Dplugins;name=3Dplugins</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-PV =3D &quot;0.7.0+git${SRCREV_cni}&quot;<br>
+PV =3D &quot;0.7.1+git${SRCREV_cni}&quot;<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail-m_-5341454204010213607gmail_signature">- Thou shalt not fol=
low the NULL pointer, for chaos and madness await thee at its end<br>- &quo=
t;Use the force Harry&quot; - Gandalf, Star Trek II<br><br></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--00000000000000cc7a058fff02ed--

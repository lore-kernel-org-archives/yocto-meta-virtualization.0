Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A651BE00791; Tue, 29 May 2018 07:23:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_10_20, 
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.45 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.1 HTML_OBFUSCATE_10_20 BODY: Message is 10% to 20% HTML obfuscation
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99A35E00791
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 07:23:47 -0700 (PDT)
Received: by mail-wm0-f45.google.com with SMTP id r15-v6so13549234wmc.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 07:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9CJMIv7yV58MzZ0Lr20DuOTsgMIZhHWfb6qvw2th8tU=;
	b=FG9I7mpOGyQ/idaWq0AWmIJS8klAGQNhDWzaiv4RkHiLioWy6tPlnTt0MnNmTQ/owh
	teAhVV5bMbtPeozH/znVmzqM6ZjDHQmUrln4IjnK70afpIntjJWwN0a1ygXQhC0L/nhK
	yv355jIX/CdGzBEDp3SZi0GBYtbivX/x57PjyTLob7YDzB/yjVihA0gF69mfWRBlbYYS
	U/XTae0EBUhfmPbbNXjF9XV23j7CbUUvT3tyjwaU6AtjDJl2Yu9kKHqDOPWGs6TtAFtI
	WCXWRGfPFVCSWgX1rYwYEYuWnTyU6KgOsqF82QCo0akPYLp4QdEsMml6j++76Zs+OzIx
	YuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9CJMIv7yV58MzZ0Lr20DuOTsgMIZhHWfb6qvw2th8tU=;
	b=CjFjuhNyIHKO+JYSlyE2JKwahyMMwkJdNRlnPDiL5s/t2ZG/nAcwk8haHRiTzyBuI2
	kv1koMp933m940UKiOLT2LMOqKWjAAhGfBfGUJmvCulfY5Kg2warVRM4V+Y79eGvNPw1
	ZlcZhdsHAA2Ch4c1Kxlnh05q0iqi3gXLo+2tqAIvDhJz8JhAlOQPF/M7QmUAZK/WZvaN
	Qyuf8SExfQ5QkNzxkO9Qqiu50DX5nQPo02HcGjYWSbZrY1bww9mK9Nzw2pLNZyOQz6uF
	aGtzHfrAe6E4IZgHDtQGL21p5sN6KjIYPEzL0zLLyzgtA5Hq5wZQeeZ0xMX7/aJ49F/x
	Qwmw==
X-Gm-Message-State: ALKqPwdHOv1+n2kAgro6wuaniOY90VFL7zZBZktuhLH8JE0ZJDcTvSMQ
	MJbtYh40JlSbeM4Wi2Yzz3jAexvRiuiVAthIKUeXGA==
X-Google-Smtp-Source: ADUXVKI9mII3+U9/w/EfVGDgXNlGfxdtyS4AcWVicaRdRCI/KoQplhZIfvpqimuX+5iexBqy6KEZMcCKIYN7PFZUOVM=
X-Received: by 2002:a2e:2bcb:: with SMTP id
	r72-v6mr4949999ljr.133.1527603826302; 
	Tue, 29 May 2018 07:23:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:3307:0:0:0:0:0 with HTTP; Tue, 29 May 2018 07:23:45
	-0700 (PDT)
In-Reply-To: <1526403350-11091-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1526403350-11091-1-git-send-email-leimaohui@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 29 May 2018 10:23:45 -0400
Message-ID: <CADkTA4O_+LrcFRVuYwzRkVF6aV5Fu6pyFqTBDyzi85HVurhppw@mail.gmail.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [oe-virtualization][meta-cloud-services][PATCH 0/8] Fix build error "distutils.errors.DistutilsError"
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
X-List-Received-Date: Tue, 29 May 2018 14:23:48 -0000
Content-Type: multipart/alternative; boundary="0000000000006ca2ee056d58fb2c"

--0000000000006ca2ee056d58fb2c
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, May 15, 2018 at 12:55 PM, Lei Maohui <leimaohui@cn.fujitsu.com>
wrote:

> Fix build error as following:
>
> "distutils.errors.DistutilsError: Could not find suitable distribution
> for Requirement.parse('pbr>=2.0.0')"
>
> Lei Maohui (8):
>   python-osc-lib: Fix build error as following:
>   python-os-client-config: Fix build error as following:
>   python-oslo.messaging: Fix build error as following:
>   python-oslo.service: Fix build error as following:
>   python-oslo.middleware: Fix build error as following:
>   python-sqlalchemy-migrate: Fix build error as following:
>   python-tenacity: Fix build error as following:
>   python-pycadf: Fix build error as following:
>
>  .../recipes-devtools/python/python-os-client-config_git.bb         | 4
> ++++
>  meta-openstack/recipes-devtools/python/python-osc-lib_1.7.0.bb     | 5
> +++++
>  .../recipes-devtools/python/python-oslo.messaging_git.bb           | 5
> +++++
>  .../recipes-devtools/python/python-oslo.middleware_git.bb          | 5
> +++++
>  meta-openstack/recipes-devtools/python/python-oslo.service_git.bb  | 7
> ++++++-
>  meta-openstack/recipes-devtools/python/python-pycadf_git.bb        | 4
> ++++
>  .../recipes-devtools/python/python-sqlalchemy-migrate_0.11.0.bb    | 7
> ++++++-
>  meta-openstack/recipes-devtools/python/python-tenacity_4.5.0.bb    | 5
> +++++
>  8 files changed, 40 insertions(+), 2 deletions(-)
>
> --
> 1.9.1
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--0000000000006ca2ee056d58fb2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Tue, May 15, 2018 at 12:55 P=
M, Lei Maohui <span dir=3D"ltr">&lt;<a href=3D"mailto:leimaohui@cn.fujitsu.=
com" target=3D"_blank">leimaohui@cn.fujitsu.com</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">Fix build error as following:<br>
<br>
&quot;distutils.errors.<wbr>DistutilsError: Could not find suitable distrib=
ution for Requirement.parse(&#39;pbr&gt;=3D2.0.0&#39;<wbr>)&quot;<br>
<br>
Lei Maohui (8):<br>
=C2=A0 python-osc-lib: Fix build error as following:<br>
=C2=A0 python-os-client-config: Fix build error as following:<br>
=C2=A0 python-oslo.messaging: Fix build error as following:<br>
=C2=A0 python-oslo.service: Fix build error as following:<br>
=C2=A0 python-oslo.middleware: Fix build error as following:<br>
=C2=A0 python-sqlalchemy-migrate: Fix build error as following:<br>
=C2=A0 python-tenacity: Fix build error as following:<br>
=C2=A0 python-pycadf: Fix build error as following:<br>
<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-os-client-config=
_git.bb" rel=3D"noreferrer" target=3D"_blank">py<wbr>thon-os-client-config_=
git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++++<br>
=C2=A0meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
osc-lib_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-<wbr>lib_=
1.7.0.bb</a>=C2=A0 =C2=A0 =C2=A0| 5 +++++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-oslo.messaging_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">py<wbr>thon-oslo.messaging_git.=
bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 +++++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-oslo.middleware_=
git.bb" rel=3D"noreferrer" target=3D"_blank">py<wbr>thon-oslo.middleware_gi=
t.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5 +++++<br>
=C2=A0meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
oslo.service_git.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.<wbr>=
service_git.bb</a>=C2=A0 | 7 ++++++-<br>
=C2=A0meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
pycadf_git.bb" rel=3D"noreferrer" target=3D"_blank">python-pycadf_<wbr>git.=
bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-sqlalchemy-migra=
te_0.11.0.bb" rel=3D"noreferrer" target=3D"_blank">py<wbr>thon-sqlalchemy-m=
igrate_0.11.<wbr>0.bb</a>=C2=A0 =C2=A0 | 7 ++++++-<br>
=C2=A0meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
tenacity_4.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>tenacit=
y_4.5.0.bb</a>=C2=A0 =C2=A0 | 5 +++++<br>
=C2=A08 files changed, 40 insertions(+), 2 deletions(-)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
-- <br>
1.9.1<br>
<br>
<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--0000000000006ca2ee056d58fb2c--
